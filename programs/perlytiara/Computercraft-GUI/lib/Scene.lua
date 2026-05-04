local version = 20260423.1600
local Class = require("lib.Class")
local EntityMgr = require("lib.EntityMgr")
local Scene = Class:derive("Scene")

--called when scene loaded
function Scene:new(sceneMgr)
	self.sceneMgr = sceneMgr
	self.em = EntityMgr() -- entities = {} 
end

function Scene:enter()
	self.em:onEnter()
end

function Scene:exit()
	self.em:onExit()
end

function Scene:update(data)
--Log:saveToLog("Scene:update("..tostring(data)..")")	--  output = Scene:update(table: 613bbe5c)
	self.em:update(data)									-- updates EntityMgr
end

function Scene:draw()
--Log:saveToLog("Scene:draw()")
	self.em:draw()
end

function Scene:destroy()
	
end

return Scene
