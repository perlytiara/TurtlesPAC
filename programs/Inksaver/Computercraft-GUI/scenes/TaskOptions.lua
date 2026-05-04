local version = 20260117.0800
local Scene 	= require("lib.Scene")
local Label 	= require("lib.ui.Label")
local Multilabel = require("lib.ui.MultiLabel")
local Button 	= require("lib.ui.Button")
local Textbox 	= require("lib.ui.Textbox")
local Checkbox 	= require("lib.ui.Checkbox")
local S 		= Scene:derive("TaskOptions")

-- computers are 51 x 19, turtles are 39 x 13
WIDTH, HEIGHT = term.getSize()	-- 39 x 13 turtle terminal

function S:new(sceneMgr)
	S.super.new(self, sceneMgr)
	self.name = "TaskOptions"
	self.ctrls = {"btnBack", "lblTitle", "btnNext", "chk1", "chk2", "chk3", "chk4", "chk5", "chk6",
				   "txt1", "txt2", "txt3", "txt4", "txt5",
				   "lbl1", "lbl2", "lbl3", "lbl4", "lbl5", "lblInfo"}
	-- Button:new(name, x, y, w, h, text, fg, bg, alignH, alignV, index, keyBind, scene)					
	self.btnBack  = Button(self.ctrls[1], 1, 1, 6, 1, "Back", colors.lime, colors.lightGray, "centre", "centre", 0, "b", self.name )
	self.lblTitle = Label(self.ctrls[2], 7,  1, WIDTH - 12, 1, "Options", colors.black, colors.yellow, "centre", "centre", 0)
	self.btnNext  = Button(self.ctrls[3], WIDTH - 5, 1, 6, 1, "Next", colors.lime, colors.lightGray, "centre", "centre", 0, "n", self.name )
	self.chk1 	  = Checkbox(1,self.ctrls[4], 1,  2, 13, 3, 	"", colors.gray, 	  colors.green, colors.white)
	self.chk2 	  = Checkbox(2,self.ctrls[5], 14, 2, 13, 3, 	"", colors.lightGray, colors.green, colors.white)
	self.chk3 	  = Checkbox(3,self.ctrls[6], 27, 2, 13, 3, 	"", colors.gray, 	  colors.green, colors.white)
	self.chk4 	  = Checkbox(4,self.ctrls[7], 1,  5, 13, 3, 	"", colors.lightGray, colors.green, colors.white)
	self.chk5 	  = Checkbox(5,self.ctrls[8], 14, 5, 13, 3, 	"", colors.gray, 	  colors.green, colors.white)
	self.chk6 	  = Checkbox(6,self.ctrls[9], 27, 5, 13, 3, 	"", colors.lightGray, colors.green, colors.white)
	--Textbox:new(name, x, y, w, h, text, fg, bg, alignH, alignV, numbersOnly, index)
	self.txt1  	  = Textbox(self.ctrls[10], WIDTH - 4, 8, 4, 1, "", colors.white, colors.black, "left", "centre", true, 7)
	self.txt2  	  = Textbox(self.ctrls[11], WIDTH - 4, 9, 4, 1, "", colors.white, colors.black, "left", "centre", true, 8)
	self.txt3  	  = Textbox(self.ctrls[12], WIDTH - 4, 10, 4, 1, "", colors.white, colors.black, "left", "centre", true, 9)
	self.txt4  	  = Textbox(self.ctrls[13], WIDTH - 4, 11, 3, 1, "", colors.white, colors.black, "left", "centre", true, 10)
	self.txt5  	  = Textbox(self.ctrls[14], WIDTH - 4, 12, 3, 1, "", colors.white, colors.black, "left", "centre", true, 11)
	-- L:new(name, x, y, w, h, text, fg, bg, alignH, alignV, index)
	self.lbl1 	  = Label(self.ctrls[15], 1, 8, WIDTH - 5, 1, "", colors.white, colors.brown, "right", "centre", 7)
	self.lbl2 	  = Label(self.ctrls[16], 1, 9, WIDTH - 5, 1, "", colors.black, colors.orange, "right", "centre", 8)
	self.lbl3 	  = Label(self.ctrls[17], 1, 10, WIDTH - 5, 1, "", colors.white, colors.brown, "right", "centre", 9)
	self.lbl4 	  = Label(self.ctrls[18], 1, 11, WIDTH - 5, 1, "", colors.black, colors.orange, "right", "centre", 10)
	self.lbl5 	  = Label(self.ctrls[19], 1, 12, WIDTH - 5, 1, "", colors.black, colors.brown, "right", "centre", 11)
	self.lblInfo  = Label(self.ctrls[20], 1, HEIGHT, WIDTH, 1, "", colors.black, colors.yellow, "centre", "centre", 0)
	
	self.lblI1	  = Label("lblI1", WIDTH, 8, 1, 1, "7", colors.black, colors.gray, "left", "centre", 7)
	self.lblI2	  = Label("lblI2", WIDTH, 9, 1, 1, "8", colors.black, colors.gray, "left", "centre", 8)
	self.lblI3	  = Label("lblI3", WIDTH, 10, 1, 1, "9", colors.black, colors.gray, "left", "centre", 9)
	self.lblI4	  = Label("lblI4", WIDTH - 1, 11, 2, 1, "10", colors.black, colors.gray, "left", "centre", 10)
	self.lblI5	  = Label("lblI5", WIDTH - 1, 12, 2, 1, "11", colors.black, colors.gray, "left", "centre", 11)
	
	self.controls =
	{
		[self.ctrls[1]] = self.btnBack, -- "btnBack" = self.btnBack
		[self.ctrls[2]] = self.lblTitle,
		[self.ctrls[3]] = self.btnNext,
		[self.ctrls[4]] = self.chk1,
		[self.ctrls[5]] = self.chk2,
		[self.ctrls[6]] = self.chk3,
		[self.ctrls[7]] = self.chk4,
		[self.ctrls[8]] = self.chk5,
		[self.ctrls[9]] = self.chk6,
		[self.ctrls[10]] = self.txt1,
		[self.ctrls[11]] = self.txt2,
		[self.ctrls[12]] = self.txt3,
		[self.ctrls[13]] = self.txt4,
		[self.ctrls[14]] = self.txt5,
		[self.ctrls[15]] = self.lbl1,
		[self.ctrls[16]] = self.lbl2,
		[self.ctrls[17]] = self.lbl3,
		[self.ctrls[18]] = self.lbl4,
		[self.ctrls[19]] = self.lbl5,
		[self.ctrls[20]] = self.lblInfo
	}
	
	self.checkboxes = {["chk1"] = self.chk1, ["chk2"] = self.chk2, ["chk3"] = self.chk3,
					   ["chk4"] = self.chk4, ["chk5"] = self.chk5, ["chk6"] = self.chk6}
	self.textboxes  = {["txt1"] = self.txt1, ["txt2"] = self.txt2, ["txt3"] = self.txt3,
					   ["txt4"] = self.txt4, ["txt5"] = self.txt5}
	self.labels 	= {["lblTitle"] = self.lblTitle, ["lbl1"] = self.lbl1, ["lbl2"] = self.lbl2, ["lbl3"] = self.lbl3,
					   ["lbl4"] = self.lbl4, ["lbl5"] = self.lbl5, ["lblInfo"] = self.lblInfo}
					   
	--self.em:add(entity,		name)
	self.em:add(self.btnBack, 	self.ctrls[1])
	self.em:add(self.lblTitle, 	self.ctrls[2])
	self.em:add(self.btnNext, 	self.ctrls[3])
	self.em:add(self.chk1, 		self.ctrls[4])
	self.em:add(self.chk2, 		self.ctrls[5])
	self.em:add(self.chk3, 		self.ctrls[6])
	self.em:add(self.chk4, 		self.ctrls[7])
	self.em:add(self.chk5, 		self.ctrls[8])
	self.em:add(self.chk6, 		self.ctrls[9])
	self.em:add(self.txt1, 		self.ctrls[10])
	self.em:add(self.txt2, 		self.ctrls[11])
	self.em:add(self.txt3, 		self.ctrls[12])
	self.em:add(self.txt4, 		self.ctrls[13])
	self.em:add(self.txt5, 		self.ctrls[14])
	self.em:add(self.lbl1, 		self.ctrls[15])
	self.em:add(self.lbl2, 		self.ctrls[16])
	self.em:add(self.lbl3, 		self.ctrls[17])
	self.em:add(self.lbl4, 		self.ctrls[18])
	self.em:add(self.lbl5, 		self.ctrls[19])
	self.em:add(self.lblInfo, 	self.ctrls[20])
	self.em:add(self.lblI1, 	"lblI1")
	self.em:add(self.lblI2, 	"lblI2")
	self.em:add(self.lblI3, 	"lblI3")
	self.em:add(self.lblI4, 	"lblI4")
	self.em:add(self.lblI5, 	"lblI5")
	
	

	self.btnClick 			= function(button) 		self:onBtnClick(button) end
	self.checkboxChanged 	= function(checkbox) 	self:onChkChanged(checkbox) end
	self.txtClick 			= function(textbox) 	self:onTxtClick(textbox) end
	self.txtChanged 		= function(textbox) 	self:onTxtChanged(textbox) end
	self.txtEnter 			= function(textbox) 	self:onTxtEnter(textbox) end
	self.changeLabel		= function(key) 		self:calculateHeight(key) end
	self.changeRoof 		= function(key) 		self:calculateRoof(key) end
	self.changeR			= function(key, value) 	self:changeRValue(key, value) end
	self.execute			= function(key, value) 	self:executeCall(key, value) end
	self.changeFocus 		= true
	self.textboxActive 		= false
	
	self.task = ""
	self.group = {}
	self.associations = {}	-- assocaites a control with a property of R to be assigned a value eg R.up = true (R["up"] = true)
	for _, controlName in ipairs(self.ctrls) do 
		self.associations[controlName] = {required = false}	-- eg self.associations["chk1"] = {required = false}
	end
	
	self.setupData = nil
	self.infoText = ""
