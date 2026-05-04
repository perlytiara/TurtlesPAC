local version = 20251218.1400
local Scene 	= require("lib.Scene")
local Label 	= require("lib.ui.Label")
local Button 	= require("lib.ui.Button")
local help 		= require("lib.help")

local S 		= Scene:derive("Help")
-- computers are 51 x 19, turtles are 39 x 13
WIDTH, HEIGHT = term.getSize()-- 51 x 19 computer terminal

function S:new(sceneMgr)
	S.super.new(self, sceneMgr)
	self.name = "Help"
	self.lblTitle = Label("lblTitle", 7,  1, WIDTH - 6, 1, 	"", colors.black, colors.lightGray, "centre", "centre")
	-- Button:new(name, x, y, w, h, text, fg, bg, alignH, alignV, index, keyBind, scene)
	self.btnBack  = Button("btnBack", 1, 1, 6, 1, "Back", colors.lime, colors.gray, "centre", "centre", 0, "b", self.name )
	self.lblDisplay = Label("lblDisplay", 1,  2, WIDTH, HEIGHT - 1, "", colors.white, colors.black, "centre", "centre")
	
	self.em:add(self.lblTitle, 		"lblTitle")
	self.em:add(self.btnBack, 		"btnBack")
	self.em:add(self.lblDisplay, 	"lblDisplay")

	self.btnClick 			= function(button) 		self:onBtnClick(button) end
end

function S:setup(title, key, items)
	if items == nil then items = false end
	self.lblTitle:setText(title)
	if items then
Log:saveToLog("f["..key.."] = "..F[key].items)
		self.lblDisplay:setText(F[key].items)
	else
		-- eg help["1+4"]
		--Log:saveToLog("help[key] = "..help[key])
		self.lblDisplay:setText(help[key])
	end
end 

function S:enter()
	S.super.enter(self)
	-- same event used for all buttons.
	_G.events:hook("onBtnClick", self.btnClick)    
end

function S:exit()
	S.super.exit(self)
	_G.events:unhook("onBtnClick", self.btnClick)    
end

function S:onBtnClick(button)
	if button.name == "btnBack" then
		U.keyboardInput = ""
		self.sceneMgr:switch("MainMenu")
	end
end

function S:update(data)
	self.super.update(self, data)
end

function S:draw()
	self.super.draw(self) 
end

return S
