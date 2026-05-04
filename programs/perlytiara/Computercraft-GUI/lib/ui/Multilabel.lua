local version = 20260423.1600
local Label = require("lib.ui.Label")
local ML = Label:derive("MultiLabel")

local drawPositions = {{"c"}, {"b", "c"}, {"b", "c", "b"},
					   {"b", "b", "c", "b"}, {"b", "b", "c", "b", "b"},
					   {"b", "b", "b", "c", "b", "b"}, {"b", "b", "b", "c", "b", "b", "b"},
					   {"b", "b", "b", "b", "c", "b", "b", "b"}, {"b", "b", "b", "b", "c", "b", "b", "b", "b"}}

function ML:new(name, x, y, w, h, text, fg, bg, alignH, alignV, labels, sizes, colours, alignments, index)
	if index == nil then index = 0 end
	ML.super.new(self, name, x, y, w, h, text, fg, bg, alignH, alignV, index)
	-- labelNames are given for a row of label objects eg {"aquired", "expected", "item", "req"}
	-- sizes = {{3, 1}, {3, 1}, {30, 1}, {1, 1}} :  should be same no of sizes as labelNames
	-- colours = {{colors.white, colors.gray},{colors.white, colors.gray}, {colors.white, colors.gray},{colors.yellow, colors.lightGray},{colors.red, colors.gray}}
	-- alignments = {{"right","centre"}, {"centre","centre"}, {left", "centre"}, {"left", "centre"}, {"centre","centre"}}
	-- self.size and self.pos in base class
	-- self.isVisible in base class
	--_G.Log:saveToLog("MultiLabel:new self.name = "..self.name..", self.size = "..self.size.x..", "..self.size.y..", self.pos = "..self.pos.x..", "..self.pos.y)
	self.labelNames = labels
	self.sizes = sizes
	self.colours = colours
	self.alignments = alignments
	self.labels = {}
	-- nothing displayed until ML:setup called with new data
end  

function ML:getControlData()
	return "multilabel", self.index
end

function ML:setup(data)
	-- data is from GetItems.lua self.inventory
	-- eg data = {{"stone", 64, 0, true},
	-- 			 {{"stone (Slab can be crafted)", "slab (Slab can be crafted)"}, {1, 3}, {0, 0}, {false, false}}}
	-- setup list of labels that have x,y,w,h,text,fg,bg,alignH,alignV
	Log:saveToLog(self.name.." (MultiLabel):setup")
	self.labels = {}		-- reset
	local currentY = self.pos.y
	local addY = 0
	for row, labelset in ipairs(data) do -- eg {"stone", 64, 0, true} = first value or {{"soul_sand (dirt: temporary)","dirt (dirt: temporary)",},{1,1,},{0,0,},{true,true,},}
		local labelRow = {}
		local currentX = self.pos.x
		for index, value in ipairs(labelset) do	-- eg "stone" or {"stone", "slab"} or 64 or true
			local lbl = {}
			lbl.index = {row, index}	-- eg index = {1, 1} for row 1 label 1
			lbl.x = currentX
			lbl.y = currentY
			lbl.w = self.sizes[index][1]
			lbl.fg = self.colours[index][1]
			lbl.bg = self.colours[index][2]
			lbl.alignH = self.alignments[index][1]
			lbl.visible = true
			-- add text to label
			if type(value) == "table" then
				lbl.h = self.sizes[index][2] * #value
				lbl.alignV = "top"
				lbl.text = {}
				if index == 1 or index == 2 then -- eg "stone" or {"stone", "slab"}
					lbl.text = value
				else
					for _, v in ipairs(value) do
						if type(v) == "boolean" then
							table.insert(lbl.text, (" "):rep(lbl.w))
							if v then
								lbl.bg = colors.red
							else
								lbl.bg = colors.green
							end
						end
					end
				end
			else
				lbl.h = self.sizes[index][2]
				lbl.alignV = self.alignments[index][2]
				--Log:saveToLog("type(value) = "..type(value))
				if type(value) == "string" or type(value) == "number" then
					lbl.text = tostring(value)
				else	-- boolean
					lbl.text = (" "):rep(lbl.w)
					if value then
						lbl.bg = colors.red
					else
						lbl.bg = colors.green
					end
				end
			end
			table.insert(labelRow, lbl)
			currentX = currentX + lbl.w
			addY = lbl.h
		end
		currentY = currentY + addY
		table.insert(self.labels, labelRow)
		
	end
--Log:saveToLog(self.name.." (MultiLabel) complete, self.labels[1] = "..textutils.serialise(self.labels[1], {compact = true}))
	self.isVisible = true
end

function ML:setButtonData(index, data)
	-- eg index = {1, 3} row 1 button 3
	-- data = {{"text", "12"}, {"fg", colors.red}}
	-- Log:saveToLog("ML:setButtonData(index = "..textutils.serialise(index, {compact = true})..", data = "..textutils.serialise(data, {compact = true})..")\n")
	local label = self.labels[index[1]][index[2]]
	for _, v in ipairs(data) do
		label[v[1]] = v[2]	-- eg label["text"] = "12"
	end
	--self.labels[index[1]][index[2]][data[1]] = data[2]
end

function ML:setLabelIsVisible(labelName, value)
	if type(labelName) == "table" then
		-- set visible state of all labels to opposite of requested
		--_G.Log:saveToLog("Label = "..textutils.serialise(self.labels))
		for _, label in pairs(self.labels) do 
			label.visible = not value
		end
		-- set visible state of selected labels to state requested
		--_G.Log:saveToLog("ML:setLabelIsVisible() self.name = "..self.name..", labels = "..textutils.serialise(labelName, {compact = true}))
		for _,name in ipairs(labelName) do 
			--_G.Log:saveToLog("self.labels["..name.."].visible = "..tostring(value))
			self.labels[name].visible = value
		end
	else
		self.labels[labelName].visible = value
	end
end

function ML:update(key, data)
	-- update text of a column of labels
	-- eg key = "aquired" , data = {64, 1} update the "aquired" column with data
	-- get index of "aquired"
	local index = 0
	for k, v in ipairs(self.labelNames) do -- eg {"aquired", "sep", "expected", "item", "req"}
		if v == key then
			index = k	-- "aquired" is in position 1 so any label with index == 1 should be edited
			break
		end
	end
	dataIndex = 1	-- used to iterate supplied data
	for k, v in ipairs(self.labels) do -- eg label = {x = 1, y = 1, w = 3, h = 1,  }
		if v.index == index then
			v.text = tostring(data[dataIndex])
			dataIndex = dataIndex + 1
		end
	end
end

function ML:draw()
	if not self.isVisible then return end
	--Log:saveToLog("ML:draw() started")
	local setPos = term.setCursorPos		-- shortcuts
	local setFG = term.setTextColor
	local setBG = term.setBackgroundColor
	-- self.labels = {{{1}, {2}, {3}, {4}},
	--				 {{1}, {2}, {3}, {4}}, ...}
	--Log:saveToLog("self.labels = "..textutils.serialise(self.labels, {compact = true}).."\n")
	for _, labelRow in ipairs(self.labels) do	-- eg {{1}, {2}, {3}, {4}}
		--Log:saveToLog("labelRow = "..textutils.serialise(labelRow, {compact = true}).."\n")
		for _, label in ipairs(labelRow) do		-- eg {1} = {visible=true,alignH="right",text="0",w=4,y=2,h=1,fg=1,x=1,alignV="centre",bg=128,index=1,}
			if label.visible then
				setPos(label.x, label.y)
				setFG(label.fg)
				setBG(label.bg)
				label.blank = (" "):rep(label.w)
				if label.h == 1 then
					if label.alignH == "right" then
						term.write(U.padLeft(label.text, label.w))
					elseif label.alignH == "left" then
						term.write(U.padRight(label.text, label.w))
					elseif label.alignH == "centre" then
						term.write(U.padCentre(label.text, label.w))
					end
				else
					if label.alignV == "top" then
						if type (label.text) == "table" then
							if label.bg ~= colors.green and label.bg ~= colors.red then
								setBG(colors.orange)
							end
							for row = 0, label.h - 1 do 
								setPos(label.x, label.y + row)
								term.write(U.padRight(label.text[row + 1], label.w))
							end 
						else
							setBG(label.bg)
							term.write(U.padRight(label.text, label.w))
							for row = 1, label.h do 
								setPos(label.x, label.y + row)
								term.write(label.blank)
							end 
						end
					elseif self.alignV == "centre" then
						for row = 0, #drawPositions[label.h] - 1 do	-- eg {"b", "c", "b"}
							setPos(label.x, label.y + row)
							if drawPositions[label.h][row + 1] == "b" then
								term.write(label.blank)
							else
								term.write(label.text)
							end
						end
					else 
						for row = 1, label.h - 1 do 
							setPos(label.x, label.y + row)
							term.write(label.blank)
						end 
						setPos(label.x, label.y + label.h)
						term.write(label.text)
					end 
				end 
			end
		end
	end
	setBG(colors.black)
end

return ML
