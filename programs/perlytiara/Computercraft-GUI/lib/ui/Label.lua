local version = 20260423.1600
local Class 	= require("lib.Class")
local Vector2 	= require("lib.Vector2")
local menu 		= require("lib.menu")
local L		 	= Class:derive("Label")
--Label("title", 1, 1, _G.WIDTH, 1, "Main Menu", colors.gray, colors.white, "centre", "centre")
function L:new(name, x, y, w, h, text, fg, bg, alignH, alignV, index) -- uses button centre as coordinates by default
	if index == nil then index = 0 end
	assert(name ~= nil, "control must have a name")
	if type(text) == "table" then
		assert(#text <= h, "Text is a table: must have height >= table length")
	end
	self.index = index
	self.name = name
	self.size = Vector2(w or 1, h or 1)
	self.pos = Vector2(x or 1, y or 1)
	self.text = text						-- string or table of strings
	self.textColour = fg or colors.white
	self.backColour = bg or colors.black
	self.alignH = alignH or "centre"
	assert(alignH == "left" or alignH == "centre" or alignH == "right", "alignH must be 'left', 'centre' or 'right'")
	self.alignV = alignV or "centre"
	assert(alignV == "top" or alignV == "centre" or alignV == "bottom", "alignV must be 'top', 'centre' or 'bottom'")
	self.isVisible = true
	--self.enabled = true	-- not used for label, but texbox derivative uses it
end

function L:enable(enabled)
	-- not used but could be called
end

function L:getControlData()
	return "label", self.index
end

function L:getName()
	--_G.Log:saveToLog("L:getName() = "..self.name)
	return self.name
end

function L:move(x, y)
	self.pos.x = self.pos.x + x
	self.pos.y = self.pos.y + y
end

function L:setFocus(focus)
	-- not implemented, but needs to be present for generic calls
end

function L:setPosition(x, y)
	self.pos = Vector2(x, y)
end

function L:setSize(w, h)
	self.size = Vector2(w, h)
end

function L:setWidth(w)
	self.size.x = w
end

function L:setBG(bg)
	self.backColour = bg
end

function L:setFG(fg)
	self.textColour = fg
end

function L:setAlignH(alignH)
	self.alignH = alignH
end

function L:setAlignV(alignV)
	self.alignV = alignV
end

function L:getText()
	return self.text
end

function L:setText(text)
	self.text = U.trim(text)
	--Log:saveToLog("L:setText('"..self.text.."')")	
end

function L:setColours(textColour, backColour)
	self.textColour = textColour
	if backColour ~= nil then
		self.backColour = backColour
	end
end

function L:setVisible(value)
	self.isVisible = value
end

function L:getRect()
	return 
	{
		x = self.pos.x,
		y = self.pos.y,
		w = self.size.x,
		h = self.size.y
	}
end

function L:update(data)
	
end

function L:draw()
	if not self.isVisible then return end
	local rows = {}
	local width = self.size.x
	local height = self.size.y
	
	local lib = {}
	
	function lib.fillLine(labelText)
		if self.size.x == #labelText then
			return labelText
		end
		if self.alignH == "left" then
			return U.padRight(labelText, self.size.x, " ")
		elseif self.alignH == "centre" then
			return U.padCentre(labelText, self.size.x, " ")
		elseif self.alignH == "right" then
			return U.padLeft(labelText, self.size.x, " ")
		end
	end
	
	--Log:saveToLog("L:draw(): ".. self.name..", self.text = '"..self.text.."'")
	U.setCurrentCursor(true)
	local coloured = 0
	if type(self.text) == "string" then
		if string.find(self.text, "`") ~= nil then
			-- multicoloured text eg `lg¬black` `lg¬purple` `lg¬black`Furnace `lg¬red` `lg¬black`Blast Furnace `lg¬green` `lg¬black`Smoker
			 coloured = 1
		elseif string.find(self.text, "~") ~= nil then	-- use menu.colourText
			coloured = 2
		end
	else
		for _, text in ipairs(self.text) do
			if string.find(text, "`") ~= nil then
				coloured = 1
			end
		end
	end
	if coloured == 1 then
		if type(self.text) == "table" then 			-- eg {"line1", "line2"}
			for i = 1, #self.text do
				--_G.Log:saveToLog("L:draw(): ".. self.text[i])
				U.colourText(self.pos.x, self.pos.y + i - 1, self.text[i])
			end
		else
			U.colourText(self.pos.x, self.pos.y, self.text)
		end
	elseif coloured == 2 then
		menu.colourText(2, self.text, true, true)
	else
		term.setBackgroundColor(self.backColour)
		term.setTextColor(self.textColour)
		
		for row = 1, height do
			table.insert(rows, (" "):rep(width))	-- insert rows of spaces
		end
		
		if type(self.text) == "table" then 			-- eg {"line1", "line2"}
			local empty = height - #self.text		-- eg 0 if all lines, 1,2 etc
			if empty == 0 then						-- no vertical alignment
				for l = 1, #self.text do
					rows[l] = lib.fillLine(self.text[l])
				end
			else	-- vertical alignment needed based on empty rows
				if self.alignV == "top" then
					for l = 1, #self.text do
						rows[l] = lib.fillLine(self.text[l])
					end
				elseif self.alignV == "bottom" then
					for l = 1, #self.text do
						rows[l + empty] = lib.fillLine(self.text[l])
					end
				elseif self.alignV == "centre" then
					for l = 1, #self.text do
						rows[l + math.ceil(empty / 2)] = lib.fillLine(self.text[l])	-- eg 1 + (3 /2)(2) = 3,4,5
					end
				end
			end
		else
--Log:saveToLog("L:draw(): labelText = '"..self.text.."'")		
			local labelText = lib.fillLine(self.text)
--Log:saveToLog("L:draw(): labelText = '"..labelText.."'")	
			if self.alignV == "top" then
				rows[1] = labelText
			elseif self.alignV == "centre" then
				if height == 1 or height == 2 then
					rows[1] = labelText
				elseif height >= 3 then
					rows[math.ceil(height / 2)] = labelText
				end
			elseif self.alignV == "bottom" then
				rows[#rows] = labelText
			end
		end
		
		local setPos = term.setCursorPos
		local rowOffset = self.pos.y -1	-- eg first row of button is 2
		for row = 1, #rows do
			setPos(self.pos.x, row + rowOffset)
			term.write(rows[row])
		end
	end
	U.restoreCursor(true)
end

return L
