local version = 20260422.1230
local Class = require("lib.Class")
local Vector2 = require("lib.Vector2")
local C = Class:derive("Checkbox")

function C:new(index, name, x, y, w, h, text, outlineColour, checkColour, textColour)
	--[[
		compact version = "*TEXT    " to length
		if h >= 3 then use full version with frame
	]]
	assert(tonumber(index) ~= nil, "control must have an index")
	assert(name ~= nil, "control must have a name")
	self.index = index
	self.name = name	
	self.size = Vector2(w or 1, h or 1)
	self.pos = Vector2(x or 1, y or 1)
	-- colours
	self.outlineColor = outlineColour or colors.white
	self.normal = colors.black
	self.pressed = checkColour or colors.red
	self.disabled = colors.gray
	self.colour = self.normal
	
	self.textNormal = textColour
	self.textDisabled = colors.gray
	self.textColour = self.textNormal
	
	self.text = text or ""	-- string or table of strings
	self.isEnabled = true
	self.isVisible = true
	self.checked = false
end

function C:enable(isEnabled)
	self.isEnabled = isEnabled
	if self.isEnabled then 
		self.colour = self.normal
		self.textColour = self.textNormal
	else
		self.colour = self.disabled
		self.textColour = self.textDisabled
	end
end

function C:flip()
	self.checked = not self.checked
end

function C:getName()
	--_G.Log:saveToLog("C:getName() = "..self.name)
	return self.name
end

function C:setVisible(value)
	self.isVisible = value
end

function C:getTraceTable()
	return
	{
		"self.name: "..self.name,
		--"self.size (x,y): "..self.size.x..", "..self.size.y,
		--"self.pos (x,y): "..self.pos.x..", "..self.pos.y,
		--"self.pressed: "..self.pressed.." ("..tostring(U.getColour(self.pressed))..")",
		--"self.disabled: "..self.disabled.." ("..tostring(U.getColour(self.disabled))..")",
		--"self.colour: "..self.colour.." ("..tostring(U.getColour(self.colour))..")",
		--"self.textNormal: "..self.textNormal.." ("..tostring(U.getColour(self.textNormal))..")",
		--"self.textDisabled: "..self.textDisabled.." ("..tostring(U.getColour(self.textDisabled))..")",
		"self.textColour: "..self.textColour.." ("..tostring(U.getColour(self.textColour))..")",
		--"self.text: "..self.text,
		--"self.isEnabled: "..tostring(self.isEnabled),
		"self.checked: "..tostring(self.checked)
	}
end

function C:move(x, y)
	self.pos.x = self.pos.x + x
	self.pos.y = self.pos.y + y
end

function C:setColours(outline, normal, pressed, disabled) -- colors
	self.outlineColor = outline
	self.normal = normal
	if pressed ~= nil then
		self.pressed = pressed
	end
	if disabled ~= nil then
		self.disabled = disabled
	end
	self.colour = self.normal
end

function C:setFocus(focus)
	-- not implemented, but needs to be present for generic calls
end

function C:setPosition(x, y)
	self.pos = Vector2(x, y)
end

function C:setSize(w, h)
	self.size = Vector2(w, h)
end

function C:setText(text)
	self.text = text
end

function C:getChecked()
	_G.Log:saveToLog("C:getChecked() = ".. tostring(self.checked).." - "..self.name)
	return self.checked
end

function C:getControlData()
	return "checkbox", self.index
end

function C:flipChecked(checked)
	self.checked = not self.checked
	--_G.Log:saveToLog("C:flipChecked: "..tostring(self.checked).." - "..self.name)
end

function C:setChecked(checked)
	self.checked = checked
	--_G.Log:saveToLog("C:setChecked: "..tostring(self.checked).." - "..self.name)
end

function C:update(data)
	--_G.Log:saveToLog("C:update("..tostring(data)..")".." - "..self.name)
	if data ~= nil then
		local mouseButton = data[2]
		local mouseover = U.mouseOver(data[3], data[4], self.pos.x, self.pos.y, self.size.x, self.size.y)
		local leftClick = mouseButton == 1	-- true / false
		if self.isEnabled then
			if mouseover then
				if leftClick then
					--local state = self.checked
					_G.events:invoke("onChkChanged", self) -- will de-activate all in a group
					--self.checked = not state
					Log:saveToLog("Checkbox "..self.name..", clicked: state = "..tostring(self.checked))
					--_G.events:invoke("onChkChanged", self)
					if self.checked then
						self.colour = self.highlight
					else
						self.colour = self.normal
					end
				else -- right click
				
				end
			end
		else
			self.colour = self.disabled
		end
		
	end
end

