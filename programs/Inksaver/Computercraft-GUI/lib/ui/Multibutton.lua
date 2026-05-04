local version = 20260423.1600
local Button = require("lib.ui.Button")
--local U = require("lib.TurtleUtils") -- using _G.U loaded in tk
local MB = Button:derive("MultiButton")

local drawPositions = {{"c"}, {"b", "c"}, {"b", "c", "b"},
					   {"b", "b", "c", "b"}, {"b", "b", "c", "b", "b"},
					   {"b", "b", "b", "c", "b", "b"}, {"b", "b", "b", "c", "b", "b", "b"},
					   {"b", "b", "b", "b", "c", "b", "b", "b"}, {"b", "b", "b", "b", "c", "b", "b", "b", "b"}}

function MB:new(name, x, y, w, h, text, fg, bg, alignH, alignV, btn, sizes, styles, activeFG, activeBG)
	-- Button:new(name, x, y, w, h, text, fg, bg, alignH, alignV, index, keyBind)
	MB.super.new(self, name, x, y, w, h, text, fg, bg, alignH, alignV, 0, "")	-- index and keybind set to default
	--[[ btn =
	{
		{{"all", "All"}, {"building","Building"}, {"coloured","Coloured"}, {"natural","Natural"}, {"functional", "Functional"}, {"menu","Menu"}},
		{{"redstone", "Redstone"}, {"tools", "Tools"}, {"combat","Combat "}, {"food", "Food"}, {"modItems", "Mod Items"}, {"ingredients","Ingredients"}}
	}
	Above gives 2 rows of 6 buttons
	sizes = {{12, 1},{4, 1}}
	styles = {["Menu"] = {colors.white, colors.gray}
	self.size, self.pos and self.name in base class
	self.alignH and self.alignV in base class
	self.isVisible in base class]]
	
--Log:saveToLog("MultiButton:new self.name = "..self.name..", self.size = "..self.size.x..", "..self.size.y..", self.pos = "..self.pos.x..", "..self.pos.y)
--Log:saveToLog("btn = "..textutils.serialise(btn, {compact = true}))
	self.sizes = sizes
	self.styles = styles
	self.activeFG = activeFG or colors.white
	self.activeBG = activeBG or colors.orange
	self.defaultCaption = defaultCaption or ""
	self.buttons = {}
	self.buttonCount = 0
	self.selectedButtonName = ""
	self.selectedButtonIndex = 0
	self.selectedButtonCaption = ""
	self:setup(btn)
end  

function MB:setup(btn)
	local index = 1
	local h = 0
	local y = self.pos.y
	local numRows = #btn	-- eg 2 in example above
--Log:saveToLog("MB:setup(btn) numRows = "..numRows)
	for row = 1, numRows do
		local numCols = #btn[row] 				-- eg 6 in example above, number can vary
--Log:saveToLog("MB:setup(btn) numCols = "..numCols)
		local x = self.pos.x					-- eg 1 for multiButton starting at col 1
		local fg = colors.lightGray				-- default foreground for top row of multi-button
		local bg = colors.gray					-- default background for top row of multi-button
		if row % 2 == 0 then					-- second and subsequent even rows of buttons
			fg = colors.gray
			bg = colors.lightGray
		end
		-- iterate row of buttons, so x increases by width of previous button
		for col = 1, numCols do					-- eg {{{"all", "All"}, {"building", "Building"}, ...}
			local name = btn[row][col][1]		-- eg btn[1] = as above; btn[1][1] = {"all", "All"}; btn[1][1][1] = "all"
			local caption = btn[row][col][2]	-- eg "All"
			local button = {}					-- new button
			self.buttonCount = self.buttonCount + 1
			button.name = name								-- eg "all" or "10"
			button.index = index
			-- eg sizes {{1,1},{1,1},{1,1}...}
--Log:saveToLog("MB:setup(btn) sizes = "..textutils.serialise(self.sizes, {compact = true}))
--Log:saveToLog("MB:setup(btn) name, caption = "..name..", "..caption)
			if self.alignH == "left" then
				button.caption = U.padLeft(caption, self.sizes[index][1], " ")	-- eg {6, 3} -> "All    "
			elseif self.alignH == "centre" then
				button.caption = U.padCentre(caption, self.sizes[index][1], " ")-- eg {6, 3} -> "  All  "
			else
				button.caption = U.padRight(caption, self.sizes[index][1], " ")	-- eg {6, 3} -> "   All"
			end 
			button.active = false
			-- self.styles is list of colours eg [mm[1]] (Mining (includes Nether))	= 
			-- {colors.white,  colors.gray}, [mm[2]]  = {colors.green,  colors.lightGray},
			-- button name is the key to colours
			if self.styles[button.name] ~= nil then
				--Log:saveToLog("MB:setup: self.styles[button.name][1] = "..tostring(self.styles[button.name][1])..", [2] = "..tostring(self.styles[button.name][2]))
				button.fg = self.styles[button.name][1]	or fg
				button.bg = self.styles[button.name][2] or bg
			else
				button.fg = fg
				button.bg = bg
			end
			--[[ flip colour scheme
			if fg == colors.lightGray then
				fg = colors.gray
				bg = colors.lightGray
			elseif fg == colors.gray then
				fg = colors.lightGray
				bg = colors.gray
			end]]
			button.x = x
			button.y = y
			button.w = self.sizes[index][1]
			button.h = self.sizes[index][2]	
			button.blank = U.padRight("", button.w, " ")
			button.visible = true
			self.buttons[button.name] = button	-- eg self.buttons["All"] = {name = "All", caption = "  All ", x = 1, y = 1}
			x = x + button.w					-- eg 1 + 6 (#"  All ") = 7
			index = index + 1
			h = button.h
		end
		y = y + h
	end
--Log:saveToLog("Buttons = "..textutils.serialise(self.buttons))
end

function MB:resetActiveButtons()
	for key, button in pairs(self.buttons) do
		button.active = false
	end
end

function MB:getActiveButtons()
	local tblActive = {}
	for key, button in pairs(self.buttons) do
		if button.active then
			table.insert(tblActive, button.name)
		end
	end
	return tblActive
end

function MB:getButtonByIndex(index)
	for key, button in pairs(self.buttons) do
		if button.index == index then
			return button
		end
	end
end

function MB:getButtonCount()
	return self.buttonCount
end

function MB:setActiveButton(buttonName)
	self.buttons[buttonName].active = true
end

function MB:setSelectedButton(buttonName, buttonIndex)
	local button = {}
	if buttonName == "" then						-- name unknown so use index
		for key, btn in pairs(self.buttons) do
			if btn.index == buttonIndex then
				button = btn
				break
			end
		end
	else
		button = self.buttons[buttonName]
	end
	self.selectedButtonName = button.name
	self.selectedButtonIndex = button.index
	self.selectedButtonCaption = button.caption
--Log:saveToLog("MB:setSelectedButton("..buttonName..", "..buttonIndex..") button.name = "..button.name..", button.index = "..button.index..", button.caption = "..button.caption)
end

function MB:setButtonIsVisible(buttonName, value)
	if type(buttonName) == "table" then
		-- set visible state of all buttons to opposite of requested
--Log:saveToLog("Buttons = "..textutils.serialise(self.buttons))
		for _, button in pairs(self.buttons) do 
			button.visible = not value
		end
		-- set visible state of selected buttons to state requested
--Log:saveToLog("MB:setButtonIsVisible() buttons = "..textutils.serialise(buttonName, {compact = true}))
		for _,name in ipairs(buttonName) do 
--Log:saveToLog("self.buttons["..name.."].visible = "..tostring(value))
			self.buttons[name].visible = value
		end
	else
--Log:saveToLog("self.buttons["..buttonName.."].visible = "..tostring(value))
		self.buttons[buttonName].visible = value
	end
end

function MB:update(data)
	local lib = {}
	
	function lib.checkInput(char)
		char = tostring(char)
		if char == "h" or char == "i" then
			return char:lower()
		end
		return ""
	end
	
	if not self.isVisible then return end	-- from base class
--Log:saveToLog(self.name..":update, visible = "..tostring(self.isVisible)..", enabled = "..tostring(self.enabled))
	if data ~= nil then																		-- data is real
		if data[1] == "char" then															-- data is a typed character
			--local char = lib.checkInput(data[2])											-- check for h or i only 
			local char = data[2]:lower()
			if char =="h" or char =="i" then
				local btnIndex = tonumber(U.keyboardInput)
Log:saveToLog(self.name..":update 'char' = "..char..", U.keyboardInput = "..U.keyboardInput)
				if (char == "h" and self.name == "mbHelp") or (char == "i" and self.name == "mbItems") then
					-- U.keyboardInput is only changed in MainMenu.lua Update
					if btnIndex ~= nil then
						U.keyboardInput = ""
Log:saveToLog(self.name..':update self:setSelectedButton("", '.. btnIndex)
						self:setSelectedButton("", btnIndex)
					end
					-- this function is a global event. Filter in the hosting scene
					-- eg self.name = mbHelp or mbItems
					_G.events:invoke("onMbClick", self)	
					U.multiButtonData = data
				end
			end				
		else
			if data ~= U.multiButtonData and data[1]:find("mouse") ~= nil then	-- data has changed and is a mouse event
				local mouseButton = data[2]
				local mouseover = U.mouseOver(data[3], data[4], self.pos.x, self.pos.y, self.size.x, self.size.y)	
				local leftClick = mouseButton == 1		-- true / false
				local mouseUp = data[1]	== "mouse_up"	-- "mouse_click" or "mouse_up"
				if mouseover then						-- mouse clicked somewhere in multi button area
--Log:saveToLog(self.name..":update, mouseover = true")
					--U.fc = U.fc + 1
					if leftClick and mouseUp then		-- leftClick and button released
						-- determine which of multiButtons have been pressed
						--self:resetActiveButtons()
						for key, button in pairs(self.buttons) do
							if U.mouseOver(data[3], data[4], button.x, button.y, button.w, button.h) then	-- mouse has been activated
--Log:saveToLog(self.name..":update data = "..textutils.serialise(data, {compact = true}).."): ".. "key  = "..key..", button.name = "..button.name..", mouseX = "..data[3]..", mouseY = "..data[4])
--Log:saveToLog(self.name..":update button = "..textutils.serialise(button, {compact = true}))
								--U.fc = U.fc + 1
								--button.active = true
								self.selectedButtonName = button.name
								self.selectedButtonIndex = button.index
								self.selectedButtonCaption = button.caption
								break
							end
						end
						--data = nil
						--_G.events:invoke("onBtnClick", self)
						_G.events:invoke("onMbClick", self)
						U.multiButtonData = data				
					end
				end
			end
		end
	end
end

function MB:draw()
--Log:writeTraceTable("Button.draw(self)", self:getTraceTable())
	if not self.isVisible then return end
	U.setCurrentCursor(true)
	local setPos = term.setCursorPos		-- shortcuts
	local setFG = term.setTextColor
	local setBG = term.setBackgroundColor
	
	for key, button in pairs(self.buttons) do
		if button.visible then
			setPos(button.x, button.y)
			if button.active then
				setFG(self.activeFG)
				setBG(self.activeBG)
			else
				setFG(button.fg)
				setBG(button.bg)
			end
			if button.h == 1 then
				term.write(button.caption)
			else
				if self.alignV == "top" then
					term.write(button.caption)
					for row = 1, button.h do 
						setPos(button.x, button.y + row)
						term.write(button.blank)
					end 
				elseif self.alignV == "centre" then
					for row = 0, #drawPositions[button.h] - 1 do	-- eg {"b", "c", "b"}
						setPos(button.x, button.y + row)
						if drawPositions[button.h][row + 1] == "b" then
							term.write(button.blank)
						else
							term.write(button.caption)
						end
					end
				else 
					for row = 1, button.h - 1 do 
						setPos(button.x, button.y + row)
						term.write(button.blank)
					end 
					setPos(button.x, button.y + button.h)
					term.write(button.caption)
				end 
			end 
		end
	end
	
	U.restoreCursor(true)
end

return MB
