local version 	= 20231119.1600

local Class = require("lib.Class")
local Vector2 = require("lib.Vector2")
--local U = require("lib.TurtleUtils") -- using _G.U loaded in tk
local Bar = Class:derive("ContentBar")

--[[
Used to represent the inventory of chests, barrels, droppers, dispensers, Shulker boxes, ccTurtles
each 1 x 1 square has 4 colours , ideally black -> gray -> lightGray -> white representing 0, 0.25, 0.5 and full capacity of each slot
Chest / barrel: 9 x 3 = 27 slots
Double chest 9 x 6 = 54 slots
furnace /blast furnace
{
	[1] = {count = #, name = "minecraft:raw_iron"}		-- input slot
	[2] = {count = #, name = "minecraft:oak_planks"} 	-- fuel slot
	[3] = {count = #, name = "minecraft:iron_ingot"} 	-- output slot
}
]]
function Bar:new(name, x, y, w, h, colours) -- uses button centre as coordinates by default
	assert(name ~= nil, "control must have a name")
	self.name = name
	self.pos = Vector2(x or 1, y or 1)
	self.size = Vector2(w or 27, y or 1)
	if colours == nil or #colours < 5 then
		self.colours = {colors.black, colors.gray, colors.lightGray, colors.white, colors.brown}
	else
		self.colours = colours
	end
	self.textColour = self.colours[5]
	self.isEnabled = true
	self.isVisible = true
	self.slots = {}
	self.symbols = {".", ":", "!", "|"}
	for h = 1, self.size.y do
		for w = 1, self.size.x do
			table.insert(self.slots, 1)
		end
	end
end

function Bar:setVisible(value)
	self.isVisible = value
end

function Bar:move(x, y)
	self.pos.x = self.pos.x + x
	self.pos.y = self.pos.y + y
end

function Bar:setPosition(x, y)
	self.pos = Vector2(x, y)
end

function Bar:setSize(w, h)
	self.size = Vector2(w, h)
end

function Bar:setAllSlots(values) -- eg slot 1, 22 items, max size 64
	self.slots = values
end

function Bar:setSlotValue(slot, value, maxValue) -- eg slot 1, 22 items, max size 64
	local capacity = 1 	-- self.symbols[1] = "."					-- empty slot
	--_G.Log:saveToLog("Bar:setSlotValue("..slot..", "..value..", ".. maxValue..")")
	if value > 0 then
		capacity = value / maxValue		-- eg 61 / 64 = 0.95, 10 / 64 = 0.15
		if capacity >= 0.75 then		-- 1 or more item shows as patially full
			capacity = 4
		elseif capacity >= 0.5 then
			capacity = 3
		elseif capacity > 0 then	-- 3 / 4 full or more shows as full
			capacity = 2
		else
			capacity = 1
		end
	end
	--_G.Log:saveToLog("Bar:setSlotValue("..slot..", "..value..", ".. maxValue..") capacity = ".. capacity)
	self.slots[slot] = capacity
end

function Bar:update(data)
	
end

function Bar:draw()
	if not self.isVisible then return end
	U.setCurrentCursor(true)
	local Pos = term.setCursorPos
	term.setTextColor(self.textColour)
	
	-- eg chest represented by 9 x 3 grid
	for h = 0, self.size.y - 1 do								-- eg 0 to 2 height 
		for w = 0, self.size.x - 1 do							-- eg 0 to 8 width
			Pos(self.pos.x + w, self.pos.y + h)					-- eg 1, 1 top left to 9,3 bottom right
			local slot = w + 1 + (h * self.size.x)				-- eg 0 + 1 + (0 * 9) = 1 to 8 + 1 + (2 * 9) = 27
			local slotValue = self.slots[slot]					-- eg 1,2,3,4
			term.setBackgroundColor(self.colours[slotValue])
			term.write(self.symbols[slotValue])
			--_G.Log:saveToLog("Pos = "..self.pos.x + w..", ".. self.pos.y + h..", Slot = "..slot..", Symbol = "..self.symbols[self.slots[slot]])
		end
	end
	
	U.restoreCursor(true)
end

return Bar