end

function S:setup()
	-- setup captions for controls
	--[[
	example data =
	{
		["chk1"] = {text = "In Nether?", state = false},
		["chk2"] = {text = "In Air?", state = false, u = {"bedrock", 0, -64}},
		["chk3"] = {text = "Build Base?", state = false, r = {"data", "chamber", ""}},	-- use R.data and give value "chamber" if selected
		["chk4"] = {text = "Go UP?", state = false, group = {"chk4", "chk5"}, required = true, r = "up"},
		["chk5"] = {text = "Go DOWN?", state = true, group = {"chk4", "chk5"}, required = true, r = "down"},
		["lbl1"] = {text = "Current level (F3):", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}},
		["lbl2"] = {text = "Go to level:", limits = {{"U.bedrock + 5"} , {"currentLevel", 2}}},
		["txt1"] = {text = "0", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}, r = "currentLevel", event = {"calculateHeight", "lbl2"}},
		["txt2"] = {text = "0", limits = {{"U.bedrock + 5"} , {"currentLevel", 2}}, r = "height", event = {"calculateHeight", "lbl2"}}
	}
	]]
	self.task = U.currentTask						-- eg  "Ladder up or down"
--Log:saveToLog("TaskOptions:setup:self.task = '"..self.task.."'")	
	local data = F[U.currentTask].data
	for _, checkbox in pairs(self.checkboxes) do	-- disabling checkboxes = draw without check graphic
		checkbox:enable(false)
		checkbox:setText("")
	end
	for _, textbox in pairs(self.textboxes) do		-- disabling textboxes so do not respond to mouse/keyboard
		textbox:enable(false)
		textbox:setFocus(focus)						-- also sets background colour
	end
