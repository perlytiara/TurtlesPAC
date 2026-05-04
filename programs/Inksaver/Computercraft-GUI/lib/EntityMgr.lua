local version = 20260423.1600
local Class = require("lib.Class")
--local U = require("lib.TurtleUtils") -- using _G.U loaded in tk3
local EM = Class:derive("EntityMgr")

local function layerCompare(e1, e2)
	return e1.layer < e2.layer
end

function EM:new()
	self.entities = {}
end

function EM:add(entity, name)
	assert(entity ~= nil, "nil value passed to Entity Manager:add, name = ".. tostring(name))
	assert(type(entity) == "table",  "NOT a table passed to Entity Manager:add ('"..tostring(entity).."')")
	if U.contains(self.entities, entity) then return end
	
	entity.name = name
	entity.layer = entity.layer or 1
	entity.started = entity.started or false
	entity.enabled = (entity.enabled == nil) or entity.enabled
	self.entities[#self.entities + 1] = entity
	
	table.sort(self.entities, layerCompare)
end

function EM:getEntity(name)
--Log:saveToLog("EM:getEntity("..name..")")
	for _, entity in ipairs(self.entities) do
		if entity:getName() == name then
			return entity
		end
	end
	return nil
end

function EM:onEnter()
	for i = 1, #self.entities do
		local e = self.entities[i]
		if e.onEnter then e:onEnter() end
	end
end

function EM:onExit()
	for i = #self.entities, 1, -1 do
		local e = self.entities[i]
		if e.onExit then e:onExit() end
	end
end

function EM:update(data)
--Log:saveToLog("EM:update("..tostring(data)..")")	-- output = EM:update(table: 613bbe5c)
	for i = #self.entities, 1, -1 do					-- iterates all entities
		local e = self.entities[i]
		
		if e ~= nil then
			if e.remove then
				e.remove = false
				if e.onRemove then e:onRemove() end
				table.remove(self.entities, i)
			end
			if e.enabled then
				if e.started then
					--_G.Log:saveToLog("EM:update()"..e:getName())	-- 
					e:update(data)						-- updates each entity
				else
					e.started = true
					if e.onStart then e:onStart() end
				end
			end
		end
	end
end

function EM:draw()
--Log:saveToLog("EM:draw()")
	for i = 1, #self.entities do
		--if self.entities[i].enabled and self.entities[i].draw then
		if self.entities[i].draw then
--Log:saveToLog("EM:draw() entities["..i.."], name = ".. self.entities[i].name)
			self.entities[i]:draw()
		end
	end
end

return EM
