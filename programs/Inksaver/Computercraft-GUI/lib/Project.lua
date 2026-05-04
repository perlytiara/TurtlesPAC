local version = 20260423.1600
local Class = require("lib.Class")
local P 	= Class:derive("Project")
--local U 	= require("lib.TurtleUtils") -- using _G.U loaded in tk
local timber= {"dark_oak", "oak", "birch", "spruce", "jungle", "acacia", "mangrove", "cherry", "bamboo", "crimson", "warped"}
local itemColours 	= {"white", "light_gray", "gray", "brown", "red", "orange", "yellow", "lime", "green", "cyan", "light_blue", "blue", "purple", "magenta", "pink"}

function P:new(item, quantity, craftingRecipe)
	quantity = quantity or 0
	assert(item ~= nil and item ~= "", "New Project must have a name")
	self.item = item							-- item full name eg "minecraft:oak_stairs"
	self.quantity = quantity					-- number of items required eg 8
	self.craftingRecipe = craftingRecipe		-- eg {quantity=1, ingredients = {["minecraft:oak_planks"]={5,7,9,11,},["minecraft:stick"]={6,10,},}, ratio=3,}
	self.smeltItems = nil						-- eg for item == "minecraft:stone" --> "minecraft:cobblestone"
	self.ratio = craftingRecipe.ratio			-- eg 1 craft of stairs uses 6 planks, gives 4 items, ratio is 4
	self.itemLocations = nil					-- eg {["minecraft:oak_planks"] = {"minecraft:chest_38", "minecraft:chest_39"}}
	self.maxQuantity = 64
	self.priority = 1
	self.stock = 0
	self.update(self)	-- change this if ingredients not available and have to be crafted eg logs --> planks
end

function P:getItem() return self.item end
function P:getQuantity() return self.quantity end
function P:setQuantity(value)	-- set the number of items to be crafted
	self.quantity = math.ceil(value / self.ratio) * value		-- eg math.ceil(7 / 4)  = 2 * 4 = 8 stairs
	--self.quantityAdjusted = true
	--P.updateIngredients(self)
end
function P:addQuantity(value)	-- set the number of items to be crafted
	self.quantity = self.quantity + value		-- eg math.ceil(7 / 4)  = 2 * 4 = 8 stairs
	--self.quantityAdjusted = true
	--P.updateIngredients(self)
end
function P:getRecipe() return self.recipe end
function P:setRecipe(value) self.recipe = value end
function P:getCraftingRecipe() return self.craftingRecipe end --U.getCraftingRecipe(recipe)
function P:getQuantifiedCraftingRecipe()
	self.craftingRecipe.priority = self.priority
	self.craftingRecipe.quantity = self.quantity
	return self.craftingRecipe
end --U.getCraftingRecipe(recipe)
function P:setCraftingRecipe(value)
	self.craftingRecipe = value
	self.ratio = tonumber(self.craftingRecipe[10]) -- eg 4 ERROR here if craftingRecipe not correct: 10 items with number at index 10. usually 1,2,3,4,6,8 or 16
end

function P:getRatio() return self.ratio end
function P:setRatio(value) self.ratio = value end
function P:getItemLocations() return self.itemLocations end
function P:getPriority() return self.priority end
function P:setPriority(value) self.priority = value end
function P:getStock() return self.stock end
function P:setStock(value) self.stock = value end
function P:addStock(value) self.stock = self.stock + value end

function P:updateCraftingRecipe(index, value)
	self.craftingRecipe[index] = value
end

