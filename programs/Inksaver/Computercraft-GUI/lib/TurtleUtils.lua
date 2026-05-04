local version = 20260419.1230
--[[
	Last edited: see version YYYYMMDD.HHMM
	save as lib/TurtleUtils.lua
	usage:This is part of the libraries required for tk2.lua and tk3 (Toolkit 2/3)
	a GUI interface ideal for Advanced Turtles. Works on non-advanced using numbers from keyboard
	It also requires Items and Vector2 libraries:
	Items 
	Vector2
]]
local Items 		= require("lib.data.items")
local Vector2 		= require("lib.Vector2")
local metals 		= {"iron", "gold", "copper", "netherite", "red_alloy"}
local categories 	= {"building", "colored", "combat", "computercraft", "food", "functional", "ingredients", "morered", "natural", "redstone", "tools"}
local timber 		= {"pale_oak", "dark_oak", "oak", "birch", "spruce", "jungle", "acacia", "mangrove", "cherry", "bamboo", "crimson", "warped"}
local stone 		= {"cobblestone", "red_sandstone", "sandstone","end_stone", "blackstone", "stone", "deepslate","granite", "diorite", "andesite", "netherrack", "nether", "basalt", "mud", "dark_prismarine", "prismarine"}
local minerals 		= {"iron", "gold", "copper", "netherite", "diamond", "emerald", "coal", "redstone", "lapis_lazuli", "quartz", "amethyst"}
local ingots 		= {"iron", "gold", "copper", "netherite"}
local itemColours 	= {"white", "light_gray", "gray", "brown", "red", "orange", "yellow", "lime", "green", "cyan", "light_blue", "blue", "purple", "magenta", "pink"}
local currentCursor = { x = 0, y = 0, fg = colors.white, bg = colors.black, blink = true}
local nuggetItems 	= {"minecraft:iron_axe", "minecraft:iron_chestplate", "minecraft:iron_helmet", "minecraft:iron_hoe", "minecraft:iron_pickaxe",
					 "minecraft:iron_boots", "minecraft:iron_leggings", "minecraft:iron_shovel","minecraft:iron_sword"}
local fuelValues 	= {["lava_bucket"] = 100, ["coal_block"] = 80, ["dried_kelp_block"] = 20, ["blaze_rod"] = 12, ["coal"] = 8, ["log"] = 1.5, ["wood"] = 1.5, ["planks"] = 1.5}
local nbt = {["021f1ac06ec4e4c75d0e0bf67c0712dc"] = "Silk Touch", ["704a1bcdf9953c791651a77b1fe78891"] = "Mending"}