--Log:saveToLog("TaskOptions:setup: data received =  "..textutils.serialise(data, {compact = true}).."\n")
--Log:saveToLog("TaskOptions:setup: self.associations =  "..textutils.serialise(self.associations, {compact = true}).."\n")
	for _, name in ipairs(self.ctrls) do			-- iterate all controls (labels, checkboxes, buttons) eg lblTitle, chk1
		self.associations[name] = {}				-- reset
		--self.associations[name]["r"] = ""			-- reset
		self.associations[name]["required"] = false	-- reset
		self.controls[name]:setText("")				-- set the text to empty string
		local tbl = data[name]						-- ["chk4"] = {text = "Go UP?", state = false, group = {"chk4", "chk5"}, required = true, r = "up"},
		if tbl ~= nil then
--Log:saveToLog("TaskOptions:setup: tbl = "..textutils.serialise(tbl, {compact = true}))
			if tbl["text"] ~= nil then					-- set text
				--local ctrlType, index = self.controls[name]:getControlData()
--Log:saveToLog("TaskOptions:setup: ctrlType = "..ctrlType..", index = "..index)
				--if ctrlType == "label" and index > 0 then
					--self.controls[name]:setText(index.." "..tbl["text"])
				--else
					self.controls[name]:setText(tbl["text"])
				--end
				self.controls[name]:enable(true)
			end
			if tbl["width"] ~= nil then
				self.controls[name]:setWidth(tbl["width"])
			end
			if tbl["x"] ~= nil then
				self.controls[name]:setX(tbl["x"])
			end
			if tbl["bg"] ~= nil then
				self.controls[name]:setBG(tbl["bg"])
			end
			if tbl["fg"] ~= nil then
				self.controls[name]:setFG(tbl["fg"])
			end
			if tbl["alignH"] ~= nil then
				self.controls[name]:setAlignH(tbl["alignH"])
			end
			if tbl["alignV"] ~= nil then
				self.controls[name]:setAlignV(tbl["alignV"])
			end
			if tbl["numbersOnly"] ~= nil then
				self.controls[name]:setNumbersOnly(tbl["numbersOnly"])
				self.controls[name]:enable(true)
			end
			if tbl["r"] ~= nil then
				self.associations[name]["r"] = tbl["r"]				
			end
			if tbl["u"] ~= nil then									-- u = {"bedrock", 0, -64}}
				self.associations[name]["u"] = tbl["u"]				-- eg misc = "U.bedrock=0,-64"}
			end
			if tbl["state"] ~= nil then					-- checkboxes only
				self.controls[name]:setChecked(tbl["state"])
			end
			if tbl["group"] ~= nil then					-- checkboxes only
				--self.group = tbl["group"]				-- eg group = {"chk4", "chk5"}
				self.group[name] = tbl["group"]			-- eg group["chk1"] = {"chk4", "chk5"}
			end
			if tbl["required"] ~= nil then				-- checkboxes and textboxes
				self.associations[name]["required"] = tbl["required"]	-- eg required = true,
			end
			
			if tbl["limits"] ~= nil then
				self.associations[name]["limits"] = tbl["limits"]	-- eg limits = {U.bedrock + 5 , "height", -2}
			end
			if tbl["event"] ~= nil then
				self.associations[name]["event"] = tbl["event"]		-- eg event = {"calculateHeight", "lbl2"}
			end
		end
	end
--Log:saveToLog("\nRevised self.associations =  "..textutils.serialise(self.associations, {compact = true}))
	--Log:saveToLog("R = "..textutils.serialise(R, {compact = true}).."\n")
	--Log:saveToLog("R.inNether = "..tostring(R.inNether)..", R.up = "..tostring(R.up)..", R.down = "..tostring(R.down)..", R.inventoryKey = "..R.inventoryKey..
				  --", R.height = "..tostring(R.height)..", R.depth = "..tostring(R.depth)..", R.currentLevel = "..tostring(R.currentLevel).."\n")
	self.setupData = data
	self.btnBack:setText("Back")	
	self.lblTitle:setText(F[U.currentTask].title)
	self.btnNext:setText("Next")
	self.lblInfo:setText("number + Enter: set checkbox / textbox")
--Log:saveToLog("TaskOptions:setup() configuring checkboxes")
	for _, chk in ipairs(self.checkboxes) do	-- if checked
		if chk.checked then
			self:changeData(chk)
		end
	end
--Log:saveToLog("TaskOptions:setup() configuring labels")
	for _, label in ipairs(self.labels) do	-- if no text in a label set to full width
		if label:getText() == "" then
			label:setSize(WIDTH, 1)
		end
	end
--Log:saveToLog("TaskOptions:setup() configuring textboxes")
	for _, txt in ipairs(self.textboxes) do	-- if text > 0 then calculate
		if txt:getText() ~= "" then
			self:onTxtChanged(txt)
		end
	end
end

function S:enter()
--Log:saveToLog("TaskOptions:enter() start")
	S.super.enter(self)

	events:hook("onBtnClick", 		self.btnClick)    
	events:hook("onChkChanged", 	self.checkboxChanged)
	events:hook("onTxtClick", 		self.txtClick)
	events:hook("onTxtChanged",		self.txtChanged)
	events:hook("onTxtEnter",		self.txtEnter)
	events:hook("calculateHeight", 	self.changeLabel)
	events:hook("calculateRoof", 	self.changeRoof)
	events:hook("changeRValue", 	self.changeR)
	events:hook("executeCall", 		self.execute)
	
	U.keyboardInput = ""