function P:update()
	-- called from S.startProject(self)
	self.stock = U.getItemStock(self.item)							-- search all inventories for total stock of item to be crafted
	self.smeltItems = U.smeltFrom[self.item]						-- nil or eg {"minecraft:cobblestone"}
	-- eg recipes for spruce fence = {{quantity = 1, ratio = 3, ingredients = {["minecraft:spruce_planks"] = {5,7,9,11},["minecraft:stick"] = {6,10}}}}

	
	-- ******** Substitute wild card ingredients *******************************
	local temp = nil
	for ingredient, slots in pairs(self.craftingRecipe.ingredients) do		-- ingredients = {["minecraft:*_planks"]={5,7,9,11}, ["minecraft:stick"]={6,10}}
		if ingredient:find("*") ~= nil then		-- eg "minecraft:*_planks", wool, carpet, shulker_box, bed: wood for planks, colour for the rest
			-- substitute with any wood/colour of the item
			temp = {}
			if  ingredient:find("*_planks") ~= nil then
				local count = 0
				local useWood = ""
				for _, wood in ipairs(timber) do
					local stock = U.getItemStock("minecraft:"..wood.."_planks")
					if stock > count then
						count = stock
						useWood = wood
					end
				end
				if count > 0 then
					temp[ingredient] = "minecraft:"..useWood.."_planks"	--  {["minecraft:*_planks"] = "minecraft:oak_planks"}
				else
					for _, wood in ipairs(timber) do
						local stock = U.getItemStock("minecraft:"..wood.."_log")
						if stock > count then
							count = stock
							useWood = wood
						end
					end
					if count > 0 then
						temp[ingredient] = "minecraft:"..useWood.."_planks"
					else
						temp[ingredient] = "minecraft:oak_planks"
					end
				end
			else
				local count = 0
				local useColour = ""
				local data = U.split(ingredient,"*")
				for _, colour in ipairs(itemColours) do
					local stock = U.getItemStock(data[1]..colour..data[2])
					if stock > count then
						count = stock
						useColour = colour
					end
				end
				if count > 0 then
					temp[ingredient] = data[1]..useColour..data[2]
				else
					temp[ingredient] = data[1].."white"..data[2]
				end
			end
		end
	end
	-- *************** substitute keys with * for real items *****************
	if temp ~= nil then
		_G.Log:saveToLog("P:update() wild card ingredients = "..textutils.serialise(temp, {compact = true}))
		for ingredient, newIngredient in pairs(temp) do
			self.craftingRecipe.ingredients[newIngredient] = self.craftingRecipe.ingredients[ingredient]
			self.craftingRecipe.ingredients[ingredient] = nil
		end
	end
	-- calculate quantity of each ingredient required, based on chosen quantity from player
	for ingredient, slots in pairs(self.craftingRecipe.ingredients) do						-- ingredients = {["minecraft:oak_planks"]={5,7,9,11}, ["minecraft:stick"]={6,10}}
		if self.itemLocations == nil then
			self.itemLocations = {}
		end
		self.itemLocations[ingredient] = {}
		self.itemLocations[ingredient].name, self.itemLocations[ingredient].displayName, self.itemLocations[ingredient].recipes = U.getRecipeData("name", ingredient)
		--local ratio = 1
		local required = #slots * self.quantity
		if self.itemLocations[ingredient].recipes ~= nil then
			_G.Log:saveToLog("P:update() self.itemLocations["..ingredient.."].recipes = ".. textutils.serialise(self.itemLocations[ingredient].recipes, {compact = true}))
			-- recipes have been modified from original values found in Items database to inclue priority = 1
			-- eg recipes = {{quantity = 1, ratio = 2, priority = 1, ingredients = {["minecraft:bamboo_block"]={1}}},{quantity = 1, ratio = 2, priority = 1, ingredients = {["minecraft:stripped_bamboo_block"]={1}}}}	
			--ratio = self.itemLocations[ingredient].recipes[1].ratio
			required = #slots * self.quantity / self.ratio -- eg 1 slots * 2 / 2 = 1
		end
		_G.Log:saveToLog("P:update() self.itemLocations["..ingredient.."].required = "..required.." (#slots(".. #slots..") * self.quantity("..self.quantity..") / self.ratio("..self.ratio..")")
		self.itemLocations[ingredient].locations = U.findItemInStorage(ingredient, true)	-- eg nil or {["minecraft:oak_planks"] = {"minecraft:chest_38", "minecraft:chest_39"} OR nil if not in stock
		self.itemLocations[ingredient].available =  U.getItemStock(ingredient)
		self.itemLocations[ingredient].required = required
		self.itemLocations[ingredient].sent = false	
		
	end
	--[[
	itemLocations["minecraft:oak_planks"] = 
	{
		name = "minecraft:oak_planks",
		displayName = "Oak Planks",
		recipes = {{quantity = 1, ratio = 4, priority = 1, ingredients = {["minecraft:oak_log"]={1}}}},
		required = 6,
		locations = {"minecraft:chest_38", "minecraft:chest_39"},
		available = 0,
		sent = false
	}
	]]
end

function P:updateItemLocations(item, location)
	-- called from Craft.lua runCraftProcess()
	-- eg new crafted items now in  inputBarrel, update
	if self.itemLocations[item] ~= nil then
		if self.itemLocations[item].locations == nil then
			self.itemLocations[item].locations = {}
		end
		self.itemLocations[item].locations = location	-- eg self.itemLocations["minecraft:oak_planks"].locations = {"minecraft:barrel_60"}
	end
end

return P
