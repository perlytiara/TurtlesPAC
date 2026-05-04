local version = 20260423.1600
local Class = require("lib.Class")
local Vector2 = require("lib.Vector2")
--local U = require("lib.TurtleUtils") -- using _G.U loaded in tk
local ListBox = Class:derive("ListBox")

function ListBox:new(name, x, y, w, h, list, fg, bg, highlight)
	assert(name ~= nil, "control must have a name")
	assert(type(list) == "table", "parameter 'list' must be an array type table")
	self.name = name
	self.size = Vector2(w or 1, h or 1)
	self.pos = Vector2(x or 1, y or 1)
	self.list = list or {}
	self.displayList = {}					-- list of all items could be displayed. starts as copy of self.list
	self.textColour = fg or colors.white
	self.backColour = bg or colors.black
	self.highlight = highlight or colors.lightGray
	self.highlightRow = 0
	self.selectedText = ""
	self.listIndex = 1						-- display data starting from this index
	self.columnIndex = 1					-- display data starting at this column
	self.dataWidth = 0
	self.dataHeight = 0
	self.searchText = ""					-- used to modify display
	self.ignoreCase = true					-- ignores case when seaching items
	self.isVisible = true
	self.toEnd = false
	--[[
		IMPORTANT!
		self.displayList = self.list is passed by REF so will not work
		
		if self.list is empty (no list passed at construction)
		force filling of displayList from outside the class:
		
		self.em:getEntity("<listbox name>").list = <table of data>
		self.em:getEntity("<listbox name>"):fillDisplayList()
	]]
	self:fillDisplayList()	-- will only work if self.list is not empty
end

function ListBox:getName()
	--_G.Log:saveToLog("ListBox:getName() = "..self.name)
	return self.name
end

function ListBox:getTraceTable()
	return
	{
		"self.name: "..self.name,
		"self.textColour: "..self.textColour.." ("..tostring(U.getColour(self.textColour))..")",
		"self.list: (table): 1 = "..tostring(self.list[1])..", 2 = "..tostring(self.list[2])..", 3 = "..tostring(self.list[3]),
		"self.highlightRow "..self.highlightRow
	}
end

function ListBox:setVisible(value)
	self.isVisible = value
end

function ListBox:setToEnd(value)
	self.toEnd = value
end

function ListBox:setColours(fg, bg, highlight)
	self.textColour = fg
	self.backColour = bg or colors.black
	self.highlight = highlight or colors.lightGray
end

function ListBox:move(x, y)
	self.pos.x = self.pos.x + x
	self.pos.y = self.pos.y + y
end

function ListBox:setPosition(x, y)
	self.pos = Vector2(x, y)
end

function ListBox:setSize(w, h)
	self.size = Vector2(w, h)
end

function ListBox:getLength()
	return self.size.y
end

function ListBox:getWidth()
	return self.size.x
end

function ListBox:setSelectedText(text)
	for k, v in ipairs(self.displayList) do
		if v == text then
			self.selectedText = v
			self.highlightRow = k
		end
	end
end

function ListBox:setHighlightRow(row)
	if #self.displayList >= row then
		self.highlightRow = row
		self.selectedText = self.displayList[self.highlightRow]
	end
end

function ListBox:fillDisplayList()
	-- fill displayList with all of self.list
	self.dataWidth = 0
	self.dataHeight = 0
	self.displayList = {}						-- reset to empty
	if self.list ~= nil then
		for i = 1, #self.list do				-- copy items from master list
			local item = self.list[i]
			table.insert(self.displayList, item)
			if #item > self.dataWidth then
				self.dataWidth = #item			-- set dataWidth to widest row
			end
		end
	end
	self.dataHeight = #self.displayList
end

function ListBox:setColours(textColour, backColour)
	self.textColour = textColour
	if backColour ~= nil then
		self.backColour = backColour
	end
end