local U = {}
U.stone =
{	
	"minecraft:cobblestone",
	"minecraft:mossy_cobblestone",
	"minecraft:netherrack",
	"minecraft:blackstone",
	"minecraft:gilded_blackstone",
	"minecraft:polished_blackstone",
	"minecraft:polished_blackstone_bricks",
	"minecraft:cracked_polished_blackstone_bricks",
	"minecraft:chiseled_polished_blackstone",
	"minecraft:basalt",
	"minecraft:deepslate",
	"minecraft:cobbled_deepslate",
	"minecraft:chiseled_deepslate",
	"minecraft:polished_deepslate",
	"minecraft:deepslate_bricks",
	"minecraft:cracked_deepslate_bricks",
	"minecraft:deepslate_tiles",
	"minecraft:cracked_deepslate_tiles",
	"minecraft:tuff",
	"minecraft:tuff_bricks",
	"minecraft:polished_tuff",
	"minecraft:chiseled_tuff",
	"minecraft:chiseled_tuff_bricks",
	"minecraft:granite",
	"minecraft:diorite",
	"minecraft:andesite",
	"minecraft:end_stone",
	"minecraft:obsidian",
	"minecraft:stone",
	"minecraft:smooth_stone",
	"minecraft:stone_bricks",
	"minecraft:cracked_stone_bricks",
	"minecraft:chiseled_stone_bricks",
	"minecraft:mossy_stone_bricks",
	"minecraft:sandstone",
	"minecraft:smooth_sandstone",
	"minecraft:chiseled_sandstone",
	"minecraft:cut_sandstone",
	"minecraft:red_sandstone",
	"minecraft:smooth_red_sandstone",
	"minecraft:chiseled_red_sandstone",
	"minecraft:cut_red_sandstone",
	"minecraft:obsidian",
	--"minecraft:dirt",
	"minecraft:glass",
	"minecraft:purpur_block",
	"minecraft:terracotta",
	"minecraft:white_terracotta",
	"minecraft:red_terracotta",
	"minecraft:orange_terracotta",
	"minecraft:yellow_terracotta",
	"minecraft:brown_terracotta",
	"minecraft:light_gray_terracotta"
} -- must be exact mc names!
U.fc = 0						-- function count for debugging purposes
U.InventoryList = 
{				

	["buildGableRoof"] = {},
	["buildPitchedRoof"] = {},
	["buildStructure"] = {},
	["buildWall"] = {},

	["clearArea"] = {},
	["clearBuilding"] = {},
	["clearMineshaft"] = {}	,	
	["clearMonumentLayer"] = {},
	["clearMountainSide"] = {},
 	["clearPerimeter"] = {},
	["clearRectangle"] = {},				
	["clearSandCube"] = {},
	["clearSandWall"] = {},
	["clearSolid"] = {},
	["clearWall"] = {},				
	["clearWaterPlants"] = {},
	["convertWater"] = {},		
	["createBoatLift"] = {},
	["createBorehole"] = {},		
	
	["createBubbleTrap"] = {},		
	["createCorridor"] = {},
	["createDragonTrap"] = {},
	["createEnderTower"] = {},
 	["createFarmNetworkStorage"] = {},

	
	["createFloorCeiling"] = {},
	["createIceCanal"]  = {},	
	
	["createLadderToWater"] = {},
	
	["createMobFarmCube"] = {},
	["createMobBubbleLift"] = {},
 	["createMobGrinder"] = {},
	["createPath"] = {},
	["createPlatform"] = {},
	["createPortal"] = {},
	["createPortalPlatform"] = {},
	["createRailway"] = {},
	["createRectanglePath"] = {},
	["createRetainingWall"] = {},
	
	["createSandWall"] = {},
	["createSlopingWater"] = {},
	["createSquidFarmBase"] = {},
	["createSinkingPlatform"] = {},
	
	["createStripMine"] = {},
	["createTreefarm"] = {},
	["createTrialCover"] = {},
	
	["createWaterCanal"] = {},
 	["deactivateDragonTower"] = {},
	["demolishPortal"] = {},
	["digTrench"] = {},
	["drainWaterLava"] = {},
	["fellTree"] = {},
	["floodMobFarm"] = {},		
	["harvestObsidian"] = {},
	["harvestShulkers"] = {},
	["harvestTreeFarm"] = {},
	["manageFarm"] = {},	
	["manageFarmSetup"] = {},
	["measure"] = {},					
	
	["oceanMonumentColumns"] = {},
	["placeRedstoneTorch"] = {},
	["plantTreefarm"] = {},		
	
	
	["sandFillArea"] = {},
	["undermineDragonTowers"] = {},
	["upgradeFarmland"] = {}	
}
U.currentTask = ""				-- name of selected task eg "createMine" used as a key for the function list U.fList
U.executeTask = false			-- flag for GUI to start the selected task
U.taskInventory = {}			-- data for required items per task eg createMine()
U.bedrock = 0					-- default level for bedrock: version dependant
U.ceiling = 255					-- default level for highest build: version dependant
U.multiButtonData = {}			-- store data from last event here to compare with next event
U.subMenuName = ""				-- MainMenu subMenu in use (name)
U.subMenuIndex = 0				-- MainMenu subMenu in use (index)
U.currentMB = ""				-- which multibutton in a scene is currently in use for char event checking
U.keyboardInput = ""			-- build keyboard entries eg 0, 1 = "01" or "q" or "b"
U.turtleName = ""
U.isStorageConfigured = false
U.barrelObjects = nil 			-- list of barrel objects returned by {periheral.find("minecraft:barrel")} in U.wrapModem()
U.chestObjects = nil			-- list of chest objects returned by  {periheral.find("minecraft:chest")}  in U.wrapModem()
U.barrelNames = nil 			-- list of barrel Names returned by {periheral.getName(barrelObject[#])}
U.chestNames = nil				-- list of chest Names returned by {periheral.getName(chestObject[#])}
U.barrelItems = nil				-- list of items and the barrels where they are usually found. ALSO SAVED in lib/data/barrelItems.lua
U.chestItems = nil				-- list of items and the chests where they are usually found,  ALSO SAVED in lib/data/chestItems.lua
U.itemDatabase = nil			-- database of all Items, their name, displayName and crafting recipe
U.crafts = nil					-- table of displayNames of all items that can be crafted. populated in scene:Craft.S.enter()from U.fillCrafts()
U.smelts = nil					-- table of displayNames of all items that can be smelted. populated in scene:Smelt.S.enter()from U.fillSmelts()
U.smeltFrom = nil				-- table of items and their smelt sources eg {["minecraft:stone"] = {"minecraft:cobblestone"}}
U.crafter = nil					-- placeholder for single Crafter object
U.smelters = {}					-- populated in main().setupSmelters()
U.allItems = {}					-- populated in main()
U.data = nil
U.furnaceCount = 0
U.blastCount = 0
U.smokerCount = 0
U.blastFurnace = {"ancient_debris","iron","gold","copper"}
U.smoker = {"mutton", "rabbit", "chicken", "potato", "cod", "salmon", "beef", "porkchop", "kelp"}
U.window = nil
U.dialog = nil
U.smeltersActive = false
U.smeltFromCraft = false
U.windowAction = ""
U.connected = false
U.dialogActive = false
U.dialogData = nil
U.R = {}						-- used to hold a copy of original values of global R created in tk3
U.stack1 = {"bed", "shulker", "decorated_pot", "minecart", "boat", "shovel", "pickaxe", "axe", "hoe", "fishing_rod", "flint_n_steel", "*bucket", "spyglass", "book_n_quill",
			"elytra", "shears", "horn", "music", "soup", "stew", "cake", "water_bottle", "potion", "enchanted_book", "helmet", "chestplate", "leggings", "boots",
			"bow", "crossbow", "armor", "cap", "tunic", "pants"}
U.stack16 = {"ender_pearl", "snowball", "bucket", "egg", "sign", "honey_bottle", "banner", "armor_stand", "bucket"}
--[[
	ccTweaked events
	char			local event, character = os.pullEvent("char")
	
	key				local event, key, is_held = os.pullEvent("key")
	key_up			local event, key = os.pullEvent("key_up")
	
	mouse_click		local event, button, x, y = os.pullEvent("mouse_click")
	mouse_drag		local event, button, x, y = os.pullEvent("mouse_drag")
	mouse_scroll	local event, direction, x, y = os.pullEvent("mouse_scroll")  direction -1 = up, 1 = down
	mouse_up		local event, button, x, y = os.pullEvent("mouse_up")
	monitor_touch	local event, side, x, y = os.pullEvent("monitor_touch")
	
	keys:
	0 = 48, 1 = 49, 2 = 50, 3 = 51, 4 = 52, 
	5 = 53, 6 = 54, 7 = 55, 8 = 56, 9 = 57
	right = 262, left = 263, down = 264, up = 265, 
	backspace = 8, enter = 13
]]

local colours =
{
	{ 1,"white"},
	{2, "orange"},
	{4, "magenta"},
	{8, "lightBlue"},
	{16, "yellow"},
	{32, "lime"},
	{64, "pink"},
	{128, "gray"},
	{256, "lightGray"},
	{512, "cyan"},
	{1024, "purple"},
	{2048, "blue"},
	{4096, "brown"},
	{8192, "green"},
	{16384, "red"},
	{32768, "black"}
}

-- GENERAL UTILITIES
function string:count(c)
    --[[ count number of occurences of c ]]
	local _,n = self:gsub(c,"")
    return n
end

function string:endsWith(ending)
	--[[ get ending character of a string ]]
	return ending == "" or self:sub(-#ending) == ending
end

function string:split(sSeparator, nMax, bRegexp, noEmpty)
	--[[return a table split with sSeparator. noEmpty removes empty elements
		use: tblSplit = SplitTest:split('~',[nil], [nil], false) or tblSplit = string.split(SplitTest, '~')]]   
	assert(sSeparator ~= '','separator must not be empty string')
	assert(nMax == nil or nMax >= 1, 'nMax must be >= 1 and not nil')
	if noEmpty == nil then noEmpty = true end

	local aRecord = {}
	local newRecord = {}
	-- self refers to the 'string' being split
	if self:len() > 0 then
		local bPlain = not bRegexp
		nMax = nMax or -1

		local nField, nStart = 1, 1
		local nFirst,nLast = self:find(sSeparator, nStart, bPlain)
		while nFirst and nMax ~= 0 do
			aRecord[nField] = self:sub(nStart, nFirst-1)
			nField = nField+1
			nStart = nLast+1
			nFirst,nLast = self:find(sSeparator, nStart, bPlain)
			nMax = nMax-1
		end
		aRecord[nField] = self:sub(nStart)
		
		if noEmpty then --split on newline preserves empty values
			for i = 1, #aRecord do
				if aRecord[i] ~= "" then
					table.insert(newRecord, aRecord[i])
				end
			end
		else
			newRecord = aRecord
		end
	end
	
	return newRecord
end

function U.charCount(text, char)
	return text:count(char)
end

function U.clear(reset)
	reset = reset or false
	
	if reset then
		term.setTextColor(colors.white)
		term.setBackgroundColor(colors.black)
	end
	term.clear()
	term.setCursorPos(1, 1)
end

function U.colourText(col, row, text)
	--[[
		This uses char ` to separate colour strings and ¬ to separate text/background colours              
		example text = `lg¬black` `lg¬purple` `lg¬black`Furnace `lg¬red` `lg¬black`Blast Furnace `lg¬green` `lg¬black`Smoker
	]]

	term.setCursorPos(col, row)
	local lineParts = text:split("`")
	for i = 1, #lineParts do
		part = lineParts[i]						-- eg "red;black" or "This is a line of red text on black background"
		if part:find("¬") ~= nil then
			local fgbg = part:split("¬")
			if fgbg[1] == "lg" then
				fgbg[1] = "lightGray"
			elseif fgbg[1] == "lb" then
				fgbg[1] = "lightBlue"
			end
			if fgbg[2] == "lg" then
				fgbg[2] = "lightGray"
			elseif fgbg[2] == "lb" then
				fgbg[2] = "lightBlue"
			end
			term.setTextColor(colors[fgbg[1]])
			term.setBackgroundColor(colors[fgbg[2]])
		else 									-- not a colour command so print it out without newline
			term.write(part)
		end
	end
end

function U.contains(list, item)
	if list ~= nil then
		for k,v in pairs(list) do
			if v == item then
				return true
			end
		end
	end
	return false
end

function U.copyTable(tbl)
	local temp = {}
	for _, v in ipairs(tbl) do 
		table.insert(temp, v)
	end
	return temp
end

function U.deepCopyTable(obj)
	-- recursive function
	function copy(obj, seen)
		if type(obj) ~= 'table' then return obj end
		if seen and seen[obj] then return seen[obj] end
		local s = seen or {}
		local res = setmetatable({}, getmetatable(obj))
		s[obj] = res
		for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
		return res
	end
	return copy(obj)
end

function U.copyR()
	U.R = {}
	for key, value in pairs(R) do
		U.R[key] = value
	end
end

function U.compareR()
	local retValue = {}
	for key, value in pairs(R) do
		if U.R[key] ~= value then
			retValue[key] = value
		end
	end
	return retValue
end

function U.LogR()
	Log:saveToLog("R values: "..textutils.serialise(R, {compact = true}))
end

function U.getColour(number)
	return colours[number]
end

function U.indexOf(list, item)
	for i,v in ipairs(list) do
		if v == item then
			return i
		end
	end
	return -1
end

function U.isIngot(item)
	for _,v in ipairs(ingots) do
		if item:find(v) ~= nil then
			return true, v
		end
	end
	return false, ""
end

function U.isMineral(item)
	for _,v in ipairs(minerals) do
		if item:find(v) ~= nil then
			return true, v
		end
	end
	return false, ""
end

function U.isStone(item)
	for _,v in ipairs(stone) do
		if item:find(v) ~= nil then
			return true, v
		end
	end
	return false, ""
end

function U.isTableEmpty(aTable)
	if next(aTable) == nil then
		return true
	end
	return false
end

function U.isTimber(item)
	for _,v in ipairs(timber) do
		if item:find(v) ~= nil then
			return true, v
		end
	end
	return false, ""
end

function U.padCenter(text, length, char)
	return U.padCentre(text, length, char)
end

function U.padCentre(text, length, char)
	--[[Pads str to length with char on left and right]]
	text = tostring(text)
	char = char or " "
	while #text < length do
		text = char..text..char
	end
	if #text > length then
		text = text:sub(1, length)
	end
	
	return text
end

function U.padLeft(text, length, char)
	--[[Pads str to length with char from left]]
	text = tostring(text)
	char = char or " "
	while #text < length do
		text = char..text
	end
	if #text > length then
		text = text:sub(1, length)
	end
	
	return text
end

function U.padRight(text, length, char)
	--[[
	Pads string to length len with chars from right
	test = lib.padRight("test", 10, "+") -> "test++++++"]]
	text = tostring(text)
	char = char or " "
	while #text < length do
		text = text.. char
	end
	if #text > length then
		text = text:sub(1, length)
	end
	
	return text
end

function U.parseExpression(expression, calledFrom)
	--[[ {"R.height * 6"} or "math.abs(R.height - R.currentLevel) / 3" ]]
	if calledFrom == nil then calledFrom = "unknown" end
--Log:saveToLog("U.parseExpression(expression = "..expression..", called from "..calledFrom)
	local lib = {}
	
	function lib.parse(part, sum)
		-- local sum = 0
		-- eg "R.width * 2 + R.length * 2",
		--Log:saveToLog("    lib.parse(part = "..part..", sum = "..sum..")")
		local elements = U.split(part, " ")
		-- eg {"R.width", "*", "2", "+", "R.length", "*", "2"}
		-- convert all R.?? into numbers
		--local operands = {}
		--local operators = {}
		for i = 1, #elements do 
			--elements[i] = lib.convert(elements[i])
			local copy = elements[i]
			if tonumber(elements[i]) ~= nil then
				--table.insert(operands, tonumber(elements[i]))
				elements[i] = tonumber(elements[i])
			else
				-- table.insert(operators, elements[i])
				elements[i] = lib.convert(elements[i])
			end
			--Log:saveToLog("\telements["..i.."] changed from "..tostring(copy).." to "..elements[i])
		end
		-- eg {"R.width", "*", "2", "+", "R.length", "*", "2"} -> {10, "*", 2, "+", 15, "*", 2}
		-- if only one element, is probably math.?? OR a number
		if #elements == 1 then
			if tonumber(elements[1]) ~= nil then
				return elements[1]
			else
				return lib.calculate(sum, elements[1], sum) -- eg -10, math.abs, -10 -> 10
			end
		else	-- 2 or more elements
			if tonumber(elements[1]) ~= nil then -- starts with a number
				--sum = elements[1]	-- eg 10
				--Log:saveToLog("\tcall lib.calculate("..elements[1]..", "..elements[2]..", "..elements[3])
				sum = lib.calculate(elements[1], elements[2], elements[3])	-- eg 10, "*", 2
				if #elements > 3 then
					for i = 4, #elements, 2 do
						--if sum == 0 then
							Log:saveToLog("\t    sum = "..sum.." call lib.calculate("..sum..", "..elements[i]..", "..elements[i+1])
							sum = lib.calculate(sum, elements[i], elements[i+1])	-- eg "+", 15
						--else
							--sum = lib.calculate(elements[i], elements[i + 1], elements[i+2])
						--end
					end
				end
			else	-- starts with an operator eg math.abs
				--Log:saveToLog("\tstarts with "..elements[1].. ", sum = "..sum)
				--if (elements[1]):find("math") ~= nil then
					--if #elements > 2 then
					
					--end
				--end
				sum = lib.calculate(sum, elements[1])
			end
		end
		-- if starts with number, should be a sequence of calculations 
		
		
		--[[Log:saveToLog("\tlib.parse(operands = "..textutils.serialise(operands, {compact = true})..", operators = "..textutils.serialise(operators, {compact = true}))
		-- eg {"10", "*", "2", "+", "10", "*", "2"} -> {10, 2, 10, 2} -> {"*", "+", "*"}
		-- normally 1 more operand than operators
		-- exceptions same no of both: "/ R.torchInterval", -> {8}, {"/"} matching no: use operator first apply to sum
		-- exceptions only 1 operator {"math.abs"}: apply operator to sum
		if #operands - #operators == 1 then -- {10, 2, 10, 2} {"*", "+",
			for i = 1, #operands do
				if i == 1 then
					sum = operands[i]
				else -- 
					sum = lib.calculate(sum, operators[i - 1], operands[i])
				end
			end
		elseif #operands == #operators then -- {8}, {"/"}
			sum = lib.calculate(sum, operators[1], operands[1])
		elseif #operands == 0 and #operators == 1 then -- {"math.abs"}
			if operators[1] == "math.abs" then
				sum = math.abs(sum)
			elseif operators[1] == "math.floor" then
				sum = math.floor(sum)
			end
		end]]
--Log:saveToLog("U.parseExpression return "..sum)
		return sum
	end
	
	function lib.convert(text)
		-- eg "R.width", "*", "2", "+", "R.length", "*", "2"
		if text:find("R.") ~= nil then
			return R[text:sub(3)] 				-- eg R.width = 10 
		elseif text:find("T:") ~= nil then 		-- eg T:getEmptySlotCount
			return T[text:sub(3)](T) 			-- eg T["getEmptySlotCount"](T)
		elseif text:find("U.") ~= nil then 		-- eg U.bedrock
			return U[text:sub(3)]			 	-- eg U["bedrock"]
		else
			return text							-- eg math.abs
		end
	end
	
	function lib.calculate(sum, operator, operand)
		if operator == "+" then
			return sum + operand
		elseif operator == "-" then
			return sum - operand
		elseif operator == "*" then
			return sum * operand
		elseif operator == "/" then
			if operand == 0 then
				return 0
			else
				return sum / operand
			end
		elseif operator == "math.abs" then
			return math.abs(sum)
		elseif operator == "math.floor" then
			return math.floor(sum)
		elseif operator == "math.ceil" then
			return math.ceil(sum)
		end
	end
		
	function lib.getBrackets(text)
		-- eg "math.floor((R.width * 2 + R.length * 2) / R.torchInterval)"
		--Log:saveToLog("lib.getBrackets('"..text.."')")
		local bracketStart = 0
		local lastFound = nil
		repeat
			bracketStart = text:find("%(", bracketStart + 1)
			if bracketStart ~= nil then
				lastFound = bracketStart
			end
		until bracketStart == nil
		if lastFound == nil then
			return 0, 0
		end
		bracketStart = lastFound
		local bracketEnd = text:find("%)", bracketStart)
		
		return bracketStart, bracketEnd -- eg brackets.open = {11, 12}, brackets.closed = {39, 58}
	end
	
	function lib.evaluateR(expression)
		-- "math.abs( R.height - R.currentLevel ) / 3"
		local elements = U.split(expression, " ")
		-- eg "math.abs(", "R.height", "-", "R.currentLevel", ")", "/", "3"
		local evalString = "return "
		for i = 1, #elements do 
			if elements[i]:find("U.") ~= nil then
				local key = elements[i]:sub(3)
				evalString = evalString..U[key]
			elseif elements[i]:find("R.") ~= nil then
				local key = elements[i]:sub(3)
				evalString = evalString..R[key]
			else
				evalString = evalString..elements[i]
			end
		end
		return evalString
	end
	
	if tonumber(expression) ~= nil then
		return tonumber(expression)		-- simple number returned immediately
	end
	-- eg "math.abs(R.height - R.currentLevel) * 2"
	local evalString = lib.evaluateR(expression)
	local func = loadstring(evalString)
	local result = func()
	-- change R. values to numbers
	
	
	--[[
	local parts = {}
	local bracketStart, bracketEnd = 0, 0
	local start, part, remain = "", "", ""
	--Log:saveToLog("U.parseExpression('"..expression.."')")
	local sum = 0
	repeat
		bracketStart, bracketEnd = lib.getBrackets(expression) -- gets innermost bracket pair
		if bracketStart > 0 then
			--Log:saveToLog("    bracketStart = "..bracketStart..", bracketEnd = "..bracketEnd)
			start = U.trim(expression:sub(1, bracketStart - 1))
			part = U.trim(expression:sub(bracketStart + 1, bracketEnd - 1))
			remain = U.trim(expression:sub(bracketEnd + 1))
			--Log:saveToLog("    start = "..start..", part = "..part..", remain = "..remain.." : parsing "..part)
			table.insert(parts, U.trim(part))
			sum = lib.parse(part, sum)
			--Log:saveToLog("    sum = "..sum)
			expression = start.." "..sum.." "..remain
			--Log:saveToLog("    reformed expression = "..expression.."\n")
			--expression = U.trim(remain)
		end
	until bracketStart == 0
	if tonumber(expression) == nil then
		sum = lib.parse(expression, sum)
	end
	return sum]]
	return result
end

function U.restoreCursor(withColours)
	withColours = withColours or false
	term.setCursorPos(currentCursor.x, currentCursor.y )
	term.setCursorBlink(currentCursor.blink )
	if withColours then
		term.setTextColor(currentCursor.fg)
		term.setBackgroundColor(currentCursor.bg )
	end
end

function U.removeDigits(text)
	-- eg " 1 64 cobbled_deepslate     " slot and count
	-- eg "62 cobblestone              " count only, no slot
	local slot = 0
	local count = 0
	text = U.trim(text)							-- remove leading and trailing spaces
	if tonumber(text:sub(1,1)) ~= nil then		-- starts with a number
		local start = text:find(" ")			-- eg start = 3
		slot = text:sub(1, start - 1)			-- eg slot = 1
		text = U.trim(text:sub(start + 1))		-- eg "64 cobbled_deepslate" or "cobblestone"
		if tonumber(text:sub(1,1)) ~= nil then	-- starts with a number
			start = text:find(" ")				-- eg start = 3
			count = text:sub(1, start - 1)		-- eg count = 64
			text = text:sub(start + 1)			-- eg "cobbled_deepslate"
		else
			count = slot						-- original number was count, not slot
			slot = 0							-- reset slot
		end
	end
	
	return text, tonumber(count), tonumber(slot)					-- eg cobbled_deepslate, 64, 1 or cobblestone, 62, 0
end

function U.setCurrentCursor(withColours)
	withColours = withColours or false
	currentCursor.x, currentCursor.y = term.getCursorPos()
	currentCursor.blink = term.getCursorBlink()
	if withColours then
		currentCursor.fg = term.getTextColor()
		currentCursor.bg = term.getBackgroundColor()
	end
end

function U.split(text, separator)
	separator = separator or " "
	return text:split(separator)
end

function U.stackSize(item)
	for _, v in ipairs(U.stack1) do
		if item:find(v) ~= nil then
			return 1
		end
	end
	for _, v in ipairs(U.stack16) do
		if item:find(v) ~= nil then
			return 16
		end
	end
	return 64
end

function U.tableConcat(tbl, sep)
    local output = ""
    for i,value in pairs(tbl) do
        output = output .. tostring(value)
        if i ~= #tbl then
            output = output .. sep
        end
    end

    return output
end

function U.tableContains(tableName, value, exactMatch)
	exactMatch = exactMatch or false
	for k, v in ipairs(tableName) do
		if exactMatch then
			if v == value then
				return true
			end
		else
			if v:find(value) ~= nil then
				return true
			end
		end
	end
	return false
end

function U.trim(text)
	--[[ trim leading and trailing spaces ]]
	if text ~= nil then
		return (text:gsub("^%s*(.-)%s*$", "%1"))
	end
	return text
end

function U.unpack(tbl)
	local output = "{"
	for key, value in pairs(tbl) do
		if type(value) == "table" then
			for k,v in pairs(value) do
				output = output.."k = "..k..", v = "..v.."; "
			end
		else
			output = "key = "..key..", value = "..tostring(value)
		end
	end
	return output.."}"
end

function U.writeTraceTable(description, tbl)
	local output = {}
	for key, value in pairs(tbl) do
		local text = ""
		if type(value) == "table" then
			for k,v in pairs(value) do
				text = text.."k = "..k..", v = "..v.."; "
			end
		else
			text = "key = "..key..", value = "..value
		end
		table.insert(output, text)
	end
	_G.Log:writeTraceTable(description, output)
end
--TURTLE UTILITIES
function U.useSticksAsFuel()
	local slot = T:getItemSlot("minecraft:stick") 
	if slot > 0 then -- use any sticks to refuel
		turtle.select(slot)
		turtle.refuel()
	end
	slot = T:getItemSlot("minecraft:mangrove_roots") 
	if slot > 0 then -- use any roots to refuel
		turtle.select(slot)
		turtle.refuel()
	end
end

-- NETWORK UTILITIES
function U.addToStorageList(storageType, itemKey, storageName, writeToFile)
	-- itemKey is a table, so is passed byRef. No need to return a value
	-- eg itemKey: [ "minecraft:dark_oak_sapling" ] = {"minecraft:barrel_94", "minecraft:barrel_96"}
	-- storageName = "minecraft:barrel_99"
	local itemTable = {}
	if storageType == "chest" then
		itemTable = U.chestItems[itemKey]	-- eg [ "minecraft:dark_oak_sapling" ] = {"minecraft:barrel_94", "minecraft:barrel_96"}
	else
		itemTable = U.barrelItems[itemKey]
	end
	if itemTable == nil then				-- key does not match. This item not previously stored
		if storageType == "chest" then
			U.chestItems[itemKey] = {storageName}	-- eg U.chestItems[minecraft:diorite] = {chest_105}
		else
			U.barrelItems[itemKey] = {storageName}
		end
	else
		for _, storage in ipairs(itemTable) do	-- is "minecraft:barrel_99" already in the list?
			if storage == storageName then
				return	-- exit function
			end
		end
		-- not found so add to table. return not required as funcion is ended
		table.insert(itemTable, storageName)	-- add to table eg table[ "minecraft:dark_oak_sapling" ] = {"minecraft:barrel_94", "minecraft:barrel_96",, "minecraft:barrel_99"}
	end
	if writeToFile then
		U.updateList(storageType)
	end
end

function U.attachModem()
	-- modem cannot be "attached". Has to be player right-click!
	-- place on  top or next to a modem and ask player to right-click
	T:clear()
	menu.colourPrint("Please right-click on the modem(s) I am next to or above/below"..
					"\nThe centre square should be lit red.\n"..
					"If embedded use narrow gap at side\n", colors.red)
	local event, side = os.pullEvent("peripheral")
	for timer = 3, 0, -1 do							-- countdown from 3 to 1
		-- text, fg, bg, width, isInput, cr
		menu.colourWrite("Thanks. continuing in ".. timer.." seconds", colors.lime, colors.black, 0, false, true)
		sleep(1)
	end
end

function U.checkInventory(inventory, itemName, itemsPerSlot, matchPart)
	--[[
	Find an item already in an inventory
	inventory = The wrapped inventory or it's name
	itemName = The name of the item to find.
	return no of items already present, and storage space for additional
	]]
	itemsPerSlot = itemsPerSlot or 64
	matchPart = matchPart or ""
	local contents = nil
	local numSlots = 0
	if type(inventory) == "string" then
		contents = peripheral.call(inventory, "list")
		numSlots = peripheral.call(inventory, "size")
		--assert(contents ~= nil, "Nil contents from inventory "..tostring(inventory))
--Log:saveToLog("U.checkInventory('"..inventory.."', itemName = "..itemName..", itemsPerSlot = "..itemsPerSlot..", matchPart = "..tostring(matchPart))
	else
		contents = inventory.list()
		numSlots = inventory.size()
	end
	local inStock = 0
	local partMatch = false
	local canStore = 0
	if contents ~= nil then
--Log:saveToLog("#slots in use = "..#contents)
		canStore = (numSlots - #contents) * itemsPerSlot 	-- capacity of empty slots
		for slot, item in pairs(contents) do
			if item.name == itemName then
				inStock = inStock  + item.count
				canStore = canStore + itemsPerSlot - item.count
			else
				if matchPart ~= "" then	-- eg check for "cobblestone" or "slab"
					if item.name:find(matchPart) ~= nil then
						partMatch = true
					end
				end
			end
		end
	end
	return inStock, canStore, partMatch -- eg 1, 3647, false if contains only 1 matching item in otherwise empty chest
end

function U.emptyInventory(barrels, chests, sticksAsFuel, relist)
	--[[
		U.emptyInventory({"sapling", "propagule", "dirt", "crafting"}, {"all"}, true)
		put {"sapling", "propagule", "dirt", "crafting"} into barrels
		put anything else into chests
	]]
	U.wrapModem(relist)
	if not T:isEmpty() then
		if sticksAsFuel then
			U.useSticksAsFuel()
		end
		for _, item in ipairs(barrels) do
			if item == "all" then
				U.sendItemToNetworkStorage("barrel", "all", 0)
				break
			end
			if T:getItemCount(item) > 0 then
				U.sendItemToNetworkStorage("barrel", item, 0)
			end
		end
		for _, item in ipairs(chests) do
			U.sendItemToNetworkStorage("chest", item, 0)
		end
	end
end

function U.loadStorageLists()
	--[[
		called from U.wrapModem() only if not previously done, or redo lists specified
		lists of barrel and chest peripherals has already been created
		contents of each now needs to be found
	]]
	local lib = {}
	
	function lib.createList(storageType)
		local total = 0
		local locations = {}
		local storageNames = U.barrelNames
		if storageType == "chest" then
			storageNames = U.chestNames
		end 
		for _, store in pairs(storageNames) do					-- eg "minecraft:chest_1"
			T:clear()				
--Log:saveToLog("Checking "..store.. " contents")		-- eg "checking minecraft:chest_1 contents"
			local contents = peripheral.call(store, "list")		-- list of items / slots for this chest
			for slot, item in pairs(contents) do				-- for each item check if this storage is listed
				if locations[item.name] == nil then				-- this item not yet found
Log:saveToLog("    lib.createList("..storageType..") creating new key: "..item.name)
					locations[item.name] = {store}				-- add to table eg locations["minecraft:cobblestone"] = {"minecraft:chest_1"}
				else											-- already has at least 1 location
					if not U.contains(locations[item.name], store) then
						table.insert(locations[item.name], store )
Log:saveToLog("    lib.createList("..storageType..") adding to key: "..item.name..": store = "..store)
					end
					--U.addToStorageList(storageType, locations[item.name], store, false)
				end
			end
			total = total + 1
		end
--Log:saveToLog("found ".. total.." "..storageType)
		local output = textutils.serialize(locations)		-- serialise to json ready to write to file
		--local fileName = "lib/data/"..storageType.."Items.lua"			-- barrelList.lua or chestList.lua
		local fileName = "lib/data/"..storageType.."Items.lua"			-- barrelList.lua or chestList.lua
		local outputHandle = fs.open(fileName, "w")			-- open file
		outputHandle.writeLine("return")					-- start file with return
		outputHandle.write(output)							-- add serialised table
		outputHandle.close()								-- close file
		return locations
	end
	
	function lib.listNeedUpdating(storageType, list)
		-- see if named chest/barrel in list is found in fresh peripheral.find
		-- turtle may have moved to a different network
		-- list = eg [ "minecraft:stick" ] = {"minecraft:barrel_91","minecraft:barrel_114"}
		local rawStorage = nil									-- peripheral find can return duplicate values
		local using = "minecraft:barrel"						-- storageType may be barrel, barrels, minecraft:barrel
		local found = false
		if storageType:find("chest") ~= nil then
			using = "minecraft:chest"
		end
		rawStorage = {peripheral.find(using)}
		
		if not U.isTableEmpty(rawStorage) then					-- chests / barrels are attached see if they match
			for item, storeList in pairs(list) do				-- existing storage names can be found here
				for key, value in ipairs(rawStorage) do			-- look in the fresh list of storage names to see if there are missing entries
					local name = peripheral.getName(value)				
					for _, storageName in ipairs(storeList) do 	-- check each storage name found
						if storageName == name then 			-- recorded name matches, check next one
							found = true
							break
						end
					end
					if found then break end
				end
				if not found then
					-- no match in existing list for this storage: list needs updating
					return true									-- list does not match
				end
			end
		end
		return false											-- list is ok
	end
	
	-- populate module scope variables U.barrelItems and U.chestItems
	U.barrelItems = {}
	U.chestItems = {}
	U.barrelItems = lib.createList("barrel")
	U.chestItems = lib.createList("chest")
	--[[local redo = false
	if U.barrelItems == nil then								-- module scope variable not yet loaded
Log:saveToLog("==> U.loadStorageLists() --> U.barrelItems == nil, checking if file exists")
		if fs.exists("lib/data/barrelItems.lua") then
Log:saveToLog("    U.loadStorageLists() --> File found. U.barrelItems = require('lib.data.barrelItems)")
			U.barrelItems = require("lib.data.barrelItems")		-- module scope variable
			if U.isTableEmpty(U.barrelItems) then				-- loaded empty table
Log:saveToLog("    U.loadStorageLists() --> File loaded. U.barrelItems is empty")
				redo = true
			else
				redo = lib.listNeedUpdating("barrel", U.barrelItems)
Log:saveToLog("    U.loadStorageLists() --> ? U.barrelItems needs updating")
			end
		else													-- file does not exist
Log:saveToLog("    U.loadStorageLists() --> U.barrelItems file does not exist")
			redo = true											
		end
	end
	if redo then
Log:saveToLog("    U.loadStorageLists() --> redo barrelList")
		U.barrelItems = lib.createList("barrel")
	end
	redo = false
	if U.chestItems == nil then									-- module scope variable not yet loaded
Log:saveToLog("    U.loadStorageLists() --> U.chestItems == nil, checking if file exists")
		if fs.exists("lib/data/chestItems.lua") then
Log:saveToLog("    U.loadStorageLists() --> File found. U.chestItems = require('lib.data.chestItems)")
			U.chestItems = require("lib.data.chestItems")		-- module scope variable
			if U.isTableEmpty(U.chestItems) then			-- loaded empty table
Log:saveToLog("    U.loadStorageLists() --> File loaded. U.chestItems is empty")
				redo = true
			else
				redo = lib.listNeedUpdating("chest", U.chestItems)
Log:saveToLog("    U.loadStorageLists() --> ? U.chestItems needs updating")
			end
		else
Log:saveToLog("    U.loadStorageLists() --> U.chestItems file does not exist")
			redo = true
		end	
	end
	if redo then
Log:saveToLog("    U.loadStorageLists() --> redo chestList")
		U.chestItems = lib.createList("chest")
	end]]
	if fs.exists("lib/data/items.lua") then
--Log:saveToLog("loading items database")
		U.itemDatabase = require ("lib/data/items")
	end
	U.isStorageConfigured = true
	return ""
end

function U.findEmptySlot(list, size)
	--[[ adapted from https://github.com/cc-tweaked/CC-Tweaked/discussions/1552
	Find the first empty slot in a chest.
	list = list of items in the chest/barrel/dropper
	size = The size of the inventory
	return integer? slot The slot number of the first empty slot, or nil if none are empty.
	]]
	for slot = 1, size do
		if not list[slot] then
			return slot
		end
	end
	
	return nil
end

function U.findItemCountInInventory(list, itemName, exactMatch)
	--[[
	Find an item in an inventory
	list = The list of items in the inventory
	itemName = The name of the item to find.
	return integer? The slot number of the item, or nil if not found.
	]]
	exactMatch = exactMatch or false
	if type(list) == "string" then
		list = peripheral.call(list, "list")
	end
	local retValue = nil
	local count = 0
	for slot, item in pairs(list) do
		local found = false
		if exactMatch then
			if item.name == itemName then found = true end
		else
			if item.name:find(itemName) ~= nil then found = true end
		end
		if found then
			if retValue == nil then
				retValue = {}
			end
			table.insert(retValue,{slot, item.count}) -- eg {1, 64}
			count = count + item.count
		end
	end
	return count, retValue -- either nil or eg {{1, 64},{4, 22}}
end

function U.findItemInInventory(inventory, itemName, exactMatch)
	--[[ adapted from https://github.com/cc-tweaked/CC-Tweaked/discussions/1552
	Find an item in an inventory
	inventory = name of inventory or wrapped peripheral
	itemName = The name of the item to find.
	return integer?, integer? The slot number and count of the item, or nil if not found.
	]]
	exactMatch = exactMatch or false
	if type(inventory) == "string" then
--Log:saveToLog("U.findItemInInventory("..inventory..", "..itemName..", exactMatch = "..tostring(exactMatch)..")", true)
		contents = peripheral.call(inventory, "list")
	else	-- should be supplied with .list() already
--Log:saveToLog("U.findItemInInventory(<inventory>, "..itemName..", exactMatch = "..tostring(exactMatch)..")", true)
		contents = inventory
	end
--Log:saveToLog("contents = "..table.concat(contents, ", "))
	--utils.writeTraceTable("contents = ", contents)
	if contents ~= nil then
		for slot, item in pairs(contents) do
--Log:saveToLog("item.name = "..item.name..", item.count = "..item.count)
			if exactMatch then
				if item.name == itemName then
--Log:saveToLog("Item found in "..slot..", quantity = "..item.count)
					return slot, item.count
				end
			else
				if (item.name):find(itemName) ~= nil then
--Log:saveToLog("Matching Item found in "..slot..", quantity = "..item.count)
					return slot, item.count
				end
			end
		end
	end
--Log:saveToLog("Item not found")
	return 0,0
end

function U.getItemFromNetwork(storageType, itemRequired, countRequired, toTurtleSlot, ignoreStock)
	local lib = {}
	
	function lib.getItem(storageTable, itemRequired, countRequired, toTurtleSlot, sent)
		local exit = false
		for k, storageName in pairs(storageTable) do 	-- eg {"minecraft:barrel_17", "minecraft:barrel_18"...}
			local available, data = U.findItemCountInInventory(storageName, itemRequired, false)		-- either nil or eg {{1, 64},{4, 22}}
--Log:saveToLog("U.findItemCountInInventory("..storageName..", "..itemRequired..", false")
			if data ~= nil then
				for i = 1, #data do 
					local request = countRequired
					if countRequired > 64 then
						request = 64
					end
					local received = U.sendItemsToTurtle(storageName, data[i][1], request, toTurtleSlot)	-- request items, returns number sent
					if received == nil then received = 0 end
					sent = sent + received
--Log:saveToLog("received = "..received..", request = "..request.." from "..storageName..", sent = "..sent)
					if sent >= countRequired then
						exit = true
						break 
					end			-- job done, no need to check remaining slots
					countRequired = countRequired - sent			-- this line not reached if sent >= count
				end
			end
			--if sent >= countRequired then break end				-- no need to check other storage
			--if countRequired <= 0 then break end
			if exit then
				return sent, countRequired
			end
		end
		
		return sent, countRequired
	end
	
	-- eg slot, count = U.getItemFromNetwork("barrel", "minecraft:crafting_table", 1)
	-- storageType either "chest" or "barrel"
	if countRequired == nil then return 0,0 end
	--if toTurtleSlot not specified then nil = use any slot
	if ignoreStock == nil then ignoreStock = false	end-- return only no of items obtained from storage
--Log:saveToLog("U.getItemFromNetwork(storageType = "..storageType..", itemRequired = ".. itemRequired..
--", countRequired = ".. countRequired..", toTurtleSlot = "..tostring(toTurtleSlot)..", ignoreStock = "..tostring(ignoreStock))
	-- Must be next to a modem: MUST remove crafting table if modem on that side. Other tools ok
	local sent = 0
	local turtleSlot, turtleCount = T:getItemSlot(itemRequired)	-- check local stock
	if not ignoreStock then	-- take account of existing items and reduce count accordingly
		countRequired = countRequired - turtleCount
	end
	local savedItems = U.chestItems
	local storageNames = U.chestNames
	if storageType == "barrel" then
		savedItems = U.barrelItems
		storageNames = U.barrelNames
	--elseif storageType == "chest" then
		--savedItems = chestItems
	end
	--local message = U.wrapModem()	-- list of chest/barrel peripherals, name of turtle, list of storage names
	--local storage, turtleName, storageNames = network.wrapModem(R, storageType)	-- list of chest/barrel peripherals, name of turtle, list of storage names
	--if turtleName == "Modem not found" then return 0, nil, nil, turtleName end
	if countRequired > 0 then 						-- not enough in stock, or ignore current stock
		-- check if item in storageLists
		local testStores = nil
		if savedItems[itemRequired] ~= nil then	-- only works with full item names
--Log:saveToLog("savedItems key in list: "..textutils.serialise(savedItems[itemRequired], {compact = true}))
			testStores = savedItems[itemRequired]
		else
			for key, value in pairs(savedItems) do 
				if key:find(itemRequired)~= nil then
--Log:saveToLog("savedItems found in list: "..textutils.serialise(value, {compact = true}))
					testStores = value
					break
				end
			end
		end
		if testStores == nil then	-- no match in storage lists
Log:saveToLog("Unable to find recorded storage, using all "..storageType.."s")
			sent, countRequired = lib.getItem(storageNames, itemRequired, countRequired, toTurtleSlot, sent)
			--sent, countRequired = lib.getItem(U.chestNames, itemRequired, countRequired, toTurtleSlot, sent)
		else -- match found, list of storage availble -- eg {"minecraft:barrel_17", "minecraft:barrel_18"...}
--Log:saveToLog("Using recorded list alias 'testStores'")
			sent, countRequired = lib.getItem(testStores, itemRequired, countRequired, toTurtleSlot, sent)
		end
	end
		-- slotData.lastSlot, total, slotData -- integer, integer, table
	local data = {}
	turtleSlot, turtleCount, data = T:getItemSlot(itemRequired)
--Log:saveToLog("turtleSlot = "..turtleSlot..", turtleCount = "..turtleCount..", sent = "..sent) --..", data = "..textutils.serialise(data))
	if ignoreStock then
		return turtleSlot, sent	-- 0 -> count
	else
		return turtleSlot, turtleCount	-- 0 -> count
	end
end

function U.getSlotCapacity(slot)
	return turtle.getItemSpace(slot) + turtle.getItemCount(slot)
end

function U.getSlotContains(inventoryName, inSlot)
	local list = peripheral.call(inventoryName, "list")
	for slot, item in pairs(list) do
		if inSlot == slot then
			return item.name
		end
	end
	return ""
end

function U.moveItem(inventoryName, itemName, toSlot)
	--[[ adapted from https://github.com/cc-tweaked/CC-Tweaked/discussions/1552
	Move a specific item to specific slot eg 1, moving other items out of the way if needed.
	inventoryName = The name of the chest/barrel/dropper to search.
	itemName = The name of the item to find.
	toSlot optional. default is slot 1
	return boolean success Whether or not the item was successfully moved to toSlot (or already existed there)
	]]
	toSlot = toSlot or 1
	local list = peripheral.call(inventoryName, "list")
	local size = peripheral.call(inventoryName, "size")
	local slot = U.findItemInInventory(list, itemName)

  -- If the item didn't exist, or is already in the first slot, we're done.
	if not slot then
--Log:saveToLog("U.moveItem(): Item not found")
		return false
	end
	if slot == toSlot then
		return true
	end

	-- If an item is blocking the first slot (we already know it's not the one we want), we need to move it.
	if list[toSlot] then
--Log:saveToLog("U.moveItem() Slot "..toSlot.." occupied, moving..")
		local emptySlot = U.findEmptySlot(list, size)

		-- If there are no empty slots, we can't move the item.
		if not emptySlot then
--Log:saveToLog("U.moveItem(): No empty slots")
			return false
		end

		-- Move the item to the first empty slot.
		
		if not U.moveItemStack(inventoryName, toSlot, emptySlot) then
--Log:saveToLog("U.moveItem(): Failed to move item to slot " .. emptySlot)
			return false
		end

--Log:saveToLog("U.moveItem(): Moved item to slot " .. emptySlot)
	end

	-- Move the item to slot 1.
	if not U.moveItemStack(inventoryName, slot, toSlot) then
--Log:saveToLog("U.moveItem(): Failed to move item to slot "..toSlot)
		return false
	end

--Log:saveToLog("U.moveItem(): Moved item to slot "..toSlot)
	return true
end

function U.moveItemsFromTurtle(toInventoryName, fromTurtleSlot, quantity, toSlot)
	--[[
	Move quantity of an item from one inventory to another. Turtles MUST use attachedInventory.pullItems()
	eg U.moveItemsFromTurtle(turtleName, chestName, turtleSlot, turtleCount, nil)
	turtleName:			The name of the turtle (via getLocalName())
	toInventoryName: 	The name of the inventory to move items into.
	fromTurtleSlot: 	The slot to move from. must be pre-determined for the item required
	quantity: 			The amount to transfer (nil for full stack)
	toSlot: 			The slot to move to. (nil will use any available slot(s))
	]]
	U.wrapModem()
	return peripheral.call(toInventoryName, "pullItems", U.turtleName, fromTurtleSlot, quantity, toSlot)
end

function U.moveItemStack(inventoryName, fromSlot, toSlot)
	--[[ adapted from https://github.com/cc-tweaked/CC-Tweaked/discussions/1552
	Move an item from one slot to another in a given inventory.
	inventoryName The name of the inventory to move items in.
	fromSlot The slot to move from.
	toSlot The slot to move to.
	]]
	return peripheral.call(inventoryName, "pushItems", inventoryName, fromSlot, nil, toSlot)
end

function U.sendItemToNetworkStorage(storageType, itemToSend, amountToSend, fromSlot)
	-- used to remove items from turtle inventory
	-- Must be next to a modem: MUST remove crafting table if modem on that side. Other tools ok
	-- fromSlot is given if emptying a specific slot
	U.wrapModem()
	local peripheralNames = U.chestNames
	if storageType == "barrel"then
		peripheralNames = U.barrelNames
	end  
	local lib = {}
	
	function lib.sendItem(savedItems, peripheralNames, turtleSlot, item, slotCount, itemsPerSlot)
		local storageToUse = ""
		local storageList = lib.getStorageFromList(savedItems, item, slotCount, itemsPerSlot)	-- try from savedList
		if storageList == nil then	-- no match found, but use first one found with U.wrapModem
--Log:saveToLog("No storage with matching items found, using first empty chest")
			storageToUse = lib.findEmptyStorage(peripheralNames, item, itemsPerSlot, slotCount)
		else
--Log:saveToLog("Storage with matching items found, checking capacity")
			storageToUse  = lib.checkCapacity(storageList, item, slotCount, itemsPerSlot)
			if storageToUse == "" then	-- no capacity in known storage list, so start a new one
				storageToUse = lib.findEmptyStorage(peripheralNames, item, itemsPerSlot, slotCount)
			end
		end
		--U.moveItemsFromTurtle(turtleName, toInventoryName, fromTurtleSlot, quantity, toSlot)
Log:saveToLog("U.moveItemsFromTurtle(turtleName = "..U.turtleName..", storageToUse = "..tostring(storageToUse)..", slot = "..tostring(turtleSlot)..", slotCount = "..tostring(slotCount)..")")
		if storageToUse ~= nil and storageToUse ~= "" then
			U.moveItemsFromTurtle(storageToUse, turtleSlot, slotCount)
		end
	end
	
	function lib.findEmptyStorage(peripheralNames, itemName, itemsPerSlot, itemCount)
		for store = 1, #peripheralNames do 
			inStock, canStore, partMatch = U.checkInventory(peripheralNames[store], itemName, itemsPerSlot, "")
			if canStore > itemCount then
				return peripheralNames[store]
			end
		end
		return nil
	end
	
	function lib.getStorageFromList(savedItems, item, sendAmount, itemsPerSlot)
		if savedItems[item] == nil then								-- no record of this item stored
--Log:saveToLog("lib.getStorageFromList() "..item.." not found")
			local parts = T:getNames(item)								-- eg minecraft:jungle_planks = "minecraft", "jungle", "planks"
			for part = #parts, 1, -1 do 								-- iterate "planks", "jungle", "minecraft"
				local searchTerm = parts[part]
				if searchTerm ~= "minecraft" and searchTerm ~= "mysticalagriculture" then
					for itemName, storageList in pairs(savedItems) do	-- iterate items used as keys eg minecraft:jungle_log matches jungle
						if itemName:find(searchTerm) ~= nil then 		-- partial match eg "sapling" found in "minecraft:oak_sapling"
							_G.Log:saveToLog("lib.getStorageFromList() matched "..searchTerm.." with "..itemName)
							return storageList							-- eg {"minecraft:chest_22", "minecraft:chest_23"}
						end
					end
				end
			end
		else
--Log:saveToLog("lib.getStorageFromList() ["..item.."] found")
			return savedItems[item]	-- list of chests with this item available
		end
		return nil
	end
	
	function lib.checkCapacity(storageList, item, sendAmount, itemsPerSlot)
		-- find a chest/barrel with sufficient capacity from list of storage
		for store = 1, #storageList do 
			local inStock, canStore, partMatch = U.checkInventory(storageList[store], item, itemsPerSlot, "")
			if canStore > sendAmount then
				return storageList[store]
			end
		end
		return ""
	end
	
	function lib.send(storageType, peripheralNames, savedItems, itemToSend,  sourceSlot, slotCount, itemsPerSlot)
		local newStore = false
		local storageToUse = ""
		local storageList = lib.getStorageFromList(savedItems, itemToSend, slotCount, itemsPerSlot)
		if storageList == nil then
			storageToUse = lib.findEmptyStorage(peripheralNames, itemToSend, itemsPerSlot, slotCount)
			U.addToStorageList(storageType, itemToSend, storageToUse, true)
			return U.moveItemsFromTurtle(storageToUse, sourceSlot, slotCount)	
		else
			local storageToUse  = lib.checkCapacity(storageList, itemToSend, slotCount, itemsPerSlot)
			if storageToUse == "" then	-- no capacity in known storage list, so start a new one
				storageToUse = lib.findEmptyStorage(peripheralNames, itemToSend, itemsPerSlot, slotCount)
				newStore = true
			end
--Log:saveToLog("sent = U.moveItemsFromTurtle(U.turtleName = "..U.turtleName..", storageToUse = "..storageToUse..", sourceSlot = "..sourceSlot..", slotCount = ".. slotCount)
			if newStore then
				U.addToStorageList(storageType, itemToSend, storageToUse, true)
			end
			return U.moveItemsFromTurtle(storageToUse, sourceSlot, slotCount)	
		end
	end
	
	amountToSend = amountToSend or 0						-- 0 = remove all of this item
	local totalSent = 0										-- track quantity sent 
	local minSend = 0										-- minimum amount to send
	if amountToSend > 0 then minSend = amountToSend end		-- update minimum to send
	local message = U.wrapModem()
	if message ~= "" then
		return 0, message
	end 
	--local storageToUse  = ""
Log:saveToLog("==> U.sendItemToNetworkStorage(storageType = '"..storageType.."', itemToSend = '"..itemToSend.."', amountToSend = "..amountToSend..")")
	local savedItems = nil
	if storageType == "barrel" then
		savedItems = U.barrelItems
	elseif storageType == "chest" then
		savedItems = U.chestItems
	end
	
	if itemToSend == "all" then	-- empty Turtle, so item names not relevant
Log:saveToLog("    itemToSend = all")
		repeat
			local item, turtleSlot, slotCount, itemsPerSlot = "", 0, 0, 64
			for slot = 1, 16 do
				item, slotCount = T:getSlotContains(slot)
				if slotCount > 0 then
					turtleSlot = slot
Log:saveToLog("    for slot = 1, 16 do: item = "..item..", slotCount = "..slotCount)
					itemsPerSlot = U.getSlotCapacity(slot)	-- most items capacity is 64 per slot
Log:saveToLog("    sending'"..item.."' from slot "..slot..", quantity = "..slotCount)
					break
				end
			end
			if turtleSlot > 0 then
Log:saveToLog("    lib.sendItem(savedItems = "..textutils.serialise(savedItems, {compact = true}).."peripheralNames = "..textutils.serialise(peripheralNames, {compact = true})..
				", item = ".. item..", slotCount = "..slotCount..", itemsPerSlot = ".. itemsPerSlot)
				lib.sendItem(savedItems, peripheralNames, turtleSlot, item, slotCount, itemsPerSlot)
			end
		until turtleSlot == 0
		return 0	-- exit function
	elseif fromSlot ~= nil then
		-- send 'amountToSend' from 'fromSlot'
		local slotCount = turtle.getItemCount(fromSlot)
		local itemsPerSlot = U.getSlotCapacity(fromSlot)
		return lib.send(storageType, peripheralNames, savedItems, itemToSend, fromSlot, slotCount, itemsPerSlot)
	else
		repeat	-- until item no longer present in inventory or requested amount has been sent
			local sourceSlot, total, data = T:getItemSlot(itemToSend)	-- which slot and how much of itemToSend is in turtle?
			local slotCount = data.leastCount
Log:saveToLog("    T:getItemSlot('"..itemToSend.."' sourceSlot = "..sourceSlot..", total = "..total..")")
			if sourceSlot == 0 then
Log:saveToLog("    "..itemToSend.." not found in turtle inventory, return 0")
				return 0	-- exit function
			else
				local itemsPerSlot = U.getSlotCapacity(sourceSlot)	-- most items capacity is 64 per slot
				itemToSend = data.leastName								-- full name of item with lowest itemCount
Log:saveToLog(    "U.sendItemToNetworkStorage("..itemToSend..", sourceSlot = "..sourceSlot..", slotCount = "..slotCount) --..", data = "..textutils.serialise(data)..")")
				if sourceSlot > 0 then									-- item is present in turtle inventory
					local sent = lib.send(storageType, peripheralNames, savedItems, itemToSend,  sourceSlot, slotCount, itemsPerSlot)
					totalSent = totalSent + sent
					if minSend > 0 and totalSent >= minSend then
						return totalSent
					end
					if amountToSend > 0 then	-- sending specified amount
						amountToSend = amountToSend - sent
					end
					if newStore then
						U.addToStorageList(storageType, itemToSend, storageToUse, true)
					end
				end
			end
		until sourceSlot == 0
	end
	
	return totalSent
end

function U.sendItemsToCrafter(crafterName, fromInventoryName, fromInventorySlot, quantity, toCrafterSlot)
	--[[
	fromInventoryName: 	The name of the inventory to move items from.
	fromInventorySlot: 	The slot to move from. must be pre-determined for the item required
	quantity: 			The amount to transfer (nil for full stack)
	toCrafterSlot: 		The slot to move to. (nil will use any available slot(s))
	]]
	return peripheral.call(fromInventoryName, "pushItems", crafterName, fromInventorySlot, quantity, toCrafterSlot)
end

function U.sendItemsToTurtle(fromInventoryName, fromInventorySlot, quantity, toTurtleSlot)
	--U.sendItemsToTurtle(turtleName, storageName, storageSlot, count, toTurtleSlot)
	--[[
	Move quantity of an item from one inventory to another. Turtles MUST use attachedInventory.pushItems()
	eg U.sendItemsToTurtle(turtleName, chestName, chestSlot, chestCount, 16) -- move to slot 16 so must be empty
	fromInventoryName: 	The name of the inventory to move items from.
	fromInventorySlot: 	The slot to move from. must be pre-determined for the item required
	quantity: 			The amount to transfer (nil for full stack)
	toTurtleSlot: 		The slot to move to. (nil will use any available slot(s))
	]]
	--U.wrapModem()
	local modem = peripheral.find("modem")		-- find modem
	if modem == nil then
		return "Modem not found"
	end
	U.turtleName = modem.getNameLocal()
	return peripheral.call(fromInventoryName, "pushItems", U.turtleName, fromInventorySlot, quantity, toTurtleSlot)
end

function U.transferItem(fromInventoryName, toInventoryName, itemName, quantity, toSlot)
	--[[
	Move a specific number of an item from one inventory to another
	fromInventoryName:	The name of the chest/barrel/dropper to search.
	toInventoryName:	The name of the receiving inventory (chest/barrel/dropper/smelter)
	itemName: 			The name of the item to find.
	toSlot: 			optional. nil picks any slot
	return: 			boolean success Whether or not the item was successfully moved to toSlot (or already existed there)
	]]
	--_G.Log:saveToLog("U.transferItem(from: "..fromInventoryName..", to: "..toInventoryName..", itemName = "..itemName..", quantity = "..tostring(quantity)..", toSlot = "..tostring(toSlot))
	local list = peripheral.call(fromInventoryName, "list")
	local size = peripheral.call(fromInventoryName, "size")
	--_G.Log:saveToLog("U.transferItem() size = "..size..", list = \n"..textutils.serialize(list))
	local count, data = U.findItemCountInInventory(list, itemName)	-- either nil or eg {{1, 64},{4, 22}}
	--_G.Log:saveToLog("U.transferItem() data = "..textutils.serialize(data, {compact = true}))
	local remaining = quantity			-- eg 22 items needed

	if data == nil then	-- Item not found
		return quantity	-- return amount requested = nothing sent
	end
	
	local fromSlot = 0
	local count = 64
	local available = 0
	for _, v in pairs(data) do	-- eg {1, 64},{2, 64}
		if v[2] < count and v[2] >= quantity then
			fromSlot = v[1]
			count = v[2]
		else
			available = available + v[2]
		end
	end
	if fromSlot > 0 then						-- now have slot with min required quantity
Log:saveToLog("U.transferItem() from: "..fromInventoryName..", to: "..toInventoryName..", fromSlot: "..fromSlot..", toSlot: "..tostring(toSlot)..", quantity: "..tostring(quantity))
		U.transferItems(fromInventoryName, toInventoryName, fromSlot, toSlot, quantity)
		return 0
	else									-- available must be at least 1
		for i = 1, #data do					-- itreate all slots containg at least 1 item
			fromSlot = data[i][1]			-- eg slot 1
			local send = data[i][2]			-- eg 10 items
			if remaining - send < 0 then	-- eg 22 - 10 = 12
				send = remaining
				remaining = 0
			else
				remaining = remaining - send-- eg remaining = 22 - 10 = 12
			end
			U.transferItems(fromInventoryName, toInventoryName, fromSlot, toSlot, send)
			if remaining <= 0 then			-- all required items transferred
				return 0
			end
		end
	end
	
	return remaining						-- return remaining items to be found from a  different inventory
end

function U.transferItems(fromInventoryName, toInventoryName, fromSlot, toSlot, quantity)
	--[[
	Move quantity of an item from one inventory to another
	fromInventoryName:	The name of the inventory to move items from.
	toInventoryName: 	The name of the inventory to move items into.
	fromSlot: 			The slot to move from. must be pre-determined for the item required
	toSlot: 			The slot to move to. (nil will use any available slot(s))
	quantity: 			The amount to transfer (nil for full stack)
	]]
	U.wrapModem()
Log:saveToLog("U.transferItems(from: "..fromInventoryName..", to: "..toInventoryName..", fromSlot: "..fromSlot..", toSlot: "..tostring(toSlot)..", quantity: "..tostring(quantity)..")")
	return peripheral.call(fromInventoryName, "pushItems", toInventoryName, fromSlot, quantity, toSlot)
end

function U.transferItemToTurtle(availableStorage, availableStorageKeys, crafterData)
	-- U.transferItemToTurtle(<availableStorage>, data = {{1, 64},{4, 22}}, "crafter_01", <crafterData>)
	-- availableStorage.minecraft:chest_114 = {count = 86, data = {{1, 64},{4, 22}},
	-- availableStorage.minecraft:chest_115 = {count = 1024, data = {{1, 64},{2, 64},{3, 64}, ... }
	-- crafterData = {{2,64}, {4,64}, {6,64}, {8,64}} 64 items in each of 4 slots in the crafter
	-- glitch? in crafter inventory, cannot add sequentially to existing items. 
	-- send to turtle slot first, then transfer
	U.wrapModem()
Log:saveToLog("U.transferItemToTurtle(availableStorage = "..textutils.serialise(availableStorage, {compact = true})..
				"\navailableStorageKeys = "..textutils.serialise(availableStorageKeys, {compact = true})..
				"\n"..U.turtleName..", crafterData = "..textutils.serialise(crafterData, {compact = true}))
				
	local total = 0
	local numSlots = 0
	local sent = 0
	for _, v in ipairs(crafterData) do								-- how many items required in total?
		total = total + v[2]										-- how many slots does it go in
		numSlots = numSlots + 1
	end
	for _, availableStorageKey in ipairs(availableStorageKeys) do	-- eg {minecraft:chest_114, minecraft:chest_115}
		local storageName = availableStorageKey						-- eg minecraft:chest_114
		local object = availableStorage[storageName]				-- availableStorage.minecraft:chest_114 = {count = 90, data = {{14,64},{15,26}}
		local storageData = object.data								-- eg data = {{14,64},{15,26}}
		local storageCount = object.count							-- eg count = 90
		for _, crafterSlotData in ipairs(crafterData) do			-- eg {{2,22}, {4,22}, {6,22}, {8,22}} -> iteration 1 = {2, 22} iterate crafter slots to be filled
			local toCrafterSlot = crafterSlotData[1]				-- eg slot 2 in turtle
			local amountToSend = crafterSlotData[2]					-- eg place 22 items in slot 2
Log:saveToLog("storageData = "..textutils.serialise(storageData, {compact = true}))
Log:saveToLog("crafterSlotData = "..textutils.serialise(crafterSlotData, {compact = true}))
			for i = 1, #storageData do								-- {{14,64},{15,26}}					
				local slotData = storageData[i]						-- {14,64}
				local availableToSend = slotData[2]					-- 64
				local fromStorageSlot = slotData[1]					-- 14
				local confirmedSent = 0
				
Log:saveToLog("i = "..i..", slotData = "..textutils.serialise(slotData, {compact = true}))
				if availableToSend >= amountToSend then
Log:saveToLog("availableToSend ("..availableToSend..") >= amountToSend: ("..amountToSend.."), current value of sent = "..sent)
Log:saveToLog("?confirmedSent = peripheral.call("..storageName..", 'pushItems', "..U.turtleName..
								", from slot "..fromStorageSlot..", amountToSend = "..
								amountToSend..", to turtle slot "..toCrafterSlot)
					confirmedSent = peripheral.call(storageName, "pushItems", U.turtleName, fromStorageSlot, amountToSend, toCrafterSlot)
					sent = sent + confirmedSent
Log:saveToLog("verified confirmedSent = "..confirmedSent..", sent = "..sent)
					slotData[2] = slotData[2] - confirmedSent
					crafterSlotData[2] = 0
Log:saveToLog("slotData[2] = "..slotData[2]..", crafterSlotData[2] = "..crafterSlotData[2])
				else
Log:saveToLog("availableToSend ("..availableToSend..") < amountToSend: ("..amountToSend.."), current value of sent = "..sent)
Log:saveToLog("?confirmedSent = peripheral.call("..storageName..", 'pushItems', "..U.turtleName..
								", from slot "..fromStorageSlot..", availableToSend = "..
								availableToSend..", to turtle slot "..toCrafterSlot)
					-- taking items from multiple storage slots requires loading into turtle first
					confirmedSent = peripheral.call(storageName, "pushItems", U.turtleName, fromStorageSlot, availableToSend, toCrafterSlot)
					sent = sent + confirmedSent
Log:saveToLog("verified confirmedSent = "..confirmedSent..", sent = "..sent)
					amountToSend = amountToSend - confirmedSent
					slotData[2] = slotData[2] - confirmedSent
					crafterSlotData[2] = amountToSend
Log:saveToLog("slotData[2] = "..slotData[2]..", crafterSlotData[2] = "..crafterSlotData[2])
				end
				
				if crafterSlotData[2] == 0 then
Log:saveToLog("crafterSlotData[2]("..crafterSlotData[2]..") == 0: breaking\n")
					break	-- already sent correct amount
				end
			end
		end
		if sent >= total then 
Log:saveToLog("sent("..sent..") >= total ("..total.."): breaking\n")
			break
		end
	end

	return sent
end

function U.pullItems(fromName, fromSlot, quantity, toName, toSlot)
	quantity = quantity or 1
	toSlot = toSlot or nil
	if type(fromName) == "table" then			-- already a wrapped peripheral
		fromName = peripheral.getName(fromName)
	end
	if type(toName) == "string" then
		toName = peripheral.wrap(toName)
	end
	toName.pullItems(fromName, fromSlot, quantity, toSlot)
end

function U.updateList(storageType)
	local output = ""
	if storageType == "barrel" then
		output = textutils.serialize(U.barrelItems)		-- serialise to json ready to write to file
	elseif storageType == "chest" then
		output = textutils.serialize(U.chestItems)		-- serialise to json ready to write to file
	end
	local fileName = "lib/data/"..storageType.."Items.lua"			-- barrelList.lua or chestList.lua
	local outputHandle = fs.open(fileName, "w")			-- open file
	outputHandle.writeLine("return")					-- start file with return
	outputHandle.write(output)							-- add serialised table
	outputHandle.close()								-- close file
Log:saveToLog("U.updateList("..storageType..") completed: "..fileName)
end

function U.wrapModem(relist)
	--[[To move turtle inventory items use the target peripheral:
		local modem = peripheral.wrap("front")		-- wrap modem next to turtle (beware crafting table!)
		local turtleName = modem.getNameLocal()		-- get name of the turtle
		local barrel = peripheral.find("barrel")	-- find barrel name you want to receive goods
		barrel.pushItems(turtleName, 1, 1)			-- push items FROM turtle to barrel  pushItems(toName, fromSlot , limit , toSlot)
		barrel.pullItems(turtleName, fromSlot , limit , toSlot)
	]]
	if relist == nil then relist = false end
	local modem = peripheral.find("modem")		-- find modem
	if modem == nil then
		return "Modem not found"
	end
	U.turtleName = modem.getNameLocal()
Log:saveToLog("==> U.wrapModem: U.turtleName = '"..U.turtleName.."'")
	if relist then	-- modem not already wrapped
		-- populate module level variables barrelObjects, barrelNames, chestObjects, chestNames
Log:saveToLog("    creating U. lists/objects")
		U.chestObjects = {}									-- memory only list of chest objects
		U.chestNames  = {}									-- memory only list of chest names
		U.barrelObjects = {}								-- memory only list of barrel objects
		U.barrelNames  = {}									-- memory only list of barrel names
		U.turtleName = modem.getNameLocal()					-- get name of the turtle (module scope variable)
Log:saveToLog("    U.turtleName (updated) = "..U.turtleName)
		local rawStorage = nil								-- peripheral find can return duplicate values
		rawStorage = {peripheral.find("minecraft:barrel")}	-- eg {rawStorage.getItemDetail(), .getItemLimit(), .list(), .pullItems(), .pushItems(), .size()}
		for k, value in ipairs(rawStorage) do
			local name = peripheral.getName(value)			-- eg "minecraft:barrel_0"
			if not U.tableContains(U.barrelNames, name, true) then	-- use exact match as checking peripherals
				table.insert(U.barrelObjects, value)		-- eg add minecraft:barrel_0 object
				table.insert(U.barrelNames, name)			-- eg add "minecraft:barrel_0" to list of barrels
			end
		end
		-- lists of barrel names and objects has been created
		table.sort(U.barrelNames, function(a,b) return tonumber(a:sub(18)) < tonumber(b:sub(18)) end)
		table.sort(U.barrelObjects, function(a,b) return tonumber(peripheral.getName(a):sub(18)) < tonumber(peripheral.getName(b):sub(18)) end)
Log:saveToLog("    sorted U.barrelNames = "..textutils.serialise(U.barrelNames, {compact = true}))
--Log:saveToLog("    sorted U.barrelObjects = "..textutils.serialise(U.barrelObjects, {compact = true}))
		--U.updateList("barrel")								-- fill U.barrelItems and save to file
		rawStorage = {peripheral.find("minecraft:chest")}
--Log:saveToLog("==> U.wrapModem(relist = "..tostring(relist)..", chests =".. textutils.serialise(rawStorage, {compact = true}))
		for k, value in ipairs(rawStorage) do
			local name = peripheral.getName(value)
			if not U.tableContains(U.chestNames, name, true) then	-- use exact match as checking peripherals
				table.insert(U.chestObjects, value)
				table.insert(U.chestNames, name)
			end
		end
		-- lists of chest names and objects has been created
		table.sort(U.chestNames, function(a,b) return tonumber(a:sub(17)) < tonumber(b:sub(17)) end)
		table.sort(U.chestObjects, function(a,b) return tonumber(peripheral.getName(a):sub(17)) < tonumber(peripheral.getName(b):sub(17)) end)
Log:saveToLog("    sorted U.chestNames = "..textutils.serialise(U.chestNames, {compact = true}))
		--U.updateList("chest")								-- fill U.chestItems and save to file
		U.loadStorageLists()
	end
	return ""
end
--SCENE UTILITIES
function U.fillCrafts()
	U.crafts = {}
	local lib = {}
	function lib.isPresent(value)
		for i = 1, #U.crafts do
			if U.crafts[i] == value then
				return true
			end
		end
		return false
	end
	
	
	for c = 1, #categories do
		for _, v in ipairs(Items[categories[c]]) do
			if v.recipes ~= nil then
				if not lib.isPresent(v.displayName) then
					table.insert(U.crafts, v.displayName)
				end
			end
		end
	end
end

function U.fillSmelts()
	--[[ Items.lua example 
	{
      name = "minecraft:iron_ingot",
      displayName = "Iron Ingot",
      recipe = {"minerals","ingot"},
      smelt = {"minecraft:raw_iron"}
    },
	]]
	U.smeltFrom = {}	-- will contain list of items derived from smelt with a table of source items
	U.smelts = {}		-- will contain list of display names of all items that can be smelted
	for c = 1, #categories do
		for _, v in ipairs(Items[categories[c]]) do
			if v.smelt ~= nil then
				table.insert(U.smelts, v.displayName)			-- eg "Iron Ingot"
				U.smeltFrom[v.name] = {}
				for k, source in ipairs(v.smelt) do
					table.insert(U.smeltFrom[v.name], source)	-- eg ["minecraft:coal"] = {"minecraft:coal_ore", "minecraft:deepslate_coal_ore"}
				end
			end
		end
	end
end

function U.findRecipe(from, key)
	-- eg "displayName", "Oak Stairs", "minecraft:oak_stairs" --> searches in Items only NOT in storage
	local recipe = {}
	for c = 1, #categories do
		for _, v in ipairs(Items[categories[c]]) do
			if from == "displayName" then
				if v.displayName == key then					-- eg "Oak Stairs"
					if v.recipe ~= nil then						-- eg  {"wood", "stairs"} or {{"colored","bed"},{"colored", "directColoured"}}
						for _, value in ipairs(v.recipe) do
							table.insert(recipe, value)
						end
						--_G.Log:saveToLog("\tU.findRecipe: '"..key.."'\n"..textutils.serialize(recipe, {compact = true}))
						return recipe							-- {"wood", "stairs"}
					end
				end
			elseif from == "name" then
				if v.name == key then							-- eg "minecraft:oak_stairs"
					if v.recipe ~= nil then						-- eg  {"wood", "stairs"} or {{"colored","bed"},{"colored", "directColoured"}}
						for _, value in ipairs(v.recipe) do
							table.insert(recipe, value)
						end
						--_G.Log:saveToLog("\tU.findRecipe '"..key.."' = {'"..recipe[1].."', '"..recipe[2].."'}")
						return recipe							-- {"wood", "stairs"} or {{"colored","bed"},{"colored", "directColoured"}}
					end
				end
			end
		end
	end
	
	return nil	
end

function U.findSmeltItem(item)
	return U.smeltFrom[item]
end

function U.findSmeltSources(smeltItem)
	-- key eg minecraft:iron_ingot or minecraft:coal
	--_G.Log:saveToLog("1:U.findSmeltSources("..smeltItem..")")
	local smeltSources = nil
	local retValue = {}
	local matches = nil
	local found = false
	for c = 1, #categories do
		for _, v in pairs(Items[categories[c]]) do
			if v.name == smeltItem then
				--_G.Log:saveToLog("2:U.findSmeltSources("..smeltItem..") v.smelt = \n"..textutils.serialize(v.smelt))
				smeltSources = v.smelt
				found = true
				break
				--return v.smelt -- eg {"minecraft:raw_iron"} or {"log","wood"}
			end
		end
		if found then break end
	end
	if smeltSources ~= nil then
		for k,v in pairs(smeltSources) do
			if v:find(":") == nil then
				-- find all types of eg "log" from Items
				local key = v
				if v == "golden_item" then
					key = "golden"
				elseif v == "iron_item" then
					key = "iron"
				end
				--_G.Log:saveToLog("3:U.findSmeltSource("..smeltItem..") key = "..key)
				matches = U.searchAllItems(key)
				--_G.Log:saveToLog("4:U.findSmeltSource("..smeltItem..") matches = "..textutils.serialize(matches, {compact = true}))
				for _, v1 in ipairs(matches) do
					table.insert(retValue, v1)
				end
			else
				table.insert(retValue, v)
			end
		end
		return retValue
	end
	
	return nil
end

function U.findSmeltLocations(storageType, sources, smeltItem)
	-- {log, wood} or {iron_item} or {golden_item} or {minecraft:cobblestone"}
	--local sources = {}
	local lib = {}
	
	function lib.cleanAdd(storageType, sources, smeltItem)
		local temp = U.findItemInInventory(storageType, smeltItem, false)	-- eg {"minecraft:chest_19", "minecraft:chest_20"}
		_G.Log:saveToLog("U.findSmeltLocations(smeltItems) lib.cleanAdd , temp = \n"..textutils.serialize(temp))
		
		for k, v in pairs(temp) do	-- eg {"minecraft:chest_19", "minecraft:chest_20"}
			_G.Log:saveToLog("U.findSmeltLocations(smeltItems) lib.cleanAdd , k = "..k..", v = "..v)
			local found = false
			for k1,v1 in pairs(sources) do
				_G.Log:saveToLog("U.findSmeltLocations(smeltItems) lib.cleanAdd , k1 = "..k1..", v1 = "..v1)
				if v == v1 then
					found = true
				end
			end
			if not found then
				table.insert(sources, v)
				_G.Log:saveToLog("U.findSmeltLocations(smeltItems) lib.cleanAdd table.insert v = "..v)
			end
		end
		
		return sources
	end
		
	if smeltItem:find(":") == nil then
		if smeltItem == "log" or smeltItem == "wood" then
			sources = lib.cleanAdd(storageType, sources, smeltItem)
			_G.Log:saveToLog("U.findSmeltLocations(smeltItems) added "..smeltItem..", sources = \n"..textutils.serialize(sources))
			--table.insert(sourcesue, U.findItemInInventory(v, false))
		elseif smeltItem == "golden_item" then
			sources = lib.cleanAdd(storageType, sources, "golden")
			--table.insert(sourcesue, U.findItemInInventory("golden", false))
		elseif smeltItem == "iron_item" then
			sources = lib.cleanAdd(storageType, sources, "iron")
			--table.insert(sourcesue, U.findItemInInventory("iron", false))
		end
	else
		sources = lib.cleanAdd(storageType, sources, smeltItem)
		--table.insert(sourcesue, v)
	end
	return sources
end

function U.getAvailable(storageType, item)
	--[[ 
	eg reqItem = "minecraft:oak_trapdoor"
	locations table example
	[ "minecraft:cobblestone" ] =
	{
		"minecraft:chest_60",
		"minecraft:chest_62",
		"minecraft:chest_61",
		"minecraft:chest_1",
	}
	]]
	if item:find(":") == nil then
		item = "minecraft:"..item
	end

	local quantity = 0
	local total = 0
	local availableList = {}
	local currentItemLocations = {}
	local storage = U.barrelObjects
	if storageType == "chest" then
		storage = U.chestObjects
	end 
	
	if storage[item] ~= nil then
		currentItemLocations = storage[item]				-- eg U.locations["minecraft:oak_log"] = {"chest_38"}
		for _, chestName in ipairs(currentItemLocations) do
			--_G.Log:saveToLog("S.populateAvailable(self,".. self.currentItem..") - chestName = ".. chestName)
			local chest = peripheral.wrap(chestName)			-- eg "minecraft:chest_60"
			local contents = chest.list()						-- list of items / slots for this chest
			quantity = 0
			for slot, item in pairs(contents) do				-- for each item check if this storage is listed
				if item.name == item then
					quantity = quantity + item.count
					total = total + item.count
				end
			end
			table.insert(availableList, chestName:sub(11).." "..quantity.." "..item:sub(11))
			--_G.Log:saveToLog("S.populateAvailable(self,".. self.currentItem..") - table.insert: "..chestName:sub(11).." "..quantity.." "..self.currentItem:sub(11))
		end
	end
	
	return availableList, total
end

function U.getCategoryTable(category)
	return Items[category]
end

function U.getCraftDetails(value)
	-- value can be recipe table OR string item name
	local ratio = 1
	local recipe = nil
	local item = ""
	local craftRecipe = nil
	--_G.Log:saveToLog("\tU.getCraftDetails("..tostring(value)..")")
	if type(value) == "string" then
		item = value -- value is string
		if value:find(":") ~= nil then
			recipe = U.findRecipe("name", value)
		else
			recipe = U.findRecipe("displayName", value)
		end
	else
		item = value[2]
	end
	--[[ eg for spruce sign  makes 6. quantity = 2 ratio = 3
	craftingRecipe =
	{
		{
			[minecraft:spruce_planks].quantity = 2,
			[minecraft:spruce_planks].slots = {1,2,3,5,6,7}
		},
		{
			[minecraft:stick].quantity = 2,
			[minecraft:stick].slots = {10}
		}
	}
	]]
	if recipe == nil then
		_G.Log:saveToLog("\tU.getCraftDetails("..item..").recipe = nil, ratio = 1")
		return recipe, craftRecipe, ratio
	end
	-- eg recipe = {"wood", "stairs"} or {"wood","minecraft:bamboo_planks"} or {{"colored","carpet"}, {"colored","directColoured"}}
	if type(recipe[1]) == "table" then	-- {{"colored","carpet"}, {"colored","directColoured"}}
		craftRecipe = {}
		_G.Log:saveToLog("\tU.getCraftDetails("..item..").recipe[1] = table: "..textutils.serialise(recipe[1], {compact = true}))
		for k, value in ipairs(recipe) do					-- eg {"colored","carpet"}
			local testRecipe = Recipes[value[1]][value[2]]	-- eg {"","","","wool","wool","","","","","3",}
			_G.Log:saveToLog("\tU.getCraftDetails("..item..").testRecipe["..k.."] = "..textutils.serialise(testRecipe, {compact = true}))
			local temp = {}
			for _, name in ipairs(testRecipe) do
				table.insert(temp, name)
			end
			table.insert(craftRecipe, temp)
			ratio = tonumber(temp[10])
		end
	else	-- {"wood","minecraft:bamboo_planks"}
		local testRecipe = Recipes[recipe[1]][recipe[2]]
		assert(testRecipe ~= nil,"Recipe for "..item .."('"..recipe[1].."', '"..recipe[2].."') does not exist")
		craftRecipe = {}
		for _, name in ipairs(testRecipe) do
			table.insert(craftRecipe, name)
		end
		ratio = tonumber(craftRecipe[10])
	end

	if ratio == nil then
		_G.Log:saveToLog("\tU.getCraftDetails("..item..").recipe = "..textutils.serialise(recipe, {compact = true}).. ", default ratio = 1")
		return recipe, craftRecipe, 1
	end
	_G.Log:saveToLog("\tU.getCraftDetails("..item..").return: recipe = ".. textutils.serialise(recipe, {compact = true})..", ratio (tonumber) = "..tostring(ratio)..", craftRecipe = "..textutils.serialise(craftRecipe, {compact = true}))
	--_G.Log:saveToLog("\tU.getCraftDetails("..item..").craftRecipe = "..textutils.serialise(craftRecipe, {compact = true}))
	return recipe, craftRecipe, ratio	-- recipe, craftRecipe, ratio
	-- {'wood', 'minecraft:bamboo_block'},
	-- {"minecraft:bamboo","minecraft:bamboo","minecraft:bamboo","minecraft:bamboo","minecraft:bamboo","minecraft:bamboo","minecraft:bamboo","minecraft:bamboo","minecraft:bamboo","1"},
	-- 1
end

function U.getCraftingRecipe(value)
	-- eg recipe = {"wood", "stairs"} or recipe = "minecraft:oak_stairs"
	if value == nil then return nil end
	local recipe = nil
	if type(value) == "string " then
		if value:find(":") ~= nil then
			recipe = U.findRecipe("name", value)
		else
			recipe = U.findRecipe("displayName", value)
		end
	end
	if recipe == nil then return nil end
	
	if type(recipe[1]) == "string" then
		local temp = Recipes[recipe[1]][recipe[2]]
		local retValue = {}
		for _, v in ipairs(temp) do
			table.insert(retValue, v)
		end
	else
		local retValue = {}
		for k,v in pairs(recipe) do -- eg {{"colored","bed"},{"colored", "directColoured"}}
			local temp = Recipes[v[1]][v[2]]
			local temp2 = {}
			for k1, v1 in ipairs(temp) do
				table.insert(temp2, v1)
			end
			table.insert(retValue, temp2)
		end
	end
	return retValue	
	-- eg {"planks", "", "", "planks", "planks", "", "planks", "planks", "planks"}
	-- or {{"", "", "", "wool", "wool", "wool", "planks", "planks", "planks", "1"}, {"", "", "", "item", "dye", "", "", "", "", "1"}}
end

function U.getCurrentCursor(withColours)
	withColours = withColours or false
	if withColours then
		return currentCursor.x, currentCursor.y, currentCursor.fg, currentCursor.bg
	else
		return currentCursor.x, currentCursor.y
	end
end

function U.getEmptyChests(limit)
	limit = limit or 1
	local emptyChests = {}
	local count = 0
	for i = 1, #U.chestNames do
		local isEmpty = true
		for slot, item in pairs(U.chestNames[i].list()) do
			if item.count > 0 then
				isEmpty = false
				break
			end
		end
		if isEmpty then
			table.insert(emptyChests, peripheral.getName(U.chestNames[i]))
			count = count + 1
			if count >= limit then
				return emptyChests
			end
		end
	end
end

function U.getIngredientFullName(recipe, item, key)
	-- eg recipe = {"wood", "stairs"}
	-- eg item = "minecraft:oak_stairs"
	-- eg key = "planks" from recipes["wood"]["stairs"] = {"planks", "", "", "planks", "planks", "", "planks", "planks", "planks"}
	-- eg convert "planks" to "minecraft:oak_planks" for use in "minecraft:oak_stairs"
	if key:find(":") ~= nil then					-- defined item --> return
		return key
	end
	local category, itemType = "", ""
	if type(recipe) == "table" then
		category = recipe[1]	-- eg wood, stone, minerals
		itemType = recipe[2]	-- eg planks, stairs, slab, pressure_plate. all items containing : will have already returned
		--_G.Log:saveToLog("\tU.getIngredientFullName.recipe = ".. textutils.serialise(recipe, {compact = true}))
	else
		category = recipe
		--_G.Log:saveToLog("\tU.getIngredientFullName.recipe = ".. recipe)
	end
	--_G.Log:saveToLog("\tU.getIngredientFullName.category = "..category..", key = "..key)
	local data = U.split(item, ":")					-- eg "minecraft:oak_stairs" --> "minecraft", "oak_stairs"
	local words = U.split(data[2], "_")				-- eg "red_candle" --> "red", "candle"
	--local words = U.split(modType[2], "_")		-- eg "oak_stairs" --> "oak", "stairs" or "oak_fence_gate" --> "oak", "fence", "gate"
	modType = data[1]..":"							-- eg "minecraft" --> "minecraft:" now string not table
	local _, woodType =  U.isTimber(item)
	local _, stoneType = U.isStone(item)
	local itemColour = U.getItemColour(item)
	local _, mineralType = U.isMineral(item)
	local _, ingotType = U.isIngot(item)
	local retValue = ""
	--_G.Log:saveToLog("\tU.getIngredientFullName woodType = "..woodType..", stoneType = "..stoneType..", itemColour = "..itemColour..", mineralType = "..mineralType..", ingotType = "..ingotType)
	if category == "wood" then							-- eg "minecraft:oak_stairs" or "minecraft:oak_fence_gate"
		-- keys = stem, log, planks
		local modifier = ""
		if item:find("stripped") ~= nil then
			modifier = "stripped_"
		end
		retValue = modType..modifier..woodType.."_"..key
	elseif category == "redstone" then
		-- keys = planks, wood_slab
		-- for simplicity return only oak_planks, oak_slabs
		if key == "wood_slab" then
			retValue = "minecraft:oak_slab"
		elseif key == "planks" then
			retValue "minecraft:oak_planks"
		end
	elseif category == "stone" then
		-- keys = stone
		-- eg recipe = {"stone", "stairs"} = {"stone", "", "", "stone", "stone", "", "stone", "stone", "stone"},
		-- eg item = "minecraft:polished_granite_stairs"
		if itemType == "polished" then
			return modType..stoneType
		end
		local modifier1 = ""
		if item:find("cobbled") ~= nil then
			modifier1 = "cobbled_"
		elseif item:find("cracked") ~= nil then
			modifier1 = "cracked_"
		end
		local modifier2 = ""
		if item:find("polished") ~= nil then
			modifier2 = "polished_"
		elseif item:find("smooth") ~= nil then
			modifier2 = "smooth_"
		elseif item:find("mossy") ~= nil then
			modifier2 = "mossy_"
		elseif item:find("chiseled") ~= nil then
			modifier2 = "chiseled_"
		elseif item:find("cut") ~= nil then
			modifier2 = "cut_"
		end
		local modifier3 = ""
		if item:find("brick") ~= nil then		-- eg "minecraft:stone_brick_stairs"
			if item:find("bricks") == nil then	-- excludes "minecraft:stone_bricks"
				modifier3 = "_bricks"
			end
		elseif item:find("tile") ~= nil then	-- eg "minecraft:deepslate_tile_stairs"
			if item:find("tiles") == nil then	-- excludes "minecraft:deepslate_tiles"
				modifier3 = "_tiles"
			end
		end
		retValue = modType..modifier1..modifier2..stoneType..modifier3
		--_G.Log:saveToLog("\tU.getIngredientFullName().retValue = "..retValue)
		if retValue:find("_") == 11 then		-- "minecraft:_bricks"
			--_G.Log:saveToLog("\tU.getIngredientFullName().retValue.gsub('_', '', 1) "..retValue:gsub("_", "", 1))
			retValue = retValue:gsub("_", "", 1)		-- replace 1 instance of "_"
		end
	elseif category == "minerals" then					-- eg {"minerals","minecraft:iron_trapdoor"} --> { "", "", "","minecraft:iron_ingot", "minecraft:iron_ingot", "","minecraft:iron_ingot", "minecraft:iron_ingot", ""},	
		-- names = {"coal", "iron", "gold", "redstone", "emerald", "lapis_lazuli", "diamond", "netherite", "quartz", "amethyst", "copper"}
		-- keys =  block, ingot, mineral, copperType
		-- eg recipe = {"minerals","ingot"}, item = "minecraft:iron_ingot", item = "block": from {"block", "", "", "", "", "", "", "", "", ""},
			
		if key == "block" then							-- get ingots as recipe for iron_block --> iron_ingot
			retValue = modType..mineralType.."_ingot"		-- "minecraft:iron_ingot"
		elseif key == "ingot" or key == "mineral" then
			if ingotType == "" then
				retValue = modType..mineralType				-- "minecraft:coal"
			else
				retValue = modType..mineralType.."_ingot"	-- "minecraft:iron_ingot"
			end
		elseif key == "copperType" then					-- ["stairs"] = {"copperType", "", "", "copperType", "copperType", "", "copperType", "copperType", "copperType"}
			local modifier1 = ""
			if item:find("waxed") ~= nil then
				modifier1 = "waxed_"
			end
			
			local modifier2 = ""
			if item:find("exposed") ~= nil then
				modifier2 = "exposed_"
			elseif item:find("weathered") ~= nil then
				modifier2 = "weathered_"
			elseif item:find("oxidized") ~= nil then
				modifier2 = "oxidized_"
			end
			
			local modifier3 = ""
			if item:find("cut") ~= nil then
				modifier3 = "cut_"
			end
			if words[#words] == "copper" then
				retValue = modType..modifier1..modifier2.."copper_block"
			else
				retValue = modType..modifier1..modifier2..modifier3.."copper"
			end
		end
	elseif category == "colored" then
		-- itemType = wool, carpet, coloured, directColoured, glass_pane, shulker_box, candle, banner, bed
		-- keys = wool, item, dye, glass, planks
		if key == "item" then
			if item:find("glass") ~= nil then
				retValue = "minecraft:glass"
			elseif item:find("shulker") ~= nil then
				retValue = "minecraft:shulker_box"
			elseif item:find("bed") ~= nil then
				retValue = "minecraft:white_bed"
			end
			if itemColour ~= "" then
				retValue = modType.."white_"..words[#words] 	-- eg wool, carpet
			end
		elseif key == "glass" then
			retValue = "minecraft:glass"
		elseif key == "wool" then
			retValue = "minecraft:"..itemColour.."_wool"
		elseif key == "planks" then
			retValue = "minecraft:*_planks"
		elseif key == "dye" then
			if itemColour ~= "" then
				retValue = modType..itemColour.."_dye"
			end
		else
			if itemType == "carpet" then
				retValue = modType..itemColour.."_wool"
			elseif itemType == "glass_pane" then
				retValue = modType..itemColour.."_glass"
			elseif itemType == "banner" then
				retValue = modType..itemColour.."_wool"
			elseif itemType == "coloured" or itemType =="directColoured" then
				--"Wool, Shulker Box, Bed, Candle
				if key == "item" then
					retValue = item
				elseif key == "dye" then
					retValue = modType..itemColour.."_dye"
				end
			end
		end
	elseif category == "natural" then
		retValue = key
	elseif category == "functional" then
		-- keys = planks, log, stone, sherd, stone_slab, wood_slab, wool, dye, item
		if key == "planks" or key == "log" then
			if woodType == "" then
				retValue = modType.."oak_"..key
			else
				retValue = modType..woodType.."_"..key
			end
		elseif key == "stone" then
			if stoneType == "" then
				retValue = modType.."cobblestone"
			else
				retValue = modType..stoneType
			end
		elseif key == "wood_slab" then
			if woodType == "" then
				retValue = modType.."oak_slab"
			else
				retValue = modType..woodType.."_slab"
			end
		elseif key == "slab" then
			if stoneType == "" then
				retValue = modType.."cobblestone_slab"
			else
				retValue = modType..stoneType.."_slab"
			end
		elseif key == "wool" or key == "dye" then
			-- eg wool --> minecraft:red_wool to create minecraft:red_bed from planks and wool
			if itemColour == "" then
				retValue = modType.."white_"..key
			else
				retValue = modType..itemColour.."_"..key
			end
		elseif key == "item" then
			-- item used eg minecraft:red_candle, recipe = ["directColoured"] = {"", "", "", "item", "dye", "", "", "", ""}
			-- item = "minecraft:candle"	
			retValue = modType..words[2]					-- eg minecraft:candle
		elseif key == "sherd" then
			retValue = "minecraft:pottery_sherd"					-- any type of sherd can be mixed, or bricks
		end
	elseif category == "tools" then
		-- keys = planks, boat
		if key == "boat" or key == "planks" then
			retValue = "minecraft:*_"..key				-- eg "minecraft:oak_boat
		end
	elseif category == "combat" then
		if key == "planks" then
			retValue = "minecraft:*_planks"
		elseif key == "potion" then
			retValue = "minecraft:potion"
		end
	elseif category == "food" then
		if key == "flower" then
			retValue = "minecraft:dandelion"
		else
			retValue = key
		end
	elseif category == "ingredients" then
		-- keys = planks
		retValue = "minecraft:*_planks"
	elseif category == "computercraft" then
		retValue = key
		if key == "stone" then
			retValue = "minecraft:stone"
		elseif key == "turtle" then
			retValue = "computercraft:turtle"
		end
	elseif category == "morered" then
		retValue = key
	end
	_G.Log:saveToLog("\t\titem = "..item..", key = "..key..", full name = "..retValue)
	return retValue
end

function U.getIngredientList(value)
	-- project is an object of the Project class OR an item name eg "minecraft:oak_stairs"
	-- project = item name when called from Craft:S:onListClick(listbox), where quantity is unknown
	local itemsRequired = nil
	local project = nil
	local recipe = nil
	local craftRecipe = nil
	local quantity = 0
	local craftItem = ""
	local ratio = 0
	
	local lib = {}
	
	function lib.getItemDetails(currentCraftRecipe, recipe, craftItem)
		local required = nil
		for i = 1, #currentCraftRecipe - 1 do												-- iterate all items in {"planks", "", "", "planks", "planks", "", "planks", "planks", "planks"}
			local itemName = currentCraftRecipe[i]											-- eg "planks"
			if itemName ~= "" then													-- NOT an empty ingredient
				if type(itemName) == "table" then
					itemName = itemName[1]
				end
				--_G.Log:saveToLog("\t\tcall fullName recipe = "..textutils.serialise(recipe, {compact = true})..", craftItem = "..craftItem..", itemName-->key = "..tostring(itemName))
				itemName = U.getIngredientFullName(recipe, craftItem, itemName)		-- eg item = planks ->  "minecraft:oak_planks"
				--_G.Log:saveToLog("U.getIngredientList().U.getIngredientFullName("..i..") = "..item)
				currentCraftRecipe[i] = itemName
				if required == nil then
					required = {}
				end
				if required[itemName] == nil then					-- not already in the table
					required[itemName] = 1							-- new table entry with value of 1
				else
					required[itemName] = required[itemName] + 1	-- increment count
				end
			end
		end
		return required
	end
	
	function lib.updateTable(tblItemsRequired)
		local temp = {}	-- build a table of new values for each item name
		_G.Log:saveToLog("\tU.getIngredientList() calculating updated quantities")
		for item, count in pairs(tblItemsRequired) do
			_G.Log:saveToLog("\t\titem: "..item..", count: "..count)
			local a, b, itemRatio = U.getCraftDetails(item)			-- eg 4 for planks
			_G.Log:saveToLog("\t\titem: "..item..", count: "..count..", itemRatio = "..itemRatio)
			--local required = count * quantity
			--self.quantity = math.ceil(self.quantity / self.ratio) * self.ratio
			local required =  math.ceil(count / itemRatio) * itemRatio
			_G.Log:saveToLog("\t\trequired = "..required)
			temp[item] = required
		end
		-- write altered values back to itemsRequired
		for item, count in pairs(temp) do
			tblItemsRequired[item] = count
		end
		return tblItemsRequired
	end
	
	if type(value) == "table" then									-- called from Project object
		_G.Log:saveToLog("\tU.getIngredientList(project):")
		project = value
		craftItem = project:getItem()								-- eg "minecraft:oak_stairs"
		recipe, craftRecipe, ratio = U.getCraftDetails(craftItem)
		project:setRecipe(recipe)
		project:setCraftingRecipe(craftRecipe)
		
		--recipe = project:getRecipe()								-- eg {"wood", "stairs"}
		--craftRecipe = project:getCraftingRecipe()					-- eg {"planks", "", "", "planks", "planks", "", "planks", "planks", "planks", "4"}
		quantity = project:getQuantity()							-- eg 4, 128
		
		--ratio = project:getRatio()									-- eg 4 for stairs
		--itemsRequired = project.itemsRequired						-- direct link to object internal values
		--recipe, craftRecipe, ratio = U.getCraftDetails(value)
	else															-- called directly from Craft.lua to provide info only eg "minecraft:oak_stairs"
		_G.Log:saveToLog("\tU.getIngredientList(value: "..value.."):")
		--recipe = U.findRecipe("name", value)						-- eg {"wood", "stairs"} or {{"colored","bed"},{"colored", "directColoured"}}
		--craftRecipe = U.getCraftingRecipe(recipe)					-- eg {"planks", "", "", "planks", "planks", "", "planks", "planks", "planks", "4"}
		quantity = 1												-- not set so use 1 as default
		craftItem = value											-- eg "minecraft:oak_stairs"
		--ratio = U.getCraftRatio(craftItem)
		recipe, craftRecipe, ratio = U.getCraftDetails(value)
	end
	
	if itemsRequired == nil then
		itemsRequired = {}
	end
	
	if craftItem:find("_block") ~= nil and craftItem:find("purpur") == nil and craftItem:find("quartz") == nil then
		-- minecraft:redstone_block can be crafted to and from minecraft:redstone
		-- minecraft:iron_block can be crafted to and from minecraft:iron_ingot
		-- do NOT iterate ingredients beyond level 1
		
		-- eg craftRecipe for block of iron = {"mineral", "mineral", "mineral", "mineral", "mineral", "mineral", "mineral", "mineral", "mineral", "1"},		
		_G.Log:saveToLog("\tU.getIngredientList.block = "..craftItem..", recipe = "..textutils.serialise(recipe, {compact = true})..", craftRecipe = "..textutils.serialise(craftRecipe, {compact = true}))
		local ingredient = U.getIngredientFullName(recipe, craftItem, craftRecipe[1])	-- eg ({"minerals","block"}, minecraft:iron_block, "mineral"
		itemsRequired[ingredient] = 9 * quantity
		-- can have multiple choices eg to make a chest, any plaks will work
		_G.Log:saveToLog("\tcraftItem: "..craftItem..", quantity: "..quantity..", ratio: "..tostring(ratio))
	else
		--if recipe ~= nil then _G.Log:saveToLog("\t\trecipe = "..textutils.serialise(recipe, {compact = true})) end
		--if craftRecipe ~= nil then _G.Log:saveToLog("\t\tcraftRecipe = "..textutils.serialise(craftRecipe, {compact = true})) end
		_G.Log:saveToLog("\t\tquantity: "..quantity..", craftItem: "..craftItem..", ratio: "..tostring(ratio))
		-- craftRecipe can consist of 2 or more sub-tables {{"", "", "", "wool", "wool", "wool", "planks", "planks", "planks", "1"}, {"", "", "", "item", "dye", "", "", "", "", "1"}}
		if craftRecipe ~= nil then
			if type(craftRecipe[1]) == "table" then	-- 2 recipes involved
				--for _, currentCraftRecipe in pairs(craftRecipe)
				for i = 1, #craftRecipe do
					local required = lib.getItemDetails(craftRecipe[i], recipe[i], craftItem)
					if required ~= nil then
						lib.updateTable(required)
						table.insert(itemsRequired, required)
					end
				end
			else
				local required = lib.getItemDetails(craftRecipe, recipe, craftItem)
				if required ~= nil then
					lib.updateTable(required)
					table.insert(itemsRequired, required)
				end
			end	
			_G.Log:saveToLog("\tU.getIngredientList().itemsRequired = "..textutils.serialise(itemsRequired, {compact = true}))
		end
	end
	
	--if project == nil then
		_G.Log:saveToLog("\tU.getIngredientList().return (itemsRequired) = "..textutils.serialise(itemsRequired, {compact = true}))
		return itemsRequired, ratio	-- eg nil if no crafting recipe
							-- eg oak stairs: {["minecraft:oak_planks"] = 6}
							-- eg redstone repeater: {["minecraft:stone"] = 3, ["minecraft:redstone_torch"] = 2, ["minecraft:redstone"] = 1}
	--else
		--_G.Log:saveToLog("\tU.getIngredientList().updating project (itemsRequired) = "..textutils.serialise(itemsRequired, {compact = true}))
		--project:setItemsRequired(itemsRequired)
		--project:setRatio(ratio)
	--end
end

function U.getInput(withTimer, interval, withInventory)
	-- will return on both mouse and key events unless mouseOnly 
	if withTimer == nil then withTimer = false end
	interval = interval or 3
	if withInventory == nil then withInventory = false end
	
	local timer_id
	while true do
		U.data = {os.pullEvent()}
--Log:saveToLog("U.getInput() data = "..textutils.serialize(U.data, {compact = true}))
		if U.data[1] == "turtle_inventory" and withInventory then 
			return {"turtle_inventory"}
		else
			if withTimer then
				timer_id = os.startTimer(interval)
				--_G.Log:saveToLog("U.getInput() timer_id "..timer_id)
			end
			if U.data[1]:find("mouse") ~= nil or U.data[1] == "monitor_touch" and not withInventory then
				if withTimer then
					os.cancelTimer(timer_id)
				end
				return U.data	-- eg {event = "mouse_click", button = 1, x = 4, y = 4)
			elseif U.data[1] == "key" then
				local key = keys.getName(U.data[2])
				if key == "enter" or key == "backspace" then
					if withTimer then
						os.cancelTimer(timer_id)
					end
					return U.data -- eg {event = "key", key = 8 (backspace) or 13 (return), nil, nil
				end
			elseif U.data[1] == "char" then -- returns all characters including symbols and shift
				if withTimer then
					os.cancelTimer(timer_id)
				end
				return U.data
			elseif U.data[1] == "timer" and withTimer then
				return nil
			end
		end
	end
end

function U.getInventoryContents(inventory, withSlots)
	--  an inventory object with a .list() property eg barrel, chest
	withSlots = withSlots or false
	local list = nil
	local contents = nil
	if inventory == nil then return end
	if type(inventory) == "string" then
		list = peripheral.call(inventory, "list")
	else
		list = inventory.list()
	end
	for slot, item in pairs(list) do
		if contents == nil then
			contents = {}
		end
		local name = item.name
		if name:find("minecraft:") ~= nil then
			name = name:sub(11)
		end
		-- setup strSlot to 2 characters eg 1 = " 1", 11 = "11"
		local strSlot = tostring(slot)
		if slot <10 then
			strSlot = " "..strSlot
		end
		local strCount = tostring(item.count)
		if item.count < 10 then
			strCount = " ".. strCount
		end
		if withSlots then
			table.insert(contents, strSlot.." "..strCount.." "..name)
		else
			table.insert(contents, strCount.." "..name)
		end
		--    slot count name
		-- eg " 1  4 oak_slab"
		-- eg "12 64 cobblestone_stairs"
	end
	
	return contents
end

function U.getInventoryObject(inventoryName)
	-- return the wrapped inventory eg local barrel = U.getInventoryObject(inputBarrelName)
	return peripheral.wrap(inventoryName)
end

function U.getItemCategory(from, key)
	for c = 1, #categories do
		for _, v in ipairs(Items[categories[c]]) do
			if from == "displayName" then
				if v.displayName:find(key) ~= nil then
					return categories[c]
				end
			elseif from == "name" then
				if key:find("computercraft") ~= nil then
					return "computercraft"
				elseif  key:find("morered") ~= nil then
					return "morered"
				else
					if v.name == key then
						return categories[c]
					end
				end
			end
		end
	end
	return nil
end

function U.getItemStock(item)
	-- return quantity of selected item in all storage locations
	if item:find(":") == nil then						-- displayName used instead
		item, _ = U.searchItem("displayName", item)		-- convert to full item name
	end
	local inventories = U.findItemInInventory("chest", item, true)	-- find any chests containing this item  eg {"minecraft:chest_38"}
	if inventories == nil then							-- item not in storage
		inventories = U.findItemInInventory("barrel", item, true)	-- find any chests containing this item  eg {"minecraft:chest_38"}
		if inventories == nil then
			return 0
		end
	end
	return  U.getStock(item, inventories)
end

function U.getRecipeData(from, key)
	for c = 1, #categories do
		for _, v in ipairs(Items[categories[c]]) do
			if from == "displayName" then
				--_G.Log:saveToLog("checking: "..v.displayName)
				if v.displayName == key then
					if v.recipes ~= nil then
						for k,recipe in pairs(v.recipes) do
							recipe.priority = 1
						end
					end
					return v.name, v.displayName, v.recipes
				end
			elseif from == "name" then
				if v.name == key then
					if v.recipes ~= nil then
						for k,recipe in pairs(v.recipes) do
							recipe.priority = 1
						end
					end
					return v.name, v.displayName, v.recipes
				end
			end
		end
	end
end

function U.getSlotOneContains(inventoryName)
	local list = peripheral.call(inventoryName, "list")
	for slot, item in pairs(list) do
		if slot == 1 then
			return item.name
		end
	end
	return ""
end

function U.getStock(itemName, inventories)
	-- return quantity of selected item found in storage supplied eg {"minecraft:chest_38"}
	local count = 0
	--_G.Log:saveToLog("U.getStock("..itemName..", inventories = \n"..textutils.serialize(inventories))
	for _, inventory in pairs(inventories) do
		local chest = peripheral.wrap(inventory)
		for slot, item in pairs(chest.list()) do
			--_G.Log:saveToLog("U.getStock() slot = "..slot..", item = "..item.name..", count = "..item.count)
			if item.name == itemName then
				count = count + item.count
			end
		end
	end
	
	return count
end

function U.populateAllItems()
	U.allItems = {}
	for category, tbl in pairs(Items) do
		for _, item in ipairs(tbl) do
			table.insert(U.allItems, item.displayName)
		end
	end
	table.sort(U.allItems)
end

function U.refineTemplate(category, itemToCraft, key)
	-- eg category = "wood", itemToCraft = "minecraft:oak_stairs", key = "planks"
	return U.getIngredientFullName(category, itemToCraft, key)
end

function U.emptySmelters()
	for i = 1, #U.smelters do
		U.smelters[i]:emptyOutput(true)	-- check if empty and drop output items into output chest
	end
end

function U.refuelSmelter(smelter)
	local lib = {}
	
	function lib.getFuelValue(item)
		for k, v in pairs(fuelValues) do
			if item:find(k) ~= nil then	-- eg find "planks" in "minecraft:bamboo_planks"
				return v
			end
		end
		return 0
	end
	
	--[[
	lava 100, coal block 180, dried kelp 20, blaze rod 12, coal 8, log, planks, most wood items 1.5
	tools, sign, boat = 1, slab 0.75, sapling, bowl,stick, button, wool = 0.5; bamboo, scaffolding 0.25
	]]
	--_G.Log:saveToLog("U.refuelSmelter() fuelType = "..smelter.fuelType)
	if smelter.fuelType == "minecraft:bucket" then
		--exchange empty bucket with full one
		if smelter.lavaFinished then
			-- find any bucket in storage to transfer empty bucket out
			local lavaAvailable = false
			local chestList = U.findItemInInventory("chest", "bucket", false)
			if #chestList > 0 then
				U.transferItem(smelter.name, chestList[1], "minecraft:bucket", 1)
				chestList = U.findItemInInventory("chest", "minecraft:lava_bucket", true)
				if #chestList > 0 then
					U.transferItem(chestList[1], smelter.name, "minecraft:lava_bucket", 1)
					lavaAvailable = true
				end
			else	-- no bucket or lava bucket available
				U.transferItem(smelter.name, U.outputBarrelName, "minecraft:bucket", 1)	-- move bucket to output, use any planks to refuel
			end
			if not lavaAvailable then
				chestList = U.findItemInInventory("chest", "planks", false)
				for i = 1, #chestList do
					local remaining = U.transferItem(chestList[i], smelter.name, "planks", 64, 2)
					if remaining == 0 then
						return true
					end
				end
			end
		end
	else
		if smelter.fuelType == "" then									-- no fuel present in fuel slot
			smelter.fuelType = "minecraft:bamboo_planks"				-- use default
		end
		_G.Log:saveToLog("U.refuelSmelter() fuelType = "..smelter.fuelType)
		local chestList = U.findItemInInventory("chest", smelter.fuelType, true)	-- find where it is stored
		local fuelRequired = math.ceil(smelter:getQuantity() / lib.getFuelValue(smelter.fuelType))		-- dried kelp ratio is 20 smelt items per fuel item
		_G.Log:saveToLog("U.refuelSmelter() smelter:getQuantity() = "..smelter:getQuantity()..", lib.getFuelValue(smelter.fuelType) = "..lib.getFuelValue(smelter.fuelType))
		if chestList ~= nil then
			_G.Log:saveToLog("U.refuelSmelter() "..smelter.fuelType..", chestList = "..textutils.serialize(chestList, {compact = true}))
			for i = 1, #chestList do
				_G.Log:saveToLog("U.refuelSmelter() U.transferItem("..chestList[i]..", "..smelter.name..", "..smelter.fuelType..", ".. fuelRequired..", 2")
				local remaining = U.transferItem(chestList[i], smelter.name, smelter.fuelType, fuelRequired, 2)
				if remaining == 0 then
					return true
				end
			end
		end
	end
	
	return false
end

function U.addToSmelter(storageList, sourceItem, index, count)
	-- add count items to smelter[index]
	--local smelter = U.smelters[index]
	local toInventoryName = U.smelters[index]:getName()
	_G.Log:saveToLog("U.addToSmelter(storageList = "..textutils.serialise(storageList, {compact = true})..", sourceItem = "..sourceItem)
	_G.Log:saveToLog("U.addToSmelter(index = "..index..". smelter name = "..toInventoryName..", count = "..count..")")
	U.smelters[index]:reset()
	for i = 1, #storageList do
		local remaining = U.transferItem(storageList[i], toInventoryName, sourceItem, count, 1)
		_G.Log:saveToLog("U.smelters["..index.."]:addQuantity("..count..")")
		U.smelters[index]:addQuantity(count)
		-- any storage chest emptied will automatically be removed fron U.locations
		if remaining <= 0 then
			break
		end
	end
	-- now check fuel
	--_G.Log:saveToLog("U.addToSmelter("..index..") fuelLevel = "..smelter.fuelLevel)
	--if smelter.fuelLevel < count then
		if not U.refuelSmelter(U.smelters[index]) then
			-- display warning about fuel levels
			--U.messageBox({"Refuelling smelters critical","No suitable fuel resources found","Click to craft planks"}, 4, "centre", "center", colors.red, colors.black)
			--U.window.setVisible(true)
			--U.windowAction = "Craft"
			--sleep(3)
		end
	--end
end

function U.sendToSmelters(storageList, sourceItem, quantity)
	-- calculate how many smelters needed for max efficiency
	-- blast furnace = ores, raw metals, armor and tools
	-- smoker food only including kelp. (except chorus fruit)
	-- quantity is total amount required
	local useSmoker = false
	local useBlast = false
	for k, v in ipairs(U.smoker) do
		if sourceItem:find(v) ~= nil then
			useSmoker = true
			break
		end
	end
	for k, v in ipairs(U.blastFurnace) do
		if sourceItem:find(v) ~= nil then
			useBlast= true
			break
		end
	end
	local smelters = {}
	for i = 1, #U.smelters do
		if not U.smelters[i].active then	-- smelter is free for use
			U.smelters[i]:setInUse(false)
			if U.smelters[i].type == "smoker" and useSmoker then
				table.insert(smelters, i)
				U.smelters[i]:setInUse(true)
			elseif U.smelters[i].type == "blast" and useBlast then
				table.insert(smelters, i)
				U.smelters[i]:setInUse(true)
			elseif U.smelters[i].type == "furnace" then
				table.insert(smelters, i)
				U.smelters[i]:setInUse(true)
			end
		end
	end
	-- smelters is a list of Smelter indices
	local portion = math.ceil(quantity / #smelters) -- eg 64 needed using 16 smelters = 4 per smelter
	_G.Log:saveToLog("U.sendToSmelters() smelters = "..textutils.serialise(smelters, {compact = true})..", portion = "..portion)
	local remaining = quantity
	for i = 1, #smelters do
		if remaining <= portion then	-- last smelter to be filled, portion could be smaller than remaining
			U.addToSmelter(storageList, sourceItem, smelters[i], remaining)	-- note smelters[i] = index of relevant U.smelters
			break
		else
			U.addToSmelter(storageList, sourceItem, smelters[i], portion)
		end
		remaining = remaining - portion
	end
	U.smeltersActive  = true
end

function U.updateSmelters()
	-- called from main() when Smelt scene is active
	local anyActive = false
	for i = 1, #U.smelters do
		--_G.Log:saveToLog("U.updateSmelters() "..i)
		U.smelters[i]:update()	-- check each smelter fuel level, fuel type, input and output count
		if U.smelters[i].active then
			anyActive = true
		end
	end
	return anyActive
end

function U.removeFromStorageFile(storageType, itemName, chestName)
	local storage = U.barrelObjects
	if storageType == "chest" then
		storage = U.chestObjects
	end 
	
	local data = storage[itemName]	-- eg {"minecraft:chest_67", "minecraft:chest_68"}
	for i, value in ipairs(data) do	 
		if chestName == value then
			table.remove(data, i)
			break
		end
	end
	if #data == 0 then
		storage[itemName] = nil		-- remove from locations
		U.updateList(storageType)
	end
end

function U.searchItem(from, key, currentCategory, strict)
	-- eg "Oak Trapdoor" searches in Items only NOT in storage
	strict = strict or false
	if currentCategory == nil or currentCategory == "all" then
		for c = 1, #categories do
			for _, v in ipairs(Items[categories[c]]) do
				if from == "displayName" then
					if strict then
						if v.displayName == key then
							return v.name, v.displayName, v.recipes, v.smelt
						end
					else
						if v.displayName:find(key) ~= nil then
							return v.name, v.displayName, v.recipes, v.smelt
						end
					end
				elseif from == "name" then
					if strict then
						if key:find(":") == nil then
							key = "minecraft:"..key
						end
						if v.name == key then
							return v.name, v.displayName, v.recipes, v.smelt
						end
					else
						if v.name:find(key) ~= nil then
							return v.name, v.displayName, v.recipes, v.smelt
						end
					end
				end
			end
		end
	else
		for _, v in ipairs(Items[currentCategory]) do
			if from == "displayName" then
				if strict then
					if v.displayName == key then
						return v.name, v.displayName, v.recipes, v.smelt
					end
				else
					if v.displayName:find(key) ~= nil then
						return v.name, v.displayName, v.recipes, v.smelt
					end
				end
			elseif from == "name" then
				if strict then
					if v.name == key then
						return v.name, v.displayName, v.recipes, v.smelt
					end
				else
					if v.name:find(key) ~= nil then
						return v.name, v.displayName, v.recipes, v.smelt
					end
				end
			end
		end
	end
	return "", "", nil, nil
end

function U.searchAllItems(key)
	-- eg "log" returns {"minecraft:xxx_log", etc} in Items only NOT in storage
	-- exclude 'wooden' from search for 'wood'
	local matches = {}
	for c = 1, #categories do
		for _, v in ipairs(Items[categories[c]]) do
			if v.name:find(key) ~= nil then
				if key == "wood" then
					if v.name:find("wooden") == nil then
						table.insert(matches, v.name)
					end
				elseif key == "iron" then
					if U.tableContains(nuggetItems, v.name) then
						table.insert(matches, v.name)
					end
				else
					table.insert(matches, v.name)
				end
			end
		end
	end
	return matches
end

function U.sendToOutput(currentItemLocations, itemName, required)
	-- eg 2 chests {{ "minecraft:chest_17" = 128,}  {"minecraft:chest_19" = 26}}
	local count = 0
	for _, chestName in ipairs(currentItemLocations) do				
		_G.Log:saveToLog("U.sendToOutput() - chestName = "..chestName)
		local chest = peripheral.wrap(chestName)							-- v = "minecraft:chest_17"
		for slot, item in pairs(chest.list()) do
			_G.Log:saveToLog("U.sendToOutput() - slot ="..slot..", item.name = "..item.name..", item.count = "..item.count)
			if item.name == itemName then
				if item.count >= required then								-- v.quantity = 128 >= required
					_G.Log:saveToLog("U.sendToOutput() - chest.pushItems("..U.outputBarrelName..", "..required..")")
					chest.pushItems(U.outputBarrelName, slot, required)			-- remove exact requirements and break
					count = required
					break
				else
					_G.Log:saveToLog("U.sendToOutput() - chest.pushItems("..U.outputBarrelName..", "..item.count..")")
					chest.pushItems(U.outputBarrelName, slot, item.count)		-- remove entire barrel contents of item
					required = required - item.count						-- reduce required then re-enter loop with next chest
					count = count + item.count
				end
			end
		end
	end
	return count
end
-- UI UTILITIES
function U.getItemColour(item)
	if item:find("light_gray") ~= nil then
		return "light_gray"
	end
	if item:find("light_blue") ~= nil then
		return "light_blue"
	end
	for _,v in ipairs(itemColours) do
		if item:find(v) ~= nil and item:find("redstone") == nil then			--  colour in item has matched. ignore redstone
			--_G.Log:saveToLog("\tU.getItemColour(item).return = "..v)
			return v
		end
	end
	--_G.Log:saveToLog("\tU.getItemColour(item).return = string.empty")
	return ""
end

function U.messageBox(message, size, alignH, alignV, fg, bg, buttons)
	--[[
	message  string
	size 1 to 5 int OR Vector2()
	alignH	left, centre, right
	alignV	top, centre, bottom
	buttons table {"ok", "yes", "no", "cancel"}
	]]
	-- 5  sizes: 1,2,3,4,5
	size = size or Vector2(8, 3)
	alignH = alignH or "centre"
	alignV = alignV or "centre"
	fg = fg or colors.white
	bg = bg or colors.black
	if type(size) == "number" then
		size = Vector2(math.floor(size * 3 * 2.7), size * 3)	-- 8x3, 16x6, 24x9, 32x12, 40x15
	end

	local pos = Vector2(0, 0)
	if alignH:find("cent") ~= nil then
		pos.x = math.floor((51 - size.x) / 2)
	elseif alignH == "right" then
		pos.x = 51 - size.x
	end
	
	if alignV:find("cent") ~= nil then
		pos.y = math.floor((19 - size.y) / 2)
	elseif alignV == "right" then
		pos.y = 19 - size.y
	end
	
	if type(message) == "string" then
		message = {message}
	end
	
	U.window = window.create(term.current(), pos.x, pos.y, size.x, size.y, false)
	U.window.setBackgroundColour(bg)
	U.window.clear()
	U.window.setBackgroundColour(colors.white)
	U.window.setCursorPos(1,1)
	U.window.write((" "):rep(size.x))
	
	for row = 2, size.y - 1 do
		U.window.setCursorPos(1, row)
		U.window.write(" ")
		U.window.setCursorPos(size.x, row)
		U.window.write(" ")
	end
	U.window.setCursorPos(1,size.y)
	U.window.write((" "):rep(size.x))
	
	U.window.setBackgroundColour(bg)
	U.window.setTextColour(fg)
	local offset = math.floor((size.y - #message) / 2)
	for i = 1, #message do
		U.window.setCursorPos(2, offset + i)
		U.window.write(U.padCentre(message[i], size.x - 2, " "))
	end
end

function U.mouseOver(mx, my, rx, ry, rw, rh)
	--[[ Is mouse in a 20 x 3 button placed on column 5 row 2?
	+------------------------------>
	|                                row 1
	|    ....................        row 2 20 spaces in background colour
	|    .   Button Text    .        row 3 20 characters including spaces in text colour on backgound colour
	|    ....................        row 4 20 spaces in background colour
	|                                row 5 
	V
	     56789111111111122222222223
		      012345678901234567890
			  
	mx = col 5                  - mouse is on left column of button
	my = row 2                  - mouse is on top row of button
	rx = button left col eg 5   - mouse is valid
	ry = button top row eg 2    - mouse is valid
	rw = width in columns eg 20 - 
	rh = height in rows eg 3
	check the following:
	1. is mouse column < button start col OR > button end col?
	2. is mouse row < button top row OR > button bottom row?
	3. If either 1 or 2 is true then the mouse is NOT in the button
	example mouse x = 4, mouse y = 24
	]]
	--[[
	long version to explain logic
	example mx = 4, my = 24 bottom left of button: rx = 5, ry = 2, rw = 20 rh = 3
	if mx < rx or mx >= rx  + rw then  -- rx + rw = 5 + 20 = 25--> mx = 24 so NOT >= 25
		return false
	end
	if my < ry or my >= ry  + rh then -- ry + rh = 2 + 3 = 5 --> my = 4 so NOT >= 5
		return false
	end
	return true
	]]
	if tonumber(mx) == nil or tonumber(my) == nil then return false end
	return  not (mx < rx or mx >= rx + rw or my < ry or my >= ry + rh) -- short version
end

function U.onScrBarClick(scrollbar, clickUp, clickDown, listPos, listbox)
	--[[_G.Log:writeTraceTable("\tS:onScrBarClick(scrollbar, clickUp, clickDown, listPos)",
							{
							"clickUp = "..tostring(clickUp)..", clickDown = "..tostring(clickDown)..", listPos = "..tostring(listPos),
							"scrollbar.name = " ..scrollbar.name,
							".isVertical = "	..tostring(scrollbar.isVertical),
							".groovePos: x = "	..scrollbar.groovePos.x..", y = "..scrollbar.groovePos.y,
							".grooveSize: w = "	..scrollbar.grooveSize.x..", h = "..scrollbar.grooveSize.y,
							".handlePos: x = "	..scrollbar.handlePos.x..", y = "..scrollbar.handlePos.y,
							".handleSize: w = "	..scrollbar.handleSize.x..", h = "..scrollbar.handleSize.y
							})]]
							
	local sb = scrollbar

	if clickUp then 		-- clicked on top or left of scrollbar
		if sb.isVertical then
			listbox.listIndex = listbox.listIndex - 1
			if listbox.listIndex < 1 then
				listbox.listIndex = 1
			end
			--_G.Log:saveToLog("S:onScrBarClick(clickUp, listbox.listIndex = "..listbox.listIndex)
		else
			listbox.columnIndex = listbox.columnIndex - 1
			if listbox.columnIndex < 1 then
				listbox.columnIndex = 1
			end
			--_G.Log:saveToLog("S:onScrBarClick(clickUp, listbox.columnIndex = "..listbox.columnIndex)
		end
	elseif clickDown then 	-- clicked on bottom or right of scrollbar
		-- move handle down / right by 1
		if sb.isVertical then
			local maxIndex = 1
			if listbox.dataHeight > listbox.size.y then
				maxIndex = listbox.dataHeight - listbox.size.y
			end
			listbox.listIndex = listbox.listIndex + 1
			if listbox.listIndex > maxIndex then
				listbox.listIndex = maxIndex
			end
			--_G.Log:saveToLog("S:onScrBarClick(clickDown, listbox.listIndex = "..listbox.listIndex)
		else
			local maxColIndex = 1
			if listbox.dataWidth > listbox.size.x then
				maxColIndex = listbox.dataWidth - listbox.size.x
			end
			listbox.columnIndex = listbox.columnIndex + 1
			if listbox.columnIndex > maxColIndex then
				listbox.columnIndex = maxColIndex
			end
			--_G.Log:saveToLog("S:onScrBarClick(clickDown, listbox.columnIndex = "..listbox.columnIndex)
		end
	else
		-- clicked some position on groove, but not inside handle
		-- calculate position in list in proportion using listPos eg 0.5
		if sb.isVertical then
			listbox.listIndex = math.ceil(listbox.dataHeight * listPos)
			--_G.Log:saveToLog("S:onScrBarClick(clickDown, listbox.listIndex = "..listbox.listIndex)
		else
			listbox.columnIndex = math.ceil(listbox.dataWidth * listPos)
			--_G.Log:saveToLog("S:onScrBarClick(clickDown, listbox.columnIndex = "..listbox.columnIndex)
		end
	end
	sb:setHandle(listbox)
end

function U.onScrBarDrag(scrollbar, listbox)
	local sb = scrollbar
	local mouseStartPos = sb.mouseDragStart	-- Vector2 
	local mouseEndPos = sb.mouseDragEnd
	local moveX = mouseEndPos.x - mouseStartPos.x 	-- negative = move left eg 10 to 5: 5-10 = -5
	local moveY = mouseEndPos.y - mouseStartPos.y  	-- negative = move up   eg 10 to 5: 5-10 = -5
	local maxIndex = math.max(listbox.dataHeight - listbox.size.y, listbox.size.y)
	local maxColIndex = math.max(listbox.dataWidth - listbox.size.x, listbox.size.x)

	--_G.Log:saveToLog("S:onScrBarDrag("..scrollbar.name..") - moveX = "..moveX..", moveY = "..moveY)
	if sb.isVertical then
		listbox.listIndex = listbox.listIndex + moveY
		if listbox.listIndex < 1 then
			listbox.listIndex = 1
		elseif listbox.listIndex > maxIndex then
			listbox.listIndex = maxIndex
		end
	else
		listbox.columnIndex = listbox.columnIndex + moveX
		if listbox.columnIndex < 1 then
			listbox.columnIndex = 1
		elseif listbox.columnIndex > maxColIndex then
			listbox.columnIndex = maxColIndex
		end
	end
	sb:setHandle(listbox)
end

return U
