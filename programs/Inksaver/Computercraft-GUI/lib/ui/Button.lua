local version = 20260423.1600
local Class 	= require("lib.Class")
local Vector2 	= require("lib.Vector2")
local B		 	= Class:derive("Button")


local pressed = {}
pressed[1] = colors.black
pressed[2] = colors.red
pressed[4] = colors.green
pressed[8] = colors.brown
pressed[16] = colors.blue
pressed[32] = colors.purple
pressed[64] = colors.cyan
pressed[128] = colors.lightGray
pressed[256] = colors.gray
pressed[512] = colors.pink
pressed[1024] = colors.lime
pressed[2048] = colors.yellow
pressed[4096] = colors.lightBlue
pressed[8192] = colors.magenta
pressed[16384] = colors.orange
pressed[32768] = colors.white
-- Button("btnStart", math.ceil(_G.WIDTH / 2), math.ceil(_G.HEIGHT / 2) - 3, 14, 4, "Start", colors.black, colors.yellow, "centre", "centre")
function B:new(name, x, y, w, h, text, fg, bg, alignH, alignV, index, keyBind, scene) -- uses button centre as coordinates by default
	--[[
		ccTweaked
		x = column of terminal / monitor where 1 = first column
		y = row of terminal / monitor where 1 = top row
		w = width in columns usually width of text + 2 minimum
		h = height in rows usually 1 or 3
	]]
	if index == nil then index = 0 end
	if keyBind == nil then keyBind = ""	end -- allows user to press specific key to actvate the button
	if scene == nil then scene = ""	end
	assert(name ~= nil, "control must have a name")
	self.index = index
	self.keyBind = keyBind
	self.scene = scene
	self.name = name
	self.size = Vector2(w or 1, h or 1)
	self.pos = Vector2(x or 1, y or 1)

	-- button colours
	self.background = bg
	--print("colour: "..bg) read()
	self.pressed = pressed[bg]
	self.disabled = colors.gray
	self.colour = self.background
	-- text colours
	self.textNormal = fg
	self.textDisabled = colors.lightGray
	self.textColour = self.textNormal
	self.text = text or ""
	self.alignH = alignH or "centre"
	assert(alignH == "left" or alignH == "centre" or alignH == "right", "alignH must be 'left', 'centre' or 'right'")
	self.alignV = alignV or "centre"
	assert(alignV == "top" or alignV == "centre" or alignV == "bottom", "alignV must be 'top', 'centre' or 'bottom'")
	
	self.isEnabled = true
	self.isPressed = false
	self.staysPressed = false
	self.isVisible = true
end

function B:move(x, y)
	self.pos.x = self.pos.x + x
	self.pos.y = self.pos.y + y
end

function B:setPosition(x, y)
	self.pos = Vector2(x, y)
end

function B:setSize(w, h)
	self.size = Vector2(w, h)
end

function B:setText(text)
	self.text = text
end

function B:setVisible(value)
	self.isVisible = value
end

function B:getControlData()
	return "button", self.index
end

function B:getName()
	return self.name
end

function B:getTraceTable()
	return
	{
		"self.name: "..self.name,
		"self.colour: "..self.colour.." ("..tostring(U.getColour(self.colour))..")",
		"self.text: "..self.text,
		"self.isEnabled: "..tostring(self.isEnabled)
	}
end

function B:setAlignH(alignH)
	self.alignH = alignH
end

function B:setAlignV(alignV)
	self.alignV = alignV
end

function B:setColours(normal, pressed, disabled)
	self.background = normal 		-- eg colors.white
	if pressed ~= nil then
		self.pressed = pressed	-- eg colors.black
	end
	if disabled ~= nil then
		self.disabled = disabled-- eg colors.gray
	end
	self.colour = self.background
end

function B:setBG(bg)
	self.background = bg
end

function B:setFG(fg)
	self.textColour = fg
end

function B:left(x)
	self.x = x
end

function B:top(y)
	self.y = y
end

function B:enable(enabled)
	self.isEnabled = enabled
	if self.isEnabled then 
		self.colour = self.background
		self.textColour = self.textNormal
	else
		self.colour = self.disabled
		self.textColour = self.textDisabled
	end
end

function B:update(data)
	local lib = {}
	
	function lib.checkInput(char)
		char = tostring(char)
		--if char == "h" or char == "i" then
			return char:lower()
		--end
		--return ""
	end
	
	function lib.leftClick()
		self.colour = self.pressed
		self.isPressed = true
		if self.staysPressed then
			if self.textNormal == colors.lightGray then
				self.textColour = colors.white
			elseif self.textNormal == colors.gray then
				self.textColour = colors.black
			end
		else
			self:draw()
			sleep(0.2)
			self.colour = self.background
			self:draw()
			sleep(0.2)
			self.isPressed = false
		end
		_G.events:invoke("onBtnClick", self)	
	end
--Log:saveToLog("B:update("..tostring(data).."): ".. self.name)
	if not self.isVisible then return end
	if data ~= nil then
		if data[1] == "char" then
			-- this function is a global event. Filter in the hosting scene
			-- eg self.name = eg "btnBack" or "btnQuit"
			local char = lib.checkInput(data[2])
			if char == self.keyBind then -- same as user pressed eg "b" key
				lib.leftClick()
			end
		elseif data[1]:find("mouse") ~= nil then
			local mouseButton = data[2]
			local mouseover = U.mouseOver(data[3], data[4], self.pos.x, self.pos.y, self.size.x, self.size.y)
			local leftClick = mouseButton == 1	-- true / false
			if self.isEnabled then
				if mouseover then
					if leftClick then
						lib.leftClick()
					else -- right click
					
					end
				end
			else
				self.colour = self.disabled
			end
		end
	end
end

function B:draw()
--Log:writeTraceTable("Button.draw(self)", self:getTraceTable())
	if not self.isVisible then return end
	U.setCurrentCursor(true)
	if self.isPressed then
		term.setBackgroundColor(self.pressed)
	else
		term.setBackgroundColor(self.colour)
	end
	term.setTextColor(self.textColour)
	
	local rows = {}
	local width = self.size.x
	local height = self.size.y
	for row = 1, height do
		table.insert(rows, (" "):rep(width))	 -- insert rows of spaces
	end
	
	local buttonText = self.text
	if self.alignH == "left" then
		buttonText = U.padRight(buttonText, self.size.x, " ")
	elseif self.alignH == "centre" then
		buttonText = U.padCentre(buttonText, self.size.x, " ")
	elseif self.alignH == "right" then
		buttonText = U.padLeft(buttonText, self.size.x, " ")
	end
	if self.alignV == "top" then
		rows[1] = buttonText
	elseif self.alignV == "centre" then
		if height == 1 or height == 2 then
			rows[1] = buttonText
		elseif height >= 3 then
			rows[math.ceil(height / 2)] = buttonText
		end
	elseif self.alignV == "bottom" then
		rows[#rows] = buttonText
	end
	local setPos = term.setCursorPos
	local rowOffset = self.pos.y -1	-- eg first row of button is 2
	for row = 1, #rows do
		setPos(self.pos.x, row + rowOffset)
		term.write(rows[row])
	end
	--term.setBackgroundColor(colors.black)
	--term.setTextColor(colors.white)
	U.restoreCursor(true)
end

return B
