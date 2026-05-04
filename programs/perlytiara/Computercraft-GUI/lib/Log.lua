local version = 20260423.1600
local Class = require("lib.Class")
local Log = Class:derive("Log")

--[[
	logging methods set from calling program
	Log:setLogFileName("log.txt") (example)
	Log:deleteLog() if new log required every time program is run
	Log:setUseLog(true) allows logging statements to be left in this class code, will only operate if this flag is set
	
	Usage:
	_G.Log = require("lib.Log", "log.txt").new(false) -- false disables log, fileName = "log.txt" note dot. new NOT colon :new
	_G.Log = require("lib.Log", "lib/log.txt").new(true) -- true enables log, fileName = "log.txt" note dot. new NOT colon :new
	or
	_G.Log = require ("lib.Log")
	_G.Log:setUseLog(true)
]]
function Log:new(useLog, fileName) -- uses button centre as coordinates by default
	useLog = useLog or false
	fileName = fileName or "GUIlog.txt"
	self.useLog = useLog
	self.toScreen = false
	self.logFileName = fileName
	self.logFileExists = false
	if self.useLog then
		print("Logging enabled")
		self:deleteLog()		
		sleep(1.5)
	end
end

function Log:getUseLog()
	return self.useLog
end

function Log:setUseLog(use)
	self.useLog = use
	return use
end

function Log:setToScreen(use)
	self.toScreen = use
	return use
end

function Log:getLogExists()
	local exists = false
	if fs.exists(self.logFileName) then
		exists = true
	end
	self.logFileExists = exists
	
	return exists
end

function Log:getLogFileName()
	return self.logFileName
end

function Log:setLogFileName(value)
	self.logFileName = value
	self.useLog = true
end

function Log:getCurrentFileSize()		
	if self.logFileExists then
		return fs.getSize(self.logFileName)
	else
		return 0
	end
end

function Log:deleteLog()		
	if fs.exists(self.logFileName) then
		fs.delete(self.logFileName)
	end
	self.logFileExists = false
	
	return true
end

function Log:appendLine(newText)
	local handle = ""
	
	if fs.exists(self.logFileName) then --logFile already created
		handle = fs.open(self.logFileName, "a") 
	else
		handle = fs.open(self.logFileName, "w") --create file
	end
	if handle == nil then
		print ("Unable to open file "..self.logFileName)
		print("You may need to allocate more memory")
		print("Or change settings in options")
		self.useLog = false
		print("\nEnter to continue")
		read()
	else
		self.logFileExists = true
		handle.writeLine(newText)
		handle.close()
	end
end

function Log:saveToLog(text, toScreen)
	toScreen = toScreen or false
	if text ~= "" and text ~= nil then
		if toScreen or self.toScreen then
			print(text)
		end
		if self.useLog then
			Log.appendLine(self, text)
			return true
		end
	end
	return false
end

function Log:writeTraceTable(description, tblTrace)
	description = description or ""
	self:appendLine(self, description)
	if type(tblTrace) == "table" then
		for _, line in ipairs(tblTrace) do
			Log.appendLine(self, "    "..line)
		end
	else
		self:appendLine(self, "    "..tostring(tblTrace))
	end
end

return Log
