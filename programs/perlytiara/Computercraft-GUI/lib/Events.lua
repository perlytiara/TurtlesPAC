local version = 20260423.1600
local Class = require("lib.Class")
local Events = Class:derive("Events")

local function indexOf(eventTable, callback)
	-- check if this callback funtion is already defined
	if eventTable == nil or callback == nil then return -1 end
	for i = 1, #eventTable do
		if eventTable[i] == callback then return i end
	end
	return -1
end

function Events:clear(eventType)
	-- Clears handlers for given event type
	if eventType == nil then --clear all eventTypes
		for k,v in pairs(self.handlers) do
			self.handlers[k] = {}
		end
	elseif self.handlers[eventType] ~= nil then --clear specific event type
		self.handlers[eventType] = {}
	end
end

function Events:new(eventMustExist)
	self.handlers = {}
	self.eventMustExist = (eventMustExist == nil) or eventMustExist
--Log:saveToLog("Events:new("..tostring(eventMustExist)..")")						-- Events class initialised
--Log:saveToLog("Events:self.eventMustExist = "..tostring(self.eventMustExist))
end

function Events.getTraceTable(self, ...)
	--local args = {...}
	--local output = textutils.serialize(self.handlers)		-- serialise to json ready to write to file
	return textutils.serialize(...)		-- serialise to json ready to write to file
end

function Events.getTraceHandlers(self, eventType)
	local tbl = self.handlers[eventType]	-- find the handler eg "onChkClick"
	for i = 1, #tbl do
		--tbl[i](...)		-- call each handler, passing the list of parameters
	end
	return {textutils.serialize(self.handlers[eventType])}		-- serialise to json ready to write to file
end

--Add new event type
function Events:add(eventType)
	assert(self.handlers[eventType] == nil, "Event "..eventType.." already exists")
	self.handlers[eventType] = {}
end

function Events:exists(eventType)
	return self.handlers[eventType] ~= nil 
end

function Events:remove(eventType)
	self.handlers[eventType] = nil
end

--subscribe to an event
function Events:hook(eventType, callback)
	assert(type(callback) == "function", "Callback parameter must be a function")
	if self.eventMustExist then
		assert(self.handlers[eventType] ~= nil, "Event of type ".. eventType .." does not exist")
	elseif self.handlers[eventType] == nil then
		self:add(eventType)
	end
	assert(indexOf(self.handlers[eventType], callback) == -1, "Callback has already been registered")
	local tbl = self.handlers[eventType]
	tbl[#tbl + 1] = callback
end

function Events:unhook(eventType, callback)
	assert(type(callback) == "function", "Callback parameter must be a function")
	if self.handlers[eventType] == nil then return end
	local index = indexOf(self.handlers[eventType], callback)
	if index > -1 then
		table.remove(self.handlers[eventType], index)
	end
end

function Events:invoke(eventType, ...)
	--[[
	... is a packed set of parguments / parameters
	eg "onChkClick", self, self.checked
	]]
--Log:writeTraceTable("Events:invoke("..eventType..", ...) - ... = ", Events.getTraceTable(self, ...))
--Log:saveToLog("Events:invoke("..eventType..", ...): eg ... = self, self.checked")
	--if self.handlers[eventType] == nil then return end
	assert(self.handlers[eventType] ~= nil, "Event of type ".. eventType .." does not exist")
--Log:saveToLog("Events:self.handlers["..eventType.."]", textutils.serialize(self.handlers[eventType]))
--Log:writeTraceTable("Events:invoke("..eventType..", ...)", Events.getTraceHandlers(self, eventType))
	local tbl = self.handlers[eventType]	-- find the handler eg "onChkClick"
	for i = 1, #tbl do
		tbl[i](...)		-- call each handler, passing the list of parameters
	end
end

return Events