function C:draw()
	if not self.isVisible then return end
	local setPos = term.setCursorPos
	local coloured = false
	local lib = {}
	
	function lib.drawBox(self, width)
		local boxFrame = (" "):rep(width)
		term.setBackgroundColor(self.outlineColor)
		setPos(self.pos.x, self.pos.y)
		term.write(boxFrame)
		setPos(self.pos.x, self.pos.y + 1)
		if self.isEnabled then
			if self.index > 0 then
				term.setTextColor(colors.black)
				term.write(tostring(self.index))
			else
				term.write(" ")
			end
			term.setBackgroundColor(colors.black)
			if self.checked then
				term.setTextColor(self.pressed)
				term.write("X")
			else
				term.setTextColor(self.textColour)
				term.write(" ")
			end
			term.setBackgroundColor(self.outlineColor)
			term.write(" ")
		else
			term.write(boxFrame)
		end
		setPos(self.pos.x, self.pos.y + 2)
		term.write(boxFrame)
	end
	
	function lib.drawBody(self)
		-- draw blank lines above and below central text
		local boxFrame = (" "):rep(self.size.x - 3)
		term.setBackgroundColor(self.outlineColor)
		for i = 0, math.floor(self.size.y / 2) - 1 do	-- eg 3 lines , for loop runs from 0 to floor(3 / 2) -1 = 0
			setPos(self.pos.x + 3, self.pos.y + i)
			term.write(boxFrame)
		end
		term.setTextColor(self.textColour)
		setPos(self.pos.x + 3, self.pos.y + math.floor(self.size.y / 2))
		term.write(U.padRight(self.text, self.size.x - 3, " "))
		for i = math.ceil(self.size.y / 2),  self.size.y - 1 do	-- eg 3 lines , for loop runs from ceil(3 / 2) = 2 to size -1 = 2
			setPos(self.pos.x + 3, self.pos.y + i)
			term.write(boxFrame)
		end
	end
	
	function lib.drawMultiLine(self)
		local boxFrame = (" "):rep(self.size.x - 3)
		local blanks = self.size.y - #self.text
		local currentLine = 0
		term.setBackgroundColor(self.outlineColor)
		term.setTextColor(self.textColour)
		if blanks > 0 then
			if blanks >= 2 then
				for i = 1, math.floor(blanks / 2) do
					setPos(self.pos.x + 3, self.pos.y + i - 1)
					currentLine  = currentLine  + 1
					term.write(boxFrame)
				end
			end
		end
		for line = 1, #self.text do
			if coloured then
				U.colourText(self.pos.x + 3, self.pos.y + line - 1, self.text[line])
			else
				setPos(self.pos.x + 3, self.pos.y + line - 1)
				term.write(U.padRight(self.text[line], self.size.x - 3, " "))
			end
			currentLine  = currentLine  + 1
		end
		if blanks > 0 then
			for i = #self.text, self.size.y - 1 do
				setPos(self.pos.x + 3, self.pos.y + currentLine)
				currentLine  = currentLine  + 1
				term.write(boxFrame)
			end
		end
	end
	
	U.setCurrentCursor(true)
	
	--Log:saveToLog("C:draw() "..self.name..", state = "..tostring(self.checked))
	
	if type(self.text) == "string" then
		if string.find(self.text, "`") ~= nil then
			-- multicoloured text eg `lg¬black` `lg¬purple` `lg¬black`Furnace `lg¬red` `lg¬black`Blast Furnace `lg¬green` `lg¬black`Smoker
			 coloured = true
		end
	else
		for _, text in ipairs(self.text) do
			if string.find(text, "`") ~= nil then
				coloured = true
			end
		end
	end
	
	--[[
	if coloured then
		if type(self.text) == "table" then 			-- eg {"line1", "line2"}
			for i = 1, #self.text do
				--_G.Log:saveToLog("Label:draw(): ".. self.text[i])
				U.colourText(self.pos.x, self.pos.y + i - 1, self.text[i])
			end
		else
			U.colourText(self.pos.x, self.pos.y, self.text)
		end
	else]]
	
	if self.size.y >= 3 then
		lib.drawBox(self, 3)
		if type(self.text) == "table" then
			lib.drawMultiLine(self)
		else
			lib.drawBody(self)
		end
	else	-- single line version
		setPos(self.pos.x, self.pos.y)
		term.setBackgroundColor(colors.black)
		if self.checked then
			term.setTextColor(self.pressed)
			term.write("X")
		else
			term.setTextColor(self.textColour)
			term.write(" ")
		end
		term.setBackgroundColor(self.outlineColor)
		term.setTextColor(self.textColour)
		term.write(U.padRight(self.text, self.size.x - 1, " "))
	end
	U.restoreCursor(true)
end

return C
