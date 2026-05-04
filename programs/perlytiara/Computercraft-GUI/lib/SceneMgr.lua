local version = 20260423.1600
local Class = require("lib.Class")
local Scene = require("lib.Scene")
local SM = Class:derive("SceneMgr")
--local U = require("lib.TurtleUtils") -- using _G.U loaded in tk3
-- Only 1 SceneMgr is created in a project
-- It conains all the scenes likely to be used
function SM:new(sceneDir, scenes)
	self.scenes = {}
	if not sceneDir then sceneDir = "" end
	self.sceneDir = sceneDir
	if scenes ~= nil then
		assert(type(scenes) == "table","parameter scenes must be a table")
		for i = 1, #scenes do
			local name = scenes[i]
			local M = require(sceneDir.."."..scenes[i])	-- eg local M = require("scenes.Quit")
			assert(M:is(Scene), "File: "..sceneDir.."."..scenes[i]..".lua is not of type Scene")
			self.scenes[scenes[i]] = M(self)
		end
	end
	-- string keys to scenes table
	self.prevSceneName = nil
	self.currentSceneName = nil
	-- scene object
	self.current = nil
end
-- adds a scene if an instance of a sub-class of Scene
function SM:add(scene, sceneName)
	if scene then
		assert(sceneName ~= nil, "parameter sceneName must be specified")
		assert(type(sceneName) == "string", "parameter sceneName must be a string")
		assert(type(scene) == "table","parameter scene must be a table")
		assert(scene:is(Scene), "Cannot add non-scene object to the scene manager")
		assert(self.scenes[sceneName] == nil, "Scene named "..sceneName.." already exists")
		self.scenes[sceneName] = scene
	end
end

function SM:control(sceneName)
	return self.scenes[sceneName]
end

function SM:getCurrentScene()
	return self.current
end

function SM:getSceneByName(name)
	for k,v in pairs(self.scenes) do
		if k == name then
			return v
		end
	end
	
	return nil
end

function SM:getCurrentSceneName()
	return self.currentSceneName
end

function SM:remove(sceneName)
	if sceneName then
		for k,v in pairs(self.scenes) do
			if k == sceneName then
				self.scenes[k]:destroy()
				self.scenes[k] = nil
				if sceneName == self.currentSceneName then
					self.current = nil
				end
				break
			end
		end
	end
end

function SM:switch(nextSceneName, cmd)
	U.clear(true)
	--_G.Log:saveToLog("SM:switch("..nextSceneName..")")
	if self.current then
		self.current:exit()
	end
	if nextSceneName then
		assert(self.scenes[nextSceneName] ~= nil, "Unable to find scene: "..nextSceneName)
		self.prevSceneName = self.currentSceneName
		self.currentSceneName = nextSceneName
		self.current = self.scenes[nextSceneName]
		--_G.Log:saveToLog("SM:self.current:enter()")
		self.current:enter(cmd)
		self.current:update()
		self.current:draw()
	end
end

-- return to previous scene 
function SM:pop()
	if self.prevSceneName then
		self:switch(self.prevSceneName)
		prevSceneName = nil
	end
end

function SM:getAvailableScenes()
	local sceneNames = {}
	for k,v in pairs(self.scenes) do
		sceneNames[#sceneNames + 1] = k	
	end
	
	return sceneNames
end

function SM:enter()
	
end

function SM:update(data)
	local continue = false
	if self.scenes["Dialog"] ~= nil then
		if self.scenes["Dialog"]:isVisible() then
			self.scenes["Dialog"]:update(data)
		else
			continue = true
		end
	else
		continue = true
	end

	if continue and self.current then
		--_G.Log:saveToLog("SM:update(data): Scene = "..SM.getCurrentSceneName(self))	-- output = SM:update(data): table: 613bbe5c
		self.current:update(data)	-- updates current Scene via Scene:update(data)
	end
end

function SM:draw()
	term.setBackgroundColor(colors.black)
	term.clear()
	if self.current then
		--_G.Log:saveToLog("SM:draw(): Scene = "..SM.getCurrentSceneName(self))
		self.current:draw()
	end
end

return SM