function ListBox:update(data)
	--_G.Log:saveToLog("ListBox:update("..tostring(data).."): "..self.name)
	if data ~= nil then
		if data[1] == "mouse_click" then
			local mouseButton = data[2]
			local mouseover = U.mouseOver(data[3], data[4], self.pos.x, self.pos.y, self.size.x, self.size.y)
			local leftClick = mouseButton == 1	-- true / false
			if mouseover then
				if leftClick then
					self.highlightRow = data[4] - self.pos.y + self.listIndex		-- eg row 1
					--_G.Log:saveToLog("self.highlightRow = "..self.highlightRow)
					if self.displayList[self.highlightRow] ~= nil then
						self.selectedText = self.displayList[self.highlightRow]	-- eg self.list[1] - "chest_01"
						if U.trim(self.selectedText) ~= "" then
							--_G.Log:saveToLog("self.highlightRow = "..self.highlightRow..", self.selectedText = "..self.selectedText)
							_G.events:invoke("onListClick", self)
						end
					end						
				else -- right click
				
				end
			end
		end
	end
end

function ListBox:draw()
	if not self.isVisible then return end
	local rowOffset = self.pos.y - 1
	local width = self.size.x
	local height = self.size.y
	local row = 0
	local setPos = term.setCursorPos
	local highlighted = false			-- used to prevent 2 identical items being highlighted
	
	local lib = {}
	
	function lib.display(self, itemText, row, withHighlight)
		--_G.Log:saveToLog("ListBox:draw():\nitemText = ".. itemText.."\nSelected = "..self.selectedText)
		if withHighlight and not highlighted then
			if itemText == self.selectedText then	-- do not draw empty rows in highlight colour
				term.setBackgroundColor(self.highlight)
				highlighted = true
			else
				term.setBackgroundColor(self.backColour)
			end
		else
			term.setBackgroundColor(self.backColour)
		end
		term.setTextColor(self.textColour)
		if self.columnIndex > 1 then			-- display data starting at this col
			itemText = U.padRight(itemText:sub(self.columnIndex),  width, " ")
		else
			itemText = U.padRight(itemText, width, " ")
		end
		setPos(self.pos.x, row + rowOffset)
		term.write(itemText)
	end
	
	function lib.preDisplay(row, itemText)
		row = row + 1
		local found = false
		for k,v in ipairs(self.displayList) do
			if v == itemText then
				found = true
				break
			end
		end
		if not found then
			table.insert(self.displayList, itemText)
		end
		--if #itemText > self.dataWidth then
			--self.dataWidth = #itemText
		--end
		lib.display(self, itemText, row, true)
		return row
	end
	
	--_G.Log:saveToLog("ListBox:draw(): ".. self.name)
	U.setCurrentCursor(true)
	term.setCursorBlink(false) 
	term.setTextColor(self.textColour)
	if self.list == nil then
		self.list = {}
	end
	if self.searchText == "" then					-- display data from complete list
		if #self.displayList ~= #self.list then		-- displayList has been modified
			ListBox.fillDisplayList(self)			-- repopulate displayList, reset dataWidth and dataHeight
		end
		if self.toEnd and #self.displayList >= height then
			for i = #self.displayList - height, height do
				row = row + 1
				lib.display(self, self.displayList[i], row, true)
			end
		else
			for i = self.listIndex, #self.displayList do
				row = row + 1
				if row <= height then
					local itemText = self.displayList[i]
					lib.display(self, itemText, row, true)
				else
					break
				end
			end
			for i = 1, height - #self.displayList do
				row = row + 1
				lib.display(self, "", row, false)
			end
		end
	else											-- modify data from complete list
		self.displayList = {}						-- reset displayList
		--self.dataWidth = 0						-- width re-calculated in lib.preDisplay()
		for i = self.listIndex, #self.list do
			if #self.displayList < height then
				local itemText = self.list[i]
				local lowerItemText = itemText:lower()
				if self.ignoreCase then
					if lowerItemText:find(self.searchText:lower()) ~= nil then
						row = lib.preDisplay(row, itemText)
					end
				else
					if itemText:find(self.searchText) ~= nil then
						row = lib.preDisplay(row, itemText)
					end
				end
			else
				break
			end
		end
		self.dataHeight = #self.displayList
		for i = 1, height - #self.displayList do
			row = row + 1
			lib.display(self, "", row, false)
			--row = row + 1
		end
		_G.events:invoke("onListChanged", self)	
	end
	U.restoreCursor(true)
end

return ListBox
