local version = 20260423.1600
local Class = require("lib.Class")
local Vector2 = require("lib.Vector2")
--local U = require("lib.TurtleUtils") -- using _G.U loaded in tk
local ScrollBar = Class:derive("ScrollBar")

function ScrollBar:new(name, x, y, length, directionColour, grooveColour, handleColour, isVertical, listboxName) -- ScrollBar groove dimensions and colour
	assert(name ~= nil, "control must have a name")
	self.name = name
	self.isVertical = isVertical or false
	self.groovePos = Vector2(x or 1, y or 1)
	if isVertical then
		self.grooveSize = Vector2(1, length or 3)
		self.handlePos = Vector2(self.groovePos.x, self.groovePos.y + 1)
	else
		self.grooveSize = Vector2(length or 3, 1)
		self.handlePos = Vector2(self.groovePos.x + 1, self.groovePos.y)
	end
	self.handleSize = Vector2(1, 1)	-- changes depending on volume of data represented
	-- colours
	self.directionColour = directionColour
	self.grooveNormal = grooveColour or colors.black
	self.grooveColour = self.grooveNormal
	self.handleNormal = handleColour or colors.lightGray
	self.handlePressed = colors.white
	self.handleColour = self.handleNormal
	self.disabled = colors.gray
	self.listboxName = listboxName
	
	self.isEnabled = true
	self.isVisible = true
	self.value = 1
	self.mouseDragStart = Vector2(0, 0)
	self.mouseDragEnd = Vector2(0, 0)
end

function ScrollBar:getName()
	--_G.Log:saveToLog("ScrollBar:getName() = "..self.name)
	return self.name
end

function ScrollBar:setVisible(value)
	self.isVisible = value
end

function ScrollBar:getTraceTable()
	return
	{
		"self.name: "..self.name,
		"self.isVertical"..tostring(self.isVertical),
		"self.groovePos: x = "..self.groovePos.x..", y = "..self.groovePos.y,
		"self.grooveSize: x = "..self.grooveSize.x..", y = "..self.grooveSize.y,
		"self.handlePos: x = "..self.handlePos.x..", y = "..self.handlePos.y,
		"self.self.handleSize: x = "..self.handleSize.x..", y = "..self.handleSize.y,
	}
end

function ScrollBar:move(x, y)
	self.groovePos.x = self.groovePos.x + x
	self.groovePos.y = self.groovePos.y + y
	self.handlePos.x = self.handlePos.x + x
	self.handlePos.y = self.handlePos.y + y
end

function ScrollBar:setPosition(x, y)
	self.groovePos = Vector2(x, y)
end

function ScrollBar:setSize(length)
	if self.isVertical then
		self.grooveSize = Vector2(1, length)
		self.handlePos = Vector2(self.groovePos.x, self.groovePos.y + 1)
	else
		self.grooveSize = Vector2(length, 1)
		self.handlePos = Vector2(self.groovePos.x + 1, self.groovePos.y)
	end
end

function ScrollBar:getValue()
	if self.isVertical then
		return math.floor((self.handlePos.y - self.groovePos.y) / (self.grooveSize.y - 1))
	else
		return math.floor((self.handlePos.x - self.groovePos.x) / (self.grooveSize.x - 1))
	end
end

function ScrollBar:getLength()
	if self.isVertical then
		return self.grooveSize.y - 2
	else
		return self.grooveSize.x - 2
	end
end

