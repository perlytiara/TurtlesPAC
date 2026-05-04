local version = 20260423.1600
local Class = require("lib.Class")
local T = Class:derive("Textbox")
local Vector2 = require("lib.Vector2")

function T:new(name, x, y, w, h, text, fg, bg, alignH, alignV, numbersOnly, index)
	-- assume textboxes have no borders and are 1 row height
	if index == nil then index = 0 end
	assert(name ~= nil, "control must have a name")
	numbersOnly = numbersOnly or false
	self.index = index
	self.name = name
	self.size = Vector2(w or 1, h or 1)
	self.pos = Vector2(x or 1, y or 1)
	self.text = text
	self.numbersOnly = numbersOnly
	self.limits = nil -- used for numbersOnly upper and lower limit of values
	self.focus = false
	self.activeBgColour = bg	-- assume white text on black background
	self.inactiveBgColour = colors.gray
	self.textColour = fg
	self.backColour = self.activeBgColour	-- override base class
	self.alignH = alignH
	self.alignV = alignV
	self.isVisible = true
	self.focus = false
	self.enabled = true
	self.controlKey = true
	self.keyPressed = 	function(key)
							if key == "backspace" or key == "delete" or key == "tab" then
								self:textChanged(key)
							end
						end
	self.textInput = 	function(text) self:textChanged(text) end
end

function T:enable(isEnabled)
	self.enabled = isEnabled
end

function T:isEnabled()
	return self.enabled
end

function T:move(x, y)
	self.pos.x = self.pos.x + x
	self.pos.y = self.pos.y + y
end

function T:setAlignH(alignH)
	self.alignH = alignH
end

function T:setAlignV(alignV)
	self.alignV = alignV
end

function T:setBackgroundColour(active)
	if active then
		self.backColour = self.activeBgColour
	else
		self.backColour = self.inactiveBgColour
	end
end

function T:setBG(bg)
	self.backColour = bg
end

function T:setFG(fg)
	self.textColour = fg
end

function T:setFocus(focus)
	self:setBackgroundColour(focus)
	self.focus = focus
end

function T:getIndex()
	return self.index
end

function T:getControlData()
	return "textbox", self.index
end

function T:setLimits(tblLimits)
	self.limits = tblLimits -- eg {0,64}
end

function T:setNumbersOnly(numbersOnly)
	self.numbersOnly = numbersOnly-- eg {0,64}
end

function T:setPosition(x, y)
	self.pos = Vector2(x, y)
end

function T:setSize(w, h)
	self.size = Vector2(w, h)
end

function T:setText(text)
	self.text = tostring(text)
end

function T:setVisible(value)
	self.isVisible = value
end

function T:setWidth(w)
	self.size.x = w
end

function T:setX(x)
	self.pos.x = x
end

function T:onEnter()
	_G.events:hook("keyPressed", self.keyPressed)
	_G.events:hook("textInput", self.textInput)
end

function T:onExit()
	_G.events:unhook("keyPressed", self.keyPressed)
	_G.events:unhook("textInput", self.textInput)
end

function T:update(data)
	if not self.enabled then return end
	if data ~= nil then
--Log:saveToLog("T:update(data): ".. self.name.." event = ".. tostring(data[1]))
		if data[1] == "key" then
--Log:saveToLog("T:update(data[1]): "..data[1]..", key/char = "..data[2])
			if not self.focus then return end
--Log:saveToLog("T:"..self.name.." update(data): key = "..keys.getName(data[2]))
			self:textChanged(keys.getName(data[2]))
			sleep(0.05)
		elseif data[1] == "char" then
			if not self.focus then return end
--Log:saveToLog("T:"..self.name.." update(data): char = ".. data[2])
			self:textChanged(data[2])
			sleep(0.05)
		else	-- mouse events
			local mouseButton = data[2]
			local mouseover = U.mouseOver(data[3], data[4], self.pos.x, self.pos.y, self.size.x, self.size.y)
			local leftClick = mouseButton == 1	-- true / false
			if mouseover then
				if leftClick then
					self.backColour = self.activeBgColour
					_G.events:invoke("onTxtClick", self)	
				else -- right click
				
				end
			end
		end
	end
end

function T:textChanged(text)
	-- recieves backspace and delete from self.keyPressed
	-- other keys from self.textInput
	if text == "backspace" then
		self:removeEndChars(1)
		_G.events:invoke("onTxtChanged", self)	
	elseif text == "delete" then
	
	elseif text == "enter" or text == "tab" then
		--if self.controlKey then
--Log:saveToLog("Textbox("..self.name.." :textChanged("..text..") invoke 'onTextEnter'")
			if self.name =="txt1" then
				_G.events:invoke("onTxtEnter", self)
			elseif self.name =="txt2" then
				_G.events:invoke("onTxtEnter", self)
			end
			--self.controlKey = false
		--end
	else
		if text ~= nil then
			if self.numbersOnly then
				if self.text == "" and text == "-" then
					self.text = self.text .. text
					_G.events:invoke("onTxtChanged", self)	
				elseif tonumber(self.text .. text) ~= nil then
--Log:saveToLog("T:textChanged("..text..") <numbersOnly>\nself.text = "..self.text.. " + "..text)
					self.text = tostring(tonumber(self.text .. text))
					_G.events:invoke("onTxtChanged", self)	
				end
			else
--Log:saveToLog("T:textChanged("..text..")\nself.text = "..self.text.. " + "..text)
				self.text = self.text .. text
				_G.events:invoke("onTxtChanged", self)	
			end
		end
	end
end

function T:removeEndChars(numChars)
	self.text = tostring(self.text)
	local offset = #self.text - numChars
	
	if offset > #self.text then
		self.text = ""
	else
		self.text = self.text:sub(1, offset)
	end
end

function T:draw()
	if not self.isVisible then return end
	local line = self.text
	if self.enabled then
		if self.alignH == "left" then
			line = U.padRight(line, self.size.x, " ")
		elseif self.alignH == "centre" then
			line = U.padCentre(line, self.size.x, " ")
		elseif self.alignH == "right" then
			line = U.padLeft(line, self.size.x, " ")
		end
	else
		line = U.padRight(" ", self.size.x, " ")
	end 
--Log:saveToLog("T:draw() name = "..self.name..", enabled = "..tostring(self.enabled)..", text = "..self.text..", line = '"..line..
					--"', alignH = "..self.alignH.."', backColour = "..self.backColour.."', textColour = "..self.textColour)
	U.setCurrentCursor(true)
	if self.enabled and self.focus then
		term.setBackgroundColor(self.activeBgColour)
	else
		term.setBackgroundColor(self.inactiveBgColour)
	end
	term.setTextColor(self.textColour)
	term.setCursorPos(self.pos.x, self.pos.y)
	term.write(line)
	U.restoreCursor(true)	
end

return T
