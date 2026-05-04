local version = 20250914.1600
-- pastebin(1): zGcD6Wzs scenes.Quit.lua
-- pastebin(2): 
local Scene = require("lib.Scene")
local Label = require("lib.ui.Label")
--local U = require("lib.Utils") -- using _G.U loaded in tk
-- turtle terminal size fixed at 39 x 13
local S = Scene:derive("quit")

function S:new(sceneMgr)
	S.super.new(self, sceneMgr)
	self.name = "Quit"
	self.lblQuit = Label("lblQuit", 1, 1,39, 1, "Storage System Shutdown", colors.red, colors.white, "centre", "centre")
	self.lblTimer = Label("lblTimer", 2, 3, 39 - 2, 13 - 3, "Closing...", colors.black, colors.white, "centre", "centre")
	self.em:add(self.lblQuit, "lblQuit")
	self.em:add(self.lblTimer, "lblTimer")
	self.colourSequence  = {colors.white, colors.lightGray, colors.gray, colors .black}
	self.currentBackColour = 1
	self.textColour = colors.black
end

function S:setText(text)
	self.lblQuit:setText(text)
end

function S:update(data)
	self.super.update(self, data)
	self.currentBackColour = self.currentBackColour + 1
	if self.currentBackColour > #self.colourSequence then
		self.currentBackColour = 1
	end
	local entity = self.em:getEntity("lblTimer")
	entity:setColours(self.textColour, self.colourSequence[self.currentBackColour])
end

function S:draw()
	self.super.draw(self)
end

return S