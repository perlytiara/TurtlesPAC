local version = 20260423.1600
--[[
	this code based on youtube dot com/watch?v=Jte9o4S6rlo&list=PLZVNxI_lsRW2kXnJh2BMb6D82HCAoSTUB
	Thanks to pixelbytestudios dot com/ for a brilliant tutorial seies on Lua and Love2d
	Adapted for use in ccTweaked / computercraft by Inksaver youtube dot com/@Inksaver
]]
local Class = require("lib.Class")
local V = Class:derive("Vector2")
local pow = math.pow
local sqrt = math.sqrt

function V:new(x,y)
	self.x = x or 0
	self.y = y or 0
end

function V:magnitude() --returns a number
	return sqrt(pow(self.x, 2) + pow(self.y, 2))
end

function V:mul(val) -- operate on self
	self.x = self.x * val
	self.y = self.y * val
end

function V.multiply(v1, multiplier)
	return V(v1.x * multiplier, v1.y * multiplier) -- return new Vector2
end

function V:add(val) -- operate on self
	self.x = self.x + val
	self.y = self.y + val
end

function V.addition(v1, v2)
	return V(v1.x + v2.x, v1.y + v2.y)
end

function V:copy()
	return V(self.x, self.y)
end

function V.divide(v1, divisor)
	assert(divisor ~= 0, "Error 'divisor' must not be 0")
	return V(v1.x / divisor, v1.y / divisor) -- return new Vector2
end

function V:div(val) -- operate on self
	assert(val ~= 0,"Error 'val' must not be 0")
	self.x = self.x / val
	self.y = self.y / val
end

function V:normalise()
	--change magnitude to 1
	local mag = self:magnitude()
	self.x = self.x / mag
	self.y = self.y / mag
end

function V:sub(val) -- operate on self
	self.x = self.x - val
	self.y = self.y - val
end

function V.subtract(v1, v2) -- return new vector
	return V(v1.x - v2.x, v1.y - v2.y)
end

--[[
function V:unit()
	--return a new Vector2 with magnitude of 1
	local mag = self:mag()
	return V(self.x / mag, self.y / mag)
end]]

function V:set(newVector2) -- supply with Vector2 table
	self.x = newVector2.x
	self.y = newVector2.y
end


return V