--Log:saveToLog("TaskOptions:enter() end")
end

function S:exit()
--Log:saveToLog("TaskOptions:exit() start")
	S.super.exit(self)
	
	events:unhook("onBtnClick", 	self.btnClick)    
	events:unhook("onChkChanged", 	self.checkboxChanged)
	events:unhook("onTxtClick", 	self.txtClick)
	events:unhook("onTxtChanged", 	self.txtChanged)
	events:unhook("onTxtEnter",		self.txtEnter)
	events:unhook("calculateHeight",self.changeLabel)
	events:unhook("calculateRoof",  self.changeRoof)
	events:unhook("changeRValue", 	self.changeR)
	events:unhook("executeCall", 	self.execute)
--Log:saveToLog("TaskOptions:exit() end")
end

function S:calculateHeight(key)
	-- user types into text box "txt1". The entry in taskInventory.lua for txt1 is:
	-- ["txt1"] = {text = "0", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}, r = "startLevel", event = {"calculateHeight", "lbl2"}},
	-- this sets the limits and calls this function using "lbl2" passed as the key: S:calculateHeight(lbl2)
	-- key = "lbl2"
	-- limits = {{"U.bedrock + 5"}, {"U.ceiling"}}

Log:saveToLog("TaskOptions:calculateHeight("..key..")")
	local controlData = self.setupData[key]					-- ["lbl2"] = {text = "Go to level:", limits = {{U.bedrock + 5}, {"currentLevel", 2}}
	local lowerLimit = U.bedrock + 5
	local upperLimit = U.ceiling
	-- get text from setup data, as label text may already have changed
	-- need to use R.upperLevel and R.lowerLevel to calculate ladders and torches
	-- if R.up then R.lowerLevel = R.startLevel, R.upperLevel = R.destinationLevel
	-- if R.down then R.upperLevel = R.startLevel, R.lowerLevel = R.destinationLevel
	local text = tostring(controlData.text)	-- eg lbl2.text = "Go to level:"
	local limits = controlData["limits"]	-- eg limits = {{U.bedrock + 5} , {"R.currentLevel", 2}} -> {-59, 319}
	
	if R.up then
		R.lowerLevel = R.startLevel
		R.upperLevel = R.destinationLevel
	elseif R.down then
		R.lowerLevel = R.startLevel
		R.upperLevel = R.destinationLevel				
	end 
Log:saveToLog("TaskOptions:calculateHeight("..key.."): R.up = "..tostring(R.up)..", R.down = "..tostring(R.down)..
			  ", R.startLevel = "..R.startLevel..", R.destinationLevel = "..R.destinationLevel..
			  ", R.lowerLevel = "..R.lowerLevel..", R.upperLevel = "..R.upperLevel)
	if  limits == nil then	
		if R.up then
			lowerLimit = R.currentLevel + 2	
			upperLimit = U.ceiling
		elseif R.down then
			lowerLimit = U.bedrock + 5
			upperLimit = R.currentLevel - 2	
		end 
		Log:saveToLog("calculated limits: lower = ".. lowerLimit..", upper = "..upperLimit)
	else -- eg {{U.bedrock + 5} , {"currentLevel", 2}}
		-- limits consists of 2 tables
		Log:saveToLog("TaskOptions:calculateHeight() limits = "..textutils.serialise(limits, {compact = true}))
		R.lowerLevel = R.startLevel
		if  limits[1] == nil then	
			if R.up then
				lowerLimit = R.currentLevel + 2	
				upperLimit = U.ceiling
			elseif R.down then			
				lowerLimit = U.bedrock + 5
				upperLimit = R.currentLevel - 2	
			end 
			Log:saveToLog("calculated limits: lower = ".. lowerLimit..", upper = "..upperLimit)
		else
			local lLimits = limits[1] 		-- eg {U.bedrock + 5} 
			local uLimits = limits[2] 		-- eg {"R.currentLevel", 2}
			if #lLimits == 1 then
				lowerLimit  = U.parseExpression(lLimits[1],"TaskOptions:calculateHeight")		-- eg -64 + 5 = -59
				Log:saveToLog("lowerLimit = ".. lowerLimit)	
			else								-- eg {"currentLevel", 2}
				local Rkey = uLimits[1]		-- eg "currentLevel"
				if Rkey:find("R.") ~= nil then
					Rkey = Rkey:sub(3)
				end
				local r = uLimits[2]		-- eg 2
				Log:saveToLog("Lower Rkey = ".. Rkey..", r = "..r..", R.up = "..tostring(R.up)..", R.down = "..tostring(R.down))	
				if R.up then
					lowerLimit = R[Rkey] + r	-- eg R.currentLevel + 2 -> 70+2 -> 72
				elseif R.down then
					lowerLimit = R[Rkey] - r -- eg R.currentLevel - 2 -> 70-2 -> 68
				end 
				--assert(not R.up and not R.down, "Neither R.up or R.down has been set")
				Log:saveToLog("calculated lowerLimit = ".. lowerLimit)	
			end
		
			if #uLimits == 1 then
				upperLimit  = U.parseExpression(uLimits[1],"TaskOptions:calculateHeight")
				Log:saveToLog("upperLimit = ".. upperLimit)	
			else								-- eg {"currentLevel", 2}
				local Rkey = uLimits[1]		-- eg "currentLevel"
				if Rkey:find("R.") ~= nil then
					Rkey = Rkey:sub(3)
				end
				local r = uLimits[2]	-- eg 2
				Log:saveToLog("Upper Rkey = ".. Rkey..", r = "..r..", R."..Rkey.." = "..tostring(R[Rkey])..", R.up = "..tostring(R.up)..", R.down = "..tostring(R.down))	
				if R.up then
					upperLimit = R[Rkey] + r
				elseif R.down then
					upperLimit = R[Rkey] - r
				end 
				--assert(not R.up and not R.down, "Neither R.up or R.down has been set")
				Log:saveToLog("calculated upperLimit = ".. tostring(upperLimit))	
			end 
		end
	end
	--local text = text.."("..lowerLimit.." to ".. upperLimit..")"
	text = text.."("..lowerLimit.." to ".. upperLimit..")"
	self.labels[key]:setText(text)
end

function S:calculateRoof(key)
	-- user types into text box "txt1". The entry in taskInventory.lua for txt1 is:
	-- ["txt1"] = {text = "0", limits = {{1}, {256}}, r = "width", event = {"calculateRoof", "lbl3"}},
	-- this sets the limits and calls this function using "lbl3" passed as the key: S:calculateRoof(lbl3)
	-- key = "lbl3"
	Log:saveToLog("TaskOptions:calculateRoof("..key..")")
	local controlData = self.setupData[key]					-- ["lbl3"] = {text = "Roof height "},
	-- get text from setup data, as label text may already have changed
	-- roof height is 0.5 width
	R.height = math.ceil(R.width / 2)
	local text = tostring(controlData.text)..R.height	-- eg lbl3.text = "Roof height 4"
	self.labels[key]:setText(text)
end

function S:changeRValue(key, value)
	-- eg event = {"changeRValue", key = "groupSize", value = "txt1"}
	local lib = {}
	
	function lib.setTurtleCount(count)
		R.turtleCount = count
	end
	
	function lib.setInventoryKey(v)	
		if U.currentTask == "createWaterCanal" then
			if v == 1 or v == 4 then	-- towpath
				if R.turtleCount == 2 then
					if R.torchInterval > 0 then
						R.inventoryKey = "2T"
					else
						R.inventoryKey = "2"
					end
				elseif R.turtleCount == 4 then
					if R.torchInterval > 0 then
						R.inventoryKey = "4pathT"
					else
						R.inventoryKey = "4path"
					end
				end
			elseif v == 2 or v == 3 then	-- over water
				if R.turtleCount == 2 then
					if R.torchInterval > 0 then
						R.inventoryKey = "2T"
					else
						R.inventoryKey = "2"
					end
				elseif R.turtleCount == 4 then
					R.inventoryKey = "4water"
				end
			elseif v == 5 or v == 6 then	-- already in canal base so water present
				if R.turtleCount == 2 then
					if R.torchInterval > 0 then
						R.inventoryKey = "2T"
					else
						R.inventoryKey = "2"
					end
				elseif R.turtleCount == 4 then
					R.inventoryKey = "4water"
				end
			end
		elseif U.currentTask == "createIceCanal" then
			if v == 1 or v == 4 then	-- towpath
				if R.torchInterval > 0 then
					R.inventoryKey = "pathT"
				else
					R.inventoryKey = "path"
				end
			elseif v == 2 or v == 3 then	-- ice or air
				R.inventoryKey = "ice"
			end
		end
		Log:saveToLog("R.inventoryKey = "..R.inventoryKey)
	end
	
	Log:saveToLog("TaskOptions:changeRValue(key = "..key..", value = "..value)
	if value:find("txt") ~= nil then
		-- control name used as data source
		local v = tonumber(self.textboxes[value].text)	-- get the text from txt1 as a number
		if v ~= nil then
			if key == "turtleCount" then
				if v == 3 then v = 4 end
				if v < 1 then v = 1 end
				if v > 4 then v = 4 end 
				lib.setTurtleCount(v) 
				lib.setInventoryKey(R.position)
			elseif key == "torchInterval" then
				R.torchInterval = v
				lib.setInventoryKey(R.position)
			else
				R[key] = v	-- eg R[length] = 16
			end
		end
	elseif value:find("chk") ~= nil then
		-- should only apply to boolean R values
		-- control name used as data source
		local state = self.checkboxes[value].checked	-- get the text from chk1 as a boolean
		R[key] = state
		Log:saveToLog("R."..key.." set from event: "..tostring(state))
	else
		if key == "inventoryKey" then
			-- each turtle has a different inventory
			-- "4path", "4pathT", "4water", "2", "2T"
			R.position = tonumber(value)
			Log:saveToLog("R.position = "..R.position)
			lib.setInventoryKey(R.position)
		else
			R[key] = value
		end
	end
end

function S:calculateLimits(textbox, association)
	-- eg association: ["txt2"] = {text = "0",
	-- limits = {{U.bedrock + 5} , {"currentLevel", 2}}, r = "depth", event = "calculateHeight"}
	-- limits = {{"U.bedrock + 5"}, {"U.ceiling"}}
	local limits = association["limits"]	-- eg limits = {{"U.bedrock + 5"} , {"R.currentLevel", 2}} -> {-59, 319}
	if limits == nil then return end
	Log:saveToLog("\nTaskOptions:calculateLimits("..textbox.name..", association['limits'] = "..textutils.serialise(limits, {compact = true})..")\n")
	local lowerLimit = U.bedrock + 5
	local upperLimit = U.ceiling
	if	limits[1] == nil then
		if R.up then
			lowerLimit = R.currentLevel + 2	
			upperLimit = U.ceiling
		elseif R.down then
			--lowerLimit = R.currentLevel - 2	
			--upperLimit = U.bedrock + 5
			lowerLimit = U.bedrock + 5
			upperLimit = R.currentLevel - 2	
		end 
	else
		-- limits consists of 2 tables		-- eg {{"U.bedrock + 5"} , {"R.currentLevel", 2}}
		local lLimits = limits[1] 		-- eg {"U.bedrock + 5"} 
		local uLimits = limits[2] 		-- eg {"R.currentLevel", 2}
		if #lLimits == 1 then
			lowerLimit = U.parseExpression(lLimits[1], "TaskOptions:calculateLimits")
		else								-- eg {"R.currentLevel", 2}
			lowerLimit = U.parseExpression(lLimits[1], "TaskOptions:calculateLimits") -- eg {"R.currentLevel"}
			--Log:saveToLog("\tU.parseExpression("..lLimits[1]..") = "..lowerLimit.." (lowerLimit)")
			local operand = U.parseExpression(lLimits[2], "TaskOptions:calculateLimits")---- eg {2}
			if R.up then
				lowerLimit = lowerLimit	+ operand-- eg R.currentLevel + 2 -> 70+2 -> 72
			elseif R.down then
				lowerLimit = lowerLimit	- operand -- eg R.currentLevel - 2 -> 70-2 -> 68
			end 
		end 
		if #uLimits == 1 then
			upperLimit  = U.parseExpression(uLimits[1])
		else								-- eg {"currentLevel", 2}
			-- eg limits = {{"U.bedrock + 5"} , {"currentLevel", 2}}, r = "height", event = {"calculateHeight", "lbl2"}}
			upperLimit = U.parseExpression(uLimits[1]) -- eg {"U.bedrock + 5"}
			--Log:saveToLog("\tU.parseExpression("..uLimits[1]..") = "..upperLimit.." (upperLimit)")
			local operand = U.parseExpression(uLimits[2], "TaskOptions:calculateLimits")---- eg {2}
			if R.up then
				upperLimit = upperLimit	+ operand-- eg R.currentLevel + 2 -> 70+2 -> 72
			elseif R.down then
				upperLimit = upperLimit	- operand -- eg R.currentLevel - 2 -> 70-2 -> 68
			end 
		end
	end
	Log:saveToLog("\tSetting limits for "..textbox.name..": lower = "..lowerLimit..", upper = "..upperLimit)
	textbox:setLimits({lowerLimit, upperLimit})