function ScrollBar:setHandle(listbox)
	--[[
	Handle size and position:
	size     = math.floor((size of groove / length of data in that direction) * (max handle size <usually groove -2>))
	position = math.floor((current data index <row/column> / (data size <length/width> - listbox size <height/width>) * max handle size <usually groove -2>)
	]]
	if self.isVertical then
		--_G.Log:saveToLog("ScrollBar:setHandle("..listbox.name..")")
		local height = listbox.size.y					-- height of listbox = display height
		local listLength = #listbox.displayList			-- length of complete list
		if listLength == 0 then							-- empty list so handle is full size at groove pos + 1
			self.handleSize.y = self.grooveSize.y - 2	-- update handle size
			self.handlePos.y  = self.groovePos.y + 1	-- update handle 
		else
			local handleSize = math.floor((self.grooveSize.y / listLength) * (self.grooveSize.y - 2))	-- eg 8 / 10 * 8 - 2 = 4 <-- (4.8)
			if handleSize < 1 then
				handleSize = 1
			elseif handleSize > self.grooveSize.y - 2 then
				handleSize = self.grooveSize.y - 2
			end
			local handleY = 1
			if handleSize == 1 then
				if listbox.listIndex > height then		-- leave handleY at 1 if not true
					local ratio = listLength / height	-- eg 240 items on a listbox 14 high = 17.1
					handleY = math.floor(listbox.listIndex / ratio)	-- eg index 100 (/ 240) : 100 / 17.1 = 5.84
				end
			else
				-- each change in handle position represents listRatio * listLength - height lines represented
				-- eg on a groove 8 high, handle size 4 = 3 positions, each position has an index change of 0.66 (1)
				-- so 10 items can have index 1, 2 or 3 (1-8, 2-9, 3-10)
				-- get the current listIndex and set y position based on current index and possible position
				handleY = math.floor((listbox.listIndex / (listLength - height)) * (self.grooveSize.y - handleSize - 2 + 1))	-- eg (1 / (10 - 8)) * (8-4-2+1) = 1.5 (1)
			end
			-- handleY currently holds relative handle position
			handleY = handleY + self.groovePos.y		-- now holds absolute position
			if handleY < self.groovePos.y + 1 then	-- above minimum position
				handleY = self.groovePos.y + 1 
			elseif handleY > self.groovePos.y + self.grooveSize.y - handleSize - 1 then
				handleY = self.groovePos.y + self.grooveSize.y - handleSize - 1
			end
			--_G.Log:saveToLog("ScrollBar:setHandle(listbox) listLength = "..listLength..", handleSize = "..handleSize..", handleY = "..handleY)
			self.handleSize.y = handleSize			-- update handle size
			self.handlePos.y  = handleY				-- update handle 
		end
	else
		local width = listbox.size.x
		local listWidth =  listbox.dataWidth
		if dataWidth == 0 then
			self.handleSize.x = self.grooveSize.x - 2			-- update handle size
			self.handlePos.x  = self.groovePos.x + 1			-- update handle 
		else
			local handleSize = math.floor((self.grooveSize.x / listWidth) * (self.grooveSize.x - 2))
			if handleSize < 1 then
				handleSize = 1
			elseif handleSize > self.grooveSize.x - 2 then
				handleSize = self.grooveSize.x - 2
			end
			
			local handleX = 1
			if handleSize == 1 then
				if listbox.columnIndex > width then	-- leave handleX at 1 if not true
					local ratio = listWidth / width	-- eg item string is 60 characters long on a listbox 50 long = 1.2
					handleX = math.floor(listbox.columnIndex / ratio)	-- eg index 10 (/ 60) : 10 / 1.2 = 0.12
				end
			else	-- handle size > 1
				handleX = math.floor((listbox.columnIndex / (listWidth - width)) * (self.grooveSize.x - 2))
			end
			
			handleX = handleX + self.groovePos.x		-- now holds absolute position
			if handleX < self.groovePos.x + 1 then	-- above minimum position
				handleX = self.groovePos.x + 1 
			elseif handleX > self.groovePos.x + self.grooveSize.x - handleSize - 1 then
				handleX = self.groovePos.x + self.grooveSize.x - handleSize - 1
			end
			
			--_G.Log:saveToLog("scrollHorizontal(self, sb) listbox.columnIndex = "..listbox.columnIndex..", listWidth = "..listWidth..", handleSize = "..handleSize..", handleX = "..handleX)
			self.handleSize.x = handleSize			-- update handle size
			self.handlePos.x  = handleX				-- update handle position
		end
	end
end

function ScrollBar:update(data)
	--[[
		data can be:
		mouse_click		button, 	x, y (1 or 2)
		mouse_drag		button, 	x, y (1 or 2)
		mouse_scroll	direction, 	x, y (-1 = up, 1 = down)
		mouse_up		button, 	x, y (1 or 2)
		monitor_touch	side, 		x, y ("left", "right", "top", "bottom", "front", "back")
	]]
	if data ~= nil then
		if self.isEnabled then
			--_G.Log:writeTraceTable("ScrollBar:update(data~=nil,isEnabled)", {"data[1] (event) = "..tostring(data[1]), "data[2] (button) = "..tostring(data[2]), "data[3] (x) = "..tostring(data[3]), "data[4] (y) = "..tostring(data[4])})
			self.grooveColour = self.grooveNormal
			self.handleColour = self.handleNormal
			local leftClick = false
			local mouseClickHandle = false
			local mouseClickGroove = false
			local mouseClickUp = false
			local mouseClickDown = false
			local mouseDrag = false
			local mouseUp = false
			local listPos = 1
			--local clickPos = Vector2(0, 0)
			local event = data[1]				--"mouse_up", "mouse_click", "mouse_drag"
			
			if event == "mouse_click" then
				-- mouseClick only in up/down areas at start and end of scrollbar
				--clickPos = Vector2(data[3], data[4])

				--clickPos.x = data[3]
				--clickPos.y = data[4]
				leftClick  = data[2] == 1		-- true / false
				if self.isVertical then
					--U.mouseOver(mx, my, rx, ry, rw, rh)
					mouseClickUp = U.mouseOver(data[3], data[4],
											 self.groovePos.x,
											 self.groovePos.y, 1, 1)	-- top of the vertical bar 1 x 1 square
					mouseClickDown = U.mouseOver(data[3], data[4],
											 self.groovePos.x,
											 self.groovePos.y + self.grooveSize.y - 1, 1, 1) -- bottom of the vertical bar 1 x 1 square
					mouseClickHandle = U.mouseOver(data[3], data[4],
											 self.handlePos.x,
											 self.handlePos.y, 1, 
											 self.handleSize.y) -- within handle rectangle
					mouseClickGroove = U.mouseOver(data[3], data[4],
											 self.groovePos.x,
											 self.groovePos.y + 1,
											 1, self.grooveSize.y - 1) -- within groove rectangle			
				else
					mouseClickUp = U.mouseOver(data[3], data[4],
											 self.groovePos.x,
											 self.groovePos.y, 1, 1)
					mouseClickDown = U.mouseOver(data[3], data[4],
											 self.groovePos.x + self.grooveSize.x - 1,
											 self.groovePos.y, 1, 1)
					mouseClickHandle = U.mouseOver(data[3], data[4],
											 self.handlePos.x,
											 self.handlePos.y,
											 self.handleSize.x, 1) -- within handle rectangle
					mouseClickGroove = U.mouseOver(data[3], data[4],
											 self.groovePos.x + 1,
											 self.groovePos.y,
											 self.grooveSize.x - 1, 1) -- within groove rectangle			
				end
				if mouseClickUp or mouseClickDown then
					--_G.Log:writeTraceTable("ScrollBar.Event = 'mouse_click'", {"mouseClickUp = "..tostring(mouseClickUp), "mouseClickDown = "..tostring(mouseClickDown)})
					_G.events:invoke("onScrBarClick", self, mouseClickUp, mouseClickDown, listPos)
				elseif mouseClickHandle then
					--_G.Log:saveToLog("ScrollBar.Event = 'mouse_click' self.mouseDragStart = Vector2("..data[3]..", ".. data[4]..")")
					self.mouseDragStart = Vector2(data[3], data[4])
				elseif mouseClickGroove then
					-- calculate relative position of click compared to list length
					if self.isVertical then
						listPos = (data[4] - self.groovePos.y) / self.grooveSize.y	-- eg (8 - 2) / 12 = 0.5 half way along a groove of length 12
					else
						listPos = (data[3] - self.groovePos.x) / self.grooveSize.x
					end
					--_G.Log:saveToLog("ScrollBar.Event = 'mouse_click' self.mouseClickGroove = "..tostring(listPos))
					_G.events:invoke("onScrBarClick", self, mouseClickUp, mouseClickDown, listPos)
				end
			end
			if event == "mouse_drag" then
				--[[
					mouse drag starts with mouse_click, so capture the click event in self.mouseDragStart = Vector2(data[3], data[4])
					in the mouse_drag event pass both captured and current mous positions to _G.events:invoke("onScrBarDrag", self)
				]]
				mouseDrag = U.mouseOver(data[3], data[4], self.handlePos.x, self.handlePos.y, self.handleSize.x, self.handleSize.y + 1)
				--_G.Log:writeTraceTable("ScrollBar.Event = 'mouse_drag'", {"mx = "..data[3], "my = "..data[4], "rx = "..self.handlePos.x, "ry = "..self.handlePos.y, "rw = "..self.handleSize.x, "rh = "..self.handleSize.y, "mouseDrag = "..tostring(mouseDrag)})

				if mouseDrag then
					self.mouseDragEnd = Vector2(data[3], data[4])
					--_G.Log:saveToLog("ScrollBar.mouse_drag = true, self.isVertical = "..tostring(self.isVertical))
					_G.events:invoke("onScrBarDrag", self)
				end
			end
			if event == "mouse_up" then
				mouseUp = U.mouseOver(data[3], data[4], self.groovePos.x, self.groovePos.y, self.grooveSize.x, self.grooveSize.y)
			end
		else
			self.grooveColour = self.disabled
			self.handleColour = self.disabled
		end
	end
end

function ScrollBar:draw()
	if not self.isVisible then return end
	U.setCurrentCursor(true)
	term.setCursorBlink(false)
	local setPos = term.setCursorPos
	term.setBackgroundColor(self.grooveColour)
	term.setTextColor(self.directionColour)
	
	if self.isVertical then
		-- draw groove and up/down arrows
		for i = 0, self.grooveSize.y - 1 do
			setPos(self.groovePos.x, self.groovePos.y + i)
			term.write(" ")
		end
		setPos(self.groovePos.x, self.groovePos.y)
		term.write("^")
		setPos(self.groovePos.x, self.groovePos.y + self.grooveSize.y - 1)
		term.write("v")
		-- now draw handle
		term.setBackgroundColor(self.handleColour)
		setPos(self.handlePos.x, self.handlePos.y)
		for i = 0, self.handleSize.y - 1 do
			setPos(self.handlePos.x, self.handlePos.y + i)
			term.write(" ")
		end
	else
		local groove = (" "):rep(self.grooveSize.x - 2)
		local handle = (" "):rep(self.handleSize.x)
		setPos(self.groovePos.x, self.groovePos.y)
		term.write("<"..groove..">")
		term.setBackgroundColor(self.handleColour)
		setPos(self.handlePos.x, self.handlePos.y)
		term.write(handle)
	end
	U.restoreCursor(true)
	--_G.Log:writeTraceTable("ScrollBar.draw(self)", self:getTraceTable())
end

return ScrollBar