end

function S:executeCall(key, value)
	-- self.execute	= function(key, value) 	self:executeCall(key, value) end
	-- remember to add to events  events:hook("executeCall", self.execute)
	-- eg event = {"execute", key = "findPortal", value = "inventory"}
	Log:saveToLog("TaskOptions:execute(key = "..key..", value = "..value)
	if key == "findPortal" then
		F[U.currentTask].inventory = F[key].call()	-- set the inventory to return value of findPortal()
	elseif key == "findSeabed" then
		F[U.currentTask].inventory = F[key].call()	-- set the inventory to return value of findSeabed()
	end
end

function S:resetTextboxFocus(textbox)
	term.setCursorBlink(false)
	for _, txt in pairs(self.textboxes) do 
		txt:setFocus(false)
	end
	if textbox == nil then
		self.textboxActive = false
		self.lblInfo:setText("number + Enter: set checkbox / textbox")
	else
		self.textboxActive = true
		textbox:setFocus(true)
		term.setBackgroundColor(textbox.backColour)
		term.setTextColor(textbox.textColour)
		term.setCursorPos(textbox.pos.x + #tostring(textbox.text), textbox.pos.y)
		term.setCursorBlink(true)
	end
	U.keyboardInput = ""
end

function S:setInfo(text)
	-- allows changing of the text from tk3.lua or another scene
	-- remains set until next update event
	self.infoText = text
	self.lblInfo:setText(text)
	self:draw()
end

function S:changeData(checkbox)
	local data = self.associations[checkbox.name]["r"]	-- eg "up"
	if type(data) == "string" then
		Log:saveToLog("self:changeData("..checkbox.name..") self.associations[r] = "..tostring(data))
	else
		Log:saveToLog("self:changeData("..checkbox.name..") self.associations[r] = "..textutils.serialise(data, {compact = true}))
	end
	if data ~= nil then	-- assign value eg R.up = true
		if type(data) == "table" then
			if #data == 3 then 				-- eg r = {"inventoryKey", "new", ""}, {"direction", "F", ""}, {"subChoice", 1, 0}
				if checkbox.checked then
					R[data[1]] = data[2] 	-- eg r = {"inventoryKey", "new", ""} -> R.inventoryKey = "new"
					--Log:saveToLog("Checkbox "..checkbox.name.." sets R."..data[1].." = "..data[2])
				else
					R[data[1]] = data[3]	-- eg r = {"inventoryKey", "new", ""} -> R.inventoryKey = ""
					--Log:saveToLog("Checkbox "..checkbox.name.." sets R."..data[1].." = "..data[3])
				end
			elseif #data == 2 then 			-- eg r = {"floor", "ceiling"},
				if checkbox.checked then
					R[data[1]] = true 		-- eg r = {"floor", "ceiling"} -> R.floor = true
					R[data[2]] = false		-- eg r = {"floor", "ceiling"} -> R.ceiling = false
				else
					R[data[1]] = false 		-- eg r = {"floor", "ceiling"} -> R.floor = true
					R[data[2]] = true		-- eg r = {"floor", "ceiling"} -> R.ceiling = false
				end
				--Log:saveToLog("Checkbox "..checkbox.name.." sets R."..data[1].." = "..tostring(R[data[1]]).." and R."..data[2].." = "..tostring(R[data[2]]))
			elseif #data == 1 then 			-- eg r = {"networkFarm"},
				R[data[1]] = checkbox.checked
				Log:saveToLog("Checkbox "..checkbox.name.." sets R."..data[1].." = "..tostring(checkbox.checked))
			end
		else
			R[data] = checkbox.checked
			Log:saveToLog("Checkbox "..checkbox.name.." sets R."..data.." = "..tostring(checkbox.checked))
		end
	end 
	data = self.associations[checkbox.name]["u"]
Log:saveToLog("self:changeData("..checkbox.name..") self.associations[u] = "..tostring(data))
	if data ~= nil then	-- eg u = {"bedrock", 0, -64}
		if checkbox.checked then
			U[data[1]] = data[2]
		else
			U[data[1]] = data[3]
		end
	end 
end

function S:clearText(textbox)
	textbox.text = ""
	textbox.focus = true
	term.setBackgroundColor(textbox.backColour)
	term.setTextColor(textbox.textColour)
	term.setCursorPos(textbox.pos.x + #textbox.text, textbox.pos.y)
	term.setCursorBlink(true)
	self:update()
	U.keyboardInput = ""
	self.textboxActive = true
end

function S:onChkChanged(checkbox)
	local name = checkbox:getName()
	local group = self.group[name]
	local state = checkbox:getChecked()				-- eg chk4 is checked
--Log:saveToLog("TaskOptions: onChkChanged("..name..") self.group["..name.."] = "..textutils.serialise(group, {compact = true}))
	
	if group ~= nil then							-- eg group = {"chk4", "chk5"}
		local inGroup = false
		for _, checkboxName in ipairs(group) do	-- only proceed if this checkbox is a group member
			if checkboxName == name then
				inGroup = true
			end
		end
		
		if inGroup then									-- only 1 checkbox in a group can be set
			if state then return end					-- if clicking on a set checkbox ignore it
--Log:saveToLog("Checkbox group = "..textutils.serialise(group, {compact = true}))
			for _, checkboxName in ipairs(group) do
				if checkboxName ~= name then
--Log:saveToLog("\ncheckboxName "..checkboxName.. ", = false")
					self.checkboxes[checkboxName]:setChecked(false)	-- set all checkbox in group to false
					self:changeData(self.checkboxes[checkboxName])
				end
			end
		end
		--checkbox.checked = not state
		checkbox:setChecked(not state)	-- set 
		self:changeData(checkbox)
	else
		checkbox.checked = not checkbox.checked
--Log:saveToLog("TaskOptions: onChkChanged() calling self:changeData()")
		self:changeData(checkbox)
	end
	local association = self.associations[checkbox.name]
	if association ~= nil then
		if association["event"] ~= nil then	-- eg event = {"calculateHeight", "lbl2"}
Log:saveToLog("association[event][1] = "..association["event"][1]..", [2] = "..association["event"][2]..", [3] = "..association["event"][3])
			events:invoke(association["event"][1], association["event"][2], association["event"][3])	-- eg invoke "calculateHeight", "lbl2"	or "execute", "findPortal"		
		end
	end
	sleep(0.3)		-- checkboxes can switch back too quickly
end

function S:onTxtChanged(textbox)
	U.keyboardInput = ""
	self.lblInfo:setText("Type into text box. Enter to move out")
	if textbox.limits ~= nil and textbox.text ~= "" then
		local currentValue = tonumber(textbox.text)
		textbox.textColour = colors.white
		if currentValue ~= nil then
			if currentValue < textbox.limits[1] then
				textbox.textColour = colors.red
			end 
			if currentValue > textbox.limits[2] then
				textbox.textColour = colors.red
			end 
		end 
	end
	local association = self.associations[textbox.name]
	if association ~= nil then
		if association["r"] ~= nil then
			--Log:saveToLog("if association[] ~= nil R = "..textutils.serialise(R, {compact = true}))
			--Log:saveToLog("R."..association["r"].." current = ".. tostring(R[association["r"]]))
			if textbox.numbersOnly then
				if textbox.text ~= "" then
					if textbox.text ~= "-" then
						local value = tonumber(textbox.text)
						if value ~= nil then
							R[association["r"]] = tonumber(textbox.text)
						end
					end
				end
			else
				R[association["r"]] = textbox.text
				--Log:saveToLog("Whoops!")
			end
			--Log:saveToLog("R."..association["r"].." changed to ".. R[association["r"]])
		end
		self:calculateLimits(textbox, association)	-- eg limits = {{U.bedrock + 5} , {"currentLevel", 2}},
		if association["event"] ~= nil then	-- eg event = {"calculateHeight", "lbl2"}
			events:invoke(association["event"][1], association["event"][2], association["event"][3])	-- eg invoke "calculateHeight", "lbl2"	or 	"changeRValue" "groupSize" "txt1"
		end
	end
	self.textboxActive = true
	self:resetTextboxFocus(textbox)
end

function S:onTxtClick(textbox)
	self:resetTextboxFocus(textbox)
end

function S:onTxtEnter(textbox)
	-- this function invoked by textbox control
	local lib = {}
	
	-- function lib.getEnabled(self)
		-- -- returns a table of enabled textboxes
		-- local enabled = {}
		-- for key, txt in pairs(self.textboxes) do
			-- if txt:isEnabled() then
				-- enabled[key] = true
			-- else
				-- enabled[key] = false
			-- end
		-- end
		-- return enabled	-- eg {["txt1"] = true, ["txt2"] = true, ["txt3"] = false, ...}
	-- end

	function lib.getNextEnabled(self, textbox)
		-- local enabled = lib.getEnabled(self)
		local keys = {"txt1", "txt2", "txt3", "txt4", "txt5"}
		local txtNum = tonumber((textbox.name):sub(4, 4)) + 1	-- eg "txt3" -> 4
		local key = "txt"..txtNum								-- eg "txt4"
		if self.textboxes[key] == nil then return nil end		-- reached end of textboxes eg "txt6"
		for i = txtNum, 5 do									-- eg 4 to 5
			if self.textboxes["txt"..i]:isEnabled() then		-- next one is enabled
				return self.textboxes["txt"..i]
			end
		end
		-- no more are enabled
		return nil
	end
	U.keyboardInput = ""
	self.lblInfo:setText("Type into text box. Enter to move out")
--self:resetTextboxFocus()
	if self.changeFocus then	-- set in update from click on textbox or keyboard equivalent
Log:saveToLog("S:onTxtEnter("..textbox.name..")")
		local nextTxt = lib.getNextEnabled(self, textbox)
		if nextTxt == nil then
			self:resetTextboxFocus()
		else
			self.changeFocus = false
			self:onTxtClick(nextTxt)
		end	
	end
end

function S:onBtnClick(button)
	if button.name == "btnBack" then
		self.sceneMgr:switch("MainMenu")
	elseif button.name == "btnNext" then
		-- check all information has been collected
		-- go to inventory scene
--Log:saveToLog("TaskOptions:onBtnClick, U.currentTask = "..U.currentTask..", R.inventoryKey = '"..R.inventoryKey.."'")
		if F[U.currentTask].inventory ~= nil then	-- items required		
			Log:saveToLog("TaskOptions:onBtnClick, F[U.currentTask].inventory = "..textutils.serialise(F[U.currentTask].inventory, {compact = true}))
			if F[U.currentTask].inventory.default ~= nil then
				-- could have inventory choice or none
				if F[U.currentTask].inventory[R.inventoryKey] ~= nil then
					self.sceneMgr:getSceneByName("GetItems"):setup()
					self.sceneMgr:switch("GetItems")
				else
					--U.currentTask = "test"	-- debugging only. comment out when completed
					U.executeTask = true
				end
			else
--Log:saveToLog("TaskOptions:onBtnClick calling self.sceneMgr:getSceneByName('GetItems'):setup()")
				self.sceneMgr:getSceneByName("GetItems"):setup()
--Log:saveToLog("TaskOptions:onBtnClick calling self.sceneMgr:switch('GetItems')")
				self.sceneMgr:switch("GetItems")
			end
		else
			--U.currentTask = "test"	-- debugging only. comment out when completed
--Log:saveToLog("TaskOptions:onBtnClick U.executeTask = true")
			U.executeTask = true
		end
	end
end

function S:update(data)
	self.super.update(self, data)
	self.changeFocus = true
--Log:saveToLog("TaskOptions:update data = "..textutils.serialise(data, {compact = true}))
	local lib = {}
	
	function lib.checkInput(char)
		char = tostring(char):lower()
		local allowed = {"0","1","2","3","4","5","6","7","8","9","c"}
		for _, v in ipairs(allowed) do
			if char == v then
				return v
			end
		end
		return ""
	end
	
	if data == nil then return end

	if data[1] == "char" and not self.textboxActive then
		local char = lib.checkInput(data[2])
		--local char = data[2]
--Log:saveToLog("TaskOptions:update data = 'char', data[2] = "..char)
		-- if char == "n" then
			-- U.keyboardInput = ""
			-- self:onBtnClick(self.btnNext)
			-- return
		-- end
		-- b or n are actioned in btnBack or btnNext
		if char == "c" then
			U.keyboardInput = ""
			self.lblInfo:setText("number+Enter set checkbox / textbox")
			return
		end
		if #U.keyboardInput >= 2 then return end		-- limit input to 2 characters
		U.keyboardInput = U.keyboardInput..char
		if #U.keyboardInput == 1 then
			self.lblInfo:setText("Input:'"..U.keyboardInput.."' 0, 1, b(ack) or Enter")
		else
			self.lblInfo:setText("Input:'"..U.keyboardInput.."' b(ack) or Enter")
		end
	elseif data[1] == "key" then			
--Log:saveToLog("TaskOptions:update data = "..data[1]..", data[2] = "..data[2])
		if data[2] == 257 then	-- Enter
			if U.keyboardInput == "" then return end
			local message = U.keyboardInput
			local action = ""
			local ctrlIndex = tonumber(message)			-- eg "1" = 1

			-- user has chosen control 1 checkbox or textbox
--Log:saveToLog("TaskOptions:update U.keyboardInput = "..U.keyboardInput.." ctrlIndex = "..tostring(ctrlIndex))
			if ctrlIndex ~= nil then						-- from user eg 01 -> 1
				for key, control in pairs(self.controls) do
					local ctrlType, index = control:getControlData()
					if ctrlType == "checkbox" and ctrlIndex == index then	-- if control is checkbox invert it's state
						U.keyboardInput = ""
--Log:saveToLog("TaskOptions:update calling self:onChkChanged("..control.name..")")
						self:onChkChanged(control)
						if self.infoText == "" then
							self.lblInfo:setText("number+Enter set checkbox / textbox")
						else
							self.infoText = ""
						end
						break
					elseif ctrlType == "textbox" and ctrlIndex == index then	-- if textbox set focus
						U.keyboardInput = ""
						if control:isEnabled() then
							self:onTxtClick(control)
							self.lblInfo:setText("Enter value in textbox "..index)
						else
							self.lblInfo:setText("number+Enter set checkbox / textbox")
						end
					end
				end
			end		
		end	
	end
--Log:saveToLog("TaskOptions:update completed")
end

function S:draw()
--Log:saveToLog("TaskOptions:draw() starting")
	self.super.draw(self)
--Log:saveToLog("TaskOptions:draw() completed")
end

return S
