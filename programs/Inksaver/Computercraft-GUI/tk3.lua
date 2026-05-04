local version = 20260422.1230
--[[
	**********Toolkit v3**********
	Last edited: see version YYYYMMDD.HHMM
	if NOT online:

Folder PATH listing from Windows cmd: tree /f /a |clip

|   tk3.lua
|   
+---lib
|   |   Class.lua
|   |   clsTurtle.lua
|   |   EntityMgr.lua
|   |   Events.lua
|   |   help.lua
|   |   Log.lua
|   |   menu.lua
|   |   Scene.lua
|   |   SceneMgr.lua
|   |   TurtleUtils.lua
|   |   Vector2.lua
|   |   
|   +---data
|   |       taskInventory.lua
|   |       
|   \---ui
|           Button.lua
|           Checkbox.lua
|           Label.lua
|           MultiButton.lua
|           MultiLabel.lua
|           Textbox.lua
|           
\---scenes
        Craft.lua
		GetItems.lua
        Help.lua
        MainMenu.lua
        Quit.lua
        TaskOptions.lua
        
	else
		lib/scenes folders will be created and files obtained automatically!
	end
]]

args = {...} -- eg "farm", "tree"


--[[
Computercraft started with mc version 1.7.10 and went to 1.8.9
ccTweaked started around mc 1.12.2 and currently at 1.21.1
mc 1.18 onwards has new blocks and bedrock at -64, so needs to be taken into account.
_HOST = The ComputerCraft and Minecraft version of the current computer environment.
For example, ComputerCraft 1.93.0 (Minecraft 1.15.2).
]]
local dbug = true -- debug is reserved word
local netherBedrock = 0
local deletesWater = false
local brick = "minecraft:nether_brick" -- pre 1.16+ name


local function checkFileSystem()
	local oldurl = "https://raw.githubusercontent.com/Inksaver/Minecraft-Toolkit/main/"
	local url = "https://raw.githubusercontent.com/Inksaver/Computercraft-GUI/main/"
	
	local lib = {}
	
	function lib.checkLabel()
		-- check if computer has been labelled, ask user for a name if not
		if os.getComputerLabel() == nil then
			local noname = true
			while noname do
				term.clear()
				term.setCursorPos(1, 1)
				print("Give this turtle a name (no spaces)_")
				name = read()
				if name == '' then
					print("Just pressing Enter does not work")
				elseif string.find(name, ' ') ~= nil then
					print("NO SPACES!")
				else
					noname = false
				end
				if noname then
					sleep(2)
				end
			end
			
			os.setComputerLabel(name)
			print("Computer label set to "..os.getComputerLabel())
		end
	end

	function lib.checkFiles(url, fileList, failedList)
		for i = 1, #fileList do
			if not fs.exists(fileList[i]) then
				print("Missing file "..fileList[i]..", trying Github")
				local fileURL = url..fileList[i]
				-- eg "https://raw.githubusercontent.com/Inksaver/Computercraft-GUI/main/lib/ui/Multibutton.lua"
				local response, message = http.get(fileURL)
				if response == nil then
					print("failed to install "..fileList[i].." from Github")
					table.insert(failedList, fileList[i]..": "..message)
				else
					local data = response.readAll()
					response.close()
					local h = fs.open(fileList[i], "w")
					if h == nil then
						table.insert(failedList, fileList[i]..": Could not open file for saving")
					end
					-- Save new file
					h.write(data)
					h.close()
					print(fileList[i].." installed from Github")
				end
			end
		end
		return failedList
	end
	
	lib.checkLabel()
	-- required for both turtle and advanced turtle
	if not fs.exists("lib") then
		fs.makeDir("lib")
	end
	if not fs.exists("lib/data") then
		fs.makeDir("lib/data")
	end
	if not fs.exists("lib/ui") then
		fs.makeDir("lib/ui")
	end
	if not fs.exists("scenes") then
		fs.makeDir("scenes")
	end
	
	local oldFileList =
	{	
		"b.lua", "d.lua", "data.lua", "f.lua", "flint.lua", "go.lua", "l.lua", "lavaRefuel.lua", "p.lua", "r.lua", "u.lua", "updater.lua", "x.lua"
	}
	
	local fileList = 
	{
		"lib/Class.lua", "lib/clsTurtle.lua", "lib/EntityMgr.lua", "lib/Events.lua", "lib/help.lua",  "lib/Log.lua", 
		"lib/menu.lua", "lib/Project.lua", "lib/Scene.lua", "lib/SceneMgr.lua", "lib/TurtleUtils.lua", "lib/Vector2.lua",
		"lib/data/taskInventory.lua", "lib/data/items.lua",
		"lib/ui/Button.lua", "lib/ui/Checkbox.lua", "lib/ui/ContentBar.lua", "lib/ui/Label.lua", 
		"lib/ui/ListBox.lua", "lib/ui/Multibutton.lua", "lib/ui/Multilabel.lua", "lib/ui/ScrollBar.lua", "lib/ui/Textbox.lua",
		"scenes/GetItems.lua", "scenes/Help.lua", "scenes/MainMenu.lua",
		"scenes/Quit.lua", "scenes/TaskOptions.lua",
	}
	
	local failedList = {}

	failedList = lib.checkFiles(oldurl, oldFileList, failedList)	-- add files from Minecraft-Toolkit
	failedList = lib.checkFiles(url, fileList, failedList)			-- add files from Computercraft-GUI
	
	term.clear()
	term.setCursorPos(1,1)
	if next(failedList) ~= nil then
		
		print("Try to obtain these files manually")
		for _,v in ipairs(failedList) do
			print(v)
		end
		return
	else
		print("All files present. Starting...")
	end
	sleep(1)	
end
checkFileSystem()

local Turtle = require("lib.clsTurtle")
-- Turtle class (T), menu class (menu) and other libraries made Global
--_G.F is created at end of script: require("lib.data.taskInventory")
_G.T = Turtle(false)
_G.menu = require("lib.menu")
_G.R = 
{
	auto = false,
	ceiling = false,
	choice = 0,
	currentLevel = 0,
	data = {},
	depth = 0,
	description = "",
	destinationLevel = 0,
	dimension = "",
	direction = "",
	down = false,
	earlyGame = false,
	floor = false,
	forward = false,
	goDown = false,
	goUp = false,
	height = 0,
	inAir = false,
	inNether = false,
	inventory = {},
	inventoryKey = "",
	left = false,
	legacy = false,
	length = 0,
	logType = "",
	lowerLevel = 0,
	menu = 0,
	message = "",
	misc = false,
	mysticalAgriculture = false,
	networkFarm = false,
	position = 1,
	ready = false,
	right = false,
	side = "",
	size = 0,
	silent = false,
	startLevel = 0,
	subChoice = 0,
	subMenu = 0,
	torchInterval = 0,
	treeSize = "",
	treeFarmVersion = 2,
	turtleCount = 1,
	up = false,
	upperLevel = 0,
	useBlockType = "",
	width = 0,
}
_G.U = require("lib.TurtleUtils")
_G.Log = require("lib.Log")
Log:setLogFileName("log.txt")
Log:deleteLog()
Log:setUseLog(true)

--[[
Netherite level start on 14
Chunk borders F3+G or:
math.floor(x / 16) * 16 add 16 for each border. same for z
]]

local ccMajor = _HOST:sub(15, _HOST:find("Minecraft") - 2) --eg ComputerCraft 1.93.0 (Minecraft 1.15.2)
_G.ccMinorVersion = 0
if tonumber(ccMajor) == nil then -- 1.93.0 NAN
	--ccMajor = ccMajor:sub(1, ccMajor:find(".", 3, true) - 1)
	local parts = U.split(ccMajor, ".")
	ccMajor = parts[1]
	if parts[2] ~= nil then
		ccMajor = ccMajor.."."..parts[2]
	end
	_G.ccMajorVersion = tonumber(ccMajor)
	if parts[3] ~= nil then
		_G.ccMinorVersion = tonumber(parts[3])
	end
else
	_G.ccMajorVersion = tonumber(ccMajor)
end

local mcMajorVersion = _HOST:sub(_HOST:find("Minecraft") + 10, _HOST:find("\)") - 1) -- eg 1.18 or 1.20 -> 1.18, 1.20
local mcMinorVersion = 0
if tonumber(mcMajorVersion) == nil then -- 1.18.3 NAN
	--mcMajorVersion = tonumber(_HOST:sub(_HOST:find("Minecraft") + 10, _HOST:find("\)") - 3)) -- eg 1.19.4 -> 1.19
	local parts = U.split(mcMajorVersion,".")
	mcMajorVersion = parts[1]
	if parts[2] ~= nil then
		mcMajorVersion = mcMajorVersion.."."..parts[2]
	end
	mcMajorVersion = tonumber(mcMajorVersion)
	if parts[3] ~= nil then
		mcMinorVersion = tonumber(parts[3])
	end
end

if mcMajorVersion < 1.7  and mcMajorVersion >= 1.18 then -- 1.12 to 1.??
	U.bedrock = -64
	U.ceiling = 319
end
if mcMajorVersion < 1.7  and mcMajorVersion >= 1.16 then -- 1.12 to 1.??
	brick = "minecraft:nether_bricks"
end
if mcMajorVersion < 1.7  and mcMajorVersion <= 1.12 then --- turtle in source deletes it. 1.7.10 to 1.12
	deletesWater = true
end
local utils = {}

function utils.calculateDimensions()
	if R.data == "" or R.data == "enclosed" then -- not being called from other functions
		if R.width == 0 then -- user chose auto settings
			R.length = utils.calculateDistance(R.length) -- still facing forward
			print("Calculated Length = "..R.length)
			T:turnRight(1) -- ready to check width
			R.width = utils.calculateDistance(R.width) -- now facing right
			print("Calculated width = "..R.width)
			T:go("R2F"..R.width - 1 .."L1".. "F"..R.length - 1 .."R2") -- back at start. width/length confirmed
		end
	end
	if R.height == 0 then -- use auto settings based on water detection
		R.height = 64
	end
end

function utils.calculateDistance(estDistance)
	--[[
	measure length
	movement stops when either solid block in front or solid below
	called from utils.calculateDimensions
	]]
	local moves = 1
	local nonSolidBelow = utils.clearVegetation("down")
	if estDistance == 0 then
		while nonSolidBelow and turtle.forward() do -- while able to move and air/water below
			moves = moves + 1
			nonSolidBelow = utils.clearVegetation("down")
		end
	else
		while moves < estDistance * 2 do -- loop can only run for max of double estimated distance
			if turtle.forward() then -- able to move forward
				moves = moves + 1
			else
				break
			end
			if not utils.clearVegetation("down") then -- solid below
				turtle.back()
				moves = moves - 1
				break
			end
		end
	end
	return moves
end

function utils.ceiling(blaze)
	-- T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	-- all outer walls complete, now for remaining 9x9 ceiling
	blaze = blaze or false
	for i = 1, 9 do
		for j = 1, 9 do
			if blaze then
				T:place("slab", "up", false)
				T:dig("down")
			else
				T:go("C0x2", false, 0, true)
			end
			if j < 9 then
				T:forward(1)
			else	-- end of length
				local place = false
				if i%2 == 1 then -- odd numbers 1,3,5,7,9
					if i < 9 then
						place = true
						T:go("R1F1 R1")
					end
				else
					place = true
					T:go("L1F1 L1")
				end
				if place then
					if blaze then
						T:place("slab", "up", false)
						T:dig("down")
					else
						T:go("C0x2", false, 0, true)
					end
				end
			end
		end
	end
end

function utils.checkFuelNeeded(quantity)
	local fuelNeeded = quantity - turtle.getFuelLevel() -- eg 600
	if fuelNeeded > 0 then
		if T:checkInventoryForItem({"minecraft:lava_bucket"}, {1}, false) == nil then	
			if T:checkInventoryForItem({"coal"}, {math.ceil(fuelNeeded / 60)}, false) == nil then
				T:checkInventoryForItem({"planks"}, {math.ceil(fuelNeeded / 15)})
			end
		end
		T:refuel(quantity, true)
	end
end

function utils.clearVegetation(direction)
	local isAirWaterLava = true	-- default true value air/water/lava presumed
	-- blockType, data
	local blockType = T:getBlockType(direction)
	if blockType ~= "" then --not air
		if T:isVegetation(blockType) then
			T:dig(direction)
		elseif blockType:find("water") == nil
			   and blockType:find("lava") == nil
			   and blockType:find("bubble") == nil
			   and blockType:find("ice") == nil then
			-- NOT water, ice or lava 
			isAirWaterLava = false -- solid block
		end
	end
	
	return isAirWaterLava --clears any grass or sea plants, returns true if air or water, bubble column or ice
end

function utils.craftItem()
	--local message = U.loadStorageLists()	-- initialises or creates lists of where an item can be found: GLOBAL LISTS!
	local message = U.wrapModem(true)	-- initialises or creates lists of where an item can be found: GLOBAL LISTS!
	if message ~= "" then return {message} end
	_G.Log:saveToLog("call U.emptyInventory({'sapling', 'propagule', 'dirt', 'crafting'}, {'all'}, true)")
	U.emptyInventory({"sapling", "propagule", "dirt", "crafting"}, {"all"}, true)	-- 2 lists, one for barrels, one for chests
	_G.Log:saveToLog("\ncall U.getItemFromNetwork('barrel', 'minecraft:dirt', 169)")
	local turtleSlot, turtleCount = U.getItemFromNetwork("barrel", "minecraft:dirt", 169, nil, false)
	_G.Log:saveToLog("Get from barrel completed: turtleSlot = "..turtleSlot..", turtleCount = "..turtleCount..", ignoreStock = "..tostring(ignoreStock))
	if turtleCount < 169 then
		_G.Log:saveToLog("\ncall U.getItemFromNetwork('chest', 'minecraft:dirt', ".. 169 - turtleCount..", ignoreStock = "..tostring(ignoreStock)..")")
		turtleSlot, turtleCount = U.getItemFromNetwork("chest", "minecraft:dirt", 169 - turtleCount, nil, true)
		if turtleCount < 169 then	-- ask player for saplings
			T:checkInventoryForItem({"dirt"}, {169 - turtleCount})
		end
	end
	return {""}
end

function utils.createBasement(up, down, width, length)
	-- start facing lower left
	T:sortInventory(false)
	T:dropItem("seeds", "forward")
	T:dropItem("flint", "forward")
	R.up = up
	R.down = down
	R.width = width
	R.length = length
	clearRectangle()	-- dig 10 x 10 x 2 area, return to starting position
	-- add network cable, modems and chests
end

function utils.createStorage()
	-- start in centre, above 1st level
	T:place("modem", "down")
	utils.goBack(1)
	
	T:place("chest", "down")	-- places with handle at back of turtle
	T:go("R1F1L1")
	T:place("chest", "down")	-- 2nd of pair
	for i = 1, 3 do
		T:go("F1L1")
		T:place("chest", "down")
		T:go("R1F1L1")
		T:place("chest", "down")
	end
	
	T:go("F1L1F1")	-- end at starting position
	U.attachModem()
end

function utils.createWalledSpace(D)
	--[[
	D.width  = #
	D.length = #
	D.height = #
	D.ceiling = false
	D.floor = false
	D.vDirection = "U" or "D"
	D.hDirection = "LR" or "RL"
	D.goHome = true
	T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	]]
	local turn  = "R1"
	local oTurn = "L1"
	if D.hDirection == "RL" then
		turn    = "L1"
		oTurn   = "R1"
	end
	local placeF = "C1"

	local lib = {}
	
	function lib.getPlace(D, start, finish)
		if start then						-- start of build
			if D.vDirection == "U" then 	-- bottom and going up
				if D.floor then
					return "C2"
				end
			else							-- D.vDirection == "D"
				if D.ceiling then
					return "C0"
				end
			end
		elseif finish then					-- end of build
			if D.vDirection == "U" then 	-- bottom and going up
				if D.ceiling then
					return "C0"
				end
			else
				if D.floor then
					return "C2"
				end
			end
		end

		return ""							-- start and finish both false
	end
	
	function lib.layer(D, start, finish)
		local outward = true
		local place = lib.getPlace(D, start, finish)
		for width = 1, D.width do
			for length = 1, D.length do
				if start or finish then
					T:go(place, false, 0, true)-- place floor / ceiling
				end
				if width == 1 then
					T:go(oTurn..placeF..turn, false, 0, true)		-- face wall and check if block
				elseif width == D.width then						-- checking opposite wall
					if outward then									-- travelling away from start
						T:go(turn..placeF..oTurn, false, 0, true)	-- face wall and check if block
					else											-- travelling towards start
						T:go(oTurn..placeF..turn, false, 0, true)	-- face wall and check if block 
					end					
				end
				-- move forward
				if length < D.length then
					T:forward(1)
				end
			end
			if width < D.width then
				-- change direction
				if outward then
					T:go(placeF..turn.."F1"..oTurn..place..placeF..turn..turn, false, 0, true)
				else
					T:go(placeF..oTurn.."F1"..turn..place..placeF..oTurn..oTurn, false, 0, true)
				end
				outward = not outward
			else
				if outward then
					T:go(placeF..oTurn.."F"..D.width -1 ..oTurn.."F"..D.length - 1 .."C1R2", false, 0, true)
				else
					T:go(placeF..turn.."F"..D.width -1 ..oTurn..placeF..turn..turn, false, 0, true)
				end
			end
		end
	end
	
	T:go("R2C1R2", false, 0, true)						-- place block behind
	for height = 1, D.height do
		if height == 1 then
			lib.layer(D, true, false)					-- first layer, so start = true, finish = false
		elseif height == D.height then		
			lib.layer(D, false, true)					-- final layer, so start = false, finish = true
		else
			lib.layer(D, false, false)					-- mid build layer, so start = false, finish = false
		end
		if height < D.height then						-- go up or down unless finished build
			T:go(D.vDirection.."1")
		end
	end
	if D.goHome then-- ends at starting point
		if D.vDirection == "U" then
			T:down(D.height - 1)
		else
			T:up(D.height - 1)
		end
	end
end

function utils.createWaterSource(level)
	if level == nil then
		level = 0
	end
	if level > 0 then
		T:up(level)
	elseif level < 0 then
		T:down(math.abs(level))
	end
	-- assume on flat surface, but allow for blocks above
	T:go("x0C2F1 x0C2F1 x0C2F1 x0C2R1 F1 x0C2F1 x0C2F1 x0C2R1 F1 x0C2F1 x0C2F1 x0C2R1 F1 x0C2F1 x0C2", false, 0, false)
	T:go("R1F1D1", false, 0, false) --move to corner and drop down
	T:go("C2F1R1 C2F1R1 C2F1R1 C2F1R1", false, 0, false)
	T:go("U1")
	for i = 1, 2 do
		T:placeWater("down")
		T:go("F1R1F1R1", false, 0, false)
	end
	-- refill water buckets
	for i = 1, 2 do
		sleep(0.5)
		T:placeWater("down")
	end
	T:go("R2F1R1F1R1")
	-- end above lower left of pond (starting point)
	return {}
end

function utils.description(text)
	menu.clear()
	print(text)
end

function utils.dropSand()
	local count = 0
	while not turtle.detectDown() do -- over water. will be infinite loop if out of sand
		if not T:place("sand", "down", false) then
			print("Out of sand. Add more to continue...")
			sleep(2)
		end
		count = count + 1
	end
	return true, count --will only get to this point if turtle.detectDown() = true
end

function utils.pause()
	--[[
	allows 2 turtles to co-operate
	When they face each other and move together
	R.side = "R" or "L"
	]]
	local rsIn = rs.getAnalogueInput("front")
	local rsOut = 1
	local present = false
	local confirmed = false
	local timer = 0
	local endTimer = 0
	local finished = false
	T:go(R.side.."1")
	rs.setAnalogueOutput("front", 0) -- switch off output
	local blockType = T:getBlockType("forward")
	while blockType:find("turtle") == nil do
		menu.colourWrite("Waiting for other turtle "..endTimer, colors.orange, nil, nil, false, true)
		blockType = T:getBlockType("forward")
		sleep(0.1)
		timer = timer + 0.1
		if timer >= 1 then
			timer = 0
			endTimer = endTimer + 1
		end
	end
	timer = 0
	endTimer = 0
	
	while not finished do
		if endTimer == 0 then
			if present then
				if confirmed then
					menu.colourWrite("Turtle confirmed: input = "..rsIn.." output = "..rsOut, colors.orange, nil, nil, false, true)
				else
					menu.colourWrite("Other turtle ok: input = "..rsIn.." output = "..rsOut, colors.orange, nil, nil, false, true)
				end
			else
				menu.colourWrite("Waiting: input = "..rsIn.." output = "..rsOut, colors.orange, nil, nil, false, true)
			end
		end
		sleep(0.1)
		timer = timer + 1
		if endTimer > 0 then
			endTimer = endTimer + 1
		end
		if endTimer >= 10 then -- allows time for other computer to get ready
			finished = true
		end
		rs.setAnalogueOutput("front", 1) -- output 1 as a signal initially
		if present then
			rs.setAnalogueOutput("front", rsOut) -- output 1 as a signal initially
		end
		rsIn = rs.getAnalogueInput("front")
		if rsIn == 1 then
			present = true
			if not confirmed then
				rsOut = 7
			end
		elseif rsIn == 7 then
			present = true
			confirmed = true
			rsOut = 15
		elseif rsIn == 15 or confirmed then
			menu.colourWrite("endTimer active = "..endTimer, colors.orange, nil, nil, false, true)
			endTimer = endTimer + 1 -- start endTimer
		end
	end
	T:go(R.side.."3")
	
	return rsIn -- 15
end

function utils.startWaterFunction(inWater, onWater, maxDescent, goIn)
	--[[
		Use with utils.getWaterStatus
		could be inWater and not onWater if on single layer of water with floor below
	]]
	maxDescent = maxDescent or 1 -- prevents continuous down due to lack of water
	if goIn == nil then	-- turtle should submerge
		goIn = true
	end
	local descent = 0 -- counter for going down
	if inWater then -- job done
		return inWater, onWater
	end
	if onWater and goIn then --inWater already returned so must be false
		if turtle.down() then
			if T:getBlockType("forward"):find("water") ~= nil or T:getBlockType("forward"):find("bubble") ~= nil then
				inWater = true
				return inWater, onWater
			end
		end
	end
	if not onWater then
		T:forward(1)
	end
	-- should now be above water, but may be further down so onWater still false
	while T:getBlockType("down"):find("water") == nil and T:getBlockType("down"):find("bubble") == nil do-- go down until water below
		if turtle.down() then
			descent = descent + 1
			if descent >= maxDescent then -- limit descent in case no water present
				onWater = false
				return inWater, onWater -- false,false
			end
		else
			onWater = false
			return inWater, onWater -- false,false
		end
	end
	-- now above water
	if goIn then
		turtle.down() -- now inside water block
		inWater = true
	end
	return inWater, onWater
end

function utils.fillBucket(direction, count)
	count = count or 1
	local buckets = 0
	local success = false
	for i = 1, count do
		if T:getWater(direction)  then
			sleep(0.3)
			success = true
			buckets = buckets + 1
		end
	end
	return success, buckets
end

function utils.getEmptyBucketCount()
	-- slotData.lastSlot, total, slotData -- integer, integer, table
	local lastSlot, total, slotData = T:getItemSlot("minecraft:bucket")
	return total
end

function utils.followGround(length)
    for i = 1, length - 1 do
        while not turtle.inspectDown() do -- must be air below
            turtle.down()
        end
		local blockType = T:getBlockType("forward")
		if T:isVegetation(blockType) then
			turtle.dig()
		else
			while turtle.detect() do
				--turtle.digUp() -- in case any blocks above
				if not turtle.up() then
					break
				end
			end
		end
		if i < length then
			turtle.forward()
		end
    end
end

function utils.getItemsForInventory(data)
	for _, v in ipairs(data) do -- eg {{"minecraft:bucket"}, {1}, false}
		-- T:checkInventoryForItem(items, quantities, required, message)
		T:checkInventoryForItem(v[1], v[2], v[3], v[4])
	end
end 

function utils.getRoofStats()
	local isWidthOdd = R.width % 2 == 1 			-- is the width odd or even?
	local isLengthOdd = R.length % 2 == 1 			-- is the length odd or even?
	if isWidthOdd then
		R.height = math.floor(R.width / 2)			-- eg 7 x 5 roof, layers = 5 / 2 = 2
	else
		R.height = R.width / 2						-- eg 17 x 8 roof, layers = 8 / 2 = 4
	end
	
	local width = 2									-- assume even width with  2 block roof ridge
	local length = R.length - R.height - 1			-- assume even width with  2 block roof ridge
	if isWidthOdd then
		width = 3									-- adjust to allow for single width roof ridge
	end
	if isLengthOdd then
		length = R.length - R.height				-- adjust as 1 layer less
	end
	
	return isWidthOdd, isLengthOdd, width, length
end

function utils.getWater()
	if deletesWater then
		T:getWater("down") -- take water from source
		sleep(0.2)
		T:getWater("down") -- take water from source
	else
		if not turtle.detectDown() then
			T:go("C2", false, 0, false)
		end
		T:getWater("forward") -- take water from source
		sleep(0.2)
		T:getWater("forward") -- take water from source
	end
end

function utils.getWaterBucketCount()
	-- lastSlot, total, slotData  = T:getItemSlot(item)
	local lastSlot, total, slotData = T:getItemSlot("minecraft:water_bucket")
	return total
end

function utils.getWaterStatus()
	--[[ Usage:
	local inWater, onWater = utils.getWaterStatus() -- returns turtle position near water
	utils.startWaterFunction(onWater, inWater, 2, true) -- move INTO water max 2 blocks down
	utils.startWaterFunction(onWater, inWater, 5, false) -- move ABOVE water max 5 blocks down
	]]
	local onWater = false
	local inWater = false
	for i = 1, 4 do
		if T:getBlockType("forward"):find("water") ~= nil  or T:getBlockType("forward"):find("bubble") ~= nil then
			inWater = true
		end
		T:turnRight(1)
	end
	if T:getBlockType("down"):find("water") ~= nil or T:getBlockType("down"):find("bubble") ~= nil then
		onWater = true
	end
	return inWater, onWater
end

function utils.goBack(blocks)
	blocks = blocks or 1
	local success = true
	for i = 1, blocks do
		if not turtle.back() then
			success = false
			T:go("R2F1R2")
		end
	end
	
	return success
end

function utils.getPrettyPrint(promptColour, menuPromptColour)
	promptColour = promptColour or colors.yellow
	menuPromptColour = menuPromptColour or colors.white
	
	local pp = {}
	pp.prompt = promptColour
	pp.itemColours = {}
	pp.menuPrompt = menuPromptColour
	pp.allowModifier = true -- can the menu return 'q' or 'h' / 'i'
	
	return pp
end

function utils.isStorage(direction)
	local blockType = T:getBlockType(direction)
	if blockType:find("barrel") ~= nil then
		return true, "barrel"
	elseif blockType:find("chest") ~= nil then
		return true, "chest"
	elseif blockType:find("modem") ~= nil then
		return true, "modem"
	end
	
	return false, blockType
end

function utils.move(blocks, reverse)
	if blocks == 0 then return 0 end
	if reverse == nil then
		reverse = false
	end
	--Log:saveToLog("utils.move R.goDown = "..tostring(R.goDown)..", reverse = "..tostring(reverse)..", R.goUp = "..tostring(R.goUp))
	if reverse then
		if R.goDown then -- reverse direction
			T:up(blocks)
		else
			T:down(blocks)
		end
		return blocks * -1
	else
		if R.goUp  then
			T:up(blocks)
		else
			T:down(blocks)
		end
		return blocks
	end
end

function utils.placeFloor(width, length, blockType)
	-- T:place(blockType, direction, leaveExisting, signText)
	for i = 1, width do				
		for j = 1, length do
			T:place(blockType, "down", false)
			if j < length then
				T:forward(1)
			else
				if i%2 == 1 then -- odd numbers 1,3,5,7,9
					if i < width then
						T:go("R1F1R1", false, 0, true)
					end
				else
					T:go("L1F1L1", false, 0, true)
				end
			end
		end
	end
end

function utils.printR()
	--[[
		choice = 0,
		subChoice = 0,
		size = 0,
		width = 0,
		length = 0,
		height = 0,
		depth = 0,
		up = false,
		down = false,
		silent = false,
		data = {},
		torchInterval = 0,
		useBlockType = "",
		auto = false,
		side = "",
		direction = "",
		ready = false,
		networkFarm = false,
		mysticalAgriculture = false,
		logType = "",
		treeSize = "",
		message = ""
	]]
	T:clear()
	print("choice= ".. tostring(R.choice)..", subChoice= ".. tostring(R.subChoice))
	print("size= ".. tostring(R.size)..", width= ".. tostring(R.width))
	print("length= ".. tostring(R.length)..", height= ".. tostring(R.height)..", depth= ".. tostring(R.depth))
	print("silent= "..tostring(R.silent)..", up= ".. tostring(R.up)..", down= "..tostring(R.down))
	print("torchInterval= ".. tostring(R.torchInterval))
	print("useBlockType= "..tostring(R.useBlockType))
	print("auto= ".. tostring(R.auto)..", side= "..tostring(R.side)..", direction= "..tostring(R.direction))
	print("ready= ".. tostring(R.ready)..", networkFarm= "..tostring(R.networkFarm)..", mysticalAgriculture= "..tostring(R.mysticalAgriculture))
	print("logType= ".. tostring(R.logType)..", treeSize= "..tostring(R.treeSize)..", message= "..tostring(R.message))
	if type(R.data) == "table" then
		io.write("data= ")
		for k,v in pairs(R.data) do
			print(k ..": "..tostring(v))
		end
	else
		print("data= ".. tostring(R.data))
	end
	io.write("Enter to continue")
	read()
end

function utils.logRvalues()
	Log:saveToLog("R values set = "..textutils.serialise(U.compareR(), {compact = true}))
end

function utils.setStorageOptions()
	-- check inventory for storage type(s) onboard
	local storage = ""
	local storageBackup = ""
	if T:getItemSlot("barrel") > 0 then
		storage = "barrel"
		storageBackup = "barrel"
	end
	if T:getItemSlot("chest") > 0 then
		if storage == "" then
			storage = "chest"
		end
		storageBackup = "chest"
	end
	return storage, storageBackup	-- eg "barrel", "chest"
end

function utils.towpathOnly()
	--[[single turtle on towpath only using 4 turtles. Starts at ground level]]
	T:turnRight(2)										-- face towards completed towpath
	for i = 1, R.length do
		local placeOnly = true							-- no torch placement
		if R.torchInterval > 0 then						-- place torches
			if i == 1 then
				T:go("U1C2 U1x0") 								-- place block on ground level, up 1 and excavate ceiling		
				T:place("torch", "down")						-- place torch	
				utils.goBack(1)
				T:go("x0D2")					
			elseif i % R.torchInterval == 0 then		-- torch interval, already facing towards completed path
				T:go("U1C2 U1x0") 						-- place block on ground level, up 1 and excavate ceiling
				T:place("torch", "down")				-- place torch
				--utils.goBack(1)
				T:go("B1x0 D2")							-- move back, delete block above, down 2
				placeOnly = false						-- no futher action as already moved forward
			end
		end
		
		if placeOnly then								-- NO torch placed so continue
			if turtle.detectUp() then
				T:go("U2x0D2")							-- up 2 and excavate ceiling, down  to ground
			end
			utils.goBack(1)
			if not T:place("slab", "forward") then	-- place slab
				T:checkInventoryForItem({"slab"}, {R.length - i})
			end				
		end
	end
end

function utils.waitForInput(message)
	-- Pause script and asks user to continue
	if message ~= nil then
		menu.colourPrint(message, colors.yellow)
		Log:saveToLog("utils.waitForInput("..message..")", false)
	end
	menu.colourPrint("Enter to continue...", colors.lightBlue)
	read()
end

function utils.writeTraceTable(description, tbl)
	local text = ""
	for key, value in pairs(tbl) do
		if type(value) == "table" then
			for k,v in pairs(value) do
				text = text.."k = "..k..", v = "..v.."; "
			end
		else
			text = "key = "..key..", value = "..value
		end
	end
	_G.Log:saveToLog(description.."\n".. text)
end

local pp = utils.getPrettyPrint()

function assessFarm()
	-- sets R.networkFarm and R.mysticalAgriculture
	menu.clear()
	menu.colourPrint("Assessing farm properties...", colors.yellow)
	--local storage = true
	for turns = 1, 4 do
		T:turnRight(1)
		local itemAhead = T:getBlockType("forward")
		if itemAhead:find("modem") ~= nil then
			if not R.networkFarm then	-- prevents repeated text display
				R.networkFarm = true
				menu.colourPrint("Network storage in use.", colors.magenta)
			end
		end
		if itemAhead:find("mysticalagriculture") ~= nil then
			R.mysticalAgriculture = true
			menu.colourPrint("Mystical Agriculture deployed.", colors.lime)
		end
	end
	sleep(1.5)
	
	--return
end

function assessTreeFarm()
	-- R.networkFarm = true
	-- R.subChoice = 1: birch, oak (single dirt)
	-- R.subChoice = 2: jungle, spruce, dark oak, pale oak (4 dirt)
	-- R.subChoice = 3: mangrove (full dirt cover)
	-- R.treeSize  = "single" or "double"
	local lib = {}
	R.message = ""
	function lib.checkPosition()
		-- should be on modem
		T:go("R1F1")
		-- if in correct start, log below
		blockType = T:getBlockType("down")
Log:saveToLog("T:go(R1F1): blockType = "..blockType)
		if blockType:find("log") ~= nil then
			lib.getSaplingType(blockType)
			T:go("B1L1")
			return true
		end
		T:go("B1L1")
		return false
	end
		
	function lib.getSaplingType(blockType)
		R.subChoice = 1
		R.treeSize = "single"
		if blockType == "minecraft:mangrove_log" then
			R.logType = blockType
			R.useBlockType ="minecraft:mangrove_propagule"
			R.subChoice = 3
		else
			local parts = T:getNames(blockType)	-- eg {"minecraft", "dark", "oak", "log"}
			local name = ""
			for i = 1, #parts - 1, 1 do				-- eg {"minecraft", "dark", "oak"
				if i == 1 then
					name = parts[1]..":"			-- eg "minecraft:"
				elseif i == 2 then
					name = name..parts[2]			-- eg "minecraft:dark"
				else
					name = name.."_"..parts[i]		-- eg "minecraft:dark_oak"
				end
			end
			name = name.."_sapling"					-- eg "minecraft:dark_oak_sapling"
			R.logType = blockType					-- eg "minecraft:dark_oak_log"
			R.useBlockType = name					-- eg "minecraft:oak_sapling"
			if name:find("spruce") ~= nil or name:find("jungle") ~= nil or name:find("dark_oak") ~= nil or name:find("pale_oak") ~= nil then
				R.subChoice = 2
				R.treeSize = "double"
			end
		end
	end
	
	Log:saveToLog("assessTreeFarm() started")
	local blockType = T:getBlockType("down")
	if blockType:find("modem") == nil then
		R.message = "Not on modem. Check position"
		Log:saveToLog("Not on modem. Check position")
		return
	end
	-- must be network farm so check position
	if not lib.checkPosition() then
		R.message = "Unable to find log for sapling type. Check position"
		Log:saveToLog("Unable to find log for sapling type. Check position")
	end
	
	return	-- no values returned as R values are set above
end

function attack(direction)
	local totalHitsF = 0
	local totalHitsU = 0
	local totalHitsD = 0
	local cycles = 0
	local lib = {}
	
	function lib.attack(direction)
		local hitF = false
		local hitU = false
		local hitD = false
		if R.up or direction == "up" or direction == nil then
			if turtle.attackUp() then
				hitU = true
				totalHitsU = totalHitsU + 1
			end
		end
		if R.down or direction == "down" or direction == nil then
			if turtle.attackDown() then
				hitD = true
				totalHitsD = totalHitsD + 1
			end
		end
		if R.forward or direction == "forward" or direction == nil then
			if turtle.attack() then
				hitF = true
				totalHitsF = totalHitsF + 1
			end
		end
		-- colourText(row, text, reset)
		if hitF or hitU or hitD then
			menu.colourText(1, "~green~cycle "..cycles.."     ")
			menu.colourText(2, "~red~hits forward:  "..totalHitsF.."          ")
			menu.colourText(3, "~orange~hits up:   "..totalHitsU.."          ")
			menu.colourText(4, "~yellow~hits down: "..totalHitsD.."          ")
		else
			menu.colourText(1, "~green~cycle "..cycles.."               ")
			menu.colourText(2, "~yellow~No hits this time                      ")
			menu.colourText(3, "                            ")
			menu.colourText(4, "                            ")
		end
	end
	
	menu.clear(true)
	if R.auto then
		while true do
			cycles = cycles + 1
			lib.attack(direction)
		end
	else
		for i = 1, R.length do
			cycles = i
			lib.attack(direction)
			sleep(1)
		end
	end
	
	return {"Attack for "..R.length.." seconds completed", "hits forward: "..totalHitsF..", up: "..totalHitsU..", down: "..totalHitsD}
end

function buildGableRoof()
	--[[
	stairs placement:
	   _|   up
	  
	   T L  forward
	   _
	    |   down

	]]
	local lib = {}
	
	function lib.placeRoof(outward)
		for i = 1, R.length + 2 do
			if R.useBlockType:find("stairs") ~= nil then
				T:place("stairs", "up")
			else
				T:go("C0", false, 0, false, R.useBlockType)
			end
			if i < R.length + 2 then
				if outward then
					T:go("L1F1R1")
				else
					T:go("R1F1L1")
				end
			end
		end
	end
	
	function lib.placeGable(outward)
		local width = R.width
		for h = 1, R.height do
			for w = 1, width do
				T:go("C1")
				if w < width then
					if outward then
						T:go("L1F1R1")
					else
						T:go("R1F1L1")
					end
				end
			end
			if h < R.height then
				if outward then
					T:go("R1F1L1U1")
				else
					T:go("L1F1R1U1")
				end
			end
			width = width - 2
			outward = not outward
		end
		return outward
	end
	
	local outward = true
	-- go to centre of end wall if odd no, or half width if even
	R.height = math.floor(R.width / 2)
	local isOdd = R.width % 2 == 1 
	R.useBlockType = T:getMostItem()
	T:go("B1R1F"..R.height - 1 .."U"..R.height - 1)	-- top of roof, under top layer
	for h = 1, R.height + 1 do						-- place tiles on left side of roof
		lib.placeRoof(outward)
		if h < R.height + 1 then
			T:go("B1D1")
			outward = not outward
		end
	end
	if isOdd then
		T:go("F"..R.height + 2 .."R2U"..R.height)
	else
		T:go("F"..R.height + 1 .."R2U"..R.height)
	end
	for h = 1, R.height + 1 do						-- place tiles on right side of roof
		lib.placeRoof(outward)
		if h < R.height + 1 then
			T:go("B1D1")
			outward = not outward
		end
	end
	-- gable ends
	if outward then
		T:go("F1R1U1")
	else
		T:go("F1L1U1")
	end
	outward = lib.placeGable(outward)
	T:go("F2R2 C1R2F"..R.length - 1 .."D"..R.height - 1)
	if outward then
		T:go("R1F"..R.height - 1 .."R1")
	else
		T:go("L1F"..R.height - 1 .."L1")
	end
	outward = not outward
	outward = lib.placeGable(outward)
	if isOdd then
		if outward then
			T:go("L1F1 R1U2 F1")
		else
			T:go("R1F1 L1U2 F1")
		end
		for i = 1, R.length do
			T:go("C2F1", false, 0, false)
		end
		for i = 1, R.length + 2 do
			utils.goBack(1)
			T:place("slab", "forward")
		end
	end
	while turtle.down() do end
	
	return {}
end

function buildPitchedRoof()
	--[[
	stairs placement:
	   _|   up
	  
	   T L  forward
	   _
	    |   down

	]]
	local lib = {}
		
	function lib.placeRoofSection(length)
		-- starts facing centre of building
		for i = 1, length do
			if i < length then
				if R.useBlockType:find("stairs") ~= nil then
					T:place("stairs", "up")
				else
					T:go("C0", false, 0, false, R.useBlockType)
				end
				T:go("L1F1R1")
			end
		end
		-- ends facing centre of building
	end
	
	function lib.placeRoof(width, length)
		lib.placeRoofSection(length)
		T:go("R1")
		lib.placeRoofSection(width)
		T:go("R1")
		lib.placeRoofSection(length)
		T:go("R1")
		lib.placeRoofSection(width)
	end
	
	function lib.placeSlabs(length)
		-- add slabs at top
		T:go("U2F1L1")
		if length > 1 then
			T:forward(length - 3)
			for i = 1, length - 3 do
				T:place("slab", "forward")
				utils.goBack(1)
			end
			T:place("slab", "forward")
		else
			T:place("slab", "forward")
		end
		T:go("D2R1")
		utils.goBack(1)
	end
	--[[
	Turtle MUST be placed on left corner of shortest dimension
	
	****   or T******
	****      *******
	****      *******
	****
	T***
	shortest dimension is R.width
	if width is odd, ignore top layer as is only 1 block wide
	]]
	local isWidthOdd, isLengthOdd, width, length = false, false, 0, 0
	isWidthOdd, isLengthOdd, width, length = utils.getRoofStats()
	T:go("F"..R.height - 1 .."R1F"..R.height - 1 .."U"..R.height - 1)		-- top of roof, under top layer
	if isWidthOdd then
		lib.placeSlabs(length)
	end
	for h = 1, R.height + 1 do						-- place tiles on left side of roof
		lib.placeRoof(width, length)
		length = length + 2							-- increase dimensions
		width = width + 2
		if h < R.height + 1 then
			utils.goBack(1)
			T:go("D1R1")
			utils.goBack(1)
		end
	end
	while turtle.down() do end
	
	return {}
end

function buildStructure()
	local lib = {}
	
	function lib.goDown()
		--T:go("L1F1 R1F1 L1")	-- now on ground floor
		if R.height > 1 then
			T:down(1)
		end
	end
	local buildHeight = R.height
	local height = R.height
	local width = R.width
	local length = R.length
	
	if R.direction == "F" then
		T:forward(1)			-- face forward, move over first block
		R.direction = ""		-- do not move forward when building walls
	end
	if R.height > 3 then
		R.height = 3
	end
	T:turnRight(2)
	R.data = "house"
	R.silent = true	-- prevent return to ground after buildWall()
	R.subChoice = 2	-- do not move forward when building walls
	R.useBlockType = T:getMostItem("", false)
	while height > 0 do
		buildWall()
		
		lib.goDown()
		R.length = width - 1
		buildWall()
		lib.goDown()
		
		R.length = length - 1
		buildWall()
		lib.goDown()
		
		R.length = width - 2
		buildWall()
		height = height - R.height	-- 1, 2 or 3
		if height > 0 then
			T:go("U2 R1F1 L1F1")
			R.height = height
			if height > 3 then
				R.height = 3
			end
			R.length = length
		end
	end
	if not R.silent then	-- NOT called from another function
		T:go("U2F2")
		while turtle.down() do end
		T:go("R1F1R1")
	end
	
	return {}
end

function buildWall()
	-- T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	local lib = {}
	
	function lib.singleLayer()
		for l = 1, R.length do
			if l == R.length and R.data == "house" then
				T:turnRight(1)
			end
			utils.goBack(1)
			T:go("C1", false, 0, false, R.useBlockType)
		end
	end
	
	function lib.doubleLayer()
		for l = 1, R.length do
			T:go("C2", false, 0, false, R.useBlockType)
			if l == R.length and R.data == "house" then
				T:turnRight(1)
			end
			utils.goBack(1)
			T:go("C1", false, 0, false, R.useBlockType)
		end
	end
	
	function lib.tripleLayer()
		for l = 1, R.length do
			T:go("C2C0", false, 0, false, R.useBlockType)
			if l == R.length and R.data == "house" then
				T:turnRight(1)
			end
			utils.goBack(1)
			T:go("C1", false, 0, false, R.useBlockType)
		end
	end
	
	-- R.width preset to 1
	R.useBlockType = T:getMostItem("", false) -- no excluded blocks, any block type
	menu.colourPrint("Creating "..R.width.." x "..R.length.." walled enclosure", colors.yellow)
	menu.colourPrint("Using: "..R.useBlockType, colors.orange)
	local remaining = R.height
	
	if R.direction == "F" then
		T:forward(1)			-- face forward, move over first block
	end
	if R.height > 1 then
		T:up(1)					-- go up 1 block
	end
	if R.data ~= "house" then
		T:turnRight(2)				-- rotate 180
	end
	if R.height == 1 then		-- single block: place in front
		lib.singleLayer()
	elseif R.height == 2 then	-- 2 blocks, go backwards, place below and ahead
		lib.doubleLayer()
	else
		while remaining >= 3 do
			lib.tripleLayer()
			remaining = remaining - 3
			if remaining == 1 then
				T:go("U2F1R2")
			elseif remaining > 1 then
				T:go("U3F1R2")
			end
		end
		if remaining == 1 then
			lib.singleLayer()
		elseif remaining == 2 then
			lib.doubleLayer()
		end
	end
	if not R.silent then
		while turtle.down() do end
	end
	
	return {}
end

function checkFarmPosition()
	local discovered = ""
	local success, storage, detected = false, "", 0
	local blockType = T:getBlockType("down")
	R.networkFarm = true	-- all farms now use network storage
	R.ready = false
--Log:saveToLog("Checking position "..blockType.. " down")
	if blockType:find("water") ~= nil then -- over water, ? facing E (crops)
		-- network: E = _modemmodem__, N = _modemmodem_, W = modemmodem__, S = modem__modem
		-- legacy/earlyGame: E = _chestchest_, N = chestchest__, W = chest__chest, S = __chestchest
		-- Legacy/earlyGame: E = _barrelbarrel_, N = barrelbarrel__, W = barrel__barrel, S = __barrelbarrel
--Log:saveToLog("? over water = true")
		for i = 1, 4 do
			success, storage = utils.isStorage("forward")	-- true/false, chest, barrel, modem,  ""
			local itemAhead = T:getBlockType("forward")
			if success then
				discovered = discovered .. storage
			else
				discovered = discovered .. "_"
			end
			if itemAhead:find("mysticalagriculture") ~= nil then
				R.mysticalAgriculture = true
			end
			T:turnRight(1)
		end
--Log:saveToLog("Storage blocks found:"..discovered)
		if discovered == "modemmodem__" then
		   T:turnLeft(1)
		elseif discovered == "modem__modem" then
		   T:turnLeft(2)
		elseif discovered == "__modemmodem" then
		   T:turnRight(1)
		end
		R.ready = true
	end	-- else not over water
	if R.ready then
		Log:saveToLog("checkFarmPosition() complete. Ready to go", true)
	else
		Log:saveToLog("checkFarmPosition() NOT ready", true)
	end
	-- now facing crops, R.ready = true/false, R.networkFarm = true/false
end

function clearAndReplantTrees()
	--[[ clear all trees in a rectangle area defined by walls, fences or non-dirt blocks
	replant with same type of sapling. If original tree 2 blocks wide, replant 4 if possible. ]]
	local width = 0
	local length = 0
	local lib = {}

	function lib.harvestTree(blockTypeF)
		--[[ Fell tree, returns true if double size ]]
		-- clsTurtle.harvestTree(extend, craftChest, direction)
		local saplingType = T:getSaplingFromLogType(blockTypeF)
		local double = T:harvestTree("forward")	-- assume single tree, will auto-discover
		T:suckAll()
		if R.auto then
			lib.plantSapling(saplingType, double)
		end
	end
	
	function lib.plantSapling(sapling, double)
		--[[ plant sapling(s) ]]
		if R.auto then
			if sapling == "" or sapling == nil then sapling = "sapling" end
			T:up(1)
			T:suckAll()
			if double then	-- check if enough saplings
				-- return slotData.lastSlot, total, slotData -- integer, integer, table
				local slot, total, _ = T:getItemSlot(sapling)
				if total >= 4 then
					for i = 1, 4 do
						T:place(sapling, "down")
						T:go("F1R1")
					end
					T:forward(1)		-- above pre-planted sapling
				else
					if not T:place(sapling, "down") then
						T:place("sapling", "down")
					end
				end
			else
				if not T:place(sapling, "down") then
					T:place("sapling", "down")
				end
			end
		end
		turtle.select(1)
	end
		
	function lib.turn(turn)
		--[[ change direction and return new value for turn direction ]]
		if turn == "r" then
			T:turnRight(1)
			turn = "l"
		else
			T:turnLeft(1)
			turn = "r"
		end
		return turn	-- will only change turn direction variable if return value is used
	end
	
	function lib.emptyInventory(blockTypeD)
		--[[ Empty all except 32 of each sapling and 1 chest ]]
		if blockTypeD == nil then
			blockTypeD = T:getBlockType("down")
		end
		if blockTypeD:find("chest") ~= nil or blockTypeD:find("barrel") ~= nil then
			-- empty logs, apples, sticks and all but 1 stack of each sapling type
			T:emptyInventorySelection("down", {"chest", "oak_sapling", "birch_sapling", "spruce_sapling", "acacia_sapling", "jungle_sapling","dark_oak_sapling"},{1, 32, 32, 32, 32, 32, 32})
			return true
		else
			return false
		end
	end
	
	function lib.moveDown(blockTypeD)
		--[[ move down until hit ground. Break leaves and continue ]]
		if blockTypeD == nil then
			blockTypeD = T:getBlockType("down")
		end
		while blockTypeD == "" or blockTypeD:find("leaves") ~= nil do	-- move down, breaking leavse
			T:down(1)
			T:suckAll()
			blockTypeD = T:getBlockType("down")
		end
		return blockTypeD
	end
	
	function lib.moveForward()
		--[[
			Move forward 1 block only, go down to ground while air or leaves below.
			Use turtle.detect to save time
		]]
		local blockTypeU = ""
		local blockTypeF = ""
		local blockTypeD = ""
		
		if turtle.detectUp() then
			blockTypeU = T:getBlockType("up")
		end
		if turtle.detect() then
			blockTypeF = T:getBlockType("forward")
		end
		if turtle.detectDown() then
			blockTypeD = T:getBlockType("down")
		end

		if blockTypeU ~= "" and blockTypeU:find("leaves") == nil then	-- block above, not leaves
			if blockTypeU:find("log") ~= nil then
				T:harvestTree("up")
				return false, "", ""
			end
			return false, blockTypeU, "up"								-- report block above, no movement
		end
		
		if blockTypeD == "" then										-- air below
			return false, blockTypeD, "down"
		end

		if blockTypeF == "" or blockTypeF:find("leaves") ~= nil then	-- air or leaves ahead
			T:forward(1)												-- move forward, breaking leaves
			blockTypeF = T:getBlockType("forward")
			return true, blockTypeF, "forward"							-- moved ok, could be air or block in front
		end
		return false, blockTypeF, ""									-- did not move, obstacle in front NOT leaves or air
	end
	
	function lib.moveUp(blockTypeF)
		--[[ Move up, dig leaves or harvest tree) ]]
		if blockTypeF == nil then
			blockTypeF = T:getBlockType("forward")
		end
		while turtle.detect() do
			if blockTypeF:find("log") ~= nil then
				lib.harvestTree(blockTypeF)
				return true, ""
			elseif blockTypeF:find("leaves") ~= nil then
				T:go("x0x1")
				return false, ""
			end
			T:up(1)
			blockTypeF = T:getBlockType("forward")
		end
		--return  treeCut, "" / "dirt" etc
		return    false,   blockTypeF	-- should be false, "" (air) or any border block, true = tree cut
	end
	
	function lib.safeMove()
		--[[ move forward until border reached. loop breaks at that point ]]
		local blockTypeF = ""
		local success = true
		while success do
			success, blockTypeF = lib.moveForward()				-- move forward 1 block, return block type ahead
			if not success then 								-- did not move forwards, block in the way: either log, dirt/grass, border block or vegetation
				if blockTypeF:find("log") then 					-- tree found
					lib.harvestTree(blockTypeF)
					success = true								-- block (log) removed, try again
				else
					success = not lib.isBorder(blockTypeF)		-- Is at border?: if is at border success = false so loop stops
					if success then								-- Not at border. Dirt/grass vegetation in front
						blockTypeF = lib.moveUp(blockTypeF)		-- move up until leaves/log/air
						success = not lib.isBorder(blockTypeF)	-- Is at border?: if is at border success = false so loop stops
						if success then							-- keep moving forward
							if blockTypeF:find("log") then 		-- tree found
								lib.harvestTree(blockTypeF)	
							end
																-- else blockTypeF is air/leaves  border has been checked
						end
					end
				end
			end													-- else success = true, 1 block moved so continue
			length = length + 1
		end
	end
	
	function lib.isBorder(blockType)
		--[[ Is the block log, dirt, grass_block, vegetation: non-border, or other:border]]
		if R.auto then
			if blockType == nil then 					-- not passed as parameter
				blockType = T:getBlockType("forward")
			end
			if blockType == "" then 					-- air ahead: not border
				return false, ""
			else										-- could be border or other
				if blockType:find("dirt") ~= nil or blockType:find("grass_block") ~= nil or blockType:find("log") ~= nil then -- either dirt, grass block or log
					return false, blockType				-- dirt, grass, log: not border
				end
				if T:isVegetation(blockType) then 		-- vegetation found: not border
					return false, blockType
				end
			end
				return true, blockType					-- dirt, grass_block, log and vegetation eliminated:must be border
		else
Log:saveToLog("length = "..length)
			if length >= R.length then
				return true
			end
			return false
		end
	end
	
	function lib.inPosition()
		--[[ check if in lower left corner ]]
		local inPosition = true 		-- assume correct
		if not turtle.detectDown() then	-- hanging in mid-air
			return false
		end
		T:turnLeft(1)
		if lib.isBorder() then
			-- so far so good
			T:turnLeft(1)
			if not lib.isBorder() then 	-- not in correct place
				inPosition = false
			end
			T:turnRight(2) 				-- return to original position
		else
			inPosition = false
			T:turnRight(1) 				-- return to original position
		end
		return inPosition
	end
	
	function lib.findBorder()
		--[[ assume started after reset. if log above harvest tree else return to ground. Find starting corner]]
		local blockType = T:getBlockType("up")					-- dig any logs above, return to ground
		local sapling = "sapling"
		if blockType:find("log") ~= nil then					-- originally felling a tree so complete it
			sapling = T:getSaplingFromLogType(blockType)
			local double = T:harvestTree("up")	-- assume single tree, will auto-discover
			lib.plantSapling(sapling, double)
		else													-- no log above so go downm
			blockType = lib.moveDown()							-- return to ground (or vegetation)
		end
		lib.safeMove()											-- move forward until border reached
		T:turnRight(1)
		lib.safeMove()											-- move forward until second border reached
		T:turnRight(1)											-- should now be in correct position
		lib.emptyInventory()									-- empty inventory if above a chest
	end
	
	menu.clear()
	menu.colourPrint("Clearing and replanting trees", colors.lime)
	if R.auto then
		menu.colourPrint("Re-planting saplings enabled...", colors.lime)
	end
	menu.colourPrint("Width: "..R.width..", length: "..R.length, colors.lime)
	Log:saveToLog("clearAndReplantTrees() width: "..R.width..", length: ".. R.length..", re-plant saplings = "..tostring(R.auto))
	local turn = "r"
	local blockTypeF = ""
	local success = false
	for w = 1, R.width do
		local success, blockType, direction, blocksMoved = false, "", "", 0	-- initialise variables
		while blocksMoved < R.length do	
			--Log:saveToLog("calling lib.moveForward()")
			success, blockType, direction = lib.moveForward()				-- try to move forward 1 block, return block type ahead
			if success then													-- moved forward
				blocksMoved = blocksMoved + 1								-- increment counter
			else															-- failed to move forwards
				if direction == "up" then									-- block above, no moves
					while turtle.detectUp() do
						blockTypeU = T:getBlockType("up")
						if blockTypeU:find("leaves") == nil and blockTypeU:find("moss") == nil then			-- not leaves or hanging moss above
							T:back(1)
							blocksMoved = blocksMoved - 1					-- decrement counter
						else
							T:up(1)
							break
						end
					end
				else
					if direction == "down" then								-- air below, no moves
						T:down(1)											-- go down 1 as no block below
						success, blockType, direction = lib.moveForward()	-- try again, 1 block lower
						if success then
							blocksMoved = blocksMoved + 1
						end
					end
					if direction == "" then									-- block in front, not air or leaves
						Log:saveToLog("calling lib.moveUp("..blockType..")")
						success, blockType = lib.moveUp(blockType)			-- true if tree felled
						if not success then									-- moved up, tree not cut
							T:forward(1)									-- move forward
						end
						blocksMoved = blocksMoved + 1
					end
				end
			end
		end
		-- length finished, turn and repeat
		lib.turn(turn)														-- turn r or l. turn direction is not changed
		success, blockType, direction = lib.moveForward()					-- try to move forward 1 block, return block type ahead
		Log:saveToLog("turn: success = "..tostring(success)..", blockType = '"..blockType.."', direction = "..direction)
		if not success then													-- did not move forward
			if direction == "up" then										-- did not go forward as block above				
				while turtle.detectUp() do									-- break blocks above
					T:up(1)
				end
				while turtle.down() do end									-- return to ground
				success, blockType, direction = lib.moveForward()			-- try to move forward 1 block, return block type ahead
			elseif direction == "down" then
				while turtle.down() do end
				success, blockType, direction = lib.moveForward()			-- try to move forward 1 block, return block type ahead
			end
			if not success then													-- following "up" direction
				if direction == "" then										-- block in front, not air or leaves
					while turtle.detect() do								-- while block in front
						blockType = T:getBlockType("forward")				-- what is in front?
						if blockType:find("leaves") ~= nil then				-- leaves found
							T:forward(1)
							break
						elseif blockType:find("log") ~= nil then			-- tree found
							lib.harvestTree(blockType)
							T:back(1)
							break
						else
							T:up(1)											-- move up 1
						end
					end
					T:forward(1)
				end
			end
		end
		turn = lib.turn(turn)												-- turn r or l. turn direction is changed to opposite
	end
	return {}
end

function clearArea()
	local evenWidth = false
	local evenHeight = false
	local loopWidth
	-- go(path, useTorch, torchInterval, leaveExisting)
	if R.width % 2 == 0 then
		evenWidth = true
		loopWidth = R.width / 2
	else
		loopWidth = math.ceil(R.width / 2)
	end
	if R.length % 2 == 0 then
		evenHeight = true
	end
	turtle.select(1)
	-- clear an area between 2 x 4 and 32 x 32
	-- if R.width is even no, then complete the up/down run
	-- if R.width odd no then finish at top of up run and reverse
	-- should be on flat ground, check voids below, harvest trees
	for x = 1, loopWidth do
		-- Clear first column (up)
		for y = 1, R.length do
			if R.useBlockType == "dirt" then
				if not turtle.detectDown() then
					T:place("minecraft:dirt", "down", true)
				else --if not water, dirt, grass , stone then replace with dirt
					blockType = T:getBlockType("down")
					if blockType ~= "" then
						if blockType ~= "minecraft:dirt" and blockType ~= "minecraft:grass_block" then
							turtle.digDown()
							T:place("minecraft:dirt", "down", true)
						end
					end
				end
			end
			if y < R.length then
				T:go("F1+1", false,0,false)
			end
		end
		-- clear second column (down)
		if x < loopWidth or (x == loopWidth and evenWidth) then -- go down if on R.width 2,4,6,8 etc
			T:go("R1F1+1R1", false,0,false)
			for y = 1, R.length do
				if R.useBlockType == "dirt" then
					if not turtle.detectDown() then
						T:place("minecraft:dirt", "down", true)
					else
						blockType = T:getBlockType("down")
						if blockType ~= "" then
							if blockType ~= "minecraft:dirt" and blockType ~= "minecraft:grass_block" then
								turtle.digDown()
								T:place("minecraft:dirt", "down", true)
							end
						end
					end
				end
				if y < R.length then
					T:go("F1+1", false, 0, false)
				end
			end
			if x < loopWidth then 
				T:go("L1F1+1L1", false,0,false)
			else
				T:turnRight(1)
				T:forward(R.width - 1)
				T:turnRight(1)
			end
		else -- equals R.width but is 1,3,5,7 etc
			T:turnLeft(2) --turn round 180
			T:forward(R.length - 1)
			T:turnRight(1)
			T:forward(R.width - 1)
			T:turnRight(1)
		end
	end
	return {}
end

function clearBuilding()
	--[[
	menu item: Clear hollow structure
	Clear the outer shell of a building, leaving inside untouched. Optional floor/ceiling removal
	R.goUp = move upwards
	R.goDown = move downwards
	R.forward = move forward first
	R.ceiling = remove ceiling
	R.floor = remove floor
	R.down = go down first (above structure)
	R.width, R.length, R.height
	examples use a 5 x 5 x 7 cube
	]]
utils.logRvalues()
	local height = 1								-- current level of turtle
	local cleared = false							-- flag for cleared floor/ceiling
	R.silent = true
	if R.forward then
		T:forward(1)
		R.forward = false							-- reset so clearPerimeter() does not use it
	end
	if R.down then
		T:down(1)
	end
	R.up = false
	R.down = false								-- reset so clearRectangle() does not use it
	-- check if floor/ceiling is to be cleared
	if (R.goUp and R.floor) or (R.goDown and R.ceiling) then	
		clearRectangle()	-- R.up and R.down
		cleared = true
	end
	
	if (R.height == 1 and not cleared) or (R.height == 2 and not cleared) then			-- only 1 layer, perimeter only eg R.height = 7
		if R.goUp then
			R.up = true
		else
			R.down = true
		end
		clearPerimeter()
	elseif R.height >= 3 then 						-- 3 or more levels, floor/ceiling already assessed eg R.height = 7
		height = height + utils.move(1)			-- move up/down 1 block for first layer eg height: 1 + 1 = 2
		-- height h + 3 R.height   loop
		--	2		5		5		end
		--	2		5		7		+
		--	5		8		7		end
		R.up = true		-- used in clearPerimeter to remove upper and lower blocks
		R.down = true
		repeat 			
			clearPerimeter()						-- runs at least once, removes 3 layers: 1,2,3
			local move = 3
			if height + 3 >= R.height then			-- range with min 3(0), 4(1), 5(2), 6(3), 7(4), 8(5), 9(6) etc			
				move = R.height - height
			end
			height = height + utils.move(move)	-- move up/down 1-2 blocks eg height = 2 + 3 = 5
		until height > R.height - 3				-- min 3 levels eg height = 2, R.height - 3 --> 7 - 3 = 4, 4 - 3 = 1
		if height == R.height then				-- already on top/bottom layer eg height = 5, R.height = 5
			R.up = false
			R.down = false
			clearPerimeter()
		else
			clearPerimeter()
		end
	end
	
	R.up = false
	R.down = false
Log:saveToLog("R.goUp = "..tostring(R.goUp)..", R.goDown = "..tostring(R.goDown)..", R.ceiling = "..tostring(R.ceiling)..", R.floor = "..tostring(R.floor))
	if (R.goUp and R.ceiling) or (R.goDown and R.floor) then		-- from bottom to top
		clearRectangle()
	end
	
	if height > 1 then
		utils.move(height - 1, true) -- reverse direction
	end
	
	return {}
end

function clearMineshaft()
	local length = 0
	local torch = 0
	local lib = {}
		
	function lib.clearCentre(axeSide, swordSide)
		local moves = {}
		local torchCount = 0
		local blockTypeU = ""
		local blockTypeF = ""
		local blockTypeD = ""
		turtle.digUp()										-- in case block already above
		repeat
			blockTypeU = T:getBlockType("up")		
			local goUp = false
			local goDown = false
			if blockTypeU ~= "" then						-- block above
				if T:isStone(blockTypeU) then				-- stone detected up
					blockTypeD = T:getBlockType("down")
					if blockTypeD:find("torch") ~= nil or blockTypeD:find("rail") ~= nil then	-- torch or rail below
						turtle.digUp(axeSide)				-- remove it
					else
						T:down(1)
						blockTypeD = T:getBlockType("down")
						if blockTypeD ~= "" then			-- block below
							T:go("U1x0")
						else	-- no block below
							table.insert(moves, "D") 		-- add D to moves
						end
					end
				else										-- known block above, not stone, eg planks
					turtle.digUp(axeSide)					-- remove it
				end
			end
									
			blockTypeD = T:getBlockType("down")
			if blockTypeD ~= "" then						-- block below
				if T:isStone(blockTypeD) then				-- stone detected down in centre of mineshaft = level change
					T:up(1)
					table.insert(moves, "U")
				elseif blockTypeD:find("torch") == nil then	-- no torch below
					turtle.digDown(axeSide)
				end
			end
			blockTypeF = T:getBlockType("forward")
			if not T:isStone(blockTypeF) then
				T:forward(1)
				table.insert(moves, "F")					-- Normal move so insert F
				torchCount = torchCount + 1
				if torchCount == R.torchInterval then
					torchCount = 0
					T:place("torch", "down")
				end
			end
		until T:isStone(blockTypeF)
		return moves
	end
	
	function lib.clearSide(directions, axeSide, swordSide)
		if type(directions) ~= "table" then
			directions = {directions}
		end
		for _, direction in ipairs(directions) do
			local blockType = T:getBlockType(direction)
			if blockType:find("cobweb") ~= nil then
				-- T:dig(direction, bypass=true, slot=1, side="")
				T:dig(direction, true, 1, swordSide)
			elseif blockType ~= "" then
				T:dig(direction, true, 1, axeSide)
			end
		end
	end
	
	function lib.clearSideToEnd(moves, axeSide, swordSide)
		for i = 1, #moves, 1 do	-- reverse the Up/ down markers
			if moves[i] == "U" then
				T:up(1)
			elseif moves[i] == "D" then
				T:down(1)
			elseif moves[i] == "F" then
				lib.clearSide({"up", "down", "forward"}, axeSide, swordSide) -- dig cobweb or any other block up/down/forward
				T:forward(1)
			end
		end
	end

	function lib.clearSideToStart(moves, axeSide, swordSide)
		-- index needs to be manipulted so moves up or down are preceeded by a forward
		local index = #moves								-- start same as loop counter
		for i = #moves, 1, -1 do							-- iterate moves backwards
			if moves[index] == "U" then
				T:go("F1D1")
				index = index - 1
			elseif moves[index] == "D" then
				T:go("F1U1")
				index = index - 1
			elseif moves[index] == "F" then
				lib.clearSide({"up", "down", "forward"}, axeSide, swordSide) -- dig cobweb or any other block up/down/forward
				T:forward(1)
			end
			index = index - 1
			if index == 0 then break end
		end
	end

	function lib.checkEquipment()
		menu.colourPrint("Checking Equipment", colors.red)
		local axeSide, swordSide = "", ""
		local itemLeft, itemRight = T:getEquipped("both")
		if itemLeft == "minecraft:diamond_pickaxe" then 
			axeSide = "left"
		elseif itemRight == "minecraft:diamond_pickaxe" then 
			axeSide = "right"
		end
		if itemLeft == "minecraft:diamond_sword" then 
			swordSide = "left"
		elseif itemRight == "minecraft:diamond_sword" then 
			swordSide = "right"
		end
		--place sword on right, pickaxe on left
		if swordSide == "" then
			-- sword not equipped
			if T:getItemSlot("minecraft:diamond_sword") > 0 then	-- sword in inventory
				if axeSide == "left" then
					T:equip("right", "minecraft:diamond_sword")
					swordSide = "right"
				else
					T:equip("left", "minecraft:diamond_sword")
					swordSide = "left"
				end
			end
		end
		if swordSide == "" then		-- no sword
			swordSide = axeSide		-- use axe instead
		end
		return axeSide, swordSide
	end
	
	function lib.checkPosition()
		menu.colourPrint("Checking position", colors.orange)
		-- check position by rotating until facing away from wall
		local turns = 0
		while not turtle.detect() do
			T:turnRight(1)
			turns = turns + 1
			if turns > 4 then
				return {"I am not facing a wall. Unable to continue"}
			end
		end
		T:turnRight(2)	-- face coridoor
		return nil
	end
	
	function lib.turnAtEnd(axeSide, swordSide)
		-- turn right, forward, right, return to start with up/down dig
		T:go("R1")
		lib.clearSide({"up","down"}, axeSide, swordSide) 	-- dig cobweb or any other block up/down
		T:go("F1R1")										-- ready for return journey
	end
	
	function lib.turnAtStart(axeSide, swordSide)
		-- move to other wall and repeat.
		T:go("R1")
		lib.clearSide({"up","down"}, axeSide, swordSide) -- dig cobweb or any other block up/down
		T:go("F1")
		lib.clearSide({"up","down"}, axeSide, swordSide) -- dig cobweb or any other block up/down
		T:go("F1R1")
		--lib.clearSide({"up","down"}, swordSide) -- dig cobweb or any other block up/down
	end
	
	local axeSide, swordSide = lib.checkEquipment()
	local position = lib.checkPosition()
	if position ~= nil then
		return position
	end
	menu.colourPrint("Clearing Mineshaft", colors.yellow)
	local moves = lib.clearCentre(axeSide, swordSide)
	
	lib.turnAtEnd(axeSide, swordSide)
	
	lib.clearSideToStart(moves, axeSide, swordSide)
	
	lib.turnAtStart(axeSide, swordSide)
	
	lib.clearSideToEnd(moves, axeSide, swordSide)
	
	lib.clearSide({"up", "down"}, axeSide, swordSide) -- dig cobweb or any other block up/down/forward
	
	return {"Mineshaft cleared"}
end

function clearMonumentLayer() -- Not currently implemented
	R.up = true
	R.down = true
	R.silent = true
	if R.subChoice == 0 then
		R.up = false
		R.down = false
	end
	-- send turtle down until it hits bottom
	-- then clear rectangle of given size
	-- start above water, usually on cobble scaffold above monument
	if T:detect("down") then -- in case not over wall
		T:forward(1)
	end
	local height = 1
	-- go down until solid block detected
	while utils.clearVegetation("down") do
		T:down(1)
		height = height + 1
	end
	T:down(1)
	height = height + 1
	clearRectangle()
	T:up(height - 1)
	
	return {}
end

function clearMountainSide()
	--[[
	First row              outward  l  s  f  mid    (length, start, finish, midPoint)

	      >|*|*|           true                     lib.clearRow() moves: 7-5=2, midPoint starts at 2 
	      +|*|*|
	      +|*|*|
	      ^|*|*|        <  false    7  5  6  2      lib.clearRow() moves: 9-2=7, midPoint starts at -4 -1 = -5
	       |*|*|*|	    +
	     |*|*|*|*|*|    +
	  >  |*|*|*|*|*|    ^  true     9  2  6  -4     lib.getStartingLength(). Ends 1 block after block finish
	  ^|*|*|*|*|*|*|*|*|                            starts here, moves up 1
	    1 2 3 4 5 6 7 8                             block index
		 
	Second row                outward l  s  f  mid
	             <            false
                 +
          |*|*|  +
	   >|*|*|*|*|^            true
	   +|*|*|*|*|
	   +|*|*|*|*|
	   ^|*|*|*|*|          <  false   6  5  6  2
	    |*|*|*|*|*|*|      +
	  |*|*|*|*|*|*|*|*|    +
	  |*|*|*|>|*|*|*|*|    ^  true    7+5   5 -7    lib.getHalf(); goBack(7) 
	|*|*|*|*|*|*|*|*|*|*|*|                           starts at midPoint of previous row eg block 4
	 0 1 2 3 4 5 6 7 8 9 10
	]]
	
	-- variables declared before lib for them to be used within lib as is then in scope
	local turn = "R"
	local oTurn = "L"
	--if R.subChoice == 1 then 	-- remove left side
	if R.left then
		turn = "L"
		oTurn = "R"
	end
	local outward = true		-- direction flag
	
	local lib = {}
	
	function lib.isAnyAbove(above)
		_G.Log:saveToLog("lib.isAnyAbove: "..U.tableConcat(above, ", "), false)
		for k,v in ipairs(above) do
			if v then
				_G.Log:saveToLog("lib.isAnyAbove Found: "..k , false)
				return true
			end
		end
		return false
	end
		
	function lib.clearLevel(above)	-- eg 9, 2, 6, -4 from lib.getStartingLength OR 7, 5, 6, 3 from previous
		-- clearLevel always follows either lib.getStartingLength or a previous lib.clearLevel
		-- midPoint should be adjusted as turtle moves to reflect current row length
		if #above == 0 then return above, 1 end
		--local index = 0
		local minMoves = math.floor(#above / 2)
		local up, forward, down = lib.getDetect()
		if outward then										-- follow table indexes
			for x = 1, minMoves do							-- clear first half
				above[x] = up								-- reset this with new value
				T:go("x0x2F1")								-- clear and move forward
				up, forward, down = lib.getDetect()
				--index = index + 1
			end
			for x = minMoves + 1, #above do					-- check remaing half and clear
				T:go("x0x2")								-- clear above / below
				if above[x] then							-- is a block recorded as present?(now below)
					above[x] = up							-- reset this with new value
					T:forward(1)							-- move forward
					up, forward, down = lib.getDetect()
					--index = index + 1
				else
					break
				end
			end
		else												-- iterate table in reverse
			--index = #above
			for x = #above, minMoves, -1 do					-- clear first half
				above[x] = up								-- reset this with new value
				T:go("x0x2F1")								-- clear and move forward
				up, forward, down = lib.getDetect()
				--index = index - 1
			end
			for x = minMoves - 1, 1, -1 do					-- check remaing half and clear
				T:go("x0x2")								-- clear up / down
				if above[x] then							-- is a block recorded as present?(now below)
					above[x] = up							-- reset this with new value
					T:forward(1)							-- move forward
					up, forward, down = lib.getDetect()
					--index = index - 1
				else
					break
				end
			end
		end
		T:go("x0x2 F1R2 x0x2 F1")							-- face opposite direction, delete blocks above and below
		outward = not outward								-- switch direction flag
		return above										-- eg {false, true, true, true, false}
	end
	
	function lib.getDetect()
		return turtle.detectUp(),  turtle.detect(),  turtle.detectDown()
	end
	
	function lib.getStartingLength()
		--[[
			length of column by excavating blocks above, ahead or below
			Rotate 180 at end of run ready to return
			already 1 block above ground
		]]
		local above = {}									-- empty table of boolean values
		local length = 0									-- used as counter							
		T:forward(1)										-- start check 1 block ahead
		local up, forward, down = lib.getDetect() 			-- check if anything around current block
		if up or forward or down then						-- block found nearby: continue
			while up or forward or down do					-- while blocks ahead / up / down move forward
				table.insert(above, up)
				T:go("x0x2F1")
				up, forward, down = lib.getDetect() 		-- check if anything around current block
				length = length + 1
				if length >= R.length then					-- check if going out of range
					_G.Log:saveToLog("lib.getStartingLength() : outward = "..tostring(outward).." MaxLength "..maxLength.." reached", false)
					break
				end
			end
			T:go("R2x0x2")									-- Rotate 180 and clear blocks above/below
		else												-- no blocks nearby: exit
			T:go("R2F1")									-- return to start position rotated 180
		end
		outward = not outward

		return above 										-- above = {false, true, true, true, true, false, false}
	end
	
	function lib.firstRow()
		local height = 1									-- starts at ground level, but forced up 1
		T:up(1)
		local above = lib.getStartingLength()				-- clear the ground level and 1 above eg 9, 2, 5, 4
		if _G.Log:saveToLog("startLength: "..#above, true) then
			_G.Log:saveToLog(U.tableConcat(above, ", "), false)
			utils.waitForInput()
		end													-- at end of first row as already turned 180, outward set to false in getStartingLength
		while lib.isAnyAbove(above) do
			T:go("U3")	-- go up 3
			height = height + 3
			above = lib.clearLevel(above)	-- returns start and finish of blocks above, rotates 180
			if _G.Log:saveToLog("checking level: "..height, true) then
				_G.Log:saveToLog(U.tableConcat(above, ", "), false)
				utils.waitForInput()
			end
		end													-- first row all levels completed. 
		T:down(height)										-- now on ground + 1, facing last column cleared.
		
		return above
	end
		
	function lib.deepCopy(tbl)
		local copy = {}
		for key, value in ipairs(tbl) do
			table.insert(copy, value)
		end
		return copy
	end
   
	function lib.getHalf(above)
		-- already 1 block above ground
		local maxLength = R.length
		local temp = {}
		local retValue = {}
		if #above > 0 then								-- not empty table, so must be second half
			temp = lib.deepCopy(above)					-- copy existing table
			above = {}									-- initialise above
		end
		local up, forward, down = lib.getDetect()
		
		while up or forward or down do					-- while blocks ahead / up / down move forward
			T:go("x0x2F1")
			table.insert(above, up)
			up, forward, down = lib.getDetect() 		-- check if anything around current block
			
			if #above >= math.floor(maxLength / 2) then	-- check if going out of range
				_G.Log:saveToLog("lib.getHalf() : outward = "..tostring(outward).." MaxLength "..maxLength.." reached", false)
				T:go("x0x2")
				break
			end
		end
		T:turnRight(2)									-- ready for next half or return
		outward = not outward
		if #temp > 0 then								-- completing a second half measurement
			for i = #above, 1, -1 do
				table.insert(retValue, above[i])		-- combine 2 tables into 1
			end
			for i = 1, #temp do
				table.insert(retValue, temp[i])
			end
		else
			retValue = above
		end
		return retValue
	end
	
	function lib.nextRow()
		local height = 1
		_G.Log:saveToLog("lib.nextRow()", false)
		T:up(1)
		local pattern = turn.."1F1"..turn.."1"
		if not outward then
			pattern = oTurn.."1F1"..oTurn.."1"
		end
		T:go(pattern)
		_G.Log:saveToLog("    T:go("..pattern..")", false)
		outward = not outward -- reverse direction flag
		-- now in next vertical row
		local above = lib.getHalf({})
		local index = 0
		if _G.Log:saveToLog("\t  first half Length: "..#above.." Enter", true) then 
			_G.Log:saveToLog(U.tableConcat(above, ", "), false)
			utils.waitForInput()
		end
		lib.returnToMidPoint(#above)					-- return to starting point
		T:forward(1)		
		above = lib.getHalf(above)					-- returns length - 1 eg 5, 4
		if _G.Log:saveToLog("\t  total length: "..#above.." Enter", true) then
			_G.Log:saveToLog(U.tableConcat(above, ", "), false)
			utils.waitForInput()
		end
		
		while lib.isAnyAbove(above) do
			T:go("U3")				-- go up 3
			height = height + 3		-- increment height
			_G.Log:saveToLog("\tClear height loop: height = "..height, false)
			above = lib.clearLevel(above)	-- returns start and finish of blocks above
		end
		T:down(height)	-- now on ground + 1
		lib.returnToMidPoint(above)
	end
	
	function lib.returnToMidPoint(above)
		--[[ value can be integer or table]]
		if type(above) == "table" then
			_G.Log:saveToLog("lib.returnToMidPoint("..#above..")", false)
			if #above > 0 then
				local midPoint = math.floor(#above / 2)
				if #above % 2 == 1 and  not outward then -- length is odd no
					midPoint = math.ceil(#above / 2)
					_G.Log:saveToLog("    midPoint adjusted "..midPoint..")", false)
				end
				_G.Log:saveToLog("    T:forward("..midPoint..")", false)
				T:forward(midPoint)
			end
		else
			_G.Log:saveToLog("lib.returnToMidPoint("..above..")", false)
			if above > 0 then
				_G.Log:saveToLog("    T:forward("..above..")", false)
				T:forward(above)
			end
		end
		-- now back at starting point
	end
	
	-- Start here
	-- if "tk log d.." typed instead of "tk" will start logfile and display comments. read() will be activated for debugging
	_G.Log:saveToLog("Starting function clearMountainSide", false)
	local above = lib.firstRow() 			-- outward depends on height eg 1-2 = false, 3-5 = true, 6-8 = false
	lib.returnToMidPoint(above)				-- return to mid first row of blocks
	for row = 1, R.width -1 do
		lib.nextRow()
	end
	
	return {}
end

function clearPerimeter()
	-- set R.up and R.down before calling!
	local lib = {}
	function lib.upDown(length)
		for l = 1, length do
			T:go("x0x2F1x0x2")
		end
	end
	
	function lib.up(length)
		for l = 1, length do
			T:go("x0F1x0")
		end
	end
	
	function lib.down(length)
		for l = 1, length do
			T:go("x2F1x2")
		end
	end
	
	if R.forward then
		T:forward(1)
	end
	if R.up and R.down then	-- rmove blocks above and below
		for i = 1, 2 do
			lib.upDown(R.length - 1)
			T:turnRight(1)
			lib.upDown(R.width - 1)
			T:turnRight(1)
		end
	elseif R.up then	-- remove blocks above only
		for i = 1, 2 do
			lib.up(R.length - 1)
			T:turnRight(1)
			lib.up(R.width - 1)
			T:turnRight(1)
		end
	elseif R.down then	-- remove blocks below only
		for i = 1, 2 do
			lib.down(R.length - 1)
			T:turnRight(1)
			lib.down(R.width - 1)
			T:turnRight(1)
		end
	else	-- remove only blocks in front
		for i = 1, 2 do
			T:forward(R.length - 1)
			T:turnRight(1)
			T:forward(R.width - 1)
			T:turnRight(1)
		end
	end
	return {}
end

function clearRectangle(withData)
	if withData == nil then withData = false end	-- used in treeFarm to count logs
	-- height = 0: one level, 1 = +up, 2 = +down, 3 = +up/down
	local logsDug = 0						-- blocks dug up, forward, down
	local itemCount = 0
	local lib = {}
	
	function lib.UpDown(length)
		for l = 1, length do
			--T:go("x0x2F1x0x2")
			turtle.digDown()				-- dig below
			itemCount = T:getTotalItemCount()
			while turtle.digUp() do			-- dig up including gravity blocks
				if T:getTotalItemCount() > itemCount then
					logsDug = logsDug + 1
				end
			end		
			while not turtle.forward() do	-- if no block in front, moves forward
				turtle.dig()				-- block in front, so dig it
			end
			turtle.digDown()				-- now moved forward so dig down again
			itemCount = T:getTotalItemCount()
			while turtle.digUp() do			-- dig up including gravity blocks
				if T:getTotalItemCount() > itemCount then
					logsDug = logsDug + 1
				end
			end		
		end
	end
	
	function lib.Up(length)
		for l = 1, length do
			itemCount = T:getTotalItemCount()
			while turtle.digUp() do			-- dig up including gravity blocks
				if T:getTotalItemCount() > itemCount then
					logsDug = logsDug + 1
				end
			end		
			while not turtle.forward() do	-- if no block in front, moves forward
				turtle.dig()				-- block in front, so dig it
			end
			itemCount = T:getTotalItemCount()
			while turtle.digUp() do			-- dig up including gravity blocks
				if T:getTotalItemCount() > itemCount then
					logsDug = logsDug + 1
				end
			end		
		end
	end
	
	function lib.Down(length)
		for l = 1, length do
			turtle.digDown()				-- dig below
			while not turtle.forward() do	-- if no block in front, moves forward
				turtle.dig()				-- block in front, so dig it
			end
			turtle.digDown()				-- now moved forward so dig down again
		end
	end
	
	function lib.Forward(length)
		T:forward(length)
	end
	
	-- could be 1 wide x xx R.length (trench) R.up and return
	-- could be 2+ x 2+
	-- even no of runs return after last run
	-- odd no of runs forward, back, forward, reverse and return
	turtle.select(1)
	if R.direction == "F" then
		T:forward(1)
	end
	if R.width == 1 then 					-- single block trench ahead only
		if R.up and R.down then				-- single block wide trench dig R.up and R.down = 3 blocks deep
			lib.UpDown(R.length - 1)
		elseif R.up then					-- single block wide trench dig R.up = 2 blocks deep
			lib.Up(R.length - 1)
		elseif R.down then					-- single block wide trench dig R.down = 2 blocks deep
			lib.Down(R.length - 1)
		else 								-- single block wide = 1 block deep
			lib.Forward(R.length - 1)
		end
		T:turnRight(2)						-- turn at the top of the run
		T:forward(R.length - 1)				-- return to start
		T:turnRight(2)						-- turn round to original position
	else 									-- R.width 2 or more blocks
		local iterations = 0 				-- R.width = 2, 4, 6, 8 etc
		if R.width % 2 == 1 then  			-- R.width = 3, 5, 7, 9 eg R.width 7
			iterations = (R.width - 1) / 2 	-- iterations 1, 2, 3, 4 for widths 3, 5, 7, 9
		else
			iterations = R.width / 2		-- iterations 1, 2, 3, 4 for widths 2, 4, 6, 8
		end
		for i = 1, iterations do 			-- eg 3 blocks wide, iterations = 1
			if R.up and R.down then							-- dig R.up and R.down
				lib.UpDown(R.length - 1)
				T:go("x0x2R1F1x0x2R1x0x2")				-- turn round
				lib.UpDown(R.length - 1)
			elseif R.up then								-- dig R.up
				lib.Up(R.length - 1)
				T:go("x0R1F1x0R1x0")
				lib.Up(R.length - 1)
			elseif R.down then							-- dig R.down
				lib.Down(R.length - 1)
				T:go("x2R1F1x2R1x2")
				lib.Down(R.length - 1)
			else										-- no digging R.up or R.down
				lib.Forward(R.length - 1)
				T:go("R1F1R1")
				lib.Forward(R.length - 1)
			end
			-- if 1 less than end, reposition for next run
			if i < iterations then
				T:go("L1F1L1", false, 0, false)
			end
		end
		if R.width % 2 == 1 then  -- additional run and return to base needed
			T:go("L1F1L1", false, 0, false)
			if R.up and R.down then
				lib.UpDown(R.length - 1)
			elseif R.up then
				lib.Up(R.length - 1)
			elseif R.down then
				lib.Down(R.length - 1)
			else
				lib.Forward(R.length - 1)
			end
			T:turnRight(2)
			T:forward(R.length - 1)
		end
		T:go("R1F"..R.width - 1 .."R1", false, 0, false)
	end
	if withData then
		return logsDug
	else
		return {}
	end
end

function clearSandCube()
	R.data = ""
	for w = 1, R.width do
		clearSandWall()
		if w < R.width then
			if w % 2 == 1 then
				T:go("R1F1R1")
			else
				T:go("L1F1L1")
			end
		end
	end
	
	return {}
end

function clearSandWall()
	--dig down while on top of sand/red_sand/soul_sand
	local lib = {}
	
	function lib.checkAbove(height)
		if turtle.detectUp() then -- moved under a ledge
			T:go("B1U1")
			height = height - 1
		end
		return height
	end
	
	function lib.moveDown(height)
		blockType = T:getBlockType("down")
		while blockType:find("sand") ~= nil do
			T:down(1)
			height = height + 1
			blockType = T:getBlockType("down")
		end
		return height
	end
	
	function lib.moveForward(length)
		local unload = false
		lib.digForward()
		T:forward(1)
		local count = T:getItemCount("sand")
		if count > 960 then
			unload = true
		end
		length = length + 1
		local blockType = T:getBlockType("forward")
		return length, blockType, unload
	end
	
	function lib.digForward()
		while turtle.detect() do
			turtle.dig()
		end
	end
	
	local moves  = 0
	local height = 0
	local length = 0
	local search = 0
	local unload = false
	local reverse = false
	local blockType = T:getBlockType("down")
	if R.length == 0 then
		R.length = 64
	end
	
	print("Checking for sand below")
	while blockType:find("sand") == nil do --move forward until sand detected or 3 moves
		T:forward(1)
		search = search + 1
		blockType = T:getBlockType("down")
		if search > 3 then
			T:go("B"..search)
			return {"Unable to locate sand"}
		end
	end
	-- must be sand below
	height = lib.moveDown(height)	-- go down if sand below
	-- repeat until height == 0
	repeat -- starts at bottom of sand wall
		blockType = T:getBlockType("forward")
		if blockType:find("sand") ~= nil then -- sand in front
			length, blockType, unload = lib.moveForward(length) -- move forward 1 and dig sand
			if unload then
				T:up(height)
				menu.clear()
				menu.colourText(1, "Inventory full. Unload and press Enter")
				read()
				T:down(height)
			end
			if blockType == "" or  blockType:find("sand") ~= nil then -- sand or nothing in front
				height = lib.moveDown(height)	-- go down if sand below
			end
		else -- solid block, air or water, not sand so move up
			if turtle.detect() then -- block in front
				blockType = T:getBlockType("down")
				if blockType:find("sand") ~= nil then -- sand below
					T:dig("down")
				end
				T:up(1)
				height = height - 1
			else -- air/water in front so move forward
				if length < 60 then -- in case missing wall and in open ocean
					length, blockType, unload = lib.moveForward(length) -- move forward 1 and dig sand
					if unload then
						T:up(height)
						menu.clear()
						menu.colourText(1, "Inventory full. Unload and press Enter")
						read()
						T:down(height)
					end
					height = lib.checkAbove(height)
				else -- already > monument length of 56
					T:up(1)
					height = height - 1
				end
			end
		end
	until height == 0 or length == R.length
	blockType = T:getBlockType("down")
	if blockType:find("sand") ~= nil then -- sand below
		T:dig("down")
	end
	if height > 0 then -- finished as length ran out
		T:up(height)
	end
	-- stay at end of cleared wall unless user chose to return
	if R.data == "return" then
		T:go("R2F"..length.."R2")
	end
	
	return {}
end

function clearSolid()
	-- R.goUp = true if moving up 
	-- R.goDown = true if moving down
	local height = 1
	local remaining = R.height 
	local lib = {}
	
	function lib.singleLayer()
		R.up = false
		R.down = false
		clearRectangle()
	end
	
	function lib.doubleLayer()
		R.up = false
		R.down = false
		if R.goUp then
			R.up = true
		else
			R.down = true
		end
		clearRectangle()
	end
		
	function lib.tripleLayer()
		-- turtle in centre layer
		R.up = true
		R.down = true
		clearRectangle()
	end

	R.silent = true
	if R.forward then	-- move forward 1
		T:forward(1)
	end
	if R.down then	-- above structure. move down 1
		T:down(1)
	end
	if R.height < 3 then 							--1-3 layers only
		if R.height == 1 then 						--one layer only
			lib.singleLayer()
		elseif R.height == 2 then 					--2 layers only current + dig up/down
			lib.doubleLayer()
		end
	else -- 3 or more levels
		height = height + utils.move(1)				-- move up/down 1 block for first layer
		while remaining >= 3 do 					-- min 3 levels
			lib.tripleLayer()
			remaining = remaining - 3
			if remaining == 0 then					-- all finished
				break
			elseif remaining == 1 then
				height = height + utils.move(2)		-- move up/down 2 blocks
				lib.singleLayer()
			elseif remaining == 2 then
				height = height + utils.move(2)		-- move up/down 2 blocks
				lib.doubleLayer()
			else
				height = height + utils.move(3)		-- move up/down 3 blocks
				if remaining == 3 then
					finish = true
				end
			end
		end
	end
	
	if height > 1 then
		utils.move(height - 1, true) -- reverse direction
	end
	
	return {}
end

function clearWall()
	local lib = {}
	
	function lib.move(direction, blocks, reverse)
		--[[ Move up or down by blocks count ]]
		if reverse == nil then
			reverse = false
		end
		if reverse then
			if direction == "down" then -- reverse direction
				T:up(blocks)
			else
				T:down(blocks)
			end
		else
			if direction == "up" then
				T:up(blocks)
			else
				T:down(blocks)
			end
		end
		return blocks
	end
	
	function lib.singleLayer(length)
		T:go("F"..length - 1)
	end
	
	function lib.doubleLayer(modifier, length)
		for i = 1, length do
			if i < length then
				T:go("x"..modifier.."F1")
			else
				T:go("x"..modifier)
			end
		end
	end
	
	function lib.tripleLayer(direction, length)
		for i = 1, length do
			if i < length then
				T:go("x0x2F1")
			else
				T:go("x0x2")
			end
		end
	end
	
	
	-- R.width preset to 1
	-- R.subChoice = 1 up / 2 down
	-- R.down = move down first
	-- R.forward = move forward first
	
	if R.forward then
		T:forward(1)
	end
	if R.down then
		T:down(1)
	end
	if R.height < 3 then
		R.silent = true
	end
	-- dig along and up/down for specified R.length
	local modifier = "0"
	local direction = "U"
	local outbound = true
	local height = 0
	if R.subChoice == 2 then
		 modifier = "2"
		 direction = "D"
	end
	if R.height == 1 then 				-- single block so dig and return
		lib.singleLayer(R.length)
	elseif R.height == 2 then
		lib.doubleLayer(modifier, R.length)
	else								-- 4 blocks or more. start with bulk 3 blocks
		local remaining = R.height
		T:go(direction.."1")			-- up 1 or down 1
		height = 1
		while remaining >= 3 do 
			lib.tripleLayer(direction, R.length)
			remaining = remaining - 3
			
			if remaining == 0 then		-- no more, return home, already in position
				
			elseif remaining == 1 or remaining == 2 then
				T:go(direction.."2")
				height = height + 2
			else
				T:go(direction.."3")
				height = height + 3
				if remaining >= 3 then -- another iteration
					T:go("R2")
					outbound = not outbound
				end
			end
		end
		-- 0, 1 or 2 layers left
		if remaining > 0 then
			T:go("R2")
			outbound = not outbound
			if remaining == 1 then
				lib.singleLayer(R.length)
			elseif remaining == 2 then
				lib.doubleLayer(modifier, R.length)
			end
		end
	end
	if outbound then
		T:go("R2F"..R.length - 1)
	else
		T:forward(1)
	end
	direction = "D" -- reverse direction
	if R.subChoice == 2 then
		 direction = "U"
	end
	if height > 0 then
		T:go(direction..height.."R2")
	else
		T:go("R2")
	end
	return {}
end

function clearWaterPlants()
	local D = {}
	D.depth = 0
	D.maxDepth = 0
	D.blockType = ""
	D.useBlockType = R.useBlockType -- "" or "prismarine"
	D.length = 0	-- copy of R.length used in lib.clearLength
	D.width = 0		-- increased every iteration
	D.facingForward = true
	D.monumentTopClear = false
	D.monumentArchesClear = false
	D.inWater = false
	D.onWater = false
	D.inWater, D.onWater = utils.getWaterStatus()
	D.floorLength = 0 -- used on monument floor
	
	local lib = {}
	
	function lib.getLength()
		local length = 1
		print("Checking water length")
		while utils.clearVegetation("forward") do
			T:forward(1)
			length = length + 1
		end
		for i = 1, length do
			turtle.back()
		end
		return length
	end
	
	function lib.clearDown()
		while utils.clearVegetation("down") do --clears any grass or sea plants, returns true if air or water, bubble column or ice
			T:down(1)
			D.depth = D.depth + 1
		end
		-- if slab at bottom, replace with solid block
		D.blockType = T:getBlockType("down")
		if D.blockType:find("slab") ~= nil then
			T:go("C2")
		end
		if D.depth > D.maxDepth then
			D.maxDepth = D.depth
		end
		
		--return D
	end
	
	function lib.clearLength()
		local moves = 0
		local blockHeight = 1
		D.floorLength = 0 -- reset
		while moves < D.length - 1 do
			if utils.clearVegetation("forward") then
				T:forward(1)
				moves = moves + 1 
				if turtle.detectUp() then -- could be on monument going under arch, or faulty monument floor
					if not D.monumentArchesClear then
						lib.checkArches()
					end
				end
				local temp = D.depth
				lib.clearDown() -- go down if in water/air
				if blockHeight == 4 and D.depth - temp == 3 then -- could be just gone over 3 block high column in ocean monument
					if not D.monumentTopClear then
						lib.checkTop()
					end
					blockHeight = 1
				end
				if D.useBlockType == "prismarine" then
					if D.blockType:find("prismarine") == nil then
						-- on monument floor so restrict forward movement to 8 blocks
						D.floorLength = D.floorLength + 1
						if D.floorLength == 8 then
							D.blockType = T:getBlockType("forward")
							while D.blockType:find("prismarine") == nil do
								T:up(1)
								D.blockType = T:getBlockType("forward")
							end
							D.floorLength = 0
						end
					end
				end
				if moves >= D.length - 1 then
					D.width = D.width + 1	-- another length completed so increase width
					return D
				end
			else -- block in front
				blockHeight = 1
				local waterAbove = utils.clearVegetation("up")
				local waterAhead = utils.clearVegetation("forward") -- true if air/water in front
				while not waterAhead do 	-- solid block in front
					if waterAbove then 		-- move up
						T:up(1)
						D.depth = D.depth - 1
						blockHeight = blockHeight + 1
						if D.depth < 1 then
							D.width = D.width + 1	-- another length completed so increase width
							return D
						end
					else 					-- block above so go back
						while not waterAbove do
							utils.goBack()	--  returns true if no object behind, but moves anyway
							waterAbove = utils.clearVegetation("up")
							moves = moves - 1
							if moves == 0 then
								T:up(1)
								D.depth = D.depth - 1
								waterAbove = utils.clearVegetation("up")
								while not waterAbove do
									T:up(1)
									D.depth = D.depth - 1
								end
							end
						end
						-- go up 1 to prevent loop
						T:up(1)
						D.depth = D.depth - 1
					end
					waterAbove = utils.clearVegetation("up")
					waterAhead = utils.clearVegetation("forward")
				end
			end
		end
		D.width = D.width + 1	-- another length completed so increase width
		D.maxDepth = D.maxDepth + 1 -- +1 to allow for starting pos in top layer
		
		--return D 
	end
	
	function lib.checkArches()
		-- gone under a block so could be monument arch (6)
		if T:getBlockType("up"):find("prismarine") ~= nil then -- confirm on monument, not previously cleared
			local direction = "" 	-- initialise direction
			T:go("B1U2F1R1")
			if T:getBlockType("forward"):find("prismarine") ~= nil then -- correct guess
				direction = "R"
			else	-- wrong direction. turn round and check other side
				T:go("R2")
				if T:getBlockType("forward"):find("prismarine") ~= nil then
					direction = "L"
				end
			end
			local path = "U1F1 U1F3 D1F1 D1R2 U2F5 D2"
			--for i = 1, 6 do
			T:go(path) -- clears arch top 1 and returns
			T:go(direction.."1F6"..direction.."1")
			T:go(path) -- clears arch top 2 and returns
			T:go(direction.."1F6"..direction.."1")
			T:go(path) -- clears arch top 3 and returns
			T:go(direction.."1F9"..direction.."1")
			T:go(path) -- clears arch top 4 and returns
			T:go(direction.."1F6"..direction.."1")
			T:go(path) -- clears arch top 5 and returns
			T:go(direction.."1F6"..direction.."1")
			T:go(path) -- clears arch top 6 and returns
			
			T:go(direction.."3F34"..direction.."2D2F1")
			D.monumentArchesClear =  true
		end
		--return D
	end
	
	function lib.checkTop()
		-- gone over 3 block column so could be at the top of ocean monument
		if T:getBlockType("down"):find("prismarine") ~= nil then -- confirm on monument, not previously cleared
			local direction = "" 	-- initialise direction
			T:go("U3R1")			-- up to top of column and try right side
			if T:getBlockType("forward"):find("prismarine") ~= nil then -- correct guess
				direction = "L"
			else	-- wrong direction. turn round and check other side
				T:go("R2")
				if T:getBlockType("forward"):find("prismarine") ~= nil then
					direction = "R"
				end
			end
			if direction ~= "" then -- facing single block on layer 2
				T:go("U1F6"..direction.."1F5".. direction.."1F5"..direction.."1F5"..direction.."1") -- clear 4 single blocks
				T:go("F1U1"..direction.."1F1"..direction.."3") -- on top of monument
				T:go("F3".. direction.."1F3"..direction.."1F3"..direction.."1F3"..direction.."3") -- clear top, face return
				T:go("F2D5"..direction.."3B1")
			end
			D.monumentTopClear = true
		end
		--return D
	end
	
	function lib.findBlockTypeEnd()
		D.blockType = "" -- reset
		repeat
			if utils.clearVegetation("forward") then
				T:forward(1)
				lib.clearDown() -- go down if in water/air, D.blockType is updated with floor type
			else -- block in front
				local waterAbove = utils.clearVegetation("up")
				local waterAhead = utils.clearVegetation("forward") -- true if air/water in front
				while not waterAhead do 	-- solid block in front
					if waterAbove then 		-- move up
						T:up(1)
					else 					-- block above so go back
						while not waterAbove do
							utils.goBack()	--  returns true if no object behind, but moves anyway
							waterAbove = utils.clearVegetation("up")
						end
					end
					waterAbove = utils.clearVegetation("up")
					waterAhead = utils.clearVegetation("forward")
				end
			end
		until D.blockType:find(D.useBlockType) == nil
		-- now above a non-prismarine block, facing away from monument
		T:turnRight(2) -- facing monument
		D.blockType = T:getBlockType("forward")
		while D.blockType:find(D.useBlockType) ~= nil do
			T:up(1)
			D.blockType = T:getBlockType("forward")
		end
		T:go("F1L1")
		D.blockType = T:getBlockType("down")
		while D.blockType:find(D.useBlockType) ~= nil do
			T:forward(1)
			D.blockType = T:getBlockType("down")
		end
		turtle.back()
		-- should now be at end of monument base
	end
	
	function lib.turn()
		local direction = "R"
		if not D.facingForward then
			direction = "L"
		end
		T:go(direction.. 1)
		if utils.clearVegetation("forward") then
			T:forward(1)
			--D.depth = D.depth + lib.clearDown(depth)
			lib.clearDown()
		else
			while not utils.clearVegetation("forward") do
				T:up(1)
				D.depth = D.depth - 1
			end
			T:forward(1)
		end
		T:go(direction.. 1)
		D.facingForward = not D.facingForward 
		
		--return D
	end
	
	if R.data == "clearWaterPlants" or R.data == "maxDepth" then -- NOT monument corner discovery
		D.inWater, D.onWater = utils.startWaterFunction(D.onWater, D.inWater, 2, true) -- move into water
		if R.length == 0 then
			R.length = lib.getLength()
		end
		if R.width == 0 then
			T:turnRight(1)
			R.width = lib.getLength()
			T:turnLeft(1)
		end
	end
	D.length = R.length
	lib.clearDown() -- go down to floor, set depth, maxDepth, blockType
	if R.data == "clearWaterPlants" or R.data == "maxDepth" then -- NOT monument corner discovery
		if R.width == 1 then
			print("Single row clearing")
			lib.clearLength() --D.width also increased
		else
			while D.width < R.width do -- D.width starts at 0
				-- now on floor, move along sea/river bed following contour
				lib.clearLength() --D.width also increased
				-- now turn and repeat
				if D.width < R.width then	
					lib.turn()
					if D.depth <= 0 then
						break
					end
				end
			end
		end
		-- finished so return to surface
		if R.data == "clearWaterPlants" then
			T:up(1) -- up 1 to check for water below
			while T:getBlockType("down"):find("water") ~= nil do
				T:up(1)
			end
			T:down(2) -- return to surface
			--[[while utils.clearVegetation("forward") do
				T:forward(1)
			end]]
		else
			T:go("U"..(D.maxDepth + 1).."R2F"..R.length.."R2")
		end
	elseif R.data == "clearMonumentArches" then -- clear under monument arches
		D.length = 8
		D.monumentTopClear = true
		D.monumentArchesClear = true
		D.useBlockType = ""
		lib.clearLength()
	elseif R.data == "oceanMonumentColumns" then -- monument corner discovery
		-- this function used to find edge of monument base
		if D.blockType:find(D.useBlockType) ~= nil then
			lib.findBlockTypeEnd()
			return {""}
		else
			T:up(D.depth)
			return {"Prismarine not found on ocean floor"}
		end
	end
	if R.silent then
		return {D.maxDepth, R.length}
	else
		return {""}
	end
end

function composter()
	-- should have composter in inventory, or be placed on top of an existing one
	local composterSlot = T:getItemSlot("composter")
	if composterSlot == 0 then
		if T:getBlockType("down"):find("composter") == nil then
			return {"No composter in inventory or below turtle"}
		end
	else
		T:place("composter", "down")
	end
	local hasVeg = true
	local bonemeal = 0
	while hasVeg do
		for slot = 1, 14 do
			turtle.select(slot)
			while turtle.getItemCount(slot) > 0 do
				while turtle.dropDown() do end
				sleep(2)
				turtle.select(15)
				turtle.digDown()
				turtle.placeDown()
				turtle.select(slot)
			end
			bonemeal = T:getItemCount("bonemeal")
			if bonemeal >= 64 then
				return {"Bulk composting halted. Bonemeal full"}
			end
		end
		hasVeg = false
		for slot = 1, 14 do
			if turtle.getItemCount(slot) > 0 then
				hasVeg = true
			end
		end
	end
	return {"Bulk composting completed"}
end

function convertEssence()
	-- R.subChoice = 1 to 5
	-- R.size = quantity
	-- 1 = inferium to prudentium
	-- 2 = prudentium to tertium
	-- 3 = Tertium to Imperium
	-- 4 = Imperium to Supremium
	-- 5 = Supremium to Insanium
	local lib = {}
	
	function lib.getCrystal()
		local turtleSlot, turtleCount = 0, 0
		if utils.isStorage("up") then
			turtle.select(2)
			turtle.suckUp()
		end
		turtleSlot = T:getItemSlot("crystal")
		if turtleSlot == 0 then
			turtleSlot, turtleCount = U.getItemFromNetwork("chest", "infusion_crystal", 1)
		end
		if turtleSlot > 0 then
			turtle.select(turtleSlot)
			turtle.transferTo(2)
			return true
		end
		
		return false
	end
		
	function lib.loadCrafter(crafterName)
		-- up to 64 essences stored in turtle slots 2, 4, 6, 8
		local slots = {2, 4, 6, 8}
		for _, slot in ipairs(slots) do		-- drop each slot contents into crafter ? slot 1
			turtle.select(slot)
			turtle.drop()
			peripheral.call(crafterName, "pushItems", crafterName, 1, nil, slot)	-- move to correct place
		end
	end
	
	function lib.loadTurtle(availableStorage, availableStorageKeys, essence, loaded)
		-- collect essence as above and place in minecraft:crafter slots 2, 4, 6, 8
		local crafterData = {{2, loaded}, {4, loaded}, {6, loaded}, {8, loaded}} -- eg 64 items in each of 4 slots in the crafter
		U.transferItemToTurtle(availableStorage, availableStorageKeys, crafterData)
	end
		
	function lib.runCrafter(crafterName, count)
		-- can only craft once, then crystal + output is returned to turtle
		-- repeat process count times
		-- drop crystal into crafter, move to slot 5
		for i = 1, count do
			local slot = T:getItemSlot("crystal")
			if slot > 0 then
				turtle.select(slot)
				turtle.drop()
				U.moveItem(crafterName, "crystal", 5)
				for i = 1, 3 do
					rs.setAnalogOutput("front",15)
					sleep(0.1)
					rs.setAnalogOutput("front", 0)
				end
			end
		end
		while turtle.suck() do end
	end
	
	function lib.storeCrystal()
		if utils.isStorage("up") then
			T:dropItem("crystal", "up")
		else
			U.sendItemToNetworkStorage("chest", "crystal", 0)	-- empty turtle to storage chests
		end
	end
	
	function lib.storeOutput()
		if utils.isStorage("up") then
			T:dropItem("crystal", "up")
		end
Log:saveToLog("==> lib.storeOutput() call --> U.sendItemToNetworkStorage('chest', 'all', 0")
		U.sendItemToNetworkStorage("chest", "all", 0)	-- empty turtle to storage chests
	end
	
	function lib.getStorageData(essence)
		--local message = U.wrapModem(true)
		--if message == "Modem not found" then return 0, nil, nil, "" end
		local availableStorage = {}
		local availableStorageKeys = {}
		local total = 0
		for _, storageName in pairs(storageNames) do 
			local storageCount, storageData = U.findItemCountInInventory(storageName, essence)	-- eg 86, {{1, 64},{4, 22}}
			if storageCount > 0 then		-- eg 86: storage has some items
				_G.Log:saveToLog("storageCount = "..storageCount)
				availableStorage[storageName] = {}
				availableStorage[storageName].count = storageCount
				availableStorage[storageName].data = storageData
				table.insert(availableStorageKeys, storageName)
				total = total + storageCount
			end
		end
		
		return total, availableStorage, availableStorageKeys
		--[[
			availableStorage.minecraft:chest_114 = {count = 86, data = {{1, 64},{4, 22}},
			availableStorage.minecraft:chest_115 = {count = 1024, data = {{1, 64},{2, 64},{3, 64}, ... }
		]]
	end
	
	local essences = {"mysticalagriculture:inferium_essence",
					"mysticalagriculture:prudentium_essence",
					"mysticalagriculture:tertium_essence",
					"mysticalagriculture:imperium_essence",
					"mysticalagriculture:supremium_essence",
					"mysticalagriculture:insanium_essence"}
	
	--local message = U.loadStorageLists()
	local message = U.wrapModem(true)	-- initialises or creates lists of where an item can be found: GLOBAL LISTS!
	if message ~= nil then return {message} end
	local essence = essences[R.subChoice]
	local missing = ""
	local crafter = peripheral.find("minecraft:crafter")
	local crafterName = ""
	local completed = 0
	if R.size > 0 then
		R.size = math.floor(R.size / 4) * 4
		if R.size == 0 then R.size = 4 end
	end
	if crafter == nil then
		return {"No crafter found"}
	else
		crafterName = peripheral.getName(crafter)
		_G.Log:saveToLog("utils.convertEssence started using "..essence..", quantity = "..R.size )
		while turtle.suck() do end						-- empty crafter
		lib.storeOutput()	-- empty turtle to storage chests, (except crystal if storage above)
		if not lib.getCrystal() then
			return {"Failed: missing infusion crystal"}
		end
		lib.storeCrystal()
		local totalInStorage, availableStorage, availableStorageKeys = lib.getStorageData(essence)
		if totalInStorage < 4 then
			return {"Only "..totalInStorage.." ".. essence:sub(20).." available"}
		else
			-- can only transfer full amount direct to crafter
			-- if a chest has 32 items in 1 slot and 32 in another Slot
			-- these have to be sent into the turtle first, dropped into crafter slot 1 and moved to correct position
			totalInStorage = math.floor(totalInStorage / 4) * 4
			if R.size == 0 then	-- process all
				_G.Log:saveToLog("initial call lib.loadTurtle("..U.turtleName..", "..totalInStorage.." essence")
				local processed = 0
				local loaded = 0
				
				while totalInStorage > 0 do		-- use ALL stored essence
					if totalInStorage - 256 > 0 then
						loaded = 64
					else
						loaded = totalInStorage / 4
					end
					lib.loadTurtle(availableStorage, availableStorageKeys, essence, loaded)
					lib.loadCrafter(crafterName)
					lib.getCrystal()
					processed = processed + loaded
					totalInStorage = totalInStorage - loaded * 4
					lib.runCrafter(crafterName, loaded)
					lib.storeOutput()
				end
			elseif R.size <= 64 then
				local loaded = math.min(R.size, totalInStorage)	-- process requested or available if less
				if loaded > 0 then
					lib.loadTurtle(availableStorage, availableStorageKeys, essence, loaded)
					lib.loadCrafter(crafterName)
					lib.getCrystal()
					lib.runCrafter(crafterName, loaded)
					lib.storeOutput()
				end
			else	-- amount > 64
				local processed = 0
				local loaded = 0
				while totalInStorage > 0 and processed < R.size do	-- stop if run out of essence, or reached target
					if totalInStorage - 256 > 0 and R.size - processed >= 64 then
						loaded = 64
					elseif totalInStorage - 256 > 0 and R.size - processed > 0 then
						loaded = R.size - processed
					end
					lib.loadTurtle(availableStorage, availableStorageKeys, essence, loaded)
					lib.loadCrafter(crafterName)
					lib.getCrystal()
					processed = processed + loaded
					totalInStorage = totalInStorage - loaded * 4
					lib.runCrafter(crafterName, loaded)
					lib.storeOutput()
				end
			end
			lib.storeOutput()
		end
		return {"success"}
	end
end

function convertFarm()
	-- check position
	local blockType = T:getBlockType("down")
	if blockType:find("water") == nil then
		return {"Position not determined.\nMove to lower left corner over water. (Normal start position)"}
	end
	local withStorage = false
	if R.inventoryKey == "convertStorage" then
		withStorage = true
	end
	local response = createFarmNetworkStorage(withStorage, true)
	return {response}
end

function convertTreefarm()
	-- legacy farm had polished block on positions 4 / (10) from left corner
	-- R.data = "convert"
	-- R.down = true if storage is to be included
	if R.data == "convert" then
		R.down = false-- no storage built underneath
	elseif R.data == "convertStorage" then
		R.down = true
	end
	return createTreefarm() 
end

function convertWater()
	--[[
	if dry need enough buckets to place along (width + length - 1) / 2
	use 12 buckets
	start on floor + 1
	place slab down and water up along 2 edges. stay on this level
	return round same 2 edges removing slabs and and placing them 1 above
	placeUp water onto slabs on both edges
	repeat recover slabs, place 1 above , placeUp water
	
	for sloping water, place full area with slabs
	place sloping water on top of slabs
	remove slabs
	
	]]
	local lib = {}
	
	function lib.checkStartPosition()
		--[[
		0 T             -- T=turtle, W=wall, S=source, F=flowing
		1 W|S|F|F|F|F|F -- sloping flowing water
		2 W|F|F|F|F|F|F -- blocks removed after placing flowing water above
		3 W|S|S|S|S|S|S -- original sources
		4 W|?|?|?|?|?|? -- may be sources
		]]
		-- need to be on floor or R.height if specified
		local depth = 0
		local blockType = T:getBlockType("down")
		local isWaterUp, isSourceUp = T:isWater("up")
		local isWaterForward, isSourceForward = T:isWater("forward")
		local isWaterDown, isSourceDown = T:isWater("down")
		print("Block below is "..blockType)
		print("Water above is "..tostring(isWaterUp))
		print("Water forward is "..tostring(isWaterForward))
		print("Water below is "..tostring(isWaterDown))
		if blockType:find("water") == nil then -- on at least level 0
			print("Moving forward in 2 seconds...")
			sleep(2)
			T:forward(1)
			blockType = T:getBlockType("down")
			if blockType:find("water") ~= nil then
				print("Water found. Going down to floor")
				depth = -1
			else
				T:down(1)
				blockType = T:getBlockType("down")
				if blockType:find("water") ~= nil then
					depth = -2
				else
					return 0, "Not close to water. Aborting..."
				end
			end
		end
		while turtle.down() do
			depth = depth + 1
		end
		local emptyBuckets = utils.getEmptyBucketCount()
		for i = depth, 0, -1 do
			if emptyBuckets > 0 then
				lib.fillBuckets()
				emptyBuckets = utils.getEmptyBucketCount()
			end
			turtle.up()
		end
		
		return depth, ""
	end
	
	function lib.fillBuckets()
		local emptyBuckets = utils.getEmptyBucketCount()
		local direction = "forward"-- start with forward
		local isWater, isSource, isIce = T:isWater(direction)
		if emptyBuckets > 0 then
			if not isSource then
				direction = "down"
				isWater, isSource, isIce = T:isWater(direction)
				if not isSource then
					direction = "up"
					isWater, isSource, isIce = T:isWater(direction)
					if not isSource then
						direction = ""
					end
				end
			end
			if direction == "" then
				print("Unable to locate water source")
			else
				for i = 1, emptyBuckets do
					if utils.fillBucket(direction) then
						print("Bucket filled "..direction)
						sleep(0.3)
					else
						print("Unable to fill bucket ".. i .." / "..emptyBuckets)
					end
				end
			end
		end
		return utils.getWaterBucketCount()
	end
	
	function lib.placeSlabs(length)
		for i = 1, length do
			T:place("slab", "down", false)
			if i < length then
				T:forward(1)
			end
		end
	end
	
	function lib.placeSources(length, place)
		local moves = 1
		local waterBuckets = utils.getWaterBucketCount()
		-- place sources alternate positions + start and finish
		while moves < length do
			if place then
				if T:placeWater("up") then
					print("Placed source up")
					waterBuckets = waterBuckets - 1
				end
			end
			place = not place
			if moves < length then
				T:forward(1)
				moves = moves + 1
			end
			if waterBuckets == 0 then
				T:down(1) -- break the slab below
				waterBuckets = lib.fillBuckets()
				T:up(1)
				T:place("slab", "down", false)
			end
		end
		if T:placeWater("up") then -- end of length
			print("Placed final source up")
		end
		return place
	end
	
	function lib.moveSlabs(length)
		for i = 1, length do
			T:dig("down")
			T:up(1)
			T:place("slab", "down", true)
			if i < length then
				T:forward(1)
				T:down(1)
			end
		end
	end
	
	function lib.recoverSlabs(length)
		for i = 1, length do
			T:dig("down")
			if i < length then
				T:forward(1)
			end
		end
	end
	
	local depth, message = lib.checkStartPosition()
	if message ~= "" then
		return {message}
	end
	local maxDepth = R.height
	local buckets = utils.getWaterBucketCount()
	utils.calculateDimensions() -- if R.width or R.length == 0
	T:down(depth)
	lib.placeSlabs(R.length)
	T:go("R1")
	lib.placeSlabs(R.width)
	T:go("R2")
	
	while depth > 0 do
		local place = true
		lib.fillBuckets()
		place = lib.placeSources(R.width, place)
		T:go("L1")
		place = lib.placeSources(R.length, place)
		lib.fillBuckets()
		T:go("R2")
		lib.moveSlabs(R.length) -- dig slab from below, move up and replace below
		T:go("R1F1D1")
		lib.moveSlabs(R.width - 1)
		T:go("R2") -- now moved up 1 layer
		depth = depth - 1
		if depth == 0 then
			place = lib.placeSources(R.width, true)
			T:go("L1")
			place = lib.placeSources(R.length, place)
			T:go("R2")
			lib.recoverSlabs(R.length)
			T:go("R1")
			lib.recoverSlabs(R.width)
		end
	end
	
	return {}
end

function craftItem()
	return {"Not yet implemented"}
end

function createBlazeGrinder()
	-- starts facing cube, embedded in original floor
	T:go("D4F2 L1F4 R1U4")				-- place upper floor and slabs under it
	utils.placeFloor(9, 9, brick) 			-- place brick floor on level 10
	T:down(2)
	T:place(brick, "up")
	T:go("D1R2")
	utils.ceiling(true)						-- true uses slabs
	
	-- place lava
	T:go("L1F4 L1F4 U4")					-- through hole in ceiling
	T:go("F4 L1F4 R2")
	for i = 1, 4 do
		T:place("lava", "down")
		T:go("F8 R1")
	end
	T:go("F4 R1F4 D2 F1 R2")
	-- place sign and repair above
	T:dig("forward")
	T:place("sign", true, "")
	T:down(1)
	T:place(brick, "up")
	T:forward(1)
	-- place blocks under exit hole
	for i = 1, 4 do
		T:place(brick, "forward")
		T:turnRight(1)
	end
	-- place chest and hopper
	
	T:go("D2x2")
	if not T:place("chest", "down") then
		T:place("barrel", "down")
	end
	T:up(1)
	T:place("hopper", "down")
	utils.goBack(1)
	T:place("slab", "forward")
	T:go("R2F5U3")-- return to starting point and create entrance
	return {}
end

function createBoatLift()
	-- build stepped lift with fencing gates and soul sand
	local lib = {}
	
	function lib.getWater(backToWater, downToWater)
		if backToWater > 0 then
			utils.goBack(backToWater)
		end
		if downToWater > 0 then
			T:down(downToWater)
		end
		T:getWater("down") -- take water from source
		sleep(0.2)
		T:getWater("down") -- take water from source
		if downToWater > 0 then
			T:up(downToWater)
		end
		if backToWater > 0 then
			T:forward(backToWater)
		end
	end
	
	--T:place(blockType, direction, leaveExisting, signText)
	
	local backToWater = 0
	local downToWater = 0
	
	T:go("R1F1L1") 										-- over canal facing forward
	for h = 1, R.height do
		lib.getWater(backToWater, downToWater)			-- check water supplies, return to starting position
		T:go("L1C1 R1D1 L1C1 R1", false, 0, false)		-- place towpath, forward, down, place towpath, face forward
		T:place("soul", "down", false) 				-- place soulsand down
		T:place("soul", "forward", false) 			-- place soulsand forward
		T:go("R1F1C1L1", false, 0, false)				-- place right towpath face forward
		T:place("soul", "down", false) 				-- place soulsand down
		T:place("soul", "forward", false) 			-- place soulsand forward
		T:go("U1 R1C1 L1")								-- place towpath, face forward
		T:placeWater("down") 							-- place water down
		utils.goBack(1)
		T:place("gate", "forward", false) 			-- place fence gate
		T:go("R1C1 U1C1 D1 L2F1 C1R1 F1 L1C1R1")		-- over left soul sand
		T:placeWater("down") 							-- place water down
		utils.goBack(1)
		T:place("gate", "forward", false) 			-- place fence gate
		T:go("U1 L1C1 R1F1 L1C1 R1x1")					-- facing forward first unit complete
		T:go("R1F1 L1x1 R1C1")
		utils.goBack(1)
		T:go("L1F1")
		if backToWater == 0 then
			backToWater = 1
		end
		backToWater = backToWater + 1
		downToWater = downToWater + 1
	end
	
	-- now finish the canal
	lib.getWater(backToWater, downToWater)
	T:go("D1 L1C1 U1C1")					-- build left towpath, facing towpath, above water level
	T:go("R1F1 L1C1 D1C1")					-- move forward, build towpath, facing towpath ground level
	T:go("R1C1 R1F1 L1C1 R1C1 U1C1")		-- build right towpath, facing towpath, above water level
	T:go("R1F1 L1C1 D1C1 U1")				-- build right towpath next to gate, facing towpath, above water level
	T:placeWater("down") 
	utils.goBack(1)
	T:go("L1F1")
	T:placeWater("down")  
	
	return {}
end

function createBorehole()
	--[[go down to bedrock and return. Chart all blocks dug/ passed through]]
	local diary = {}
	local lib = {}
	local depth = R.height	-- eg 63 start position
	local moves = 0
	--R.height = current level
	
	function lib.addBlock(depth, blockType, diary)
		if blockType == "" then
			blockType = "air"
		end
		table.insert(diary, blockType)
		
		
		--[[if blockType ~= "" then
			local add = true
			for k,v in pairs(diary) do
				if blockType == v then
					add = false
					break
				end
			end
			if add then
				diary[depth] = blockType
			end
		end]]
		
		return diary
	end
	
	function lib.processItem(item)
		if item:find("minecraft") ~= nil then
			return item:sub(11)
		end
		return item
	end
	
	function lib.writeReport(diary)
		local numLevels = #diary						-- eg 125 levels
		local levelsPerCol = math.ceil(numLevels / 4)	-- eg 31.25 -> 32
		local lines = {}
		for l = 1, levelsPerCol do						-- add 32 empty strings
			table.insert(lines, "")
		end
		local lineNo = 1
		for k, v in ipairs(diary) do
			local level = R.height - k 					-- eg 63 range 63 to -59
			local lev = "      "
			local item = lib.processItem(v)
			if level < -9 then
				lev = tostring(level).."   "			-- "-10   " to "-59   "
			elseif level < 0 then				
				lev = "-0"..math.abs(level).."   "		-- "-09   " to "-01   " 
			elseif level < 10 then
				lev = " 0"..level.."   "				-- " 01   " to " 09   "
			elseif level < 100 then
				lev = " "..level.."   "					-- " 10   " to " 99   "
			else
				lev = " "..level.."  " 					-- " 100  " to " 319  "
			end
			local output = lev..item					-- eg "-10   grass_block"
			if #output > 20 then						-- eg "-10   some_long_block_name"  
				output = output:sub(1, 20)				-- eg "-10   some_long_block_" 
			else
				output = menu.padRight(output, 20, " ")	-- eg "-10   grass_block     "
			end
			lines[lineNo] = lines[lineNo]..output		-- add new entry to this line
			lineNo = lineNo + 1							-- increase line no
			if lineNo > levelsPerCol then				-- past last line number
				lineNo = 1								-- reset to 1
			end
		end
		
		local fileName = "borehole"..os.getComputerID()..".txt"
		local handle = fs.open(fileName, "w") 		--create file eg "borehole0.txt"
		handle.writeLine("Level Block         Level Block         Level Block         Level Block")
		for k,v in ipairs(lines) do
			handle.writeLine(v)
		end
		
		handle.close()
		
		return fileName
	end
	
	local blockType = T:getBlockType("down")
	while T:down(1) do
		depth = depth - 1
		moves = moves + 1
		if depth == R.depth then
			break
		end
		diary = lib.addBlock(depth, blockType, diary)
		blockType = T:getBlockType("down")
	end
	local fileName = lib.writeReport(diary)
	T:up(moves)
	
	return {"File '"..fileName.."' written"}
end

function createBubbleLiftOLD()
	menu.clear()
	local message = 
[[~red~Additional blocks may be required
~yellow~Observe turtle when collecting water

Right-click if not operating
Add 64 blocks of any stone

~lime~Press Enter to continue
]]
	menu.colourText(1, message)
	read()
	menu.clear()
	local dirt = "minecraft:dirt"
	if T:getItemSlot("minecraft:soul_sand") > 0 then
		dirt = "minecraft:soul_sand"
	end
	local turn, oTurn = "R", "L"								-- build column on right side
	
	local lib = {}
	
	function lib.addLayer(closeSide)
		if closeSide == nil then closeSide = true end
		if closeSide then
			T:go("R1C1 R1C1 R1C1 R1F2 L1C1 R1C1 R1C1 L1", false, 0, true) -- T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
		else
			T:go("R2C1 R2F2C1", false, 0, true)
		end
		turtle.back()
		T:dig("up")	-- clear block above so completed lift can be found
		T:placeWater("forward") 
		turtle.back()
		T:go("C1x0")		
	end
		
	function lib.buildLift(toHeight)
		local built = lib.goToWater() 		-- returns lift blocks already placed, total height of drop from starting point
		local toBuild = toHeight - built 	-- no of blocks remaining to increase lift size
		local waterBuckets = 0
		local entryLayer = 0
		while toBuild > 0 do 				-- at least 1 block height remaining
			entryLayer = entryLayer + 1
			if entryLayer == 1 then
				waterBuckets = lib.fillBuckets(true) -- emty trash and arrange buckets
			else
				waterBuckets = lib.fillBuckets(false) -- no of water buckets onboard (could be more than required)
			end
			if waterBuckets > toBuild then			-- more water than required
				waterBuckets = toBuild				-- reduce to correct amount
			end
			T:up(built)						-- climb to top of existing lift
			while waterBuckets > 0 and toBuild > 0 do
				if entryLayer > 2 then
					lib.addLayer(true)
				else
					lib.addLayer(false)
				end
				entryLayer = entryLayer + 1
				waterBuckets = waterBuckets - 1
				T:up(1)
				toBuild = toBuild - 1
			end
			-- may still be some height to complete, but needs refill
			if toBuild > 0 then
				built = lib.goToWater() --return to source
				toBuild = toHeight - built
				--lib.fillBuckets(toBuild)
			end
		end
	end
	
	function lib.createSource()
		-- place source at ground level, start above soul sand position, facing along source
		--T:go("F2C1"..turn.."1F1C2 L1C1 R2C1 L1F1C2 L1C1 R2C1 L1F1C2 L1C1 R1C1 R1C1 R1U1", false, 0, true)	-- end of source facing Start
		T:go("C2F1 L1C1 R2C1 L1F1C2 L1C1 R2C1 L1F1C2 L1C1 R1C1 R1C1 R1U1", false, 0, true, R.useBlockType)	-- end of source facing Start
		T:placeWater("down") 											-- place back water source
		T:forward(2)
		T:placeWater("down") 											-- place front water source
		T:go("F1R2C2", false, 0, true, R.useBlockType)
		-- |W|W|W|S|C now at position S facing source water: starting point and direction, 1 above ground level
	end
	
	function lib.fillBuckets(withSort)
		local emptyBuckets = T:getItemCount("minecraft:bucket")
		for i = 1, emptyBuckets do
			if T:getWater("down") then
				sleep(0.5)
			end
		end
		if T:getItemCount("stone") < 16 then
			T:checkInventoryForItem({"stone"}, {64}, true)
		end
		
		return T:getItemCount("minecraft:water_bucket")
	end
		
	function lib.goToWater()
		local built = 0 -- measures completed lift height
		while turtle.down() do -- takes turtle to bottom of water source
			if turtle.detect() then
				built = built + 1
			end
		end
		T:up(1) -- above watersource ready to fill buckets
		-- height = height - 1
		-- built = built - 1 not required as next block is water source: not detected
		--lib.fillBuckets(R.height - built, false)
		return built -- , height
	end
	
	function lib.isLadder()
		for i = 0, 3 do
			local blockType = T:getBlockType("forward")
			if blockType:find("ladder") ~= nil then 
				return true, i
			end
			turtle.turnRight()
		end
		return false, 0
	end
	
	function lib.stackBuckets(withSort)
		if withSort == nil then withSort = false end
		local data = {}
		local noEmpty = false
		if withSort then
			T:emptyInventorySelection("up", {"minecraft:bucket", "minecraft:water_bucket", R.useBlockType}, {12, 12, 192})
		end
		-- iterate all slots
		for i = 1, 16 do
			if turtle.getItemCount(i) > 0 then
				data = turtle.getItemDetail(i)
				if data.name == "minecraft:bucket" then
					if data.count > 1 then
						turtle.select(i)
						while turtle.getItemCount(i) > 1 do
							local empty = T:getFirstEmptySlot()
							if empty > 0 then
								turtle.transferTo(empty)
							else
								noEmpty = true
								break
							end
						end
						if noEmpty then break end
					end
				end
			end
		end
		local emptySlots = T:getEmptySlotCount()
		local waterBuckets = T:getItemCount("minecraft:water_bucket")
		local emptyBuckets = T:getItemCount("minecraft:bucket")
		return emptySlots, waterBuckets, emptyBuckets
	end
	
	local ladder, turns = lib.isLadder()							-- is ladder next to turtle?, If yes then turns to right is returned
	if ladder then													-- ladder found and facing it
		T:go("L"..turns)											-- face gap next to ladder
		if turns == 1 then
			turn = "L"												-- build column on left side
			oTurn = "R"
		end 
	end
	R.height = math.abs(R.upperLevel - R.lowerLevel)
	R.currentLevel = R.startLevel	-- eg 64 going down
	R.useBlockType = T:getMostItem("", false)
	local emptyBuckets = T:getItemCount("minecraft:bucket")
	if emptyBuckets > 10 then
		T:dropItem("minecraft:bucket","up", 10)
	end
	
	if ladder then
		T:go("F1"..turn.."1")										-- backing ladder column, on floor
		lib.createSource()											-- starting position, but up 1
		if T:getItemCount("sign") >= 4 then
			T:go(oTurn.."1F1"..turn.."1C1 U1C1"..oTurn.."2F1"..oTurn.."2", false, 0, true, R.useBlockType)-- back of ladder column
			T:place("sign", "forward", false, "Lift to\nsurface")		-- top sign
			T:go("D1")													-- down
			T:place("sign", "forward", false, "Travel at\nown risk")	-- lower sign
			T:go("D1F1"..turn.."1F1U1C2"..oTurn.."1", false, 0, true, R.useBlockType)
		end
		T:go(turn.."1F1"..oTurn.."1C1 U1C1"..turn.."2F1"..turn.."2", false, 0, true, R.useBlockType)-- will now have removed ladder 3rd block from ground, facing lift entrance
		T:place("sign", "forward", false, "Lift to\nsurface")		-- top sign
		T:go("D1")													-- down
		T:place("sign", "forward", false, "Travel at\nown risk")	-- lower sign
		T:go(oTurn.."1B1")
		T:place("ladder", "forward")
		T:up(1)
		T:place("ladder", "forward")
		T:up(1)
		T:place("ladder", "forward")
		T:go("D3"..turn.."1F1"..oTurn.."1F2"..turn.."1U1")
		T:place(dirt, "down")										-- soul sand placed at end of source
		T:go("F2R1x1 L2x1 U1x1 R2x1 R1D1")							-- centre of source, facing column
	else
		T:go("F2"..turn.."1")										-- backing ladder column, on floor
		lib.createSource()											-- starting position, but up 1
		T:go(turn.."1F1"..turn.."1C1 U1C1"..turn.."2F1"..turn.."2", false, 0, true, R.useBlockType)	-- return to start, place blocks to support signs
		T:place("sign", "forward", false, "Lift to\nsurface")		-- top sign
		T:go("D1C0", false, 0, true, R.useBlockType)												-- down and block above
		T:place("sign", "forward", false, "Travel at\nown risk")	-- lower sign
		T:go("D1C0 F1R2 C1"..oTurn.."1F1R2C1"..turn.."1U1"..turn.."2", false, 0, true, R.useBlockType)	-- ground level, return to soul sand site, go up
		T:place(dirt, "down")										-- soul sand placed at end of source
		T:go("F2R1x1 L2x1 U1x1 R2x1 R1D1")							-- centre of source, facing column
	end
	--lib.fillBuckets(R.height, true)									-- fill as many buckets as required or until inventory full, sort inventory as well
	-- ready to build lift
	local height = R.height + math.abs(R.currentLevel)
	lib.stackBuckets(true)
	lib.buildLift(height - 1)
	
	return {"Bubble lift created", "Check correct operation", "Check exit before using" }
end

function createBubbleLift()
	-- Normal start at top- if start from bottom:
	-- move in to column
	-- dig directly up to upperLevel
	local lib = {}
	
	function lib.addPipe()
		for j = 1, 4 do
			-- go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
			T:go("C1R1", false, 0, true)
		end
	end
	
	function lib.placeKelp()
		T:place("minecraft:kelp", "forward")
		T:up(1)
	end
	
	local drop = 0
	if R.down then
		menu.colourPrint("Wait for my return!", colors.yellow)
	end
	R.height = math.abs(R.upperLevel - R.lowerLevel)
Log:saveToLog("createBubbleColumn(): R.height = "..R.height, true)
	if R.up then
		T:go("F1U"..R.height)
	end
	local atBedrock = false
	local blockType = T:getBlockType("down")
	for i = 1, R.height do
		if blockType:find("bedrock") == nil then	-- not at bedrock
			T:down(1)
			drop = drop + 1
			lib.addPipe()
			if i == 1 then
				T:placeWater("forward")
			end
			blockType = T:getBlockType("down")
		else 										-- at bedrock
			atBedrock = true
			break
		end
	end
	if atBedrock then
		T:up(1)
		drop = drop - 1
	else
		T:dig("down")
	end
	if not T:place("minecraft:soul_sand", "down") then
		T:place("minecraft:dirt", "down")
	end
	T:go("R2F1R2C2")
	lib.placeKelp()
	T:place("sign", "down", false, "UP!")
	lib.placeKelp()
	T:place("sign", "down", false, "GOING")
	for i = 1, drop - 2 do
		lib.placeKelp()
	end
	while turtle.down() do end	-- on top of signs				
	T:go("F1D1x2 U1B1")			-- break kelp and move over it, down 1, break last piece, return to column
	for i = 1, drop - 2 do
		T:go("U1C2")
	end
	
	return {"Bubble column completed "..drop.. " blocks"}
end

function createClayfarm()
	
	R.useBlockType = T:getMostItem("minecraft:dirt", true)		-- exclude dirt from choice
	
	local lib = {}
	
	function lib.waterSource()
		--make 3 x 1 water source
		T:go("L1F1 R1F1 R1")
		T:go("C2F1 C2F1 C2F1 C2F1 C2")
		T:go("R1F1 C2F1 R1")
		T:go("C2F1 C2F1 C2F1 C2F1 C2")
		T:go("R1F1 C2R1 F1")
		T:go("D2 F1x0 F1x0 U2")
		T:place("slab", "down")
		T:back(2)
		T:place("slab", "down")
		T:go("F1D2 C1R2 C1U1 C2")
		T:placeWater("forward")
		T:turnRight(2)
		T:placeWater("forward")
		T:go("U1B1 L1")
	end
	
	function lib.buildWall(length)
		for i = 1, length do 
			T:go("F1x0 x2C2", false, 0, false, R.useBlockType)
		end
	end
	
	-- starts behind SW corner
	lib.waterSource()	-- ends at starting position
	for i = 1, 4 do
		lib.buildWall(11)
		T:go("R1")
	end
	T:go("F1R1 F1L1 D2")						-- 2 blocks below surface grass / dirt
	utils.createBasement(true, true, 10, 10)	-- remove 3 layers
	T:down(2)
	utils.createBasement(true, true, 10, 10)
	T:up(1)
	R.up = true
	R.width = 10
	R.length = 10
	R.useBlockType = "slab"
	createFloorCeiling()
	T:down(1)
	R.useBlockType = "minecraft:pointed_dripstone"
	createFloorCeiling()
	T:go("R2D1C2 F1x0C2 F1x0C2 F1x0C2 C1U1C1")
	T:place("ladder","down")
	T:go("U1C1")
	T:place("ladder","down")
	T:go("U1C1")
	T:place("ladder","down")
	T:go("U1C1")
	T:place("ladder","down")
	T:go("B1")
	T:place("water", "forward")
	T:go("U1R2")
end

function createCorridor()
	--[[create a corridoor 2 blocks high, with floor and ceiling guaranteed
	T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)]]
	local lib = {}
	
	function lib.continue(currentSteps, totalSteps)
		if not R.silent then
			if currentSteps >= 64 and R.length == 0 then
				-- request permission to continue if infinite
				T:clear()
				print("Completed "..totalSteps..". Ready for 64 more")
				print("Do you want to continue? (y/n)")
				response = read()
				if response:lower() ~= "y" then
					return true, 0
				else
					return false, currentSteps
				end
			end
		end
		return true, currentSteps
	end
	
	function lib.seal()	
		local blockType = T:getBlockType("forward")
		if blockType:find("water") ~= nil then
			T:place("stone", "forward", false)
			return "water"	-- water found
		elseif blockType:find("lava") ~= nil then
			T:place("stone", "forward", false)
			return "lava"	-- lava found
		end
		return ""	-- no water or lava
	end
	
	function lib.checkSeal()
		local fluidType = ""
		if R.data == "seal" then 		-- check for lava/water at the sides
			T:turnRight(1)
			fluidType = lib.seal()		-- could be "", "water", "lava"
			T:turnLeft(2)
			local blockType = lib.seal()
			if fluidType == "" then		-- no water / lava so far
				fluidType = blockType	-- could be "", "water", "lava"
			end
			T:turnRight(1)
		end
		return fluidType				-- could be "", "water", "lava"
	end
	
	function lib.placeTorch(torchSpaces, totalSteps)
		if R.torchInterval > 0 then -- torches onboard
			if torchSpaces == R.torchInterval then -- time to place another torch
				if totalSteps < R.length then -- not at end of run
					if T:getItemSlot("minecraft:torch") > 0 then
						T:place("minecraft:torch", "down")
					end
					torchSpaces = 1
				end
			end
		end
		return torchSpaces -- original value or 1
	end
	
	if T:getItemSlot("minecraft:torch") == 0 then
		R.torchInterval = 0 -- set to default 9 in getTask()
	end
	local currentSteps = 0					-- counter for infinite length. pause every 64 blocks
	local totalSteps = 0					-- counter for all steps so far
	local torchSpaces = R.torchInterval		-- if torches present, counter to place with 8 blocks between
	local fluidType = ""
	local damLength = 0
	local damStarted = false
	local doContinue = true
	
	for steps = 1, R.length do
		-- starts on floor of tunnel
		doContinue, currentSteps = lib.continue(currentSteps, totalSteps) -- continue tunnelling?
		if not doContinue then
			break
		end
		T:go("C2U1C0", false, 0, true)		-- place floor, up 1, place ceiling
		fluidType = lib.checkSeal()			-- if R.data == "seal", check for water/lava at ceiling level
		if fluidType == "" then				-- either R.data ~= "seal" or no fluid found
			torchSpaces = lib.placeTorch(torchSpaces, totalSteps) -- original value or 1 if torch placed
			T:go("F1D1")
		elseif fluidType == "water" then
			T:go("F1R2 C1D1 C1L2", false, 0, true)
			damStarted = true
			damLength = damLength + 1
		else	--lava
			T:go("F1D1")
		end
		blockType = lib.checkSeal()
		if blockType ~= "" then
			fluidType = blockType
		end
		currentSteps = currentSteps + 1
		totalSteps = totalSteps + 1
		torchSpaces = torchSpaces + 1
		if damStarted and fluidType == "" then -- was in water, but no more
			T:go("R2 F"..damLength + 1 .."U1L2F"..damLength + 1 .."D1")
			damStarted = false
		end
	end
	if fluidType ~= "" then -- water or lava found while tunnelling
		T:go("U1C0", false, 0, true)
		lib.checkSeal()
		T:go("C1", false, 0, true)
		T:down(1)
	end
	return {}
end

function createDirectedPath()
	-- allow user to control length / width of each path
	-- T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	--local pp = utils.getPrettyPrint()
	local lib = {}
	
	function lib.forward()
		if R.subChoice == 1 then
			for i = 1, R.length do
				T:go("F1x0C2", false, 0, true)
			end
		else
			for i = 1, R.length do
				T:go("F1U1C0D1C2", false, 0, true)
			end
		end
	end
	
	function lib.back()
		for i = 1, R.length do
			turtle.back()
		end
	end
	
	function lib.left()
		T:turnLeft(R.length)
	end
	
	function lib.right()
		T:turnRight(R.length)
	end
	
	function lib.up()
		if R.subChoice == 1 then
			T:go("U2R2 x1R2 D1C2", false, 0, true)
		else
			T:go("U2R2 x1R2C0 D1C2", false, 0, true)
		end
	end
	
	function lib.down()
		T:go("D1C2", false, 0, true)
	end
	
	if R.data == "menu" then
		-- mimics direct commands using f.lua, r.lua etc with space between commands and number
		local width = 0
		local length = 0
		local choices =
		{
			"Forward 1 block",
			"Forward # blocks",
			"Back 1 block",
			"Back # blocks",
			"Turn Right",
			"Turn Left",
			"Up 1 block",
			"Down 1 block",
			"Quit"
		}
		local choice, modifier
		pp.itemColours = {colors.lime, colors.lime, colors.green, colors.green, colors.orange, colors.orange, colors.cyan, colors.cyan, colors.gray}
		while choice ~= 9 do
			choice, modifier = menu.menu("Choose next step", choices, pp, "Type number + Enter ")
			if choice == 1 then
				R.length = 1
				lib.forward()
			elseif choice == 2 then
				-- getInteger(prompt, minValue, maxValue, row, fg, bg, default) 
				R.length = menu.getInteger("Move forward how many blocks?", 1, 250, nil, colors.lime)
				lib.forward()
			elseif choice == 3 then
				R.length = 1
				lib.back()
			elseif choice == 4 then
				R.length = menu.getInteger("Move back how many blocks?", 1, 250, nil, colors.green)
				lib.back()
			elseif choice == 5 then
				R.length = 1
				lib.right()
			elseif choice == 6 then
				R.length = 1
				lib.left()
			elseif choice == 7 then
				lib.up()
			elseif choice == 8 then
				lib.down()
			end
		end
	else
		local instructions = 
[[~lightGray~Commands:

direction + ~blue~number ~yellow~eg ~white~f2 ~yellow~= forward ~blue~2
~lightGray~direction without number = ~blue~1

~yellow~f = forward  ~orange~b = backward
~lime~l = left     ~red~r = right
~lightGray~u = up       ~cyan~d = down

~red~q = quit

]] -- Direct control
		local cmd = ""
		while cmd ~= "q" do
			local line = menu.clear()
			line = menu.colourText(line, instructions)
			-- menu.getString(prompt, withTitle, minValue, maxValue, row, fg, bg, default) 
			input = menu.getString("command ", false, 1, 5, line, colors.yellow, colors.black):lower()
			-- remove spaces
			input = input:gsub( " ", "")
			cmd = input:sub(1,1)
			R.length = 1
			if #input > 1 then
				R.length = tonumber(input:sub(2))
			end
			if cmd == "q" then
				return{"User has quit application"}
			end
			if cmd == "f" then
				lib.forward()
			elseif cmd == "b" then
				lib.back()
			elseif cmd == "l" then
				lib.left()
			elseif cmd == "r" then
				lib.right()
			elseif cmd == "u" then
				lib.up()
			elseif cmd == "d" then
				lib.down()
			end
		end
	end
	return {}
end

function createDiveColumn()
	-- place a series of doors in deep water to make a dive column
	-- go to sea bed
	local block = T:getMostItem("door", false)
	local moves = 0
	local lib = {}
	
	function lib.placeDoor()
		-- place block, door above, open it, move above.
		T:place(block, "forward")					
		T:go("U1")
		T:place("door", "forward")
		rs.setAnalogOutput("front", 15)
		T:up(2)							-- above door
	end
	
	while turtle.down() do
		moves = moves + 1						-- increment counter
	end
	
	T:go("F1R2")								-- on sea bed. clear any block in front
	while moves > 0 do							-- head back to surface
		lib.placeDoor()
		T:go("F3R2")
		if moves < 3 then break end
		moves = moves - 3
	end
	return {"Dive column created"}
end

function createDragonTrap()
	-- build up 145 blocks with ladders
	T:clear()
	local text = 
[[~yellow~You ~red~MUST ~yellow~have already constructed a 
bridge / tunnel into the dragon island
to allow for safe construction of the
dragon trap.

If not use toolkit:
  ~brown~5.~gray~2 Covered path or tunnel~yellow~ length 100
  
start centre of obsidian platform:
  100,49,0 facing west
~orange~Enter to continue]]
	menu.colourText(1, text)
	read()
	menu.colourPrint("Press Enter to start 1 minute delay\n", colors.red)
	menu.colourPrint("Run to island centre across the bridge\n", colors.orange)
	menu.colourPrint("You have already made the bridge?...", colors.lime)
	read()
	for t = 60, 1, -1 do
		sleep(1)
		T:clear()
		io.write("Starting in "..t.. " seconds ")
	end
	for i = 1, 145 do
		T:go("U1C2")
		turtle.back()
		T:place("minecraft:ladder", "down")
		turtle.forward()
	end
	T:go("R2F1C1 L1C1 L2C1 R1")
	for i = 1, 100 do
		T:go("F1C2U1C0D1")
	end
	T:forward(1)
	T:place("minecraft:obsidian", "down")
	T:go("R2F1x2R2")
	T:placeWater("forward") 
	T:go("R2F6R2")
	attack()
	
	return {}
end

function createEnclosure()
	local lib = {}
	
	function lib.placeBarrel()
		if R.inventoryKey == "barrel" then
			utils.goBack(1)
			T:go("L1F1")
			T:place("barrel", "down", false)
			utils.goBack(1)
			T:go("R1")
			T:forward(1)
		end
	end
	
	function lib.placeTorch()
		T:up(1)
		local up = 1
		local blockType = T:getBlockType("forward")
		while blockType:find(R.useBlockType) ~= nil and blockType ~= "" do -- prevent continuous upward travel
			T:up(1)
			up = up + 1
			blockType = T:getBlockType("forward")
		end
		T:place("torch", "forward", true)
		T:down(up)
	end
	
	function lib.buildWall(length)
		-- T:place(blockType, direction, leaveExisting, signText)
		local blockType = ""
		local blocks = 0
		lib.placeBarrel()
		while blocks < length do
			if turtle.back() then
				T:place(R.useBlockType, "forward", true)
				if R.torchInterval > 0 then
					if blocks == 0 or blocks % R.torchInterval == 0 then
						lib.placeTorch()
					end
				end
				blocks = blocks + 1 -- still facing start position
				while turtle.down() do
					T:place(R.useBlockType, "up", true)
				end
			else -- obstruction
				T:turnRight(2) -- facing away from start
				blockType = T:getBlockType("forward")
				if blockType:find("torch") ~= nil then
					T:go("F1R2")
					T:place(R.useBlockType, "forward")
					blocks = blocks + 1 -- facing start
				elseif blockType:find("log") ~= nil then
					T:harvestTree()
					T:turnRight(2)
					T:place(R.useBlockType, "forward")
					blocks = blocks + 1 -- facing start
				elseif T:isVegetation(blockType) then
					T:go("F1R2")
					T:place(R.useBlockType, "forward")
					blocks = blocks + 1 -- facing start
				else -- cant go forward, go up instead
					while turtle.detect() and blockType:find("torch") == nil and blockType:find("log") == nil and not T:isVegetation(blockType) do -- block ahead, but not torch or tree
						while turtle.detectUp() do -- will only run if block above
							utils.goBack(1)
							blocks = blocks - 1
						end
						turtle.up()
						T:place(R.useBlockType, "down", true)
						blockType = T:getBlockType("forward")
					end
					T:turnRight(2) -- facing start
				end
			end
		end
	end
	R.useBlockType = T:getMostItem("", false)
	T:turnRight(2) --facing start position
	if R.width == 0 then -- single fence
		lib.buildWall(R.length)
	else	
		lib.buildWall(R.length - 1)
		T:go("R1") -- facing start so left turn = turnRight
		lib.buildWall(R.width - 1)
		T:go("R1")
		lib.buildWall(R.length - 1)
		T:go("R1")
		lib.buildWall(R.width - 2)
		T:go("U1")
		T:place(R.useBlockType, "down", true)
	end
	
	return {"Wall or fence completed"}
end
	
function createFarmNetworkStorage(withStorage, removeLegacy)
	if removeLegacy == nil then removeLegacy = false end
	-- new or converted farm will have:
	-- 2 modems, 1 barrel per plot
	-- primary plot and storage needs 1 modem, 1 barrel, 8 chests
	local lib = {}
	
	function lib.placeNetwork(count, pattern)
		for i = 1, count do
			T:place("computercraft:cable", "up", true)
			if i < count then
				T:go(pattern)
			end
		end
	end
	
	-- called when starting at lower left side of plot, facing crops
	if removeLegacy then
		T:go("L1F1")
		local blockType = T:getBlockType("down")
		if blockType == "minecraft:chest" or blockType == "minecraft:barrel" then
			while turtle.suckDown() do end	-- barrel/chest used to be present
		--T:dig("down", false)	-- do not bypass chests
			turtle.digDown()
			T:place("dirt", "down")
		end
		T:go("R2F1")	-- back over water
		while turtle.suck() do end	-- in case barrel / chest in front
		T:go("F1L1 F1U1 R2")	-- remove barrel/wall or double chest. face tree
		T:place("stone", "down")
		T:forward(1)
		T:place("modem", "down")
		-- could be tree/sapling in front
		T:forward(1)
		if T:getBlockType("down") == "minecraft:dirt" then
			T:place("barrel", "down")
			T:go("U1x0")
			T:place("dirt", "up")
			T:go("B1U2")
			if T:getBlockType("forward"):find("log") ~= nil then
				T:place("sapling", "forward")
			end
			T:go("D3F1 R1F1")
		else
			T:place("barrel", "down")
			T:go("R1F1")
		end
		while turtle.suckDown() do end
		T:place("modem", "down")
		U.attachModem()
		T:clear()
		T:go("F1x2 R2C2 F1L1 F1D1")
	end
	
	T:go("L1D3") -- move below crop field, face N
	utils.createBasement(true, true, 10, 10)	-- ends facing N 1 block below water source
	-- Close all leaking water sources
	T:go("U1 L1C1 L1C1")
	T:go("B1C1 B8 R1C1 R1C1 L1")				-- move N backwards along W edge, end facing W on N edge
	T:go("B1C1 B8 R1C1 R1C1 L1")
	T:go("B1C1 B8 R1C1 R1C1 L1")
	T:go("B1C1 R2F7 L1F1 R1F1x1 R2C1 B1L1") 	-- move to corner, face W along front edge
	-- 1 block below barrel, facing N. If farm to left, will be cable above
	
	T:place("computercraft:cable", "up")		-- cable placed under barrel
	T:go("F1R2 C1x0")							-- block placed under cable, block above removed
	T:place("computercraft:cable", "up")		-- cable placed up
	T:go("B1C1 R2")								-- 
	lib.placeNetwork(9, "F1x0x2")
	
	for i = 1, 3 do
		T:go("R1C1 L1F1")							-- in NW corner, facing N
		T:place("computercraft:cable", "up")
		T:go("R2C1 L1")								-- 1 block below NW corner, facing E
		T:go("F1x0 F1x0 R2 F1C1")						-- in NW corner, facing E, 2 blocks further E
		T:place("computercraft:cable", "up")
		T:go("B1C1 R2")									-- in NW corner, facing E, 2 blocks further E
		lib.placeNetwork(9, "F1x0x2") 
	end
		
	T:go("R1C1 L1F1")							-- in SE corner, facing S
	T:place("computercraft:cable", "up")
	T:go("R2C1")								-- under network under barrel, facing E side
	
	if withStorage then
		T:go("F2R2 C1R2 F3L1")					-- under mid network cable run facing in
		lib.placeNetwork(6, "D1")				-- build cable down under floor level
		lib.placeNetwork(6, "F1x0")				-- continue under floor to chest area
		T:go("F1U2")
		T:place("computercraft:cable", "down", true)
		T:go("U1")
		T:place("computercraft:cable", "down", true)
		T:go("U1")
		utils.createStorage()					-- places modem and chests
		-- R.data used for "new" or extension direction: "right" or "back"
		if R.data == "new" then
			T:go("L2F5 R1D1 F5L1 F2L1")			-- ends 4 below south edge, 1 block south S, facing E
		end
	else
		if R.data == "new" then
			T:go("R1F1 R2C1 R1D2")				-- ends 4 below south edge, 1 block south S, facing E
		end
	end
	if R.data == "new" then
		for i = 1, 5 do
			T:go("C1U1")
			T:place("ladder", "down")
		end
	else
		T:go("D1C0 D1")
	end
	
	return "Farm created with networking"
end

function createFarm()
	-- R.data used for "new" or extension direction: "right" or "back"
	-- R.networkFarm = true. All farms will use network storage
	-- R.goDown = true (build storage)	
	-- R.misc = true = pumpkin / melon
	
	local lib = {}

	function lib.addWaterSource(pattern)
		-- pattern = {"d","c","c","d"} t = place crafting  instead of dirt
		-- place(self, blockType, damageNo, direction, leaveExisting, signText)
		T:go("D1x2C2", false, 0, false, R.useBlockType)
		for i = 1, 4 do
			T:dig("forward")
			if pattern[i] == "d" then
				T:place("dirt", "forward", false)
			-- elseif pattern[i] == "t" then
				-- if T:place(storage, "forward", false) then
					-- if T:dropItem("crafting", "forward", 0) then
						-- print("Crafting table -> buried storage")
					-- end
				-- else
					-- T:place("dirt", "forward", false) -- dirt if no storage available
				-- end
			elseif pattern[i] == "c" then
				T:place(R.useBlockType, "forward", false)
			end
			T:turnRight(1)
		end
		T:up(1)
		T:placeWater("down")	-- ends facing same direction as started, over water source
	end
	
	function lib.placeDirt(count, atCurrent)
		if atCurrent then
			local blockType = T:getBlockType("down")
			if blockType:find("dirt") == nil and blockType:find("grass_block") == nil then
				T:place("dirt", "down", false)
			end
		end
		for  i = 1, count do
			T:forward(1)
			T:dig("up")
			local blockType = T:getBlockType("down")
			if blockType:find("dirt") == nil and blockType:find("grass_block") == nil then
				T:place("dirt", "down", false)
			end
		end
	end

	function lib.placeStorage(storage, storageBackup)
		T:dig("down")
		if not T:place(storage, "down", false) then-- place barrel/chest below
			T:place(storageBackup, "down", false) -- place chest below
		end
	end
	
	local blockType = ""
	
	local numPlots = 0
	local storage, storageBackup = utils.setStorageOptions()	-- storage type(s) onboard eg "barrel", "barrel"
	R.useBlockType = T:getMostItem("minecraft:dirt", true)		-- exclude dirt from choice
	if R.data == "right" then				-- extendFarm called. Position should be facing crops
		T:up(1)
		utils.goBack(1)
		repeat
			T:forward(11)
			numPlots = numPlots + 1
		until not utils.isStorage("down") 	-- on top of chest, barrel or modem
		T:go("R1F1R2")						-- move to front right corner of last plot on right side
	elseif R.data == "back" then			-- extendFarm called. Position should be facing crops
		T:go("L1U1")
		utils.goBack(1)
		repeat
			T:forward(11)
			numPlots = numPlots + 1
		until not utils.isStorage("down") 	-- on top of chest, barrel or modem
		T:go("L1F1 R1x2")					-- could dig tree or sapling + block below
	else 									-- new farm.
		T:up(1) 							-- assume on the ground, go up 1
	end
	
	-- design change: sapling placed 2 blocks above corner for ease of walking round
	-- barrel on corner
	-- modems on each side N/E
	T:place("barrel", "down", false)

	-- stage 2 place sapling
	T:up(3)
	T:place("dirt", "down")
	T:up(1)
	T:place("sapling", "down") -- plant sapling
	T:go("F1D4")
	T:place("modem", "down", false)
	U.attachModem()
	T:forward(1)
	T:place(R.useBlockType, "down", false)

	if R.data == "right" then -- cobble wall exists so go forward to its end
		T:forward(9)
	else -- new farm or extend forward
		for i = 1, 9 do -- complete left wall to end of farm
			T:go("F1 x0x2 C2", false, 0, false, R.useBlockType)
		end
	end
	-- T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	T:go("R1F1 R1x0 x2C2 F1D1", false, 0, false, R.useBlockType)-- turn round ready for first dirt col
	lib.addWaterSource({"d","c","c","d"}) -- water at top of farm
	lib.placeDirt(9, false) 	-- place dirt back to start
	-- water source next to modem
	lib.addWaterSource({"c","c","d","d"})
	-- T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock
	T:go("U1F1L1")
	T:place("modem", "down", false)
	T:go("F1C2 L1F1 D1", false, 0, false, R.useBlockType)
	lib.placeDirt(9, true)
	local turn = "R"
	for i = 1, 7 do
		T:go("F1U1x0C2"..turn.."1F1"..turn.."1x0 x2C2 F1D1", false, 0, false, R.useBlockType)
		lib.placeDirt(9, true)
		if turn == "R" then
			turn = "L"
		else
			turn = "R"
		end
	end
	T:go("F1U1x0C2"..turn.."1F1"..turn.."1x0x2C2F1D1", false, 0, false, R.useBlockType)
	lib.addWaterSource({"d","c","c","d"})	-- bottom right
	lib.placeDirt(9, false)
	lib.addWaterSource({"c","c","d","d"})	-- top right, facing away from plot
	T:go("F1U1 R1C2 x0F1 x0x2 C2R1", false, 0, false, R.useBlockType)
	for i = 1, 11 do	-- build right wall from top of plot to bottom
		T:go("F1x0x2C2", false, 0, false, R.useBlockType)
	end
	T:go("R1F10")				-- ends on top of front modem facing tree
	if R.misc then
		-- add solid blocks for melon or pumpkin farm
		T:go("R1F5 R1")
		for i = 1, 10 do
			T:go("C2F1")
		end
		T:go("L1F1 L1F1")
		for i = 1, 10 do
			T:go("C2F1")
		end
		T:go("L1F6 L1F1 L2")
	end
	U.attachModem()
	T:clear()
	T:go("R1F1D1R1")	-- over water source, facing E (crops)
	if R.data == "new" and R.goDown then	-- primary plot, user chose to add storage
		createFarmNetworkStorage(true)		-- add networking and storage
	else
		createFarmNetworkStorage(false)		-- add networking, no storage
	end
	-- if R.data == "right" then
		-- T:up(1)
		-- utils.goBack(numPlots * 11)
		-- T:down(1)
	-- elseif R.data == "back" then
		-- T:go("R1U1F".. numPlots * 11 .."D1L1")
	-- end
	return {"Modular farm completed"}
end

function createFarmExtension()
	-- R.data = "right" or "back"
	-- R.networkFarm = true
	-- R.misc = true or false: true = melon or pumpkin
	
	checkFarmPosition()
	
	if not R.ready then
		return {"Unable to determine starting position"}
	end
	
	createFarm()
	return {"Modular crop farm extended"}
end

function createFloorCeiling()
	--[[
	R.up = true for ceiling
	R.down = true for floor
	R.height = 0 for normal
	R.height combined with R.up/R.down used for remote access
	R.data == "random" for random floor placement
	]]
	
	local lib = {}
	
	function lib.goToRemote()
		R.silent = true
		local depth = 0
		if R.down or R.floor then -- floor could be under water
			while turtle.down() do
				depth = depth + 1
			end
		elseif R.up or R.ceiling then
			while turtle.up() do
				depth = depth + 1
				if depth > R.height + 3 then
					break
				end
			end
		end
		if not(R.height - depth <= 2 or depth - R.height <= 2) then
			T:up(depth)
			return "Measured depth/height of "..depth.." > setting: "..R.height
		end
		-- not returned so depth acceptable
		return ""
	end
	
	function lib.checkPosition()
		-- check if block above/below
		if R.subChoice == 2 then -- new floor/ceiling above /below existing
			if R.floor and turtle.detectDown() then
				T:up(1)
			elseif R.ceiling and turtle.detectUp() then
				T:down(1)
			end
		end
	end
	
	function lib.placeRow(direction, waterPresent)
		for y = 1, R.length do
			local blockType = T:getBlockType("forward")
			if not waterPresent then
				if blockType:find("lava") ~= nil or blockType:find("water") ~= nil then
					waterPresent = true
				end
			end
			lib.getRandomBlock()	-- changes block randomly ONLY if R.data == "random"
			lib.changeCheckered()	-- changes to next block type ONLY if R.data == "checked"
			-- ONLY if R.data == "striped" has already been changed for whole row
			T:place(R.inventory.useBlock, direction, false) -- leaveExisting = false
			if y < R.length then
				T:forward(1)
			end
		end
		return waterPresent
	end
	
	function lib.getRandomBlock()
		if R.data == "random" then
			local index = math.random(1, #R.inventory.names)	-- random index between 1 and no of block types
			local success = false
			for i = index, R.inventory.blockTypeCount do		-- iterate from index upwards
				if R.inventory.quantities[i] > 0 then			-- at least 1 block left
					R.inventory.useBlock = R.inventory.names[i]
					R.inventory.quantities[i] = R.inventory.quantities[i] - 1
					R.inventory.blockCount = R.inventory.blockCount - 1
					success = true
					break
				end
			end
			
			if not success then								-- no blocks left in the range of index -> no of block types
				for i = index, 1, -1 do						-- go backwards from index to 1
					if R.inventory.quantities[i] > 0 then		-- at least 1 block left
						R.inventory.useBlock = R.inventory.names[i]
						R.inventory.quantities[i] = R.inventory.quantities[i] - 1
						R.inventory.blockCount = R.inventory.blockCount - 1
						success = true
						break
					end
				end
			end
		end	
	end
	
	function lib.changeStripe()
		if R.data == "striped" then
			R.size = R.size + 1
			if R.size > R.inventory.blockTypeCount then
				R.size = 1
			end
			R.inventory.useBlock = R.inventory.names[R.size]
		end
	end
	
	function lib.changeCheckered()
		--swap between 2 block types
		if R.data == "checked" then
			if R.inventory.useBlock == R.inventory.names[1] then
				R.inventory.useBlock = R.inventory.names[2]
			else
				R.inventory.useBlock = R.inventory.names[1]
			end
		end
	end
	
	local waterPresent = false
	
	R.inventory = T:getInventory()
	--[[
		{
		inventory["minecraft:cobblestone"] = 128
		inventory["minecraft:stone"] = 64
		inventory.names = {minecraft:cobblestone, minecraft:stone}
		inventory.quantities = {128, 64}
		inventory.blockTypeCount = 2,
		inventory.blockCount = 196,
		inventory.useBlock = "minecraft:cobblestone"
		inventory.mostBlock = "minecraft:cobblestone"
		inventory.mostCount = 128
		}
	]]
	--R.useBlockType = T:getMostItem("", false)
	--Log:saveToLog("R.useBlockType = "..R.useBlockType)
	--R.inventory.useBlock = R.useBlockType
	--local inventory = T:getInventory()
	Log:saveToLog("T:R.inventory = "..textutils.serialise(inventory, {compact = true}))
	--R.inventory.blockCount = T:getInventory()["blockCount"]
	--Log:saveToLog("T:getInventory()['blockCount'] = "..	R.inventory.blockCount)
	
	if R.data == "random" then
		math.randomseed(R.inventory.blockCount)
		print("Using random blocks")
	elseif R.data == "striped" then
		print("Using striped pattern")
	elseif R.data == "checked" then
		print("Using checkered pattern")
	end
	local direction = "down"
	if R.up or R.ceiling then
		direction = "up"
	end
	
	if R.height > 0 then -- remote placing. go up/down R.height first
		local message = lib.goToRemote()
		if message ~= "" then	-- error encountered
			return {message}
		end
	end
	
	lib.checkPosition()
	-- based on clearRectangle code
	if R.width == 1 then 					-- single block ahead only
		waterPresent = lib.placeRow(direction, waterPresent)
		T:turnRight(2)						-- turn at the top of the run
		T:forward(R.length - 1)				-- return to start
		T:turnRight(2)						-- turn round to original position
	else
		local iterations = 0 				-- R.width = 2, 4, 6, 8 etc
		if R.width % 2 == 1 then  			-- R.width = 3, 5, 7, 9 eg R.width 7
			iterations = (R.width - 1) / 2 	-- iterations 1, 2, 3, 4 for widths 3, 5, 7, 9
		else
			iterations = R.width / 2		-- iterations 1, 2, 3, 4 for widths 2, 4, 6, 8
		end
		lib.changeStripe()
		lib.changeCheckered()
		for i = 1, iterations do 			-- eg 3 blocks wide, iterations = 1
			waterPresent = lib.placeRow(direction, waterPresent)
			T:go("R1F1R1")
			lib.changeStripe()
			--lib.changeCheckered()
			waterPresent = lib.placeRow(direction, waterPresent)
			-- if 1 less than end, reposition for next run
			if i < iterations then
				T:go("L1F1L1", false, 0, false)
				lib.changeStripe()
			end
		end
		if R.width % 2 == 1 then  -- additional run and return to base needed
			T:go("L1F1L1", false, 0, false)
			lib.changeStripe()
			waterPresent = lib.placeRow(direction, waterPresent)
			T:turnRight(2)
			T:forward(R.length - 1)
		end
		T:go("R1F"..R.width - 1 .."R1", false, 0, false)
	end

	if waterPresent then
		return {"water or lava found"}
	end
	
	return {""}
end

function createIceCanal()
	--[[
		R.position = 
		1: Remove block above and below, place slabs, blocks and torches if > 0
		2: Remove block above, place ice alternating below or 3
		3: Remove block above and below or 2
		4: Remove block above and below, place slabs, blocks and torches if > 0
	]]
	local turn = "L"
	local oTurn = "R"
	
	R.side = "L"
	if R.position == 3 or R.position == 4 then
		R.side = "R"
		turn = "R"
		oTurn = "L"
	end
	
	local lib = {}
	
	function lib.convertTowpath()
		-- tk3 water canal already uses slabs for towpath. Does NOT need converting
		-- only used to convert existing water canal, so assume towpath already present
		-- starting position 1 block above existing towpath
		for i = 1, R.length do
			if turtle.detectDown() then							-- eg existing torch
				T:dig("down")
			end
			local placeSlab = true
			if R.torchInterval > 0 then							-- place torches
				if i == 1 or i % R.torchInterval == 0 then		-- ready to place torch
					--go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
					T:go("C2x0", false, 0, false, R.useBlockType)-- place solid block below
					T:go("F1R2x0")
					T:place("torch", "forward")				-- place torch, move forward
					T:turnRight(2)								-- turn round
					placeSlab = false
				end
			end
			if placeSlab then
				T:dig("up")
				if not T:place("slab", "down") then			-- break if out of slabs
					break
				end
				if i < R.length then
					T:forward(1)								-- move forward
				end
			end
		end
	end
	
	function lib.icePath()
		-- use only for placing ice to convert a water canal
		-- place ice on alternate blocks until length reached or run out of ice
		local placeIce = true
		--Log:saveToLog("Placing ice")
		for i = 1, R.length do
			if turtle.detectUp() then
				T:go("U2x0D2")
			end
			if T:getBlockType("down"):find("ice") == nil then -- no ice below
				T:dig("down") -- remove any existing block
				if placeIce then
					--Log:saveToLog("Placing ice i = "..i)
					if not T:place("ice", "down", true) then -- out of ice
						break
					end
					if i == R.length - 1 then
						break
					end
				end
			else -- ice already below
				placeIce = true
			end
			--T:go("U1x0 D1F1")
			T:forward(1)
			placeIce = not placeIce -- reverse action
		end
	end
	
	function lib.airPath()
		-- tk3 water canal alredy at correct height. Does NOT need converting
		-- use only for converting a water canal. start at ground level
		-- dig up/down/forward to clear space
		for i = 1, R.length + 1 do
			if turtle.detectUp() then
				T:go("U2x0D2")
			end
			if turtle.detectDown() then
				turtle.digDown()
			end
			if i < R.length + 1 then
				T:forward(1)
			end
		end
	end
	
	if R.length == 0 then
		R.length = 512
	end
	
	R.useBlockType = T:getMostItem("", true) 
	--Log:saveToLog("createIceCanal() R.floor = "..tostring(R.floor))
	-- R.floor = true if ice placed by this turtle
	if R.data == "new" or R.data == "" then
		if R.position == 1 or R.position == 4 then	-- towpath
			utils.towpathOnly() -- places torches if R.torchInterval > 0
		elseif R.position == 2 or R.position == 3 then -- ice or air
			if R.floor then	-- place ice
				lib.icePath()
			else 	-- dig 3 blocks
				lib.airPath()
			end
		end
	elseif R.data == "convert" then
		if R.position == 2 or R.position == 3 then			-- over water
			if R.floor then									-- assume placed on existing ice or initial ice position
				lib.icePath()						-- place ice
			else											-- assume placed on empty path
				lib.airPath()							-- clear 3 high area
			end
		elseif R.position == 1 or R.position == 4 then
			if T:getBlockType("down"):find("slab") ~= nil then 	-- slab already present
				T:go("F1")
			else
				T:up(1)
			end
			lib.convertTowpath()
		end
	end
	
	return {}
end

function createLadder()
	-- go(path, useTorch, torchInterval, leaveExisting)
	-- place(blockType, damageNo, direction, leaveExisting)
	local lib = {}
	
	function lib.isFluid(side)
		-- check if water or lava present
		side = side or "forward"
		local blockType = ""
		if side == "left" then
			T:turnLeft(1)
		elseif side == "right" then
			T:turnRight(1)
		end
		blockType = T:getBlockType("forward")
		Log:saveToLog("lib.isFluid() blockType (forward) = "..blockType)
		if blockType:find("lava") ~= nil or blockType:find("water") ~= nil then	-- fluid found, return to correct position
			if side == "left" then
				T:turnRight(1)
			elseif side == "right" then
				T:turnLeft(1)
			end
			return true
		end
		blockType = T:getBlockType("up")
		Log:saveToLog("lib.isFluid() blockType (up) = "..blockType)
		if blockType:find("lava") ~= nil or blockType:find("water") ~= nil then
			return true
		end
		
		blockType = T:getBlockType("down")
		Log:saveToLog("lib.isFluid() blockType (down) = "..blockType)
		if blockType:find("lava") ~= nil or blockType:find("water") ~= nil then
			return true
		end
		
		return false
	end
	
	function lib.buildDam()
		--T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
		if lib.isFluid("forward") then
			--[[ surround 2 block shaft with blocks ]]
			T:go("R1C1 R1C1 R1C1 R1F1 L1C1 R1C1 R1C1 R1C1F1 R2C1 x1")
		else
			--[[ no water/lava so prepare ladder site]]
			T:go("F1 L1C1 R1C1 R1C1 L1B1", false, 0, true)
		end
	end
	
	function lib.placeLadder(direction, ledge, i)
		if not T:place("ladder", "forward", false) then
			T:checkInventoryForItem({"ladder"}, {height - i}, false)
		end
		-- 3 check if ledge, torch
		if ledge == 0 and i > 1 then -- place block above unless new ladder
			T:place("common", direction, false) -- any common block
		elseif ledge == 1 then
			T:place("minecraft:torch", direction, false)
		elseif ledge == 2 then
			ledge = -1
		end
		
		return ledge
	end
	
	menu.clear()
	
	-- R.startLevel and R.destinationLevel set in taskInventory.lua
	-- R.auto = stop at stronghold/trial chamber
	-- R.startLevel eg 64 at top (R.goDown = true) or 5 at bedrock, R.goUp = true 
	-- R.lowerLevel = bottom of ladder
	-- R.upperLevel = top of ladder
Log:saveToLog("tk3.createLadder() starting; R.up = "..tostring(R.up).."R.down = "..tostring(R.down)
			   .."R.startLevel = "..R.startLevel.."R.destinationLevel = "..R.destinationLevel)

	R.height = math.abs(R.upperLevel - R.lowerLevel)
	R.currentLevel = R.startLevel	-- eg 64 going down
	local retValue = {}
	local ledge = 0
	--local height = math.abs(R.currentLevel - R.height) --height of ladder
	local blockType = T:getBlockType("forward")
	--if R.goUp then -- create ladder from current level to height specified
	if R.up then -- create ladder from current level to height specified
		print("Creating ladder going up "..R.height.." blocks")
		for i = 1, R.height do -- go up, place ladder as you go
			lib.buildDam()
			ledge = lib.placeLadder("down", ledge, i, R.currentLevel) -- ladder placed forward, stone ledge for torch placed down
			if i < R.height then
				T:up(1)
				R.currentLevel = R.currentLevel + 1
				ledge = ledge + 1
			end
		end		
	else -- R.goDown = true: ladder towards bedrock		
		print("Creating ladder going down "..R.height.." blocks")
		local success = true
		local numBlocks, errorMsg = 0, ""
		T:down(1)
		R.currentLevel = R.currentLevel - 1
		for i = 1, R.height do -- go down, place ladder as you go
			lib.buildDam()
			ledge = lib.placeLadder("up", ledge, i) -- ladder placed forward, stone torch placed up
			--success, blocksMoved, errorMsg, blockType = clsTurtle.down(self, steps, getBlockType)
			if i < R.height then
				success, numBlocks, errorMsg, blockType = T:down(1, true) -- true = return blockType
				ledge = ledge + 1
			end
			-- if looking for stronghold then check for stone_bricks 
			if R.auto then
				if blockType:find("stone_bricks") ~= nil then
					table.insert(retValue, "Stronghold discovered")
					break -- stop descent at stronghold
				end
				if blockType:find("polished_tuff") ~= nil then
					table.insert(retValue, "Trial chamber discovered")
					break -- stop descent at trial chamber
				end
			end
		end
		-- if user requested shelter create chamber at this level
		if R.data == "chamber" then -- user has chosen to build a chamber
			table.insert(retValue, "Shelter constructed at level".. R.depth)
			if blockType:find("bedrock") ~= nil then
				T:findBedrockTop(0) -- test to check if on safe level immediately above tallest bedrock
			end
			-- In shaft, facing start direction, on lowest safe level
			-- create a square space round shaft base, end facing original shaft, 1 space back
			T:go("C2 L1n1 R1n3 R1n2 R1n3 R1n1", false, 0, true)
			T:go("U1Q1 R1Q3 R1Q2 R1Q3 R1Q1 R1D1", false, 0, true)
		end
	end
	
	return retValue
end

function createLadderToWater()
	-- go down to water/lava with alternaate solid/open layers
	-- create a working area at the base
	-- Return to surface facing towards player placing ladders
	local inAir = true
	local numBlocks, errorMsg = 0, ""
	local height = 2
	local blockType = T:getBlockType("down")
	if blockType ~= "" then -- not over air
		T:forward(1)
	end
	T:go("R2D1") -- face player, go down 2
	while inAir do --success = false when hits water/lava
		blockType = T:isWaterOrLava("down")
		if blockType:find("water") ~= nil or blockType:find("lava") ~= nil then
			inAir = false
		end
		T:go("C1R1 C1R2 C1R1", false, 0, false)	-- surround front  and sides with cobble
		if inAir then
			T:down(1)
			height = height + 1
		end
		T:place("ladder", "up")
	end
	-- In shaft, facing opposite start direction, on water/lava, ladders above
	T:go("C2", false, 0, false)
	utils.goBack(1)
	T:place("ladder", "forward")
	T:up(3)
	height = height - 3
	for i = 1, height do
		if i < height then
			T:go("C2U1", false, 0, false)
		else
			T:go("C2", false, 0, false)
		end
	end

	return {}
end

function createMine()
	-- go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	-- "M" mine block above and/or fill void
	-- "m" mine block below and/or fill void
	-- "N" mine block above and/or fill void + mine block below if valuable: 1 block high ceiling area
	-- "n" mine block below and/or fill void + check left side
	local lib = {}
	
	function lib.ceiling(length, useTorch)
		-- excavates a length and places block above
		for i = 1, length do
			if useTorch and (i == 1 or i == 17 or i == length) then
				T:place("torch", "down", true)
			end
			if i < length then
				T:go("C0F1", false, 0, true)
			else
				T:go("C0", false, 0, true)
			end
		end
	end
	
	function lib.clearArea()
		local outward = true
		for i = 1, 13 do
			T:go("N28", false, 0, true)
			if i < 13 then
				if outward then
					T:go("L1F1L1", false, 0, true)
				else
					T:go("R1F1R1", false, 0, true)
				end
				outward = not outward 
			end
		end
	end
	
	function lib.floor(length, clearUp)
		-- excavates a length and places block below
		for i = 1, length do
			if clearUp then						-- used along floor to make a corridor
				T:go("x0C2", false, 0, true)	-- used along top of wall to place below and clear a passage
			else
				T:go("C2", false, 0, true)
			end
			if i < length then
				T:forward(1)
			end
		end
	end
	
	function lib.fillWall(length)
		for i = 1, length do
			if i < length then
				T:go("B1C1", false, 0, true)
			end
		end
		T:go("R1")
	end
	
	function lib.placeStorage()
		T:go("U2D2") 							-- create space for chest
		if not T:place("chest", "up", false) then
			T:place("barrel", "up", false)
		end
	end
	
	function lib.prepareArea()
		T:go("V14 L1 V14 R1F2R1", false, 0, true)
		T:go("V14 L1 V14 L1 V14 L1", false, 0, true)
		T:go("V14 F2 V14 L1 V14 L1", false, 0, true)
		T:go("F1L1 F1R1", false, 0, true)
	end
	
	function lib.torch()
		T:go("C2U1", false, 0, true)
		T:place("torch", "down", true)
		T:go("C0F1 C0D1", false, 0, true)
	end
	
	lib.floor(33, true)						-- mine ground level
	T:go("U1R2") 							-- go up, reverse
	lib.ceiling(17, true)					-- mine ceiling to mid-point
	T:go("D1R1")							-- face side branch on left
	lib.floor(17, true)						-- mine ground level
	T:go("U1R2") 							-- go up, reverse
	lib.ceiling(33, true)					-- mine ceiling
	T:go("R2D1")							-- floor level
	lib.torch()
	lib.floor(16, true)						-- mine ground level
	T:go("L1U1")
	lib.placeStorage()
	T:emptyTrash("up")
	T:place("torch", "down", true)
	T:go("F16R1D1") 						-- return to start, turn right, down to floor
	
	if R.inNether then
		-- construct solid wall round whole 35 x 35 area first
		lib.floor(17, true)					-- move from centre area to SE corner
		T:go("F1L1 F1R2 U1")				-- ready for outer wall at ceiling level
		for i = 1, 3 do
			lib.floor(35, false)
			T:go("R1")
		end
		lib.floor(16, false)
		T:go("F4")
		lib.floor(16, false)
		T:go("L1C1")						-- face backwards
		for i = 1, 3 do
			lib.fillWall(35)
		end
		lib.fillWall(17)
		T:go("R1F3L2")
		lib.fillWall(15)
		T:go("R2F1 R2C1 R2D1")				-- on floor ready for inner corridor
		for i = 1, 4 do
			lib.floor(33, true)				-- make sure floor is solid
			T:go("R1")
		end
		T:up(1)
		for i = 1, 4 do
			lib.ceiling(33, true)			-- make sure ceiling is solid
			T:go("R1")
		end
		T:go("R1F16L1")
	else
		-- sides not checked for water or lava
		-- start on floor level
		lib.torch()
		lib.floor(16, true)					-- make sure floor is solid
		T:go("R1")
		for i = 1, 3 do
			lib.torch()
			lib.floor(32, true)				-- make sure floor is solid
			T:go("R1")
		end
		lib.torch()
		lib.floor(16, true)					-- back to ladder area
		lib.torch()							-- to left of ladder
		T:go("U1")
		lib.ceiling(16, false)				-- make sure ceiling is solid
		T:go("R1")
		for i = 1, 3 do
			lib.ceiling(33, true)				-- make sure floor is solid
			T:go("R1")
		end
		lib.ceiling(17, true)
		T:go("R1")
	end
	lib.ceiling(16, false)					-- return to centre
	T:go("F1R2")
	T:place("torch", "down", true)
	T:emptyTrash("up")
	T:go("F16 R1F1 R1F1") --return to shaft + 1
	lib.prepareArea()
	lib.clearArea()	-- ends NW corner
	T:go("R1F13 R1F14 L1F1")
	T:emptyTrash("up")
	T:go("B1L1 F15 R1 F2R1")
	lib.prepareArea()
	lib.clearArea()	-- ends SE corner
	T:go("F1R1 F13L1")
	return{"Mining operation complete"}
end

function createMobFarmCube()
	--[[
	Part 1 / 3 Mob Spawner Farm
	blaze = true: blaze spawner in nether
		R.subChoice is set to:
		1 = on top of spawner
		2 = line of sight
		3 = room below
	blaze = false: overworld mob spawner
		R.width / R.length set by player (external size)
		R.data = "spawner" or "chest" if chests present
	]]
	R.useBlockType = T:getMostItem("", true) -- exclude none, use stone only/netherrack
	local innerWidth = R.width - 2
	local innerLength = R.length - 2
	if R.data == "chest" then				-- need external chest to empty internals
		if T:getItemSlot("chest") == 0 then
			T:checkInventoryForItem({"minecraft:chest"}, {1}, true)
		end
	end
	local blaze = false	-- R.data = "blaze"
	if R.data == "blaze" then
		blaze = true
	end

	menu.clear(true)

	local lib = {}
	
	function lib.floorSection(length)
		for i = 1, length do		-- starts on top left corner
			T:go("C2")
			if i < length then
				T:forward(1)
			else
				T:go("R1F1")
			end
		end
	end
	
	function lib.wallSection(blaze)
		blaze = blaze or false
		for i = 1, 4 do
			for j = 1, 11 do
				if blaze then
					T:place("slab", "up", false)
					T:go("C2", false, 0, false)
				else
					T:go("C0C2", false, 0, false)
				end
				if j < 11 then
					T:forward(1)
					T:go("R2C1L2", false, 0, false)
				else
					T:turnRight(1)
				end
			end
		end
	end
	
	function lib.clearWall(length)
		for i = 1, 4 do
			for j = 1, length do 
				if j < length then
					T:go("x0x2F1")
				else
					T:go("x0x2R1")
				end
			end
		end
	end
	
	function lib.isSpawner()
		local blockType = T:getBlockType("down")
		if blockType:find("spawner") ~= nil then
			return true, "top"
		end
		blockType = T:getBlockType("up")
		if blockType:find("spawner") ~= nil then
			return true, "bottom"
		end
		blockType = T:getBlockType("forward")
		if blockType:find("spawner") ~= nil then
			return true, "forward"
		end
		return false, ""
	end
		
	function lib.findChests()
		local forward = true
		for w = 1, innerWidth do
			for i = 1, innerLength do 
				local blockType = T:getBlockType("down")
				if blockType:find("chest") ~= nil then
					while turtle.suckDown() do end
					turtle.digDown()
				end
				if i < innerWidth then
					turtle.forward()
				end
			end
			if w < innerWidth then
				if forward then
					T:go("R1F1R1")
				else
					T:go("L1F1L1")
				end
				forward = not forward
			end
		end
		-- all chests found, ends on top right corner
		T:go("L1F"..math.floor(innerWidth / 2).."L1F"..math.floor(innerWidth / 2).."F7")	-- next to chest
		T:go("U1x1 U1x1 D1")	-- place chest on top of existing
		T:place("chest", "forward", false)
		T:emptyInventory("forward")
		T:down(1)
		while turtle.suck() do end	-- empty original supplies chest
		T:go("R2F7")	-- on top of spawner
	end
		
	function lib.enterDungeon()
		--[[ find and empty any chests, return to dungeon wall ]]
		print("Entering dungeon")
		local found, position = false, ""						-- initialise variables
		local blockType = T:getBlockType("forward")
		if blockType == "" then 								-- nothing in front.Error
			position = "No block in front: Check position."
		else 													-- attempt entry into dungeon wall
			T:go("U2F2 R2C1R2")									-- go up 2 enter, seal behind
			while turtle.down() do end 							-- either on floor or chest if one at this position
			blockType = T:getBlockType("down")
			if blockType:find("chest") ~= nil then
				T:go("F1D1") -- on floor level facing spawner
			end
			found, position = lib.findSpawner(blaze)			-- should be in line to spawner
		end
		return found, position	-- position = either error message or "top", "forward", "bottom"
	end
		
	function lib.findSpawner(blaze)
		local moves  = 0
		local quit = false
		-- assume turtle placed on centre of inside spawner wall in front of spawner
		-- or as close as possible in Nether
		print("Checking if next to spawner")
		local found, position = lib.isSpawner() -- true/false, top/bottom/nil
		if not found then -- move forward towards spawner
			print("Not close to spawner")
			while turtle.forward() and not quit do
				moves = moves + 1
				if moves > 16 then
					quit = true
				end
			end
			found, position = lib.isSpawner() -- true/false, top/bottom/nil
			if not found then
				if blaze then -- could be behind a wall
					print("Assuming blaze spawner behind a wall")
					T:forward(1)
					moves = moves + 1
					while turtle.forward() and not quit do 
						moves = moves + 1
						if moves > 16 then
							quit = true
						end
					end
					found, position = lib.isSpawner() -- true/false, top/bottom/nil
					if not found then
						T:go("R2F"..moves + 2 .."R2")
					end
				end
			end
		end
		
		return found, position
	end
	
	-- clsTurtle.go(self, path, useTorch, torchInterval, leaveExisting, preferredBlock)
	-- determine spawner position level 4, move to top of spawner (level 6)
	print("Checking if already at spawner")
	local found, position = lib.isSpawner() -- already on spawner?
	if blaze then 
		if not found then -- away from spawner
			if R.subChoice == 3 then	-- on floor below
				T:go("U5")
			end
			found, position = lib.findSpawner(blaze)
		end
	else -- go to bottom of dungeon and empty chests
		if not found then 														-- not next to spawner: outside dungeon
			local success, message = lib.enterDungeon()
			if not success then
				return {message}
			end
			found, position = lib.findSpawner(blaze) 							-- is spawner in front / above / below?
			if found then
				if position == "forward" then
					T:go("U1F1")
				elseif position == "bottom" then
					T:go("R2F1U2R2F1")
				end
																				-- now on top of spawner facing away from entrance
				if R.data == "chest" then										-- locate and empty any chests
					T:go("R2F3 F1x0 F1x0 F1x0 F1x0 F1x0 B1")							-- move out and place external chest
					T:place("chest", "forward", false)
					T:emptyInventory("forward")
					local innerWall = 8 - (math.floor(R.length / 2) )			-- eg 7/2-> 3 -> 8-3 = 5 
					T:go("R2F"..innerWall.."L1F".. math.floor(innerWidth / 2).."R1")
					print("Searching for chests")
					lib.findChests()											-- go round inside walls  emptying chests. Finish mid-wall
					position = "top"											-- ready to start
				end
			else
				return {position}
			end
		end 
	end
	
	if found then -- true: move to correct starting position if not on top 
		--[[
		1 |c|c|c|c|c|c|c|c|c|c|c|
		2 |w| | | | | | | | | |w|
		3 |w| | | | | | | | | |w|
		4 |w| | | | | | | | | |w|
		5 |w| | | | | | | | | |w|
		6 |w| | | | |s| | | | |w|
		7 |w| | | | | | | | | |w|
		8 |w| | | | | | | | | |w|
		9 |w| | | | | | | | | |w|
	   10 |w| | | | | | | | | |w| exit level for overworld
	   11 |f|f|f|f|f|f|f|f|f|f|f|
	   12 |f|f|f|f|f|f|f|f|f|f|f| sub floor for overworld
		   1 2 3 4 5 6 7 8 9 1 1
							 0 1
		]]
		if position == "bottom" then
			T:go("B1U2F1")
		elseif position == "forward" then
			T:go("U1F1")
		end
		T:up(1)
		T:place("slab", "down", true) 				-- place slab on top T:place(blockType, direction, leaveExisting)
		-- go up 2 blocks, forward 5, right, forward 5, right
		T:go("U2F5 R1F5 R1") 							-- Level 2: now placed 1 below ceiling inside wall, top right corner of new dungeon
		lib.wallSection(blaze) 							-- fix layers 1, 2, 3 including ceiling margin turtle at Level 2			
		T:go("F1R2 C1L1 F1R2 C1R1", false, 0, false)	-- exit wall, repair behind, still Level 2
		utils.ceiling(blaze)								-- fix ceiling, end opposite corner to start
		T:go("R2D3")									-- clear the inner walls inside original dungeon
		lib.clearWall(9)								-- clear the 9 x 9 area around the spawner
		T:go("F1R1F1L1")
		lib.clearWall(7)								-- clear the 7 x 7 area around the spawner
		T:go("F1R1F1L1")
		lib.clearWall(5)								-- clear the 5 x 5 area around the spawner. Also needed for cave spiders
		T:go("R2F1R1F1R1")
		T:go("F7R1 F8L1F1R2", false, 0, false)			-- return from ceiling, enter wall below previous section: Level 5
		lib.wallSection() 								-- deal with areas from spawner level up (4,5,6). walls only	
		T:go("F1R2 C1L1 F1R2 C1R1 D3", false, 0, false) -- exit wall, repair behind, embed 1 below original floor: Level 8
		--local temp = {width = R.width, length = R.length, up = R.up, down = R.down}
		R.width = 9
		R.length = 9
		R.up = true
		R.down = true
		--clearRectangle({width = 9, length = 9, up = true, down = true}) -- clear levels 7,8,9
		clearRectangle()
		T:go("L1F1 L1F1L2", false, 0, false) 			-- go inside wall sectio, ready for next wall section
		lib.wallSection() 								-- deal with walls on levels 7,8,9
		T:go("F1R2 C1L1 F1R2 C1R1 D3", false, 0, false) -- exit wall, repair behind, embed 4 below original floor: Level 11
		--print("Check: about to clear 3 floors 3 below spawner") read()
		--clearRectangle({width = 9, length = 9, up = true, down = true}) -- clear levels 10,11,12 
		clearRectangle()
		if blaze then
			T:go("L1F1 L1F1L2", false, 0, false) 			-- ready for next wall section
			lib.wallSection() 								-- wall on layers 10,11,12
			T:go("F1R2 C1L1 F1R2 C1R1 D3", false, 0, false) -- exit wall, repair behind, embed 1 below original floor: Level 8
			--clearRectangle({width = 9, length = 9, up = true, down = true}) -- clear levels 13, 14, 15
			clearRectangle()
		end
		
		T:go("L1F1L1F1L2", false, 0, false) -- ready for next wall section
		--print("Check: level 11, 5 north, 5 east")
		--read()
		lib.wallSection() 	-- wall on layers 10,11,12 or 12,13,14 if blaze
		T:go("F1R1 F1R2 C1R1 U1", false, 0, false) -- exit wall, repair behind: Level 10, facing entry point top right corner
		T:down(1)
		if blaze then
			utils.placeFloor(9, 9, brick) 			-- place brick floor on level 14
			T:go("L1F4 R1F2 U4R2")					-- ends facing in to lower chamber ?below staircase
			-- now needs to build killzone
		else
			utils.placeFloor(9, 9, "stone") 			-- ends facing wall on entrance side
			T:go("U1R2")
			utils.placeFloor(9, 9, "stone") 			-- ends facing wall on opposite side
			-- return to mid-point front
			T:go("R2F8 R1F4 L1F2")					-- exit at bottom of dungeon
			T:go("x1U1 x1U1 x1U1 x1D3 R2") 			-- rise to chest, then return ready for next stage	
			-- ends with turtle facing spawner, in front of exit hole				
		end
	else
		return
		{
			"Spawner not found. Place me on top,",
			"immediately below, or facing it.",
			"\nEnter to quit"
		}
	end

	return {}
end

function createMobFarmCubeBlaze()
	return createMobFarmCube()
end

function createMobBubbleLift()
	-- Part 3 / 3 Mob Spawner Farm
	-- R.subChoice = 1 or 2 (left/right)
	local lib = {}
	
	function lib.initialise()
		local blockType = T:getBlockType("down")
		if blockType ~= "minecraft:soul_sand" then
			T:dig("down")
			if not T:place("minecraft:soul_sand", "down", false) then
				return {"Unable to find or place soul sand."}
			end
		end
		-- check facing sign, rotate if not
		blockType = T:getBlockType("forward")
		local turns = 0
		while blockType:find("sign") == nil do
			T:turnRight(1)
			turns = turns + 1
			if turns == 4 then
				return {"Unable to find sign."}
			end
			blockType = T:getBlockType("forward")
		end
		return {""}
	end
	
	function lib.createWaterSource()
		T:go("F2R2 F1D1")
		for i = 1, 3 do
			T:go("C2 L1C1 R2C1 L1")
			if i < 3 then
				T:go("F1")
			end
		end
		T:go("R2F1") 				-- face column move to middle
		T:placeWater("forward")
		T:go("R2")					-- face away
		T:placeWater("forward")
		T:go("R2U1")				-- facing column, above surface, centre of source	
	end
	
	function lib.goToWater(moves)
		T:down(moves)
		T:getWater("down")
		sleep(0.1)
		T:getWater("down")
	end
	
	function lib.placeCollector(turn, oTurn)
		local hopperSlot = T:getItemSlot("hopper")
		local chestSlot = T:getItemSlot("chest")
		if hopperSlot > 0 and chestSlot > 0 then
			T:dig("down")
			T:place("chest", "down")
			T:go(turn.."1F1"..oTurn.."1")
			T:dig("down")
			T:place("chest", "down")
			T:go(turn.."1")
			utils.goBack(3)
			T:go("D1x1")
			T:place("hopper", "forward")
			T:go("U1C2F2"..oTurn.."1")
		end
	end
	
	function lib.up()
		local moves = 0
		while turtle.detect() do
			turtle.up()
			moves = moves + 1
		end

		return moves
	end
	
	function lib.createChamber()
		local D =
		{
			width  = 4,
			length = 7,
			height = 4,
			ceiling = true,
			floor = true,
			vDirection = "D",
			hDirection = "RL",
			goHome = true
		}
		if R.subChoice == 1 then
			D.hDirection = "LR"
		end
		utils.createWalledSpace(D)
	end
	
	function lib.mobTransporter()
		for i = 1, 9 do -- fill in a solid block bar from bubble column for 8 spaces
			T:go("F1C0C2 R1C1 R1C1 R1C1 R1C1")
		end
		T:go("D1C2C1 R1C1 R2C1 L1 C0x0") -- move down column
		for i = 1, 8 do -- go under solid block bar
			T:go("F1C2 R1C1 L2C1 R1x0")
		end
	end
	
	menu.clear()
	
	local turn = "R"
	local oTurn = "L"
	if R.subChoice == 1 then
		turn = "L"
		oTurn = "R"
	end
	
	local data = lib.initialise()			-- check if in the right position
	if data[1] ~= "" then
		return data 						-- eg {"Unable to find sign."}
	end
	--lib.createWaterSource(oTurn)			-- everything in place, build a water source, facing spawner
	for i = 1, 3 do		-- fill in back and one side, go up
		T:go(turn.."1C1"..turn.."1C1"..turn.."1x1"..turn.."1U1", false, 0, true)
	end
	-- dungeon wall, above mob exit, facing spawner
	local colHeight = 19
	for i = 1, colHeight do		-- tunnel up, filling 3 sides
		T:go(turn.."1C1"..turn.."1C1"..turn.."1x1"..turn.."1C1 U1", false, 0, true)
	end
	-- facing spawner 20 blocks up. move either left/right 8 blocks, repairing ceiling and sides
	T:go("C0"..turn.."2C1"..turn.."1F1 C0C1"..turn.."1C1"..turn.."2C1"..oTurn.."1", false, 0, true) -- fill top of column
	lib.mobTransporter()
	T:go("x2x0 F1x2x0 F1x2x0 R2") -- over water source
	T:down(colHeight + 2)
	-- now create bubble column
	lib.createWaterSource(oTurn)			-- everything in place, build a water source, facing spawner
	local moves = 0
	repeat
		lib.goToWater(moves)	-- get water
		moves = lib.up()
		T:go("F1")
		T:placeWater("forward")
		T:go("U1C2")
		T:placeWater("forward")
		utils.goBack(1)
		T:go("C1")
		moves = moves + 1
	until moves >= colHeight + 1
	lib.goToWater(moves)	-- get water for last time
	lib.up()				-- finishes above lower part of the transport bar
	T:go("F2R2C1D1")		-- seal off bubble column
	utils.goBack(1)
	T:placeWater("forward")	-- place source on top of bubble column
	utils.goBack(7)			-- over down shaft
	T:down(1)				-- start shaft, facing bubble column
	for i = 1, 17 do
		-- tunnel down, filling all 4 sides
		T:go("R1C1 R1C1 R1C1 R1C1 D1", false, 0, true)
	end
	-- facing column
	lib.createChamber()
	T:go("x0")
	T:go(oTurn.."1C1".. turn.."1D1C2"..oTurn.."1C1"..turn.."1F1".. oTurn.."1F1"..oTurn.."1") -- facing end wall ready to place slabs
	for i = 1, 6 do
		T:place("slab", "down")
		if i == 6 then
			T:go(oTurn.."1")
		end
		utils.goBack(1)
		T:go("C1")
	end
	
	T:go("D2F2"..turn.."1F5")
	T:placeWater("forward")
	T:go(turn.."1F1"..oTurn.."1") -- facing down mob channel floor
	for i = 1, 5 do
		T:go("C1")
		utils.goBack(1)
	end
	T:go("C1"..turn.."1F1"..turn.."1F1")
	for i = 1, 7 do
		T:go("C2x0")
		if i < 7 then
			T:forward(1)
		end
	end
	T:go("U3R2")
	for i = 1, 7 do
		T:go("F1x2")
	end
	T:go("D3")
	
	lib.placeCollector(turn, oTurn) -- if hopper / chests present
	
	return {}
end

function createPath()
	--[[places a path in air/lava/water. R can also be of type int]]
	local length = R.length
	local reduce = false
	local torchInterval = R.torchInterval
	if R.data == "reduce" then
		reduce = true
	end
	local numBlocks = 0
	local preferredBlock = {}
	local lastSlot, total, slotData = T:getItemSlot("slab")
	if total > 0 then
		preferredBlock = {slotData.name}
	end
	lastSlot, total, slotData = T:getItemSlot("minecraft:dirt")
	if total > 0 then
		preferredBlock = {"minecraft:dirt"}
	end
	if reduce then
		T:forward(1)
		local blockType = T:getBlockType("down")
		local useBlock = blockType
		while blockType == useBlock do
			T:go("x2F1")
			numBlocks = numBlocks + 1
			blockType = T:getBlockType("down")
		end
		utils.goBack(numBlocks + 1)
	else
		for i = 1, 2 do
			T:fillVoid("down", preferredBlock, false, true)
			T:forward(1)
			numBlocks = numBlocks + 1
		end
		local place = utils.clearVegetation("down")
		while place do -- while air, water, normal ice, bubble column or lava below
			-- T:fillVoid(direction, tblPreferredBlock, leaveExisting, allowSlab)
			if T:fillVoid("down", preferredBlock, false, true) then -- false if out of blocks
				T:forward(1)
				numBlocks = numBlocks + 1
				if numBlocks % torchInterval == 1 or numBlocks == 0 then
					if T:getItemSlot("minecraft:torch", -1) > 0 then
						T:turnRight(2)
						T:place("minecraft:torch", "forward", false)
						T:turnRight(2)
					end
				end
			else
				break
			end
			if length > 0 and numBlocks >= length then -- not infinite path (length = 0)
				break
			end
			place = utils.clearVegetation("down")
		end
	end
	return {numBlocks} -- returned as a table in case called as task 51 back to main()
end

function createPlatform()
	-- T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	local forward = true
	R.useBlockType = T:getMostItem("", true) 
	for w = 1, R.width do
		for l = 1, R.length do
			T:go("x2C2", false, 0, false, R.useBlockType)
			if R.up then
				T:dig("up")
			end
			if l < R.length then
				T:forward(1)
			end
		end
		if w < R.width then
			if forward then
				if R.up then
					T:go("R1F1 x0R1")
				else
					T:go("R1F1 R1")
				end
			else
				if R.up then
					T:go("L1F1 x0L1")
				else
					T:go("L1F1 L1")
				end
			end
		end
		forward = not forward
	end
	return {}
end

function createPortal()
	--[[
	R.length = length of portal NOT width default 4
	R.height = height of portal default 5
	R.width = thickness of portal default 1
	R.data = "bury" to embed bottom into ground
	R.side = "F" (facing) "E" at edge
	]]

	local lib = {}
	
	function lib.buildBase()
		--T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
		T:go("C2", false, 0, false, R.useBlockType)
		T:forward(1)
		for i = 1, R.length - 2 do -- R.length = 4: place when i=1,2
			T:place("minecraft:obsidian", "down", false)
			T:forward(1)
		end
		T:go("C2", false, 0, false, R.useBlockType)
	end
	
	function lib.buildLayer()
		T:place("minecraft:obsidian", "down", false)
		for i = 1, R.length - 1 do -- R.length = 4: forward when i=1,2,3
			T:forward(1)
		end
		T:place("minecraft:obsidian", "down", false)
	end
	
	R.useBlockType = T:getMostItem("obsidian", true) -- exclude obsidian from count
	if R.data ~= "bury" then
		T:up(1)
	end
	if R.side == "F" then
		T:go("F1R1")
	end
	local out = true
	for width = 1, R.width do
		lib.buildBase()
		for i = 1, R.height - 2 do
			T:go("R2U1")
			out = not out
			lib.buildLayer()
		end
		T:go("R2U1")
		out = not out
		lib.buildBase()
		if out then
			T:go("R2F"..R.length - 1)
		end
		if width < R.width then
			T:go("R1F1D"..R.height.."R1")
			out = true
		else
			T:go("L1F"..R.width.."D"..R.height - 1 .."R2")
			if R.data ~= "bury" then
				T:down(1)
			end
		end
	end
	
	return {}
end

function createPortalPlatform()
	--[[ Used in End World to use a trapdoor to push player through portal ]]
	local lib ={}
	
	-- function lib.findPortal()
		-- local found = false
		-- local onSide = false
		-- for i = 1, 64 do
			-- if not turtle.up() then -- hit block above
				-- found = true
				-- break
			-- end
		-- end
		-- if found then
			-- -- are we under the centre block, or one of the sides?
			-- if turtle.detect() then -- under a side
				-- onSide = true
			-- else	-- nothing in front, probably under centre, or facing wrong direction so check
				-- for i = 1, 4 do
					-- turtle.turnRight()
					-- if turtle.detect() then
						-- onSide = true
						-- break
					-- end
				-- end
			-- end
			-- if onSide then-- move to centre
				-- T:go("D1F1")
			-- end
		-- end
		-- local height = 3 -- allows for 2 bedrock + starting space
		-- while turtle.down() do
			-- height = height + 1
		-- end
		-- return found, height
	-- end
	
	function lib.addFloor(length)
		for i = 1, length do
			if i < length then
				T:go("C2F1", false, 0, true)
			else
				T:go("C2", false, 0, true)
			end
		end
	end
	
	function lib.buildLadder(height)
		for i = 1, height do
			--T:go("F1C1 R1C1 L2C1 L1F1L2", false, 0, true)
			T:go("F1C1 R1C1 L2C1 R1", false, 0, true)
			utils.goBack(1)
			if i > 3 then
				T:go("C2")
			end
			T:place("minecraft:ladder", "forward", true)
			T:up(1)
		end
	end
	
	--local found, height = lib.findPortal()
	--if found then	-- position under centre of beacon
		-- build ladder up and create platform
		T:go("L1F1L1F2L2")
		--T:checkInventoryForItem({"minecraft:ladder"},{height})
		--T:checkInventoryForItem({"stone"},{height * 4 + 18})
		--T:checkInventoryForItem({"trapdoor"},{1})
		lib.buildLadder(R.height) -- ends facing ladder, 1 block above
		
		T:go("R1")
		utils.goBack(1)
		T:go("C2F1 C2F1 C2F1 C2")
		T:go("R1F1R1")
		T:go("C2F1 C2F1 C2F1 C2")
		utils.goBack(2)
		T:go("R1F1")			-- facing portal entrance
		T:place("trapdoor", "up", false)
	--else
		--return {"Portal not found. Move me under","the centre if possible.", "wait for purple beacon."}
	--end
	return {}
end

function createRailway()
	-- go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	--[[
		Build steps up or down ready for railtrack
		R.up (default) or R.down
		R.height = no blocks to move (up/down)
		R.depth = headroom, default 2
	]]
	if R.down then									-- move downwards
		if R.height == 0 then						-- stop when reaching existing ground
			local blockType = ""
			while blockType == "" do
				T:go("F1D1", false, 0, true)
				blockType = T:getBlockType("down")
				if blockType == "" then
					T:go("C2", false, 0, true)
				end
			end
		else
			for i = 1, R.height - 1 do
				--T:go("U1x0 D1x1 F1x0x1 D1x1 C2", false, 0, false)
				T:go("U"..math.max(1, R.depth - 1) .."x0 D"..math.max(1, R.depth - 1) .."x1 F1x0x1 D1x1 C2", false, 0, false)
			end
		end
	elseif R.up then
		for i = 1, R.height do
			--T:go("C1U2 x0D1F1", false, 0, false) --put stone in front, up 2 excavate 1, down 1, forward 1
			T:go("C1U"..math.min(1, R.depth).." x0D"..math.min(0, R.depth - 1).."F1", false, 0, false) --put stone in front, up 2 (or headroom) excavate 1, down 1, forward 1
		end
	end
	return {}
end

function createRetainingWall()
	-- facing direction wall will take
	-- will need to rotate 180 to build
	-- if R.height > 0 then build to specified depth
	local lib = {}
		
	function lib.checkFloor()
		local newDepth = 0
		place = utils.clearVegetation("down") -- in case col in front is deeper
		while place do -- loop will be entered at least once
			T:down(1)
			newDepth = newDepth + 1
			place = utils.clearVegetation("down")
		end
		if newDepth > 0 then
			for j = 1, newDepth do	-- go up until column base is met
				T:go("U1C2")
			end
		end
	end
	
	function lib.patchMissingBlock()
		if turtle.back() then
			T:go("C1")
		else
			T:go("B1C1")
		end
	end
	
	function lib.placeSingle(height)
		local y = 0
		if height > 0 then
			T:go("D"..height)
			y = height
		else
			local place = utils.clearVegetation("down")
			while place do -- loop will be entered at least once
				place = utils.clearVegetation("down")
				if place then
					T:down(1)
					y = y + 1
				end
			end
		end
		-- return to surface, placing below
		for i = 1, y do
			T:go("U1C2", false, 0, true)
		end
	end
	
	function lib.placeDouble(height)
		--T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
		local y = 0
		if not turtle.back() then
			T:go("B1")
		end
		if height > 0 then
			for i = 1, height do
				T:go("C1D1", false, 0, true)
			end
			T:go("C1", false, 0, true)
			y = height
		else
			local place = utils.clearVegetation("down")
			-- build back column
			while place do -- loop will be entered at least once
				place = utils.clearVegetation("down")
				if place then
					T:go("C1D1", false, 0, true)
					y = y + 1
				end
			end
			-- reached bottom. floor in front could drop down
			T:go("F1") -- move under first column
			lib.checkFloor()
			turtle.back() -- back at starting point
			T:go("C1", false, 0, true) 
		end
		-- return to surface, placing below
		for i = 1, y do
			T:go("U1C2", false, 0, true)
		end
	end
		
	function lib.placeTriple(height)
		--T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
		local y = 0
		utils.goBack(1)
		-- if turtle.back() then
			-- T:go("C1")
		-- else
			-- T:go("B1C1")
		-- end
		T:go("C1")
		if height > 0 then
			for i = 1, height do
				T:go("C1D1", false, 0, true)
			end
			for i = 1, height do
				T:go("C1D1", false, 0, true)
			end
			T:go("C1R2C1", false, 0, true) --fill last block, then turn 180 to build opposite side
			y = height
		else
			local place = utils.clearVegetation("down")
			-- build back column
			while place do -- loop will be entered at least once
				place = utils.clearVegetation("down")
				if place then
					--T:go("C1D1", false, 0, true)
					T:go("C1D1C0", false, 0, true)
					y = y + 1
				end
			end
			-- reached bottom. floor in front could drop down
			T:go("F1") -- move under first column
			lib.checkFloor()
			--T:go("B1C1R2F1", false, 0, true) 
			T:go("B1C1B1C1R2F1", false, 0, true) 
			lib.checkFloor()
			T:go("B1C1")
			-- return to surface , placing below and to front
		end
		for i = 1, y do
			T:go("C1U1C2", false, 0, true)
		end
		T:go("F1R2C1", false, 0, true)
		-- facing back again inside edge of col 3
		return y -- depth of this run
	end
	
	local topInPlace = false -- topInPlace = true already a path across the water eg monument rectangle
	if R.data == "withPath" then
		topInPlace = true
	end
	local place = false
	local inWater = false
	local onWater = false
	if not topInPlace then
		if R.length > 1 then
			inWater, onWater = utils.getWaterStatus() -- returns whether above water, or immersed
		end
	end
	
	local maxDepth = 5 --initial estimated value
	-- start at surface, move back 1 block
	-- each iteration completes 3 columns
	local numBlocks = T:getSolidBlockCount()
	print("Solid blocks in inventory: "..numBlocks)
	
	if R.length == 1 then -- single column down to water bed
		lib.placeSingle(R.height)
	elseif R.length == 2 then--down then up: 2 cols
		inWater, onWater = utils.startWaterFunction(onWater, inWater, 2, true) -- move into water
		T:go("R2") -- move to face player
		lib.placeDouble(R.height)
		if not inWater then
			T:go("U1C2", false, 0, true)
		end
	else -- R.length 3 or more
		if topInPlace then
			T:down(1) -- break through top
		else
			inWater, onWater = utils.startWaterFunction(onWater, inWater, 2, true) -- move into water
		end
		T:go("R2") -- move to face player
		-- now at water surface
		local remain = R.length
		--while remain >= 3 do
		while remain >= 4 do
			numBlocks = T:getSolidBlockCount()
			print("Inventory blocks: "..numBlocks.." depth: "..maxDepth)
			if numBlocks < maxDepth * 3 then
				--ask player for more
				T:checkInventoryForItem({"stone"}, {maxDepth * remain}, false)
			end
			local y = lib.placeTriple(R.height) -- moves back, places col in front, centre and behind. R.height = 0 for auto depth
			if y > maxDepth then
				maxDepth = y
			end
			--remain = remain - 3
			remain = remain - 4
			if remain > 1 then
				lib.patchMissingBlock()
			end
		end
		if remain == 1 then -- 1 more column
			lib.patchMissingBlock()
			lib.placeSingle(R.height)
		elseif remain == 2 then -- 2 cols
			lib.placeDouble(R.height)
		end
		T:go("U1C2") -- above surface
	end
	return {}
end

function createSafeDrop()
	-- dig down R.height blocks, checking for blocks on all sides
	local drop = 0
	menu.colourPrint("Wait for my return!", colors.yellow)
	R.height = math.abs(R.upperLevel - R.lowerLevel)	-- eg 64 - -59 = 123
Log:saveToLog("createSafeDrop(): R.height = "..R.height, true)
	for i = 1, R.height do				-- assume turtle is at foot level
		if i > 2 then					-- start placing blocks when below ground level
			for j = 1, 4 do
				-- go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
				T:go("C1R1", false, 0, true)
			end
		end
		--if i < R.height then
			if T:down(1) then
				 drop = drop + 1
			else
				break
			end
		--end
		if T:isWaterOrLava("up") ~= "" then
			T:go("C0x0", false, 0, false) -- delete water/ lava block
		end
	end
	local blockType = T:getBlockType("down")
	if blockType:find("bedrock") ~= nil then	-- at bedrock
		T:go("C1R1 C1R1 C1R1 C1R1 U1", false, 0, true )
	else
Log:saveToLog("createSafeDrop(): drop = "..drop.." blocks")
		T:go("D1 C1R1 C1R1 C1R1 C1R1 U1")
		drop = drop + 1
	end
	T:placeWater("down")
	T:go("R2 x1U1 x1 R2")
	drop = drop - 2
	T:up(drop)
	
	return {"Safe drop completed "..drop + 2 .. " blocks"}
end

function createSandWall()
	local success = true
	local count = 0
	local count17 = 0
	local reg = {0, 0, 0, 0, 0, 0, 0, 0} --{18,17,17,17,17,17,17,18}
	--move above water
	local maxMove = 2
	local lib = {}
	
	function lib.isArch(count)
		local complete = true
		for i = 1, 7 do
			reg[i] = reg[i + 1]
		end
		reg[8] = count
		Log:saveToLog("reg = "..textutils.serialise(reg, {compact = true}))
		if  reg[2] == reg[3] and reg[2] == reg[4] and reg[2] == reg[5] and reg[2] == reg[6] and reg[2] == reg[7]  then
			if  reg[1] == reg[2] + 1 and reg[8] == reg[7] + 1 then
				return true
			end
		end
		return false
	end
	
	function lib.underArch()
		-- need to go down 17, check for prismarine
		T:go("F1")
		local depth = 0
		while turtle.down()	do
			depth = depth + 1
		end	
		local blockType = T:getBlockType("down")
		if blockType:find("prismarine") ~= nil then	-- if prismarine, go through, under and place sand below
			T:go("D1R2F1")					-- at col 8 of arch, facing across it
			while turtle.down() do end		-- on floor backing against arch col 9
			utils.followGround(8)			-- clear plants 8 blocks
			while turtle.up() do end		-- climb against col 0 of arch
			
			utils.dropSand() 				-- col 1 (inner side of arch 
			
			utils.goBack(1)
			T:place("sand", "forward")		-- close col 1
			utils.dropSand() 				-- col 2 of arch
			
			utils.goBack(1)
			T:place("sand", "forward")		-- close col 2
			turtle.up()						-- ready for col 3. under arch next to lantern
			utils.dropSand() 				-- col 3 of arch
			
			utils.goBack(1)
			T:place("sand", "forward")		-- close col 3
			utils.dropSand() 				-- col 4 of arch
			
			utils.goBack(1)
			T:place("sand", "forward")		-- close col 4
			utils.dropSand() 				-- col 5 of arch
			
			utils.goBack(1)					-- back against lantern
			T:place("sand", "forward")		-- close col 5
			T:down(1)						-- need to go under lantern. use solid block to plug hole
			T:place("minecraft:prismarine_bricks", "up")		-- place prismarine
			utils.dropSand() 				-- col 6 of arch
			
			utils.goBack(1)					-- back against lantern
			T:place("sand", "forward")		-- close col 6
			utils.dropSand() 				-- col 7 of arch
			
			utils.goBack(1)					-- under final block
			T:place("sand", "forward")		-- close col 7
			utils.dropSand() 				-- col 8 of arch
			
			utils.goBack(1)					-- at entry point
			T:place("sand", "forward")		-- close col 8
		end
		T:go("R2U"..tostring(depth + 1))
	end

	while turtle.detectDown() and maxMove > 0 do
		T:forward(1)
		maxMove = maxMove - 1
	end
	if R.length > 0 then
		for i = 1, R.length - 1 do
			success, count = utils.dropSand()
			Log:saveToLog("Sand dropped = "..count)
			if lib.isArch(count) then
				lib.underArch()
			end
			T:forward(1, false)
		end
		success, count = utils.dropSand()
	else
		while not turtle.detectDown() do 				-- over water
			while not turtle.detectDown() do 			-- nested to allow forward movement
				success, count = utils.dropSand() 		-- drops sand and checks supplies
				Log:saveToLog("Sand dropped = "..count)
				if lib.isArch(count) then				-- pattern of sand drops matches arch
					lib.underArch()
				end
			end
			if success then
				T:forward(1, false)
			else -- out of sand
				break
			end
		end
	end
	return {}
end

function createSlopingWater()
	--[[
	creates a sloping water area above existing lake/river/ocean
	R.width is usually 7 with an existing wall on 8th row
	R.length  is user choice, limited to bucket/slab quantities
	Places slabs into existing surface, places row of sources
	Removes slabs
	]]
	local lib = {}
	
	function lib.fillBuckets()
		local emptyBuckets = utils.getEmptyBucketCount()
		for i = 1, emptyBuckets do
			if utils.fillBucket("down") then
				print("Bucket filled down")
				sleep(0.3)
			else
				print("Unable to fill bucket ".. i .." / "..emptyBuckets)
			end
		end
		return utils.getWaterBucketCount()
	end
	
	local outbound = true
	local inWater, onWater = utils.getWaterStatus()
	inWater, onWater = utils.startWaterFunction(onWater, inWater, 2 ,false) -- move above water, max descent 2
	local waterBuckets = lib.fillBuckets()
	for w = 1, R.width do
		for l = 1, R.length do
			T:place("slab", "down", false)
			if l < R.length then
				T:forward(1)
			end
		end
		if w < R.width then
			if outbound then
				T:go("R1F1R1")
			else
				T:go("L1F1L1")
			end
			outbound = not outbound
		end
	end
	if outbound then
		T:go("L1F"..R.width - 1 .."L1")
	else
		T:go("R1F"..R.width - 1 .."R1")
	end
	T:placeWater("up")  -- place in corner
	local move = true
	while move do
		move = turtle.forward()
		move = turtle.forward() -- false if at end of run
		T:placeWater("up")  -- alternate positions + end of run
	end
	T:go("R2D1")
	T:sortInventory() -- get all buckets into 1 slot
	for w = 1, R.width do
		for l = 1, R.length do
			if l < R.length then
				T:forward(1)
			end
		end
		if w < R.width then
			if outbound then
				T:go("R1F1R1")
			else
				T:go("L1F1L1")
			end
			outbound = not outbound
		end
	end
	if outbound then
		T:go("L1F"..R.width - 1 .."L1")
	else
		T:go("R1F"..R.width - 1 .."R1")
	end
	T:go("U2")
	
	return {}
end

function createSinkingPlatform()
	local lib = {}
	
	function lib.stage1a()							-- build side wall left side
		for l = 1, R.length do 						--            | |*| |
			T:go("L1C1 R1C2", false, 0, false)		-- |*|>| | to |*|>| | place left wall
			if l == 1 then							-- first iteration
				T:go("U1C2 D1 F1C2", false, 0, false)-- |*|>| | to |*|*|>| up/down block to delete source at corner
			elseif l < R.length then				-- mid run
				T:go("F1C2", false, 0, false)		-- |*|>| | to |*|*|>| move forward
			else									-- end of run
				T:go("C1U1 C2D1", false, 0, false)	-- |*|>| | to |*|>|*| place end wall
			end
		end
	end
	
	function lib.stage1b()							-- same as stage1a on right side
		for l = 1, R.length do 
			T:go("R1C1 L1C2", false, 0, false)
			if l == 1 then
				T:go("U1C2 D1 F1C2", false, 0, false)
			elseif l < R.length then
				T:go("F1C2", false, 0, false)
			else
				T:go("C1U1 C2D1", false, 0, false)
			end
		end
	end
	
	function lib.stage2(forward)
		if forward then
			T:go("C1R1 F1L1 C1R2", false, 0, false)
		else
			T:go("C1L1 F1R1 C1L2", false, 0, false)
		end
	end
		
	local forward = true
	local goingRight = true
	local blockType = T:getBlockType("down")
	if blockType:find("water") ~= nil or blockType:find("lava") ~= nil then
		T:up(1)
	end
	for h = 1, R.height do						-- repeatedly create a platform, move down and repeat
		T:down(1) 								-- move down into existing platform
		if goingRight then 						-- first side
			if forward then						-- complete left side
				T:go("R2C1 L2", false, 0, false) -- | |>| | to |*|<| | to |*|>| | 
				lib.stage1a()					-- build left wall
				T:go("R1F1 L1C1 R2C2", false, 0, false)			-- turn ready for next side
			else
				T:go("L2C1 R2", false, 0, false) -- block 1, 1
				lib.stage1b(R)					-- turn ready for next side
				T:go("L1F1 R1C1 L2C2", false, 0, false)
			end
		else 									-- on right side so different approach
			if forward then
				T:go("L2C1 R2", false, 0, false) -- | |<| | to | |>|* | to | |<|*| 
				lib.stage1b()					
				T:go("C1L1 F1R1 C1L2 C2", false, 0, false)		-- turn ready for next side
			else								-- complete left side
				T:go("R2C1 L2", false, 0, false) -- block 1, 1
				lib.stage1a()					-- turn ready for next side
				T:go("C1R1 F1L1 C1R2 C2", false, 0, false)
			end
		end
		forward = not forward					-- continue strips across until at far edge
		for w = 1, R.width - 2 do
			for l = 1, R.length do
				if l < R.length then
					T:go("C2F1", false, 0, false)
				else
					T:go("C2", false, 0, false)
				end
			end
			if goingRight then
				lib.stage2(forward)
			else
				lib.stage2(not forward)
			end
			forward = not forward
		end										-- far side
		if goingRight then
			if forward then
				lib.stage1b()
			else
				lib.stage1a()
			end
		else
			if forward then
				lib.stage1a()
			else
				lib.stage1b()
			end
		end
		goingRight = not goingRight
		T:turnRight(2)
		forward = not forward
	end
	return {}
end

function createStaircase()
	-- using slabs NOT stairs
	-- start in centre column of staircase
	-- go down from current level to requested level, then build outer wall upwards if in water or lava
	-- or go up from current level
	-- at top build slabs downwards, deleting water/lava if required
	-- turtle.place() slab stays at ground level, whether block present or not
	-- turtle.placeDown() if block below, places on top of block, else directly below turtle
	-- starting position
	--  |S|S|S| in air / solid ground
	--  |S|T|S|
	--  |S|S|S|

	
	--	| |*|*|*| | in water or lava
	--  |*|S|S|S|*|
	--  |*|S|T|S|*|
	--  |*|S|S|S|*|
	--	| |*|*|*| |

	local lib = {}
	
	function lib.isFluid()
		-- check if water or lava present
		local blockType = T:getBlockType("forward")
	--Log:saveToLog("lib.isFluid() blockType (forward) = "..blockType)
		if blockType:find("lava") ~= nil or blockType:find("water") ~= nil then	-- liquid found, return position
			return true
		end
		blockType = T:getBlockType("up")
	--Log:saveToLog("lib.isFluid() blockType (up) = "..blockType)
		if blockType:find("lava") ~= nil or blockType:find("water") ~= nil then
			return true
		end
		
		blockType = T:getBlockType("down")
	--Log:saveToLog("lib.isFluid() blockType (down) = "..blockType)
		if blockType:find("lava") ~= nil or blockType:find("water") ~= nil then
			return true
		end
		
		T:turnLeft(1)
		blockType = T:getBlockType("forward")
		if blockType:find("lava") ~= nil or blockType:find("water") ~= nil then	-- liquid found, return position
			T:turnRight(1)
			return true
		end
		
		T:turnRight(1)
		blockType = T:getBlockType("forward")
		if blockType:find("lava") ~= nil or blockType:find("water") ~= nil then	-- liquid found, return position
			T:turnLeft(1)
			return true
		end
		
		return false
	end
			
	function lib.addSlabs()
		-- starting position in corner facing pevious steps on left side
		T:go("U1R1")
		T:place("slab", "down")			-- place corner step
		--T:go("B1L1 C1R1 B1")
		T:go("B2")
		T:place("slab", "forward")		-- place centre step, wall 1
	end
	
	function lib.cutDrain(height)
		if height == 3 then
			-- remove all blocks in this area
			T:go("x0x2 F1 x0x2 F1 x0x2 R1")	-- ends NE corner face S: |*|*|v| 3
			T:go("x0x2 F1 x0x2 F1 x0x2 R1")	-- ends SE corner face W: |W|W|<| 1
			T:go("x0x2 F1 x0x2 F1 x0x2 R1")	-- ends SW corner face N: |^|*|*| 1
			T:go("x0x2 F1 x0x2 F1R1")			-- ends NW corner face E: |>|*|*| 3
		elseif height == 2 then
			T:go("x0F1 x0F1 x0R1")			-- ends NE corner face S: |*|*|v| 3
			T:go("x0F1 x0F1 x0R1")			-- ends SE corner face W: |W|W|<| 1
			T:go("x0F1 x0F1 x0R1")			-- ends SW corner face N: |^|*|*| 1
			T:go("x0F1 x0F1 R1")				-- ends NW corner face E: |>|*|*| 3
		elseif height == 1 then
			T:go("F2R1 F2R1 F2R1 F2R1")
		end
	end
	
	function lib.buildRectangle(width, length, height)
		-- used to build outer wall in water / lava with width/length  = 5 * 5
		-- also inner wall 3 * 3
		width = width -1
		length = length -1
		if height == 3 then
			for w = 1, width do
				T:go("C0C2F1")
			end
			T:go("R1")	-- ends NE corner face S: |*|*|v| 3
			for l = 1, length do
				T:go("C0C2F1")
			end
			T:go("R1")	-- ends NE corner face S: |*|*|v| 3
			for w = 1, width do
				T:go("C0C2F1")
			end
			T:go("R1")	-- ends NE corner face S: |*|*|v| 3
			for l = 1, length do
				T:go("C0C2F1")
			end
			T:turnLeft(1)	-- ends NW corner face W: |<|*|...  has blocks above and below		
		elseif height == 2 then
			for w = 1, width do
				T:go("C0F1")
			end
			T:go("R1")	-- ends NE corner face S: |*|*|v| 3
			for l = 1, length do
				T:go("C0F1")
			end
			T:go("R1")	-- ends NE corner face S: |*|*|v| 3
			for w = 1, width do
				T:go("C0F1")
			end
			T:go("R1")	-- ends NE corner face S: |*|*|v| 3
			for l = 1, length do
				T:go("C0F1")
			end
			T:turnLeft(1)	-- ends NW corner face W: |<|*|...  has blocks above and below		
		elseif height == 1 then
			T:go("F"..width.."R1 F"..length.."R1 F"..width.."R1 F"..length + 1 .."L1")	-- ends NE corner face S: |*|*|v| 3
		end
		for w = 1, width do
			T:go("B1C1")
		end
		T:turnRight(1)
		for l = 1, length do
			T:go("B1C1")
		end
		T:turnRight(1)
		for w = 1, width do
			T:go("B1C1")
		end
		T:turnRight(1)
		for l = 1, length do
			T:go("B1C1")
		end
		--T:turnLeft(1)
		--T:go("R2F1R1")
		-- ends NE corner face E: |>|*|... with block above and below
	end
	
	function lib.buildWaterBlock(drainHeight)
		T:go("L1F1 L1F1R2")					--	|>| | | | | row 5 in water or lava
		lib.buildRectangle(5, 5, drainHeight)
		T:go("L1F1 R1F1 L2C1 R1")			--      |*|>|*|... row 4 in water or lava
		lib.buildRectangle(3, 3, drainHeight)
		T:go("L1")
		lib.cutDrain(drainHeight)
	end
	
	function lib.clearCore()
		-- start at top and work down to remove all blocks in 3x3x3 area
		-- delete water/lava as you go
		-- clearance includes layer above and below turtle current level
		-- starting position:
		--  |>|S|S| in air / solid ground
		--  |S|S|S|
		--  |S|S|S|
Log:saveToLog("lib.clearCore() starting")
		
		local remaining = R.height - 2					-- -2 as already 2 blocks below top
		local drainHeight = math.min(3, remaining)		-- 3 unless very shallow
		while remaining > 0 do
			if lib.isFluid() then						-- water or lava present
				lib.buildWaterBlock(drainHeight)
			else
				lib.cutDrain(drainHeight)
			end
Log:saveToLog("lib.clearCore() remaining = "..remaining)		
			if remaining > 3 then
				T:down(3)
				drainHeight = 3
				remaining = remaining - 3
			elseif remaining == 3 then					-- 3 blocks from base, turtle at 4 blocks above
				T:down(3)								-- turtle 1 block above base. fixes layer above and below
				if lib.isFluid() then					-- water or lava present
					lib.buildWaterBlock(3)
				else
					lib.cutDrain(3)
				end
				break									-- turtle ends at ground level
			elseif remaining == 2 then					-- 2 blocks from base, turtle at 3 blocks above
				T:down(2)								-- turtle at ground level, fixes layer above only
				if lib.isFluid() then					-- water or lava present
					lib.buildWaterBlock(2)
				else
					lib.cutDrain(2)
				end
				break									-- turtle ends at ground level
			elseif remaining == 1 then					-- 1 blocks from base, turtle at 3 blocks above
				T:down(1)								-- at base level
				if lib.isFluid() then					-- turtle already at ground level, fixes this layer only
					lib.buildWaterBlock(1)
				else
					lib.cutDrain(1)
				end
				break
			end
		end
	end
	
	-- R.startLevel and R.destinationLevel set in taskInventory.lua
	-- R.auto = stop at stronghold/trial chamber
	-- R.startLevel eg 64 at top (R.goDown = true) or 5 at bedrock, R.goUp = true 
	-- R.lowerLevel = bottom of ladder
	-- R.upperLevel = top of ladder

	R.height = math.abs(R.upperLevel - R.lowerLevel)
	R.currentLevel = R.startLevel	-- eg 64 going down
	R.useBlockType = T:getMostItem("slab", true) -- exclude slab, use stone only/netherrack
--Log:saveToLog("Creating staircase "..R.height.." blocks", true)
Log:saveToLog("tk3.createStaircase() starting; R.up = "..tostring(R.up).."R.down = "..tostring(R.down)
			   .."R.startLevel = "..R.startLevel.."R.destinationLevel = "..R.destinationLevel..", R.height = "..R.height)

	local success, numBlocks, errorMsg, blockType = true, 0, "", ""
	if R.down then -- go down towards bedrock
		local atBedrock = false
		for i = 1, R.height do
			success, numBlocks, errorMsg, blockType = T:down(1, true) -- true = return blockType
			if success then
				R.currentLevel = R.currentLevel - 1
				if R.auto then
					if blockType:find("stone_bricks") ~= nil then
						table.insert(retValue, "Stronghold discovered")
						break -- stop descent at stronghold
					end
					if blockType:find("polished_tuff") ~= nil or blockType:find("tuff_bricks") ~= nil then
						table.insert(retValue, "Trial chamber discovered")
						break -- stop descent at trial chamber
					end
				end
			else
				atBedrock = true
				break
			end
		end
		if atBedrock then -- hit bedrock so get to level 5 / -59
			R.currentLevel = T:findBedrockTop(R.currentLevel)
			T:go("R1F1R1", false, 0, true)
		end
		-- re-calculate start and destination levels
		R.destinationLevel = R.startLevel
		R.startLevel = R.currentLevel
		R.height = math.abs(R.upperLevel - R.lowerLevel)
	end
	-- start from lowerLevel
	for i = 1, R.height do
		T:up(1)
		if not T:place(R.useBlockType, "down") then
			T:place("stone", "down")
		end
	end
	-- moved to top, placing blocks below for central column
	local isFluid = lib.isFluid()
	while isFluid do		-- continue upwards until out of water/lava
		T:up(1)
		if not T:place(R.useBlockType, "down") then
			T:place("stone", "down")
		end
		R.height = R.height + 1
		isFluid = lib.isFluid()
	end
	-- now at top in air or solid blocks
	-- cut a square pipe round central column
	T:go("F1L1 F1R2 D2")		--  |>| | |  > = turtle facing E
								--  | |X| |  X = core
								--  | | | |
	lib.clearCore()
	T:go("R1x2 F2D1 x2L1")		--  | | | |  
								--  | |X| |  X = core
								--  |>| | |  > = turtle facing E top at ground level
	while R.currentLevel < R.destinationLevel do
		lib.addSlabs()
		R.currentLevel = R.currentLevel + 1
	end
	
	return{"Staircase completed"}
end

function createStripMine()
	--[[
	R.length should be a multiple of 16
	mine a corridoor repairing floor and ceiling
	check sides, remove valuable items
	plug if lava present
	Every 16 blocks dig a side passage 1 block deep 2 blocks long
	]]
	local lib = {}
	
	function lib.seal()	
		if T:isValuable("forward") then	-- valuable block in front. If debris then refuse already dumped
			T:dig("forward")
		end
		local blockType = T:getBlockType("forward")
		if blockType:find("lava") ~= nil then
			--T:place("stone", "forward", false) -- place does not allow for specific blocktype
			T:go("C1", false, 0, false, R.useBlockType)
			return true
		end
		
		return false
	end
	
	function lib.checkSeal()
		local retValue = false
		T:turnRight(1)
		if lib.seal() then
			retValue = true
		end
		T:turnLeft(2)
		if lib.seal() then
			retValue = true
		end
		T:turnRight(1)
		return retValue
	end
		
	function lib.alcove()
		-- right side, starting at ceiling
		T:go("R1F1 C0", false, 0, false, R.useBlockType)-- stone ceiling, facing alcove wall (upper)
		lib.seal()										-- seal alcove wall (upper)	
		T:go("D1C2", false, 0, false, "cobble")			-- cobble floor, facing alcove wall (lower)	
		lib.seal()										-- seal alcove wall (lower)		
		T:go("L2 F1")									-- down 1, turn round, return to corridoor.
		-- left side	
		T:go("F1 C2", false, 0, false, "cobble")		-- cobble floor, facing alcove wall (lower)	
		lib.seal()										-- seal alcove wall (lower)
		T:go("U1 C0", false, 0, false, R.useBlockType)	-- stone ceiling, still facing alcove wall
		lib.seal()										-- seal alcove wall (upper)						
		T:go("L2F1L1")									-- return to corridoor at ceiling position
		lib.placeTorch()								
	end
	
	function lib.placeTorch()
		if R.torchInterval > 0 then 					-- torches onboard
			if T:getItemSlot("minecraft:torch") > 0 then
				T:place("minecraft:torch", "down")
			end
		end
	end
	
	R.useBlockType = T:getMostItem("", true) -- exclude none, use stone only/netherrack
	
	local seal = false
	if T:getItemSlot("minecraft:torch") == 0 then
		R.torchInterval = 0 -- set to default 16 above
	end
	for steps = 1, R.length do
		-- go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
		T:go("C2U1C0", false, 0, true, R.useBlockType)		-- check and repair floor / ceiling
		if steps % 16 == 0 or steps % 16 == 1 then
			lib.alcove() -- enter and exit at ceiling position
		else
			seal = lib.checkSeal()
		end
		T:go("F1D1", false, 0, true)
		seal = lib.checkSeal()
	end
	if seal then -- water or lava found while tunnelling
		T:go("U1C0", false, 0, true, R.useBlockType)
		lib.checkSeal()
		T:go("C1", false, 0, true, R.useBlockType)
		T:down(1)
	end
	return {}
end

function createTreefarm()
	local lib = {}
	--go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	function lib.buildWallSection(section, useBlockType)
		-- build a layer 1 block high below turtle
		for i = 1, #section do
			local block = section:sub(i, i)
			if block == "l" then
				T:place("log", "down")
			elseif block == "m" then
				T:place("modem", "down")
			elseif block == "b" then
				T:place("barrel", "down")
				T:drop("down", "dirt", 64)	-- T:drop(direction, slot, amount): override number 'slot' with string 'dirt'
			elseif block == "c" then
				T:place("cable", "down")
			else
				T:place(useBlockType, "down")
			end
			if i < #section then
				T:forward(1)
			end
		end
	end
	
	function lib.placeFloor(length, useBlockType)
		for i = 1, length do
			while turtle.digUp() do end
			turtle.digDown()
			T:place(useBlockType, "down")
			--T:go("x0C2", false, 0, false, useBlockType)
			if i < length then
				while not turtle.forward() do
					turtle.dig()
				end
				--T:forward(1)
			end
		end
	end
	
	function lib.placeWater(length)
		T:placeWater("down") 
		T:go("F"..length.."R1")
	end
	
	function lib.placeCorners(length, numBlocks, useBlockType)
		for i = 1, numBlocks do
			T:go("C2F1", false, 0, false, useBlockType)
		end
		-- now at 5th space
		T:forward(length - (numBlocks * 2))
		for i = 1, numBlocks do
			T:go("C2", false, 0, false, useBlockType)
			if i < numBlocks then
				T:forward(1)
			end
		end
	end
	
	function lib.turn(outward)
		if outward then
			T:go("R1F1R1")
		else
			T:go("L1F1L1")
		end
		return not outward
	end
	
	function lib.findLegacyStart()
		T:turnRight(1)
		local block = T:getBlockType("down")
		if block:find("polished") ~= nil then
			return ""	-- in correct position, facing centre of front wall
		end
		-- assume on left corner
		T:forward (1)
		local couint = 0
		while (T:getBlockType("down")):find("polished") == nil do
			T:forward(1)
			count = count + 1
			if count > 10 then
				return "Unable to locate polished block"
			end
		end
		return ""
	end
	
	function lib.floodFarm()
		local outward = true
		T:sortInventory(false)
		for i = 1, R.width - 2 do
			lib.placeFloor(R.length - 2, R.useBlockType)
			if i < R.width - 2 then
				outward = lib.turn(outward)
			end
		end
		T:go("U1R2") -- over 13 x 13 internal area opposite corner
		-- now add corners
		lib.placeCorners(R.length - 2, 4, R.useBlockType)
		outward = lib.turn(outward)
		lib.placeCorners(R.length - 2, 3, R.useBlockType)
		outward = lib.turn(outward)
		lib.placeCorners(R.length - 2, 2, R.useBlockType)
		outward = lib.turn(outward)
		lib.placeCorners(R.length - 2, 1, R.useBlockType)
		if outward then
			T:go("R1F"..R.width - 9 .."R1")
		else
			T:go("L1F"..R.width - 9 .."L1")
		end
		outward = not outward
		lib.placeCorners(R.length - 2, 1, R.useBlockType)
		outward = lib.turn(outward)
		lib.placeCorners(R.length - 2, 2, R.useBlockType)
		outward = lib.turn(outward)
		lib.placeCorners(R.length - 2, 3, R.useBlockType)
		outward = lib.turn(outward)
		lib.placeCorners(R.length - 2, 4, R.useBlockType) -- should be back in starting corner facing front
		
		T:go("U1R1")
		lib.placeWater(R.length - 3) -- place water down then move forward, turn right
		lib.placeWater(R.width - 3)
		lib.placeWater(R.length - 3) 
		lib.placeWater(R.width - 3)
		T:go("F".. math.floor((R.length - 2) / 2).."R1F".. math.floor((R.width - 2) / 2)) -- should be in centre
		
		--T:go("D6x2 F1x2 F1x2 F1x2 F1x2 F1x2 F1x2 F1x2 F1x2 F1x2 R1F7 R1U1")
		T:go("D6F7 R1F7 R1U1") -- end facing back at left corner, 1 block above floor/1 below ceiling
	end
	
	function lib.clearBasement()
		-- T:sortInventory(false)
		-- T:dropItem("seeds", "forward")
		-- T:dropItem("flint", "forward")
		-- clearRectangle({width = 15, length = 15, up = true, down = true})
		utils.createBasement(true, true, 15, 15)	-- end facing back at left corner, 1 block above floor/1 below ceiling
		-- area has been cleared. starts facing back, 1 block above ground, 1 block below ceiling
		T:go("R1U1")
		for i = 1, 14 do	-- place cable into gutter beneath front of farm
			T:place("cable", "up")
			if i < 14 then
				T:forward(1)
			end
		end
		-- ends right side facing right, just below ceiling
	end
	
	local blockType
	local blockModifier
	R.useBlockType = T:getMostItem("", true)
	-- R.data = "new", "left", "right" or "back" to extend tree farm
	-- R.data = "convert" or "convertStorage" for legacy farm
	-- R.up = true if clear area
	-- R.goDown to create storage area
	utils.waitForInput("IMPORTANT! follow me underneath\nto activate modems when prompted")
	
	if R.inventoryKey ~= "" then
		R.data = R.inventoryKey
	end
	if R.up then
		if R.data == "left" then -- clearArea() start position is bottom left
			turtle.turnLeft()
		end
		clearArea()
		if R.data == "left" then -- clearArea() end position is bottom left
			turtle.turnRight()
		end
	end
	-- R.data = "new", "left", "right", "back"
	-- R.up = clear area
	-- R.goDown = add storage: usually on new farm

	if R.data == "new" then -- new treeFarm, Start at current position
		-- build 4 wall sections in 2 passes
		T:down(1)
		lib.buildWallSection("---------------", R.useBlockType)		-- left wall (15 blocks)
		T:go("R1F1")
		for i = 1, 2 do
			lib.buildWallSection("--------------", R.useBlockType)	-- back/ right wall (14 blocks)
			T:go("R1F1")
		end
		lib.buildWallSection("------c------", R.useBlockType)		-- front wall (14 blocks) c = network cable
		T:go("U1F1R1")
		lib.buildWallSection("---------------", R.useBlockType)		-- left wall top (15 blocks)
		T:go("R1F1")
		for i = 1, 2 do
			lib.buildWallSection("--------------", R.useBlockType)	--back/right wall (14 blocks)
			T:go("R1F1")
		end
		--lib.buildWallSection("-----lmb-----", R.useBlockType)	--front wall (14 blocks) log/modem/barrel
		lib.buildWallSection("-----lmb", R.useBlockType)
		utils.goBack(1)
		U.attachModem()
		T:forward(2)
		lib.buildWallSection("-----", R.useBlockType)	
		T:go("R1F1 D2") -- over 13 x 13 internal area
	elseif R.data == "left" or R.data == "right" or R.data == "back" then
		-- build 3 wall sections in 2 passes
		if R.data == "left" then										-- should be on left corner of existing
			T:go("L1F1 D1") 											-- move left 1 blocks, down 1: <-
			lib.buildWallSection("------c-------", R.useBlockType)		-- front wall (14 blocks) c = network cable <-
			T:go("R1F1")
			lib.buildWallSection("--------------", R.useBlockType)		-- left wall (14 blocks) ^
			T:go("R1F1")
			lib.buildWallSection("-------------", R.useBlockType)		-- back wall (13 blocks) ->
			T:go("U1R2")												-- turn round ready to add next layer <-
			lib.buildWallSection("--------------", R.useBlockType)		-- back wall top (14 blocks) <-
			T:go("L1F1")
			lib.buildWallSection("--------------", R.useBlockType)		-- left wall top (14 blocks) v
			T:go("L1F1")
			lib.buildWallSection("-----bm", R.useBlockType)			-- front wall (7 blocks) barrel/modem ->
			U.attachModem()
			T:forward(1)
			lib.buildWallSection("l-----", R.useBlockType)				-- front wall (5 blocks) log ->
			T:go("R2F12 R1F1 D2") 										-- over 13 x 13 internal area lower left side
		elseif R.data == "right" then									-- should be on right corner of existing
			T:go("R1F1 D1") 											-- move right, forward, down 1
			lib.buildWallSection("------c-------", R.useBlockType)	-- front wall (14 blocks) c = network cable
			T:go("L1F1")
			lib.buildWallSection("--------------", R.useBlockType)		-- right wall (14 blocks)
			T:go("L1F1")
			lib.buildWallSection("-------------", R.useBlockType)		-- back wall (13 blocks)
			T:go("U1R2")												-- turn round ready to add next layer
			lib.buildWallSection("--------------", R.useBlockType)		-- back wall top (14 blocks)
			T:go("R1F1")
			lib.buildWallSection("--------------", R.useBlockType)		-- left wall top (14 blocks)
			T:go("R1F1")
			lib.buildWallSection("-----lmb", R.useBlockType)
			utils.goBack(1)
			U.attachModem()
			T:forward(2)
			lib.buildWallSection("-----", R.useBlockType)	
			T:go("R1F1 D2") 											-- over 13 x 13 internal area
		elseif R.data == "back" then									-- should be on left front corner of existing
			T:go("R2F1 D4R2 F1") 										-- move forward 14 blocks, down 1
			for i = 1, 15 do
				T:place("cable", "up")
				T:forward(1)
			end
			T:up(1)
			if T:getBlockType("up") == R.useBlockType then				-- already a farm on left side
				T:go("U2C2 U1C2 F13R1 F1D1", false, 0, false, R.useBlockType)
				lib.buildWallSection("--------------", R.useBlockType)	-- back wall (14 blocks)
				T:go("R1F1")
			else
				T:up(2)
				lib.buildWallSection("--------------", R.useBlockType)	-- left wall (14 blocks)
				T:go("R1F1")
				lib.buildWallSection("--------------", R.useBlockType)	-- back wall (14 blocks)
				T:go("R1F1")
			end

			lib.buildWallSection("-------------", R.useBlockType)		--right wall (13 blocks) no special blocks
			T:go("U1R2")	-- turn round ready to add next layer
			for i = 1, 2 do
				lib.buildWallSection("--------------", R.useBlockType)	--right wall top (14 blocks) no special blocks
				T:go("L1F1")
			end
			lib.buildWallSection("-------------", R.useBlockType)		-- left wall top (13 blocks) no special blocks
			T:go("F1L1 F7x2")
			T:go("D1x2")
			T:place("cable", "down")
			T:up(1)
			T:place("modem", "down")
			T:go("F1R2x2")
			T:place("log", "down")
			T:go("F2x2")
			T:place("barrel", "down")
			utils.goBack(1)
			U.attachModem()
			T:go("F6R1 F1D2")
		end
	else -- convertStorage or convert
		-- legacy farm had polished block on positions 4 / (10) from left corner
		 local message = lib.findLegacyStart()
		 if message ~= "" then
			return {message}
		 end
		 -- now on top of polished block, 4 from left corner, facing Centre
		 T:forward(2)
		 T:place("barrel", "down")
		 T:go("F1D1")
		 T:place("cable", "down")
		 T:up(1)
		 T:place("modem", "down")
		 U.attachModem()
		 T:forward(1)
		 T:place("log", "down")
		 T:go("R1F1 R1F1 D5R1 F1L1 F7R1")-- left corner, facing back ready to clear basement
	end
	if (R.data):find("convert") == nil then
		lib.floodFarm()
	end
	lib.clearBasement() 				-- area has been cleared. ends right side facing right, just below ceiling
	
	if R.data == "back" then			-- do not make exit for player
		R.goDown = false				-- disable storage
		T:go("R2F6 R1D1")
	else
		--T:go("R2F6 L1F1 U4D5 R2F1") 	-- make exit for player. end mid floor/ceiling height, facing back, in centre
		T:go("R2F6 L1F1 x2U4") 	-- make exit for player. end mid floor/ceiling height, facing back, in centre
		for i = 1, 6 do
			T:down(1)
			T:place("ladder", "up")
		end
		T:back(1)
		T:place("ladder", "forward")
		T:go("U1R2")
	end
	for i = 1, 6 do
		T:place("cable", "up")
		T:forward(1)
	end
	if R.goDown or R.data == "convertStorage" then	-- build storage
		utils.createStorage()	-- creates on ground, 1 below current
		T:place("modem", "up")
		T:go("F1R2")
		T:place("cable", "forward")
		T:go("U2")
	else
		T:place("modem", "up")
		T:go("F1U2R2")
	end
	T:place("barrel", "down")
	T:up(1)
	T:place("hopper", "down")
	T:go("F2D2")
	U.attachModem()
	T:up(1)
	T:place("cable", "down")
	T:go("U1C2 U2F5 R2")
	
	return {"tree farm created"}
end

function createTrialCover()
	local lib = {}
	
	function lib.isSpawner()
		local blockType = T:getBlockType("down")
		if blockType:find("spawner") ~= nil then
			return true, "top", ""
		end
		blockType = T:getBlockType("up")
		if blockType:find("spawner") ~= nil then
			return true, "bottom", ""
		end
		blockType = T:getBlockType("forward")
		if blockType:find("spawner") ~= nil then
			return true, "forward", blockType
		end
		return false, "", blockType	-- block ahead always returned. Allows mushroom checking
	end
	
	function lib.findSpawner()
		local moves  = 0
		local wallCleared = false
		local quit = false
		-- assume turtle placed facing trial spawner
		print("Checking if next to spawner")
		local found, position, blockType = lib.isSpawner() -- true/false, top/bottom/nil
		while not found and not quit do -- move forward towards spawner
			print("Not close to spawner")
			
			if blockType:find("mushroom") ~= nil then
				turtle.dig()
				blockType = ""
			elseif blockType ~= "" then
				if wallCleared then	
					quit = true
					break
				else	-- could be behind a wall
					print("Assuming spawner behind a wall")
					turtle.dig()
					blockType = ""
					wallCleared = true
				end
			end
			turtle.forward()
			moves = moves + 1
			if moves > 32 then
				quit = true
			end
			found, position, blockType = lib.isSpawner() -- true/false, top/bottom/nil
		end
		if not found or quit then
			T:go("R2F"..moves + 2 .."R2")
		end
		
		return found, position
	end
	
	
	function lib.front()
		-- in mid right side facing left | | |<|
		T:go("C0C2 F1 C0C2 F1 C0C2")
		T:go("B1C1 B1C1 B1C1")
		-- ends outside mid right side facing left | | | |<
	end
	
	function lib.sides()
		-- on mid left side of a 3 x 3 square, facing right
		T:go("C0C2 F1 C0C2 F1 C0C2 F1L1 F1")
		T:go("C0C2 F1 C0C2 F1 C0C2 F1L1 F1")
		T:go("C0C2 F1 C0C2 F1 C0C2")
		T:go("B1C1 B1C1 B1C1")
		T:go("R1B1")
		T:go("B1C1 B1C1 B1C1")
		T:go("R1B1")
		T:go("B1C1 B1C1 B1C1")
		-- ends on mid right of front facing back
	end
	
	function lib.floor()
		-- start in floor left corner 3 x 3 facing back
		T:go("C2F1 C2F1 C2R1")	-- floor round spawner lowered by 1 block, facing player
		T:go("F1 C2F1 C2R1")
		T:go("F1 C2F1 C2R1")
		T:go("F1C2 B1R1 F1R1")
	end
	
	R.useBlockType = T:getMostItem("", false) -- use whatever block type available
	local found, position = lib.findSpawner() -- move forwards until meet Spawner, go through wall if present
	if not found then --outside dungeon
		return {"Trial spawner not found"}
	end
	-- move to face spawner, 1 block gap
	if position == "top" then
		T:go("B2D1")
	elseif position == "forward" then
		T:go("B1")
	else
		T:go("B2U1")
	end
	T:go("R1F1R2")				-- ends in right side of 3 x 3 face, looking left | | |<|
								-- starts with wall across spawner
	lib.front()					-- ends in right side of 3 x 3 face, looking left | | | |<
	T:go("R1F1")				-- in position to start sides
	lib.sides()					-- end right of mid front panel, facing rear
	T:go("U1F1 L1F1 R2C1 L1")	-- end top right corner under ceiling, facing rear
	T:go("C0F1 C0F1 C0L1 F1L1 C0F1 C0F1 C0R1 F1R1 C0F1 C0F1 C0") -- ceiling placed. end outside top right corner, facing left
	T:go("R1D2")				-- on top of new floor level
	lib.floor()					-- end facing player, on new floor, block ahead
	T:go("F1C2 F1D1 C2U1 R2")	-- break through, fix player block 
	T:place("slab","down")		-- slab for player
	T:go("F1x0")				-- return to entrance, break block above 
	T:place("slab","up")		-- reduce exit height
	R.auto = true				-- ready for continuous attack
	attack("forward")
	return {}
end

function createFence()
	R.width = 0
	return createEnclosure()
end

function createWaterCanal()
	--[[
	designed for 4 turtles, but can be done with 2 as well
	R.data = 1 (2 turtles) or 2 (4 turtles)
	R.height = 0 (in water/ on canal floor) or 1 (at ground level)
	R.side = "R" or "L"
	R.subChoice =
		1 = left side, ground level (on towpath)
		2 = left side above canal water (new canal only)
		3 = right side above canal water (new canal only)
		4 = right side, ground level (on towpath)
		5 = left side in canal water (if present)
		6 = right side in canal water (if present)
	
	if R.height = 0 then already at correct height on canal floor
		check block below, block to left and block above, move forward tunnelling
		if entering water then move up, onto canal wall and continue pathway
		if tunnelling then flood canal
	else R.height = 1 then above water and on path across
		move forward, checking for water below
		if water finishes, move into canal, drop down and continue tunnelling
	]]
	local turn = "L"
	local oTurn = "R"
	local lib = {}
	
	function lib.fillEmpty(direction)
		direction = direction or "forward"
		local blockType = T:getBlockType(direction)
		if blockType == "" then	-- air
			T:place("stone", direction)
		end
	end
	
	function lib.newCanalSide()
		T:go("U1x1") 									
		T:place("slab", "forward")					-- place slab on ground level
		--if turtle.detectUp() then
			--T:go("U1x1 U1x1 U1x1 D4")				-- go up 3 removing blocks ahead and up. back to water level
		--else
			--T:down(1)								-- back to water level
		--end
		local moves = 0
		while turtle.detectUp() and moves <= 3 do
			T:up(1)
			moves = moves + 1
		end
		T:down(moves)
	end
	
	function lib.newSource()
		-- levels: 0 = water, 1 = path, -1 = canal floor
		-- rows 0 = canal back, 1,2,3, = water source
		--starts facing away from canal at back wall level 0				   |V|V|  0, 1
		T:go("C1D1"..turn.."1") -- facing opposite side under base 		   |>|<| -1, 1										   			-- |>|<| -1, 1
		lib.fillEmpty("forward")
		
		T:go(turn.."1F1"..oTurn.."1") -- facing opposite side under base 2	   |>|<| -1, 2
		lib.fillEmpty("forward")
		
		T:go(turn.."1F1"..oTurn.."1") -- facing opposite side under base 3	   |>|<| -1, 3
		lib.fillEmpty("forward")
		
		T:go(turn.."1U1C1"..turn.."1C1C2 "..turn.."1F1"..oTurn.."1C1C2"..turn.."1F1"..oTurn.."1C1C2"..oTurn.."1F1")
		-- | |C|C| | 0, 4
		-- |C| | |C| 0, 3
		-- |C|^|^|C| 0, 2
		-- |C| | |C| 0, 1
		-- | |C|C| | 0, 0
		T:placeWater("forward") 							-- |C|W|W|C| 0, 3 
		T:go(turn.."2")										-- |C|V|V|C| 0, 2
		T:placeWater("forward") 							-- |C|W|W|C| 0, 1
		T:go("F1"..turn.."2")								-- |C|^|^|C| 0, 1
		-- ends at back of canal/water source, facing down canal
	end
		
	function lib.initialiseCanal()
		--[[ move turtle to correct position. return moves]]
		local newCanal, isWater, isSource = false, false, false
		--if R.subChoice == 1 or R.subChoice == 4 then 	-- left / right side on towpath- move into canal space
		if R.position == 1 or R.position == 4 then 		-- left / right side on towpath- move into canal space
			T:go(oTurn.."1F1D1"..oTurn.."1") 		-- move into canal, face back along any existing canal
			isWater, isSource = T:isWater("forward")
			if isSource then
				T:go(turn.."2") 					-- face forward for new canal
			else
				newCanal = true
			end
		elseif R.position == 2 or R.position == 3 then	-- left / right side above canal finishing pos if deletesWater
			T:go("D1"..R.side.."2")					-- facing existing on canal floor
			isWater, isSource = T:isWater("forward")
			if isSource then						-- water ahead
				T:go(R.side.."2")					-- face forward for new canal
			else 									
				newCanal = true
			end
		end

		if newCanal then 								-- no water ahead, facing start wall of new canal *|<| | |
			lib.newSource() 							-- start new canal, finish facing new canal 6 block water sources
		end
		
		--return 1 									-- facing forward ready for new canal *|>| | |
	end
	
	function lib.waterOnly()
		-- Already in position facing new canal, 2 water buckets
		local sourceCount = 0								-- allow for 1 iteration of placing source blocks when changing from solid to water
		local numBlocks = 0									-- distance travelled
		local _, isSource = nil, false						-- initialise variables
		
		while numBlocks < R.length do						-- loop from here. Facing forwards to extend canal
			numBlocks = numBlocks + 1						-- inrease block count
			T:forward(1) 								-- move forward to extend canal
			_, isSource = T:isWater("forward")			-- check if source water ahead
			if isSource then							-- ? source ahead
				sourceCount = sourceCount + 1
			else
				sourceCount = 0
				if not turtle.detectDown() then			-- air / water below, but no source in front, so fill it
					T:go(oTurn.."1D1")					-- ready to repair neighbouring canal base
					lib.fillEmpty("forward")			-- repair neighbouring canal base
					T:go(turn.."1U1C2")					-- place block below if not already source
				end
			end
			local moves = 0
			while turtle.detectUp() and moves <= 3 do
				T:up(1)
				moves = moves + 1
				--T:go("U2x0D1")							-- up 1 and excavate blocks above canal. return to canal base
			end
			T:down(moves)

			--T:go(turn.."1C1"..oTurn.."1", false, 0, true) -- face canal wall, replace with stone if empty, face forward	
			T:go(turn.."1")
			lib.fillEmpty("forward")
			T:go(oTurn.."1") 
			if not isSource	and sourceCount == 0 then	-- not source in front, or first time found, ensures continous canal					
				T:go("C1", false, 0, true) 				-- 0| | | |>| face along new canal and block entrance
				utils.goBack(1)							-- 0| | |>| | back 1
				T:placeWater("forward")					-- 0| | |>|W| place water
				T:go(oTurn.."2") 						-- 0| | |<|W| face existing canal 
				_, isSource = T:isWater("forward")		-- 0| |?|<|W| check if source water ahead 
				if not isSource then
					if not T:placeWater("forward") then	-- place water again 0| |W|<|W|
						while not T:getWater("forward") do -- wait for other turtle
							print("Out of water buckets")
							sleep(1)
						end
						sleep(0.2)
						T:placeWater("forward") 
					end
				end
				utils.getWater() 						-- collects 2 water 0| |W|<|W|
				T:go(turn.."2F1") 						-- face along new canal *| |W|>|W| to *| |W|W|>|
			end
		end
	end
	
	function lib.waterPath()
		-- Already in position facing new canal, 2 water buckets
		local sourceCount = 0								-- allow for 1 iteration of placing source blocks when changing from solid to water
		local _, isSource = nil, false						-- initialise variables
		
		for i = 1, R.length do								-- loop from here. Facing forwards to extend canal
			T:go(turn.."1")									-- face towpath at water level
			if R.torchInterval > 0 then						-- place torches
				if i == 1 or i % R.torchInterval == 0 then
					T:go("U1x1") 							-- up to towpath level							
					T:place("stone", "forward")				-- place block on ground level
					T:go("U1x1 U1x1 U1x0 F1x0 D1")						-- 
					T:place("torch", "down")				-- place torch	on block
					T:go("B1D3")
					--utils.goBack(1)
					--T:down(3)								-- back to water level
				else
					lib.newCanalSide()
				end
			else
				lib.newCanalSide()
			end
			T:go(oTurn.."1")								-- face front of canal at water level
			-- side of canal has been excavated, slab or torch placed
			-- now continue adding water to canal length
			_, isSource = T:isWater("forward")			-- check if source water ahead
			if isSource then							-- ? source ahead
				sourceCount = sourceCount + 1
			else
				sourceCount = 0
				if not turtle.detectDown() then			-- air / water below, but no source in front, so fill it
					T:go(oTurn.."1D1")					-- ready to repair neighbouring canal base
					lib.fillEmpty("forward")			-- repair neighbouring canal base
					T:go(turn.."1U1C2")					-- place block below if not already source
				end
			end
		
			T:go(turn.."1")								-- face towpath at water level
			lib.fillEmpty("forward")					-- close gap if air (water left alone)
			T:go(oTurn.."1") 
			if not isSource	and sourceCount == 0 then	-- not source in front, or first time found, ensures continous canal					
				T:go("C1", false, 0, true) 				-- 0| | | |>| face along new canal and block entrance
				utils.goBack(1)							-- 0| | |>| | back 1
				T:placeWater("forward")					-- 0| | |>|W| place water
				T:go(oTurn.."2") 						-- 0| | |<|W| face existing canal 
				_, isSource = T:isWater("forward")		-- 0| |?|<|W| check if source water ahead 
				if not isSource then
					if not T:placeWater("forward") then	-- place water again 0| |W|<|W|
						while not T:getWater("forward") do -- wait for other turtle
							print("Out of water buckets")
							sleep(1)
						end
						sleep(0.2)
						T:placeWater("forward") 
					end
				end
				utils.getWater() 						-- collects 2 water 0| |W|<|W|
				T:go(turn.."2F1") 						-- face along new canal *| |W|>|W| to *| |W|W|>|
				T:forward(1) 								-- move forward to extend canal
			end
		end
	end
	
	R.useBlockType = T:getMostItem("", true) 
	if R.length == 0 then
		R.length = 512
	end
	R.side = "L"
	if R.position == 3 or R.position == 4 or R.position == 6 then
		R.side = "R"
		turn = "R"
		oTurn = "L"
	end
	menu.clear()
	menu.colourWrite("Building canal "..R.side.." side", colors.yellow, nil, nil, false, true)
	if R.turtleCount == 2 then 		-- 2 turtles
		if R.position < 5 then		-- R.position 5 & 6 already in water canal
			lib.initialiseCanal() 	-- move to correct position and/or start new canal
		end
		lib.waterPath()									-- construct towpath and canal at same time
	else -- 4 turtles (default)
		if R.position == 1 or R.position == 4 then 		-- towpath
			utils.towpathOnly()
		else
			if R.position < 5 then		-- R.position 1, 4 already checked, so 2, 3 only
				lib.initialiseCanal() 	-- move to correct position and/or start new canal
			end
			lib.waterOnly()		
		end
	end
	
	return {}
end

function deactivateDragonTower()
	-- go up centre of tower to bedrock
	local height = 0
	--numBlocksMoved, errorMsg = clsTurtle.doMoves(self, numBlocksRequested, direction)
	local numBlocks, message = T:doMoves(1, "up")
	while message == nil do
		numBlocks, message = T:doMoves(1, "up")
		height = height + 1
		if height > 100 then	 -- climbed too high
			T:down(height)
			return{"Tower top not found"}
		end
	end
	-- go round bedrock and destroy crystal
	--T:go("F1R2U2x1U1x1")
	T:go("F2R2U2")
	turtle.attack() -- mc 1.20+ crystals can be attacked, not dig
	turtle.dig()
	turtle.up()
	turtle.attack() -- mc 1.20+ crystals can be attacked, not dig
	turtle.dig()
	turtle.forward()
	turtle.attack() -- mc 1.20+ crystals can be attacked, not dig
	turtle.dig()
	-- return to start
	T:down(height + 5)
	return {}
end

function demolishPortal()
	--[[
	R.length = length of portal NOT width default 4
	R.height = height of portal default 5
	R.width = thickness of portal default 1
	R.data = "bury" if embedded base in ground
	R.side = "F" facing portal, "E" = aligned with side
	]]
	local data = R.data
	if R.side == "F" then -- facing portal
		T:go("F"..R.width.."R1")
	else
		T:forward(1)
	end
	if R.data == "bury" then
		T:down(1)
	end

	R.data = "up"
	R.silent = true
	if R.width == 1 then
		clearWall()
	else
		clearBuilding(true, true)
	end
	if data == "bury" then
		T:up(1)
	end
	if R.side == "F" then -- facing portal
		T:go("R1F1L1F1L1")
	end
	
	return {}
end

function digTrench()
	local blockType
	-- go down R.height, move forward
	if R.length == 0 then
		R.length = 4096 -- will go out of loaded chunks and stop or max 4096 on a server
	end
	for i = 1, R.length do
		local count = 0
		for down = 1, R.height do
			blockType = T:isWaterOrLava("down") 
			-- go down only if no water or lava below
			if blockType:find("water") == nil and blockType:find("lava") == nil then
				T:down(1)
				count = count + 1
			end 
		end
		T:go("C2", false, 0, true)				-- if empty below fill void
		T:go("U"..count)						-- return to surface, continue if block above
		while turtle.detect() do				-- go up while block in front
			blockType = T:getBlockType("forward")
			if T:isVegetation(blockType) then
				T:dig("forward")
				break
			elseif blockType:find("log") ~= nil then
				T:harvestTree("forward")
			else
				T:up(1)
			end
		end
		T:forward(1)							-- move forward
		while not turtle.detectDown() do		-- go down until block detected
			blockType = T:isWaterOrLava("down") 
			if blockType:find("water") == nil and blockType:find("lava") == nil then
				T:down(1)
			else
				break
			end
		end
	end
	
	return {}
end

function drainWaterLava()
	-- repeatedly deletes water with row of stone to right
	local lib = {}
		
	function lib.startCorner()
		-- assume starting mid 3 high column
		T:go("D1C1R1C1 U1C1 L1C1 U1C1 R1C1 L1D1 C2C0", false, 0, true)
		-- finished on same mid 3 high column with wall in front and right completed
	end
	
	function lib.midWall()
		-- assume starting mid 3 high column
		T:go("D1R1C1 U1C1 U1C1 L1D1 C2C0", false, 0, true)
		-- finished on same mid 3 high column with wall on right completed
	end
	
	function lib.endCorner()
		-- assume starting mid 3 high column
		T:go("D1R1C1 R1C1 U1C1 L1C1 U1C1 R1C1 L2D1 C2C0", false, 0, true)
		-- finished on same mid 3 high column with wall behind and right completed
	end
	
	function lib.backTurn(offset)
		-- assume starting mid 3 high column with completed wall behind
		T:go("L1F"..offset.."L2C1 R1D1C1 U1C1 U1C1 D1")
		-- end next row along the width, facing the back, mid point
		-- wall ahead completed
	end
	
	function lib.frontTurn()
		-- assume starting mid 3 high column facing back
		-- next move is to turn toward previous wall and remove

		T:go("L2D1C1 U1C1 U1C1 D1R1 C2C0 F1R2C1 L1")
		-- end facing back ready to remove wall
	end
	
	function lib.buildWall(height)
		-- starts 1 block below surface facing across length of water/lava/water
		-- builds 3 high wall ending at starting position
		-- any blocks found along the way are removed
		for i = 1, R.length do
			if i < R.length then
				if height == 3 then
					T:go("C0C2F1")
				else
					T:go("C2F1")
				end
			else
				if height == 3 then
					T:go("C0C2")
				else
					T:go("C2")
				end
			end
		end
		for i = 1, R.length - 1 do
			turtle.back()
			T:place(R.useBlockType, "forward")
		end
	end
		
	function lib.removeWall(height)
		-- starts centre block of 3 high wall
		-- removes all blocks , ending at perimeter wall
		for i = 1, R.length do
			if i < R.length then
				if height == 3 then
					T:go("x0x2F1")
				else
					T:go("x2F1")
				end
			else
				if height == 3 then
					T:go("x0x2")
				else
					T:go("x2")
				end
			end
		end
	end
	
	function lib.placeRetainingWall(distance)
		-- assume starting above 3 block high area facing front (player)
		--T:down(1)
		for i = 1, distance do
			if i == 1 then -- start wall
				lib.startCorner()
			else
				if i < distance then -- mid wall
					lib.midWall()
				else -- end of the wall
					lib.endCorner()
				end
			end
			if i < distance then
				if not turtle.back() then
					T:go("R2F1R2")
				end
				T:go("C1", false, 0, true)
			end
		end
		return 1
	end
	
	function lib.startWall(height)
		lib.buildWall(height)				-- col 1: 1st wall, return to start position
		T:go("R1F1 R2C1 R1")			-- col 2: ready for parallel wall
		lib.buildWall(height)				-- col 2: first 2 walls built. facing far side
		T:go("L1F1 R2C1 L1")			-- col 1: facing far side, retaining wall to right
		lib.removeWall(height)			-- col 1: wall removed, now at far side facing start
		T:go("R2F"..(R.length - 1)) 	-- col 1: start position, facing wall, ready for loop
	end
	
	function lib.placeDam(distance)
		--T:go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
		local waterPresent = false
		for i = 1, distance do
			if T:isWater("down") then
				waterPresent = true
			end
			T:go("C0C2")
			if i < distance then
				if not turtle.back() then
					T:go("R2F1R2")
				end
				T:go("C1", false, 0, true)
			end
		end
		return waterPresent
	end
	
	function lib.removeDam(distance)
		-- facing towards back, dig wall up down and ahead
		for i = 1, distance do
			T:go("x0x2")
			if i < distance then
				T:forward(1)
			end
		end
		T:turnRight(2)
		-- end up back to retaining wall, mid point
	end
	
	R.useBlockType = T:getMostItem("", false)
	if R.data == "" then
		if turtle.detectDown() then -- on solid surface
			turtle.forward()
		end
	end

	if deletesWater then --turtle replaces source so use clearSolid()
		R.silent = true
		R.down = true
		R.up = false
		clearSolid()
	else -- mc 1.12.15+ turtle does NOT replace source blocks
		-- place first stone along the length of water and measure length		
		if R.data == "enclosed" then	-- eg ocean monument all walls built

			if R.height == 0 then				-- get max depth
				local tempWidth = R.width
				R.data = "maxDepth"
				R.silent = true
				R.width = 1
				R.length = 0
				local data = clearWaterPlants()		-- {D.maxDepth, R.length} will alreay be at starting position
				R.width = tempWidth
				R.height = data[1]
			else
				if R.length == 0 then				-- get length
					T:forward(1)
					R.length = utils.calculateDistance(0)
					utils.goBack(R.length)
					R.length = R.length - 1
				end
				if R.width == 0 then				-- get width
					T:go("F1R1")
					R.width = utils.calculateDistance(0) - 1
					T:go("R2F"..(R.width).."R1B1")
				end
			end
			local wall = 2							-- wall height
			local depth = 2
			if R.height >= 3 then
				wall = 3
				depth = 3
			end
			if R.height >= 3 then
				T:go("F1D2")						-- col 1: move into water down 2.
			else
				T:go("F1D1")						-- col 1: move into water down 2.
			end
			if R.width == 1 then					-- single width stream
				while depth <= R.height do
					lib.buildWall(wall)				-- build wall, return to start position
					T:go("F1R2 C1F1 R2")			-- remove final water source
					lib.removeWall(wall)
					depth = depth + wall
					wall = 2
					if R.height - depth >= 3 then
						wall = 3
					end
					T:down(wall)
				end
				T:up(R.height)				
			else
				local odd = false
				if R.width % 2 == 1 then
					odd = true
				end
				while depth <= R.height do
					lib.startWall(wall)
					local col = 1
					while col < R.width do
						if col == R.width - 1 and not odd then
							T:go("L1F1L1")
							lib.removeWall(wall)	-- ends far side
							T:go("L1F"..(R.width - 1).."L1F"..(R.length - 1).."R2")
							break
						end
						T:go("L1F2 R2C1 R1")		-- col 1, 3, 5  to 3, 5, 7 etc: cut through retaining wall, in water, facing far side
						col = col + 2
						lib.buildWall(wall)			-- col 3, 5, 7 etc: wall to far side, return to start
						T:go("L1F1 R2C1 L1")		-- col 3, 5, 7 to 2, 4, 6 etc: inside retaining wall at start
						col = col - 1
						lib.removeWall(wall)		-- col 2, 4, 6 etc: end at far side
						if col == R.width - 1 and odd then
							T:go("R1F1R1")
							lib.removeWall(wall)	-- ends start side
							T:go("R1F"..(R.width - 1).."R1")
							break
						end
						T:go("R1F2 R2C1 L1")		-- col 2, 4, 6 to 4, 6, 8 etc: cut through retaining wall, in water, facing start
						col = col + 2
						lib.buildWall(wall)			-- col 4, 6, 8 etc: wall to start side, return to far position
						T:go("R1F1 R2C1 R1")		-- col 4, 6, 8  to 3, 5, 7 etc:cut through inner wall, facing start
						col = col - 1
						lib.removeWall(wall)		-- col 3, 5, 7 etc: end at start
					end
					depth = depth + wall
					wall = 2
					if R.height - depth >= 3 then
						wall = 3
					end
					T:down(wall)
				end
			end
		else
			if R.width == 0 or R.length == 0 then
				utils.calculateDimensions()
			end
			local depth = 0
			for h = 1, R.height do
				local waterPresent = false -- resets at each level
				local row = 0
				T:go("R2D2", false, 0, true)	-- at start, level 2, facing towards the front, move backards
				--lib.startCorner()
				row = row + lib.placeRetainingWall(R.length)
				lib.backTurn(1)
				if lib.placeDam(R.length) then
					waterPresent = true
				end
				row = row + 1
				-- left side wall has been built, 2 rows of walls laid. row = 2
				while row < R.width - 1 do -- eg width=2, row=2, this will not run. width=5, row=2
					lib.frontTurn()
					lib.removeDam(R.length)
					lib.backTurn(2)
					if lib.placeDam(R.length) then
						waterPresent = true
					end
					row = row + 1
				end
				-- lay right wall
				lib.frontTurn()
				lib.removeDam(R.length)
				lib.backTurn(2)
				row = row + lib.placeRetainingWall(R.length)
				lib.frontTurn()
				lib.removeDam(R.length) -- faces to front on finish
				T:go("L1F1R1")
				lib.removeDam(R.length) -- faces to front on finish
				depth = depth + 3
				T:go("L1F"..R.width - 1 .."R1D1")
				if depth == R.height or not waterPresent then -- still replacing water
					T:up(depth - 1) -- when h == R.height will go up
					break -- in case water dries up before loop has completed
				end
			end
		end
	end
	return {}
end

function earlyExit(message)
	return {message}
end

function fellTree()
	if T:isLog("forward") then
		--menu.colourPrint("Felling tree", colors.lime)
		os.sleep(2)    -- pause for 2 secs to allow time to press esc
		T:harvestTree("forward")
		while turtle.down() do end
		retValue = {"Tree Harvested"}
	elseif T:isLog("up") then
		os.sleep(2)    -- pause for 2 secs to allow time to press esc
		T:harvestTree("up")
		while turtle.down() do end
		retValue = {"Tree Harvested"}
	else
		retValue =
		{
			"No log in front..",
			"Move me in front of a tree!"
		}
	end
	return retValue
end

function findPortal()
	-- Called from TaskOptions:executeCall(key, value) key = "findPortal", value = "inventory"
	local found = false
	local onSide = false
	sm:getSceneByName("TaskOptions"):setInfo("Checking height. Please wait...")
	for i = 1, 64 do
		if not turtle.up() then -- hit block above
			found = true
			break
		end
	end
	if found then
		-- are we under the centre block, or one of the sides?
		if turtle.detect() then -- under a side
			onSide = true
		else	-- nothing in front, probably under centre, or facing wrong direction so check
			for i = 1, 4 do
				turtle.turnRight()
				if turtle.detect() then
					onSide = true
					break
				end
			end
		end
		if onSide then-- move to centre
			T:go("D1F1")
		end
	end
	R.height = 3 -- allows for 2 bedrock + starting space
	while turtle.down() do
		R.height = R.height + 1
	end
	local inventory = nil
	if found then
		inventory = 
		{
			{"minecraft:ladder", R.height, true, ""},
			{"stone", R.height * 4 + 18, true, ""},
			{"trapdoor", 1, true, ""}
		}
	end
	F["createPortalPlatform"].inventory = inventory
	sm:getSceneByName("TaskOptions"):setInfo("Height = "..R.height..", Click 'Next' or type 'n'")
	return inventory
end

function findSeabed()
	-- Called from TaskOptions:executeCall(key, value) key = "findSeabed", value = "inventory"
	sm:getSceneByName("TaskOptions"):setInfo("Checking water depth. Please wait...")
	R.depth = 0
	while utils.clearVegetation("down") do		-- go down to sea bed
		T:go("x1D1")							-- make sure area in front is clear, go down
		R.depth = R.depth + 1						-- increment counter
	end
	T:up(R.depth)
	local inventory =  
	{
		{"door", math.floor(R.depth / 3) , true, ""},
		{"dirt", math.floor(R.depth / 3), true, ""},
	}
	F["createDiveColumn"].inventory = inventory
	sm:getSceneByName("TaskOptions"):setInfo("Depth = "..R.depth..", Click 'Next' or type 'n'")
	return inventory
end

function floodArea()
	-- flood a rectangular area R.width * R.length * R.depth
	-- use 3 water buckets repeatedly along 2 edges, starting at the bottom
	local lib = {}
	
	function lib.checkStartPosition()
		-- need to be on floor or R.height if specified
		local depth = 0
		local blockType = T:getBlockType("down")

		if blockType:find("water") == nil then -- on at least level 0
			T:forward(1)
		end
		while turtle.down() do
			depth = depth + 1
		end

		return depth
	end
	
	function lib.fillBuckets(count)
		T:forward(2)
		utils.fillBucket("forward", count)
	end
	
	function lib.placeSources()
		local continue = true
		for i = 1, 4 do
			if turtle.back() then
				T:place("water", "forward")
			else
				continue = false
				break
			end
		end
		return continue
	end
	
	if R.forward then
		T:forward(1)
	end
	
	depth = lib.checkStartPosition()	-- go to bottom of pool area
	if R.depth == 0 then				-- if not already specified use full depth of travel
		R.depth = depth
	end
	
	T:turnRight(2)						-- facing start
	for d = 1, R.depth do
		lib.placeSources()				-- 4 source blocks placed
		lib.fillBuckets(4)
		while lib.placeSources() do
			lib.fillBuckets(4)
		end
		lib.fillBuckets(count)			-- recharge before turning
		while turtle.back() do end
		T:turnRight(1)
		while lib.placeSources() do
			lib.fillBuckets(4)
		end
		T:go("F1R2")					-- ready to place final source
		T:place("water", "forward")
		T:turnRight(2)					-- turn to sources
		lib.fillBuckets(4)				-- ready to move to next level
		T:go("R2U1 F1L1")				-- up to next level, facing wall
	end
	
	return {"Area "..R.width.." * "..R.length.." * "..R.depth.." flooded"}
	-- ready for next layer
end

function floodMobFarm()
	--[[Part 2 / 3 Mob Spawner Farm turtle on floor, pointing towards water source wall, single hole]]
	local lib ={}
	
	function lib.setPosition(addWater)
		local width = 0
		while turtle.forward() do end					-- move forward until hit wall
		T:go("U1L1")
		while turtle.forward() do end					-- move forward until hit left wall
		if addWater then
			T:placeWater("down") 			 			-- place water down
		end
		T:turnLeft(2)									-- turn round
		while turtle.forward() do
			width = width + 1 
		end			-- go forward 7
		if addWater then								-- back 1
			T:placeWater("down") 						-- place water					
		end
		T:go("L2F".. math.floor(width / 2) .."L1")		-- turn round, go forward 3 (centre of wall), turn left
	end

	function lib.digFloor()
		T:go("x2F1 x2")									-- first block, move forward
		
		T:turnLeft(1)									-- left turn, go back into right side, facing left
		utils.goBack(1)
		T:go("x2 F1x2 F1x2 R1F1")						-- go right to left dig 3 blocks, forward on left side
		
		T:turnRight(1)									-- right turn, go back into left side, facing right
		utils.goBack(1)
		T:go("x2 F1x2 F1x2 F1x2 F1x2 L1F1")				-- go left to right dig 5 blocks, forward on right side
		
		T:turnLeft(1)									-- left turn, go back into right side, facing left
		utils.goBack(1)
		T:go("x2 F1x2 F1x2 F1x2 F1x2 F1x2 F1x2 R1F1")	-- go right to left dig 7 blocks, forward on left side
		
		T:turnRight(1)									-- right turn, go back into left side, facing right
		utils.goBack(1)
		T:go("x2 F1x2 F1x2 F1x2 F1x2 F1x2  F1x2  F1x2  F1x2 L1")	-- go left to right dig 5 blocks, face forward on right side
	end
	
	lib.setPosition(false)					-- move to back of cube and verify position
	if R.inventoryKey == "lift" then
		T:forward(3)						-- forward 4 (centre of chamber)
	elseif R.inventoryKey == "turtle" then
		T:forward(2)						-- forward 3
	end
	T:down(1)
	lib.digFloor()
	if R.inventoryKey == "lift" then		
		T:go("D1F1 L1F8")
		utils.goBack(4)
		T:go("L1U1")
		lib.setPosition(true)				-- place water sources
		T:go("F8D2")
		-- go down 2, check floor, up 1, place fence
		T:go("D2C2U1", false, 0, true)
		T:place("fence", "down", false)
		T:go("F1D1C2U1", false, 0, true)
		T:place("fence", "down", false)
		T:go("F1U1R2", false, 0, true)
		T:go("F1R1U1")
		T:place("sign", "down", false)
		T:go("U1C0D1")
		T:place("slab", "up", false)
		T:go("R2F1R2")
		T:place("sign", "forward", false)
		T:go("R1F1R2C1R1F1D1L1") --sitting on soul sand/dirt facing spawner
		if not T:place("minecraft:soul_sand", "down", false) then
			T:place("minecraft:dirt", "down", false)
		end
	elseif R.inventoryKey == "turtle" then
		T:go("D1F1 L1F8")
		T:go("R1F1 R1F8")
		utils.goBack(4)
		T:go("R1U1")
		lib.setPosition(true)		-- place water sources
		T:go("F8D2 F1C2C0 F1R2")	-- exit leaving single hole in wall, facing spawner
	end
	
	return {}
end

function harvestObsidian()
	local lib = {}
	
	function lib.forward(move)
		T:isWaterOrLava("forward")	-- automatically use lava ahead to refuel
		T:isWaterOrLava("down") 	-- automatically use lava down to refuel
		T:go("C2", false, 0, false)	-- place / replace block below
		if move then
			T:forward(1)
		end
	end
	
	function lib.home(outward)
		if outward then
			T:go("L1F"..R.width - 1 .."L1F"..R.length - 1)
		else	
			T:go("R1F"..R.width - 1 .."R1")
		end
	end
	
	function lib.start()
		local lavaSlot = T:getItemSlot("lava")
		if lavaSlot > 0 then
			turtle.select(slot)
			turtle.refuel()
		end
		T:down(1)
	end
	
	local outward = true
	
	lib.start()						-- use lava bucket if placed, move down into block below
	for w = 1, R.width do
		for l = 1, R.length do
			if l < R.length then
				lib.forward(true)
			else
				lib.forward(false)
			end
		end
		if w < R.width then
			if outward then
				T:go("R1F1R1")
			else
				T:go("L1F1L1")
			end
			outward = not outward
		end
	end
	
	lib.home(outward)
	
	return {}
end

function harvestShulkers()
	local lib = {}
	
	function lib.attackAll()
		return turtle.attack(), turtle.attackUp(), turtle.attackDown()
	end

	function lib.attack()
		local forward, up, down = lib.attackAll()
		while forward or up or down do
			forward, up, down = lib.attackAll()
			sleep(0.2)
		end
	end
	
	function lib.approach(direction, limit, dig)
		-- move forward until stopped by shulker
		limit = limit or 64
		dig = dig or false
		local count = 0
		local solidDown = false
		move = turtle.forward
		if direction == "up" then
			move = turtle.up
		elseif direction == "down" then
			move = turtle.down
		end
		local forward, up, down = lib.attackAll()
		if forward or up or down then -- attacks suceeded
			return true, 0, solidDown
		else
			while move() do
				count = count + 1
				if turtle.detectDown() then
					solidDown = true
				end
				if count >= limit then
					return false, count, solidDown
				end
				forward, up, down = lib.attackAll()
				if forward or up or down then
					return true, count, solidDown
				else
					if dig then
						T:dig("forward")
					end
				end
			end
			return false, count, solidDown
		end
	end
	
	function lib.home(direction, moves)
		local move = turtle.back
		if direction == "up" then
			move = turtle.down
		elseif direction == "down" then
			move = turtle.up
		end
		for i = 1, moves do
			move()
		end
	end
	
	function lib.checkPosition()
		if T:detect("forward") then			-- wall in front
			T:turnRight(1)
			if T:detect("forward") then		-- wall to right
				T:turnLeft(1)
				return true					-- position corrected
			else
				T:turnLeft(2)
				if T:detect("forward") then	-- wall in front. position correct
					return true
				end
			end
		end
		return false
	end
	
	function lib.getLength()
		local count = 0
		while turtle.detectDown() do
			count = count + 1
			T:forward(1)
		end
		utils.goBack(1)
		return count
	end
	
	function lib.clearWall()
		local distance = 0
		while distance < 9 do	-- smallest external walls are 8 x 8
			local success, count = lib.approach("forward", 8 - distance)
			if success then
				lib.attack()
			end
			distance = distance + count
		end
		T:turnLeft(1)
		if T:detect("forward") then	-- larger than 8 blocks
			T:turnRight(1)
			while distance < 14 do	-- larger builds are 14 x 14
				local success, count = lib.approach("forward", 13 - distance)
				if success then
					lib.attack()
				end
				distance = distance + count
			end
			T:go("L1x2")
		end
	end
	
	function lib.roof()
		-- check position
		local doContinue = lib.checkPosition()
		
		if doContinue then
			T:go("U2F3 R1F3 R1")
			local length = lib.getLength()
			local width = 1
			local outward = lib.turnRound(true)	
			local success, count, onRoof = false, 0, true	
			while onRoof do
				local distance = 0
				while distance < length - 1 do
					success, count, onRoof = lib.approach("forward", length - 1 - distance)
					if success then
						lib.attack()
					end
					if count == 0 then
						turtle.dig()
					end
					distance = distance + count
				end
				width = width + 1
				outward = lib.turnRound(outward)
			end
			if outward then
				T:go("F".. 3 .."L1F"..width - 3 .."D2L1")
			else
				T:go("F".. length - 3 .."R1F"..width - 3 .."D2L1")
			end
			return {}
		else
			return {"Turtle not in front of a wall"}
		end
	end
	
	function lib.turnRound(outward)
		if outward then
			T:go("R1F1R1")
		else
			T:go("L1F1L1")
		end
		return not outward
	end

	function lib.upAndOver()
		local start, height, forward = 0, 0, 0
		while turtle.detect() do
			turtle.up()
			start = start + 1
		end
		while turtle.forward() do
			forward = forward + 1
		end
		turtle.turnRight()
		while not turtle.detectUp() do
			local success, count = lib.approach("up", 64, true)
			if success then
				lib.attack()
			end
			height = height + count
		end
		T:turnRight(2)
		while not turtle.detectDown() do
			if lib.approach("down", 64, true) then
				lib.attack()
			end
		end
		T:turnLeft(1)
		for i = 1, forward do
			turtle.forward()
		end
		for i = 1, start do
			turtle.down()
		end
		T:turnRight(2)
	end
	
	function lib.walls()
		local doContinue = lib.checkPosition()
		if doContinue then
			T:go("F2R1 F2R2 D1x2")		-- on corner outside middle of wall, facing along its length, dig light rod	
			for i = 1, 4 do
				lib.clearWall()
			end
			T:go("F2L1 U1F2 R2")
		else
			return {"Turtle not in front of a wall"}
		end
	end
		
	local direction = "forward"
	local doContinue = false
	
	if R.subChoice == 1 then		-- Shulker is above
		direction = "up"
		doContinue = true
	elseif R.subChoice == 2 then	-- Shulker is ahead
		doContinue = true
	elseif R.subChoice == 3 then	-- Shulker is below
		direction = "down"
		doContinue = true
	else
		if R.subChoice == 4 then	-- Climb tower wall
			lib.upAndOver()
		elseif R.subChoice == 5 then	-- Clear roof above
			return lib.roof()
		elseif R.subChoice == 6 then	-- Clear outside walls
			lib.walls()
		end
	
	end
	if doContinue then
		local success, moves = lib.approach(direction, 64)
		if success then
			lib.attack()
		end
		lib.home(direction, moves)
	end
	
	return {}
end

function harvestTreeFarm()
	local lib = {}
	
	function lib.getLogCount()
		local count = 0
		for i = 1,16 do
			local item, itemCount = T:getSlotContains(i)
			if item:find("log") ~= nil then
				count = count + itemCount
			end
		end
		
		return count
	end
	
	function lib.initialise()
		-- assumes legacy tree farm with turtle on polished block 4 blocks from corner
		local message  = ""
		R.treeSize = "single"
		local blockType = T:getBlockType("forward")
		--local logType = ""
		--local startHeight = 0
		local range = 0
		if blockType == "" then
			while turtle.forward() do
				range = range + 1
				if range == 3 then
					break
				end
			end
		end
		blockType = T:getBlockType("forward")
		if blockType:find("dirt") ~= nil then	-- dirt found
			T:go("R1F1L1")
			blockType = T:getBlockType("forward")
			if blockType:find("dirt") ~= nil then
				R.treeSize = "double"
			end
			T:go("L1F1 R1")
		else	-- dirt NOT found where expected
			message = "Unable to determine position"
		end
		T:up(1)
		blockType = T:getBlockType("forward")	-- 1 block above dirt
		if blockType:find("log") ~= nil or blockType:find("sapling") ~= nil or blockType:find("propagule") ~= nil then
			local parts = T:getNames(blockType)
			local name = ""
			for i = 1, #parts - 1, 1 do				-- eg {"minecraft", "dark", "oak"
				if i == 1 then
					name = parts[1]..":"			-- eg "minecraft:"
				elseif i == 2 then
					name = name..parts[2]			-- eg "minecraft:dark"
				else
					name = name.."_"..parts[i]		-- eg "minecraft:dark_oak"
				end
			end
			name = name.."_sapling"					-- eg "minecraft:dark_oak_sapling"
		end
		T:down(1)	-- facing dirt
		
		return message
	end
	
	function lib.waitForGrowth()
		local pattern = R.treeSize	--"single","double"
		local elapsed = 0
		
		if R.logType:find("mangrove") ~= nil then
			pattern = "mangrove"
			local ready = {}
			ready.left = false
			ready.top = false
			ready.right = false
			ready.bottom = false
			local facings = {"left", "top", "right", "bottom"}
			T:up(1)	-- go up from dirt to sapling level
			while not ready.left or not ready.right or not ready.top or not ready.bottom do
				for i = 1, 4 do
					local blockType = T:getBlockType("forward")
					if blockType:find("propagule") ==  nil then	-- either grown or deleted by roots
						ready[facings[i]] = true
					end
					T:turnRight(1)
				end
				if ready.left and ready.right and ready.top and ready.bottom then
					break
				else
					sleep(15)
					elapsed = elapsed + 15
					if  elapsed / 60 > 15 then	-- max 15 mins real time before farm is harvested
						break
					end
				end
				print("Waiting for mangrove growth "..elapsed / 60 .." minutes")
				print("Left = "..tostring(ready.left)..
					  ", top = "..tostring(ready.top)..
					  ", right = "..tostring(ready.right)..
					  ", bottom = "..tostring(ready.bottom))
				
			end
			--T:go("L1D1")
			T:turnLeft(1)	-- face front
		else
			while true do
				T:up(1)	-- go up from dirt to sapling level
				if (T:getBlockType("forward")):find("log") ~=  nil then
					T:down(1)	-- drop below sapling to dirt level
					return
				end
				T:clear()
				print("Farm type: "..pattern)
				print("Waiting for tree growth "..elapsed / 60 .." minutes")
				print("Left grown = "..tostring(ready.left)..", right grown = "..tostring(ready.right))
				sleep(15)
				elapsed = elapsed + 15
				if pattern == "single" and elapsed / 60 > 10 then	-- max 10 mins real time before farm is harvested
					break
				elseif pattern == "double" and elapsed / 60 > 15 then	-- max 15 mins real time before farm is harvested
					break
				end
			end
		end
		if pattern == "mangrove" then 
			T:go("D2F6 U1F1 R1F6 R1F1 U1")
		end
		-- ends facing dirt at base of first tree
		-- no return needed, function exit so trees are grown
	end
	
	function lib.harvestSingle(direction, moves)
		-- if direction == "up": starting inside tree on dirt at dirt level
Log:saveToLog("lib.harvestSingle('"..direction.."', moves = "..moves)
		if direction == "up" then
			while turtle.detectUp() do
				T:up(1)
				moves = moves + 1
			end
		else	-- direction = "down", but could be mid-tree
			local movesUp = 0
			while turtle.detectUp() do
				T:up(1)
				movesUp = movesUp + 1
			end
			T:down(movesUp)
			T:down(moves)
		end
		return moves
	end
	
	function lib.harvestSingleRow()
		-- start under dirt of first tree
		local moves = lib.harvestSingle("up", 0)
		T:go("F2")
		lib.harvestSingle("down", moves)
		T:go("F2")
		moves = lib.harvestSingle("up", 0)
		T:go("F2")
		lib.harvestSingle("down", moves)
	end
	
	function lib.harvestDouble()
		T:forward(1)	-- dig dirt, move into left (S) corner
		local moves = 0
		while turtle.detectUp() do
			turtle.dig()
			turtle.digUp()
			turtle.up()
			moves = moves + 1
		end
		turtle.dig()
		T:go("R1F1L1")	-- move to right corner
		for i = 1, moves do
			turtle.dig()
			turtle.digDown()
			turtle.down()
		end
		turtle.dig()
		T:go("F1L1F1R1") -- move to left corner (N)
	end
		
	-- R.networkFarm is now default
	menu.clear()
	menu.colourPrint("Harvesting treefarm starting", colors.lime)
	R.silent = true

	--local message = U.loadStorageLists()	-- initialises or creates lists of where an item can be found: GLOBAL LISTS!
	local message = U.wrapModem(true)	-- initialises or creates lists of where an item can be found: GLOBAL LISTS!
	if message ~= "" then return {message} end
	U.emptyInventory({"sapling", "propagule", "dirt"}, {"all"}, true)
	if turtle.getFuelLevel() < turtle.getFuelLimit() / 2 then
		local turtleSlot, turtleCount = U.getItemFromNetwork("chest", "log", 16)
		if turtleSlot > 0 then
			if turtle.craft() then
				turtle.refuel()
			end
		end
	end
	if R.logType:find("mangrove") ~= nil then	-- mangrove
		T:go("F1D1")
		T:place("dirt", "up")
		T:go("F6x2U1L1")				-- move under dirt covering, clear roots from hopper, move level with dirt, face left
	else
		T:go("F4L1")					-- either in between 2 trees or in gap between double trees at dirt level
		if turtle.detect() then			-- single trees, move between 1st and 2nd rows
			T:go("L1F1 R1F3 R1")		-- facing first dirt 4x4 grid, facing back
			R.treeSize = "single"
		else							-- using double trees
			T:go("F1")					-- next to dirt on first double tree group
			if turtle.detect() then		-- dirt found
				T:go("L1F1 R1F2 R1")	-- move to lower left corner of 2x2 dirt, facing back
				R.treeSize = "double"
			else
				return {"Unable to determine position"}
			end
		end
	end

Log:saveToLog("harvestTreeFarm(): logType = "..R.logType..", treeSize = "..R.treeSize)
	lib.waitForGrowth()
Log:saveToLog("harvestTreeFarm(): trees grown. Starting")	
	-- different clearing for different trees:
	-- mangrove clear solid cube including dirt placed over whole farm
	-- spruce and jungle: double trees staight up/down
	-- birch single up / down
	-- acacia, cherry, oak,  pale_oak and dark_oak treat as solid cube
	if R.logType:find("mangrove") ~= nil then
		R.width = 13
		R.length = 13
		R.up = true
		R.down = true
		clearRectangle()
		T:go("U2F1 R1F1L1")
		R.width = 11
		R.length = 11
		R.height = 21
		R.goUp = true
		clearSolid()
		T:go("D3R1 F5R1 F2R2")
		U.emptyInventory({"sapling", "propagule", "dirt", "crafting"}, {"all"}, true)
	elseif R.logType:find("birch") ~= nil or R.logType:find("spruce") ~= nil or R.logType:find("jungle") ~= nil then	-- use column harvest
		if R.treeSize == "single" then
			T:forward(1)
			lib.harvestSingleRow() -- do 4 dirt/tree blocks on first col
			T:go("R1F2R1")	-- facing towards start on col 2
			lib.harvestSingleRow()
			T:go("L1F2L1") -- facing towards back on col 3
			lib.harvestSingleRow() -- facing towards start on col 4
			T:go("R1F2R1")
			lib.harvestSingleRow()
			T:go("F1R1 F3L1 F3R2")
			U.emptyInventory({"sapling", "propagule", "dirt", "crafting"}, {"all"}, true)
		else
			lib.harvestDouble()
			T:go("F3")
			lib.harvestDouble()
			T:go("R1F4")
			lib.harvestDouble()
			T:go("R1F4")
			lib.harvestDouble()
			T:go("F1R1 F3L1 F3R2")
			U.emptyInventory({"sapling", "propagule", "dirt", "crafting"}, {"all"}, true)
		end
	else	-- acacia, cherry, oak,  pale_oak, dark_oak
		local size = 11							-- default for oak,  pale_oak and dark_oak
		local start = "L1F1 L1F1 R2"			-- default for oak,  pale_oak and dark_oak
		local finish = "R1F1 R1F3 R2"			-- default for oak,  pale_oak and dark_oak
		if R.logType:find("acacia") ~= nil then
			size = 12
			start = "L1F2 L1F2 R2"
			finish = "R1F2 R1F2 R2"
		elseif R.logType:find("cherry") ~= nil then
			size = 14
			start = "L1F3 L1F3 R2"
			finish = "R1F3 R1F1 R2"
		end
		T:go("U1F1")	-- into first log at base of tree
		R.width = 7
		R.length = 7
		R.up = true
		R.down = true
		local currentLogCount = clearRectangle(true)			-- amount of logs obtained by digUp
Log:saveToLog("logs from digUp() first layer = "..currentLogCount, true)
		T:go(start)												-- after clearing soil and first layer, move out
		R.width = size
		R.length = size
		local height = 0		
		while currentLogCount > 0 do							-- ony continue if at least 1 logs harvested last round
			T:up(3)
			height = height + 3
			currentLogCount = clearRectangle(true)				-- true = return logs dug from digUp() only
Log:saveToLog("logs from digUp() height = "..height..", count = "..currentLogCount, true)			
		end	
		T:up(3)													-- one additional layer
		height = height + 3
		currentLogCount = clearRectangle(true)					-- true = return logs dug from digUp() only
		Log:saveToLog("logs from final digUp() height = "..height..", count = "..currentLogCount, true)			
		T:down(height + 1)
		T:go(finish)
		T:go("R1F3 L1")			-- on modem
		--storageType, itemRequired, countRequired, toTurtleSlot, ignoreStock
		U.getItemFromNetwork("barrel", "minecraft:stick", 64, nil, false)
		U.getItemFromNetwork("barrel", "minecraft:apple", 64, nil, false)
		U.emptyInventory({"sapling", "propagule", "dirt", "crafting"}, {"all"}, true)
	end
	
	return {}	-- if player initiated, stops here. If R.auto then returns to plantTreeFarm() code
end

function lavaRefuel()
	local lib = {}
	
	function lib.getLavaStrip(y)
		local block, blockType = T:isWaterOrLava("down") -- will automatically fill bucket with lava and refuel
		local length = 0
		local lavaPresent = false
		local full = false
		-- while lava below, just started or moved forward < 3
		while (block == "minecraft:lava" or block == "minecraft:flowing_lava" or length < 3) and not full do --will automatically fill bucket with lava
			if T:forward(1) then
				length = length + 1
				y = y + 1
			end
			block, blockType = T:isWaterOrLava("down")
			
			print("Block below: "..tostring(block))
			if block == "minecraft:lava" or block == "minecraft:flowing_lava" then
				lavaPresent = true
			end
			if turtle.getFuelLevel() >= turtle.getFuelLimit() then
				full = true
				lavaPresent = false
			end
		end
		T:go("L2F"..length + 1)
		y = y - length - 1
		block, blockType = T:isWaterOrLava("down")
		while block == "minecraft:lava" or block == "minecraft:flowing_lava" do
			T:forward(1)
			y = y - 1
			block, blockType = T:isWaterOrLava("down")
		end
		turtle.back()
		y = y + 1
		T:go("L2")
		return lavaPresent, y
	end
	
	function lib.goHome(x, y)
		if y > 0 then
			utils.goBack(y)
		elseif y < 0 then
			T:forward(math.abs(y))
		end
		if x > 0 then
			T:go("L1F"..x.."R1")
		elseif x < 0 then
			T:go("R1F"..math.abs(x).."L1")
		end
	end

	print("Current fuel: "..turtle.getFuelLevel().." / "..turtle.getFuelLimit())

	local lavaSlot = T:getItemSlot("minecraft:lava_bucket", -1) 
	if lavaSlot > 0 then
		turtle.select(lavaSlot)
		T:refuel(0) -- 0=force refuel
	end
	T:refuel(0) -- 0=force refuel
	local x, y, width = 0, 0, 0
	local lavaPresent, y = lib.getLavaStrip(y)
	if R.side ~= 'C' then -- not a single strip
		while lavaPresent do
			width = width + 1
			if R.side == 'R' then -- do strip on the right
				T:go("R1F1L1")
				x = x + 1
			else
				T:go("L1F1R1")
				x = x - 1
			end
			lavaPresent, y  = lib.getLavaStrip(y)
			if turtle.getFuelLevel() >= turtle.getFuelLimit() then
				lavaPresent = false
				print("Max fuel "..turtle.getFuelLimit() .. " achieved")
			end
		end
		if width <= 0 then
			width = 1
		end
		lib.goHome(x, y)
	end
	
	return {"Refuelled to "..turtle.getFuelLevel()}
end

function makeMud()
	--[[
	1 empty bottle
	up to 14 stacks of dirt
	water source below
	]]
	local bottleSlot = T:getItemSlot("bottle")					-- is empty bottle in inventory
	local dirtSlot = T:getItemSlot("minecraft:dirt")			-- get first dirt slot
	
	local lib = {}
	function lib.convertDirt()
		turtle.select(dirtSlot)									-- select slot
		turtle.place()											-- place forward
		turtle.select(bottleSlot)								-- select water bottle
		turtle.place()											-- turn dirt into mud
		turtle.placeDown()										-- refill bottle
		turtle.dig()											-- dig mud block
	end
	
	if R.misc then
		if bottleSlot > 0 then										-- found empty bottle
			turtle.select(bottleSlot)								-- select empty bottle
			turtle.placeDown()										-- fill from water source below
		else
			bottleSlot = T:getItemSlot("potion")					-- bottle may already contain water
			if bottleSlot == 0 then									-- no bottle or potion present
				return {"Unable to locate bottle or water bottle"}
			end
		end
	end
	
	local mudCount = 0
	local mudRequired = 0
	if R.misc then												-- make mud
		if R.size == 0 then
			mudRequired = 896										-- 14 full slots
		else
			mudRequired = R.size
		end
		while dirtSlot > 0 do
			while turtle.getItemCount(dirtSlot) > 1 do				-- use all but 1 dirt in the slot
				lib.convertDirt()
				mudCount = mudCount + 1
				if mudCount >= mudRequired then
					break
				end
			end
			lib.convertDirt()										-- place and convert last one. It may then contain mud
			mudCount = mudCount + 1
			if mudCount >= mudRequired then
				break
			end
			dirtSlot = T:getItemSlot("minecraft:dirt")				-- any more dirt?
		end
	end
	if R.auto then													-- manage clay
		-- 1. mud/clay already present
		-- 2. no mud/clay present
		-- collect existing clay and place new mud
		T:forward(2)
		local forward = true
		for w = 1, 10 do
			for l = 1, 10 do
				local blockBelow = T:getBlockType("down")
				if blockBelow:find("clay") ~= nil then
					turtle.select(1)
					turtle.digDown()
					blockBelow = ""
				end
				if blockBelow == "" then
					T:place("mud", "down")
				end
				if l < 10 then
					turtle.forward()
				end
			end
			if w < 10 then
				if forward then
					T:go("R1F1R1")
				else
					T:go("L1F1L1")
				end
				forward = not forward
			end
		end
		T:go("R1F9 L1F2 R2")
	end
	return {"Mud and clay management completed"}
end

function manageFarm()
	local lib = {}
		
	function lib.askPlayerForCrops()
		local seed  = ""
		pp.itemColours = {colors.lightGray, colors.red, colors.orange, colors.brown, colors.magenta, colors.yellow}
		crops = {"minecraft:wheat_seeds", "minecraft:beetroot_seeds", "minecraft:carrots", "minecraft:potatoes", "minecraft:pumpkin_seeds", "minecraft:melon_seeds", "mysticalagriculture", "none"}
		choices = {"wheat (seeds)", "beetroot (seeds)", "carrot", "potato", "pumpkin", "melon", "Mystical Agriculture", "Till soil only"}
		choice = menu.menu("Choose preferred crop", choices, pp, "Type number of your choice")
		crop = crops[choice]
		if crop == "none" then
			return "", ""
		elseif crop == "mysticalagriculture" then
			T:checkInventoryForItem({"seeds"}, {95}, true, "Add one type of M. Agriculture seeds")
		else
			if crop == "minecraft:pumpkin_seeds" or crop == "minecraft:melon_seeds" then
				T:checkInventoryForItem({crop}, {36}, true, "Do not mix! Enter when done")
			else
				T:checkInventoryForItem({crop}, {95}, true, "Do not mix! Enter when done")
			end
		end
		crop = T:getMostItem("", false)		-- not searching for any specific item, not checking stone only
		-- crop could be wheat/beetroot seeds, carrots, potatoes or mystical agriculture seeds
		seed, crop = lib.getCropSeed(crop)	-- seed type or "", crop type
		return seed, crop	
	end	
		
	function lib.assessPlot()
		local crop = T:getBlockType("forward")	-- convert ma:inferium_crop to ma:inferium_seeds
		local seed = lib.getCropSeed(crop)
		turtle.down()									-- into water source
		local soil = T:getBlockType("forward")
		turtle.up()										-- at crop level
		return crop, seed, soil
	end
	
	function lib.chartPosition()
		local chart = {"","","",""}
		for turns = 1, 4 do
			T:go("F1")
			local item = T:getBlockType("down")
			if item:find("chest") ~= nil then
				chart[turns] = "c"
			elseif item:find("barrel") ~= nil ~= nil then
				chart[turns] = "b"
			elseif item:find("modem") ~= nil then
				chart[turns] = "m"
				R.networkFarm = true
			end
			utils.goBack(1)
			T:go("R1")
		end
		return chart
	end
			
	function lib.crossFarm()
		-- used with goHome to find starting point
		local blockType = ""
		local isReady, cropType, seed, status
		isReady, cropType, seed, status = lib.isCropReady("down")
		-- will go forward until chest, barrel, modem or cobble detected below
		-- if detected within 1 move, this is ignored
		local numMoves = 0
		local endOfPath = false
		while not endOfPath do
			blockType = T:getBlockType("down")
			if blockType == "" or cropType ~= "" then --crops or nothing below
				turtle.forward()
			elseif  blockType:find("barrel") ~= nil or
					blockType:find("chest") ~= nil or
					blockType:find("modem") ~= nil or
					blockType:find("cobble") ~= nil then
				endOfPath = true
			end
			numMoves = numMoves + 1
		end
		return blockType -- either barrel, chest, modem or cobble
	end
			
	function lib.checkFarmToRight()
		-- check existence of farms to right and front
		local isFarmToRight = false
		T:go("U1F10")						-- go to right side of this farm
		if utils.isStorage("down") then
			isFarmToRight = true
		end
		T:go("B10D1")						-- return to default position
		return isFarmToRight
	end
	
	function lib.checkFarmLocations()
		-- check existence of farms to right and front
		local isFarmToRight, isFarmToFront = false, false
		T:go("U1F10")						-- right side of this farm
		if utils.isStorage("down") then
			isFarmToRight = true
		end
		T:go("B10 L1F10")					-- front of this farm
		if utils.isStorage("down") then
			isFarmToFront = true
		end
		T:go("B10 D1R1")					-- starting position
		
		return isFarmToRight, isFarmToFront
	end
	
	function lib.farmToRight(plotCountR)
		--[[ facing crops on first farm. move to next farm on right side ]]
		if plotCountR then
			T:go("U1F11 D1")													-- on next farm, facing crops
		end
		local isFarmToRight = false
		local isReady, crop, seed, status = lib.isCropReady("forward")		-- eg true, "minecraft:carrots", "7 / 7" or false, "", ""
Log:saveToLog("lib.farmToRight(), isReady = "..tostring(isReady)..", crop = "..crop..", seed = "..seed)
		if crop == "" then -- if no crop then ignore this farm
			isFarmToRight, isFarmToFront = lib.checkFarmLocations()
		else
			lib.manageTree() -- refuel if required, else do nothing
			lib.getSeedsOrCrops(seed, crop)
			isFarmToRight, isFarmToFront = lib.harvest(seed, crop)			-- harvest field, store crops
			-- now at starting position of current plot
		end
		
		return isFarmToRight, isFarmToFront
	end
	
	function lib.getCropSeed(crop)
		-- change growing crops into equivalent seed names
		-- crop could be seeds, so return equivalent crop
		local start = crop:find("_crop")
		if start ~= nil then	-- only modded seeds have "crop"
			return crop, crop:sub(1, start).."seeds"
		end
		if crop:find("seeds") ~= nil then	-- asked to return crop from seed type
			if crop:find("wheat") ~= nil then
				return  "minecraft:wheat", "minecraft:wheat_seeds"
			end
			if crop:find("beetroot") ~= nil then
				return "minecraft:beetroot", "minecraft:beetroot_seeds"
			end
			if crop:find("tomatoes") ~= nil then
				return "farmersdelight:tomatoes", "farmers_delight:tomato_seeds"
			end
		end
		if crop:find("wheat") ~= nil then
			return  "minecraft:wheat", "minecraft:wheat_seeds"
		end
		if crop:find("beetroot") ~= nil then
			return  "minecraft:beetroot", "minecraft:beetroot_seeds"
		end
		if crop:find("carrot") ~= nil then
			return "minecraft:carrot", ""
		end
		if crop:find("potato") ~= nil then
			return "minecraft:potato", ""
		end
		if crop:find("onion") ~= nil then
			return "farmersdelight:onion", ""
		end
		-- planted crops are plural, harvested singular: carrots / carrot, pototoes/ potato
		return crop, "" -- no seed for carrot / potato
	end

	function lib.getItem(name)
Log:saveToLog("==> lib.getItem("..name..")")
		local slot = U.getItemFromNetwork("barrel", name, 1)
		if slot > 0 then					-- obtained from network
Log:saveToLog("    return slot = "..slot..", item = "..name)
			return slot
		end
		-- not found, slot = 0
		slot = T:getItemSlot(name)				-- if item in inventory
		if slot == 0 then						-- item not present
			T:checkInventoryForItem({name}, {1}, true, name.." required to continue")
			slot = T:getItemSlot(name)			-- if item in inventory
			if slot == 0 then
				return {name.." is required. Add to turtle and restart"}
			end
		end
		return slot
	end
	
	function lib.getSeedsOrCrops(crop, seed)
		-- get seeds or veg based on what is growing
		if seed ~= "" then
			local seedType, seedCount = lib.getSeeds(seed) 	-- table: get 95 of beetroot / wheat / mysticalagriculture seeds
			if seedCount == 0 then
Log:saveToLog("No seeds available.", true)
			end
		else	-- seed  = ""
			local veg, vegCount = "", 0
			veg, vegCount = lib.getVeg(crop)	-- gets any carrots / potatoes
			if veg ~= "" then
				crop = veg
			end
		end
	end
					
	function lib.getSaplings()
		-- get a single sapling from network storage
		U.wrapModem(false)
		local slot, count = U.getItemFromNetwork("barrel", "sapling", 1)

		return slot
	end
	
	function lib.getSeeds(seed)
		--[[ 
			seed = name of growing crops seed or ""
			turtle facing crops on networked, else facing storage
			allow for other seeds from mods eg MysticalAgriculture
			get 1 stack of seeds of whatever type is being farmed
		]]
		if seed == "" then
			return "", 0
		end
		local inventorySlot, seedCount = 0, 0
Log:saveToLog("Collecting seeds from storage")
		U.wrapModem(false)
		inventorySlot, seedCount = U.getItemFromNetwork("chest", seed, 64)
		if seedCount > 0 then
Log:saveToLog("planting " ..seed)
		end
		return seed, seedCount	-- could be: "", 0 or "minecraft:wheat_seeds", 64
	end
		
	function lib.getVeg(crop)
		-- assume only one type of crop per field
		-- local item, itemName, shortName, slot = "", "","", 0
		local inventorySlot, cropCount = 0, 0
		U.wrapModem(false)
		inventorySlot, cropCount = U.getItemFromNetwork("chest", crop, 64)
		
		if cropCount > 0 then
			print("planting " ..crop)
		end
		return crop, cropCount -- could be: "", 0 or "minecraft:potato", 64
	end
	
	function lib.goHome()
		-- after a re-boot go to start
		R.ready = true
		local onTree = false
		-- is tree above or in front
		-- check if log in front
		if T:getBlockType("forward"):find("log") ~= nil then -- about to harvest tree
			lib.harvestTree("forward") 		-- will only harvest if fuel below half of limit
			onTree = true					-- end on dirt
		elseif T:getBlockType("up"):find("log") ~= nil then -- harvesting tree
			lib.harvestTree("up")			-- end on dirt
			onTree = true
		elseif T:getItemSlot("log") > 0 then-- tree just harvested 
			onTree = true
			turtle.up()
			if T:getBlockType("up"):find("log") ~= nil then -- harvesting tree
				lib.harvestTree("up")		-- end on dirt
			else
				while turtle.down() do end	-- end on dirt
			end
		elseif T:getBlockType("down"):find("barrel") ~= nil then -- on corner barrel, could be networked or earlyGame
			local chart = lib.chartPosition()
			-- chart = {"","s","s",""} = facing out of left
			-- chart = {"s","s","",""} = facing back of farm
			-- chart = {"s","","","s"} = facing right side of farm
			-- chart = {"","","s","s"} = facing out of front farm
			if chart == {"s","s","",""} then
				T:go("L1")
			elseif chart == {"s","","","s"} then
				T:go("R2")
			elseif chart == {"","","s","s"} then
				T:go("R1")
			end
			T:go("B1D4 R1F1 D1R1")	-- facing crops, over water
		elseif T:getBlockType("down"):find("chest") ~= nil then -- on earlyGame farm on top of chest
			local chart = lib.chartPosition()
			-- |c|w
			-- |b|c|c
			if chart == {"b","","c",""} then -- on front chest, left side facing out of left
				T:go("R1")
			elseif chart == {"c","","b",""} then -- on front chest, facing right side of farm
				T:go("L1")
			elseif chart == {"","b","","c"}  then -- on front chest, facing away from farm
				T:go("R2")
			end
			T:go("F1D1R1")
		end
		
		if onTree then 
			local success, storage = false, ""
			-- tree harvested, sitting on dirt, but direction unknown
			T:down(3) 				-- dig dirt, go down to barrel in left corner
			-- if storage type farm chest/barrel will give position
			local chart = lib.chartPosition()
			if chart == {"","c","c",""} or chart == {"", "m","m",""} then
				T:go("L1")
			elseif chart == {"c","c","",""} or chart == {"m","m","",""} then
				T:go("R2")
			elseif chart == {"","","c","c"} or chart == {"","","m","m"} then
				T:go("R1")
			end
			T:up(3)
			T:place("dirt", "down")
			T:up(1)
			T:place("sapling", "down") -- plant sapling
			T:go("B1D4 R1F1 D1R1")	-- facing crops, over water
		else
			while turtle.down() do end -- no tree around, no logs onboard
			R.ready = false
		end
	end
	
	function lib.goToLeft(plotCountR)
		if plotCountR > 0 then
			T:go("U1B"..plotCountR * 11 .."D1")	-- return home and continue with front
			if R.config ~= nil then
				local coord = R.config.currentPlot
				for i = 1, plotCountR do
					coord = lib.configUpdateCoords(coord, "left")
				end
				R.config.currentPlot = coord
			end
		end
	end
	
	function lib.goToFront(plotCountF)
		if plotCountF > 0 then
			T:go("U1R1F"..plotCountF * 11 .."D1L1")
			if R.config ~= nil then
				local coord = R.config.currentPlot
				for i = 1, plotCountF do
					coord = lib.configUpdateCoords(coord, "back")
				end
				R.config.currentPlot = coord
			end
		end
	end
	
	function lib.gotoTree()
Log:saveToLog("==> lib.gotoTree()")
		T:go("R1U1 F1R1 U3")								-- move on top of wall/storage. face tree direction
Log:saveToLog("    Finding tree..")
		lib.harvestTree("forward") 				-- fell tree or plant sapling, ends facing tree / dirt / sapling. sticks already used for fuel. excess saplings placed
		T:go("R1F1D1R1")							-- return to base, facing crops 
		U.sendItemToNetworkStorage("barrel", "sapling", 64) --move saplings to any attached barrel
		-- ends in field facing crops
	end
	
	function lib.harvest(seed, crop)
		--[[
		cover the field in a set pattern.
		harvest crop if ripe
		till soil and plant new ones
		place seeds / harvest in chests
		return farm(s) to right / front
		crop is full name. if mixed seeds only one type returned
		]]
		T:go("U1") --ready to farm field
		local isFarmToRight = false
		local isFarmToFront = false
		local width = 9
		local length = 10
		local toRight = true
Log:saveToLog("lib.harvest(seed = "..seed..", crop = "..crop..")")
		if crop:find("pumpkin") ~= nil or crop:find("melon") ~= nil or seed:find("pumpkin") ~= nil or seed:find("melon") ~= nil then
Log:saveToLog("lib.harvest(seed = "..seed..", crop = "..crop..") found pumpkin or melon")
			for w = 1, width do
				lib.replant(seed, crop)	-- check and replant crop below
				T:forward(1)
			end
			turtle.forward()
			if utils.isStorage("down") then	-- chest, barrel or modem
				isFarmToRight = true
			end
			turtle.back()
			-- end of the row: change direction
			T:go("L1F1L1")												-- over first row of melon/pumpkin
			T:go("x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2")		-- harvest first row
			T:go("R1F1R1")
			T:go("x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2")		-- over second row of melon/pumpkin
			T:go("L1F1L1")												-- over second row of stems
			for w = 1, width do
				lib.replant(seed, crop)									-- check and replant crop below
				T:forward(1)
			end
			lib.replant(seed, crop)
			T:go("R1F3R1")												-- move over solid blocks
			for w = 1, width do
				lib.replant(seed, crop)									-- check and replant crop below
				T:forward(1)
			end
			lib.replant(seed, crop)
			T:go("L1F1L1")												-- over third row of stems
			T:go("x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2")		-- harvest third row
			T:go("R1F1R1")
			T:go("x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2F1 x2")		-- over fouth row of melon/pumpkin
			T:go("L1F1L1")												-- over second row of stems
			for w = 1, width do
				lib.replant(seed, crop)									-- check and replant crop below
				T:forward(1)
			end
		else
			for l = 1, length do
				for w = 1, width do
					lib.replant(seed, crop)	-- check and replant crop below
					T:forward(1)
					if l == 1 and w == width then -- last block of first row at front of farm
						T:forward(1)
						if utils.isStorage("down") then	-- chest, barrel or modem
							isFarmToRight = true
						end
						turtle.back()
					end
				end
				-- end of the row: change direction
				if l < length then -- do not turn at final row
					lib.replant(seed, crop)	-- check and replant crop below
					if toRight then
						T:go("L1F1L1")
					else
						T:go("R1F1R1")
					end
					lib.replant(seed, crop)
				end
				toRight = not toRight
			end
		end
		T:go("R1F1") -- goes over chest/cobble on top wall
		if utils.isStorage("down") then
			isFarmToFront = true
		end
		T:go("R2F"..length.."D1L1") -- go straight across to seed chest 10 blocks, facing crops
		lib.storeCrops() -- rotates from start to deposit seeds and crops, ends facing crops
		return isFarmToRight, isFarmToFront
	end	
	
	function lib.harvestTree(direction)
		--[[
			start in front of / during tree harvest
			Check if sapling present
			Harvest tree if present, replant sapling
			Dispose of apples. Use sticks as fuel
			Return to top of storage
		]]

		direction = direction or "forward"
		local inFront = T:getBlockType("forward")
		print("Checking tree")
		if inFront == "" then -- no tree or sapling
			print("No sapling: planting sapling")
			T:place("sapling", "forward")
		elseif inFront:find("log") ~= nil or direction == "up" then -- tree above or in front
			--print("Harvesting tree")
			T:harvestTree(direction) --do not investigate side branches in case chunk unloaded
			T:back(1) -- face dirt
			-- place(self, blockType, direction, leaveExisting, signText)
			T:place("sapling", "forward")
		end
		print("Disposing of apples")
		T:dropItem("apple", "up", 0) -- drop any apples
		U.useSticksAsFuel()
		
		while turtle.down() do end	-- ends facing tree, on top of plot storage
	end
	
	function lib.manageTree()
		-- starting position facing crops
		local logSlot = T:getItemSlot("stick")
		if logSlot > 0 then
			turtle.select(logSlot)
			turtle.refuel()
		end
		if turtle.getFuelLevel() < 250 then
Log:saveToLog("==> lib.manageTree() Fuel required: Extracting saplings from storage")
			-- assume facing crops
			if lib.getItem("sapling") > 0 then					-- gets one sapling only (if present)
Log:saveToLog("    calling lib.gotoTree()")
				lib.gotoTree()			-- check for sapling or harvest tree, retuns to facing crops
				lib.refuelWithLogs(T:getItemSlot("log"))
			end
		end
	end
	
	function lib.isCropReady(direction)
		local isReady = false
		local status = ""
		local success = false
		local crop, seed = "", ""
		local data = {}

		direction = direction or "forward"

		if direction == "down" then
			success, data = turtle.inspectDown()
		else
			success, data = turtle.inspect()
		end
--Log:saveToLog("lib.isCropReady(".. direction..")")
		if success then			-- inspect() success
			crop = data.name	-- name of growing plant
			if crop:find("flower") ~= nil then
Log:saveToLog("Flower "..crop.." found")
				return true, crop, "open"	-- eg torchflower
			else
				if data.name:find("beetroot") ~= nil then
					status = data.state.age.." / 3"
					if data.state.age == 3 then
						isReady = true
					end
				--elseif data.name:find("attached") ~= nil then	-- pumpkin / melon does not have state.age
				elseif data.name:find("stem") ~= nil then	-- pumpkin / melon does not have state.age
					return true, crop, "", 7
				else			-- all other crops inc Mystical Agriculture
					if data.state.age == nil then
						isReady = true
					else
						status = data.state.age.." / 7"
						if data.state.age == 7 then
							isReady = true
						end
					end
				end
			end
			crop, seed = lib.getCropSeed(crop)
		end
--Log:saveToLog("return isReady = "..tostring(isReady)..", crop = "..crop..", seed = "..seed..", status = "..status)
		-- crop: "", "minecraft:carrots", "minecraft:beetroot", "minecraft:potatoes", "minecraft:wheat", "mysticalagriculture:*_crop"
		return isReady, crop, seed, status	-- eg true, "minecraft:carrots", "7 / 7" or false, "mysticalagriculture:inferium_crop", "1 / 7"
	end
	
	function lib.locateFarm()
		_G.Log:saveToLog("? over water = false")
		for i = 1, 4 do
			if turtle.detect() then
				detected = i
			end
			T:turnRight(1)
		end
		_G.Log:saveToLog("Neighbouring blocks detected at: "..detected)
		-- check if on corner
		if detected > 0 then
			--assume tree / sapling on corner on older farm type
			_G.Log:saveToLog("Assuming next to tree / sapling. Moving..")
			T:go("R"..detected .."F1D1R1")
		else	-- no surrounding blocks
			for i = 1, 4 do
				T:forward(1)
				success, storage = utils.isStorage("down")
				_G.Log:saveToLog("i = "..i..",success = "..tostring(success)..". storage = "..storage)
				if success then
					discovered = discovered .. storage
					if storage == "modem" then
						R.networkFarm = true
					end
				else
					if storage == "" then
						discovered = discovered .. "_"
					else
						discovered = discovered .. "wall"
					end
				end
				utils.goBack(1)
				T:turnRight(1)
			end
			_G.Log:saveToLog("Neighbouring blocks found:"..discovered)
		end
		-- check discovered for patterns eg {_wall_barrel}
		-- |W|*|B| * = turtle on wall
		-- | | |M|
		if R.networkFarm then
			-- E = wall_barrel_, N = _barrel_wall, W = wall_barrel_, S = _wall_barrel 
			if discovered == "_wall_barrel" then
				T:go("F1D1R1")
			elseif discovered == "barrel_wall_" then
				T:go("R1F1D1R1")
			elseif discovered == "_barrel_wall" then
				T:go("R2F1D1R1")
			elseif discovered == "wall_barrel_" then
				T:go("L1F1D1R1")
			end
		else	-- normal storage farm
			if discovered == "_chest_chest" then
				T:go("F1D1R1")
			elseif discovered == "chest__chest" then
				T:go("R1F1D1R1")
			elseif discovered == "_chest_chest" then
				T:go("R2F1D1R1")
			elseif discovered == "chest_chest_" then
				T:go("L1F1D1R1")
			end
		end
		blockType = T:getBlockType("down")
		if blockType:find("water") ~= nil then
			for i = 1, 4 do
				success, storage = utils.isStorage("forward")	-- true/false, chest, barrel, modem / ""
				if success and storage == "modem" then
					R.networkFarm = true
				end
				T:turnRight(1)
			end
			R.ready = true
		end
	end
	
	function lib.plantCrop(seed, crop, direction)
		--turtle.digDown("left") -- harvest existing
		--turtle.digDown("right") -- till soil
		if crop:find("potato") ~= nil then
			T:dropItem("poison", "up", 0)
		end
--Log:saveToLog("lib.plantCrop(seed = "..seed..", crop = "..crop)
		local success = false
		-- place(blockType, direction, leaveExisting, signText, doNotAttack)
		if seed == "" then			-- must be a crop or bare soil
			if crop == "" then		-- crop planted
				return false
			else
				success = T:place(crop, direction, true, "", true)
			end
			--success = T:place(crop, direction, false, "", true)
--Log:saveToLog("Seed = "..seed..". Placing "..crop..": success = "..tostring(success))
		else
			success = T:place(seed, direction, true, "", true) 	-- eg "mysticalagriculture:air_seeds"
			--success = T:place(seed, direction, false, "", true) 	-- eg "mysticalagriculture:air_seeds"
--Log:saveToLog("Placing "..seed..": success = "..tostring(success))
		end
		if not success then
			success = T:place("seed", direction, true, "", true)			-- failsafe
			--success = T:place("seed", direction, false, "", true)			-- failsafe
--Log:saveToLog("Placing generic 'seeds' : success = "..tostring(success))
		end
		return success
	end
		
	function lib.replant(seed, crop)
		-- check crop below. If ripe, dig and replant seed
		local isReady, cropType, seedType, status = lib.isCropReady("down")	-- eg true, "minecraft:carrots", "7 / 7" or false, "", ""
		if cropType == "" then					-- no crop below (above water, storage or dirt)
			turtle.digDown("right")				-- use hoe
			if not lib.plantCrop(seed, crop, "down") then	-- plant crop
				turtle.digDown("right")			-- use hoe again required with some mods
				lib.plantCrop(seed, crop, "down")
			end
		elseif crop:find("pumpkin") == nil and crop:find("melon") == nil and isReady then						-- crop below is ready
			turtle.digDown("left")				-- use pickaxe
			if not lib.plantCrop(seedType, cropType, "down") then	-- plant crop
				turtle.digDown("left")
				lib.plantCrop(seedType, cropType, "down")
			end
		elseif cropType == "minecraft:melon" or cropType == "minecraft:pumpkin" then
			turtle.digDown("left")				-- use pickaxe
		end
		turtle.suckDown()
	end
	
	function lib.refuelWithLogs(logSlot)
		--[[ called after lib.manageTree and on startup ]]
Log:saveToLog("lib.refuelWithLogs(logSlot = "..logSlot..")")
		if logslot == 0 then return end
		local equippedLeft, equippedRight = T:getEquipped("both")				-- "" or "minecraft:..." for each side
		local craftSlot = T:getItemSlot("minecraft:crafting_table")				-- if crafting table in inventory
Log:saveToLog("lib.refuelWithLogs("..logSlot..") equippedLeft = "..equippedLeft..", equippedRight = "..equippedRight)
		if equippedLeft ~= "minecraft:crafting_table" and equippedRight ~= "minecraft:crafting_table" then
			if craftSlot == 0 then												-- no crafter present
				craftSlot = lib.getItem("minecraft:crafting_table") 			-- gets item or errors
			end
			T:equip("right", "minecraft:crafting_table")						-- equip with crafting table
			U.sendItemToNetworkStorage("barrel", "minecraft:diamond_hoe", 1)
		end
		turtle.select(logSlot)
		turtle.transferTo(1)
-- utils.waitForInput("Ready to craft logs slot 1. Proceed?")
		turtle.craft()														-- craft logs to planks
		logSlot = T:getItemSlot("planks")
		while logSlot > 0 and turtle.getFuelLevel() < turtle.getFuelLimit() do
			turtle.select(logSlot)
			turtle.refuel()													-- refuel using planks
			logSlot = T:getItemSlot("planks")				
		end
		
		T:unequip("right")													-- unequip crafting table
		-- return crafting table
		U.sendItemToNetworkStorage("barrel", "minecraft:crafting_table", 1)
		if not T:equip("right", "minecraft:diamond_hoe") then		-- ? equip hoe
			lib.getItem("minecraft:diamond_hoe")				-- get hoe
			T:equip("right", "minecraft:diamond_hoe")				-- equip hoe
		end
	end
	
	function lib.storeCraftingTable()
		-- turtle facing crops 
		U.sendItemToNetworkStorage("barrel", "minecraft:crafting_table", 1)
	end
	
	function lib.storeCrops()
		-- place crops and seeds into chests. Starts facing crops
		T:dropItem("apple", "up", 0) 									-- drop all apples
		T:dropItem("poison", "up", 0) 									-- drop all poison potatoes
		-- put "sapling", "diamond_hoe", "crafting" into barrels near farm, everything else into chest storage
		-- U.emptyInventory(barrels, chests, sticksAsFuel, relist)
		-- relist forces remappimg of chest and barrel contents to help locate correct storage location
		U.emptyInventory({"sapling", "diamond_hoe", "crafting"}, {"all"}, true, true)
		-- position remains as start of this function
	end
		
	function lib.watchFarm()
		--[[
		check status of crops in front of turtle.
		call lib.harvest when ripe
		return farm(s) found in front or to the right
		]]
		--    bool,    string, string, integer
		local isReady, crop, seed, status = lib.isCropReady("forward")		-- eg true, "minecraft:carrots", "7 / 7" or false, "", ""
		-- check state of crop in front. Harvest if ripe		
		repeat
			if not isReady then
				if crop == "" then
					return {"No crops found in front", "Plant seeds, carrots, potatoes", "pumpkin or melon"}
				else
					print("Waiting for "..crop.." status: "..status)
					if crop:find("mysticalagriculture") ~= nil then
						R.mysticalAgriculture = true
					end
				end
				sleep(60)
				isReady, crop, seed, status = lib.isCropReady("forward")			-- eg true, "minecraft:carrots", "7 / 7" or false, "", ""
			end
		until isReady
Log:saveToLog("Local crops ripe calling lib.manageTree()")
		--seed, crop = lib.manageTree() -- "", "" or name of seed, crop
		lib.manageTree() -- refuel if required, else do nothing
		lib.getSeedsOrCrops(crop, seed)
		return crop, seed
	end
	
	--[[
		ENTRY POINT**********************************************
		called from args on start, or from user choice
		farm already built, needs planting and/or harvesting
		needs both pickaxe and hoe. crafting chest only used if tree is felled for fuel
		may start in any position if chunk unloaded while running
		All farms now use network storage
	]]
Log:saveToLog("manageFarm() calling checkFarmPosition()")
	if turtle.getFuelLevel() < 60 then
Log:saveToLog("manageFarm(): Unable to proceed. Fuel level is "..turtle.getFuelLevel())
		if R.auto then 	
			utils.waitForInput("Unable to proceed. Fuel level is "..turtle.getFuelLevel())
			return {}
		else		-- not started from startup.lua
			return {"Unable to proceed. Fuel level is "..turtle.getFuelLevel()}
		end
	end
	checkFarmPosition()											-- should be facing crops, placed above water source. R.ready, R.networkFarm is true
	if not R.ready then											-- not in correct starting place
		lib.goHome()
		if not R.ready then 									-- try to find home
			return
			{
				"Unable to determine my position.\n",
				"Place me in the lower left corner",
				"over water, facing the crops with",
				"barrel / chest /modem to my right",
				"and behind."
			}
		end
	end
	local message = U.wrapModem(true)								-- initialises or creates lists of where an item can be found: GLOBAL LISTS!
	if message ~= "" then return {message} end						-- return to main menu
	local empty = T:isEmpty()
	if not empty then												-- items still in turtle inventory
		T:sortInventory(false)										-- sort inventory prior to unloading.
	end
	local equippedLeft, equippedRight = T:getEquipped("both")		-- "" or "minecraft:..." for each side
	local emptySlots = T:getEmptySlotCount()
	if emptySlots < 3 then											-- 3 slots needed for axe, hoe and crafting
		T:clear()
		return {"Too many items in inventory. 3 free slots required"}
	end
	local logSlot = T:getItemSlot("log")							-- if logs in inventory
	if logSlot == 0 and not empty then								-- no logs, so empty inventory
		lib.storeCrops(false)										-- stores crops and seeds
	end
	if equippedLeft ~= "minecraft:diamond_pickaxe" then
		T:unequip("left")											-- remove from left
		if not T:equip("left", "minecraft:diamond_pickaxe") then	-- ? equip pickaxe. should always be present
			lib.getItem("minecraft:diamond_pickaxe")				-- get pickaxe
			T:equip("left", "minecraft:diamond_pickaxe")			-- equip pickaxe
		end
	end
	local craftSlot = T:getItemSlot("minecraft:crafting_table")		-- if crafting table in inventory
	-- turtle has pickaxe equipped. If fuel needed equip crafter, else hoe
	-- if logs present, use as fuel, or fuelLevel < 1000
	if logSlot > 0 then				-- equip axe and crafter		-- logs onboard, need to equip crafting table
		lib.refuelWithLogs(logSlot)
	else
		-- store crafting table as not required
		if craftSlot > 0 then
			lib.storeCraftingTable(false)
		end
		if equippedRight ~= "minecraft:diamond_hoe" then
			if not T:equip("right", "minecraft:diamond_hoe") then		-- ? equip hoe
				lib.getItem("minecraft:diamond_hoe")					-- get hoe
				T:equip("right", "minecraft:diamond_hoe")				-- equip hoe
			end
		end
	end														

	--local isFarmToRight, isFarmToFront = false, false
	--local isReady, crop, seed, status
	local isReady, crop, seed, status = lib.isCropReady("forward")
Log:saveToLog("lib.isCropReady('forward'): isReady = "..tostring(isReady)..", crop = "..crop..", seed = "..seed..", status = "..status)
	local watch = true	-- assume watching farm already planted
	local planted = true
	if crop == "" then	-- nothing has been planted
		seed, crop = lib.askPlayerForCrops()
		if crop ~= "" or seed  ~= "" then	-- something has been chosen
Log:saveToLog("Initial planting of "..crop, true)
			-- isFarmToRight, isFarmToFront = lib.harvest(seed, crop)	-- harvest plot a1 plots to right / front recorded	
			lib.harvest(seed, crop)	-- plant this plot only
			return {"Initial crops planted. Re-start to manage this farm"}
		elseif crop == "" and seed == "" then	-- request till soil only
			watch = false
			planted = false
			lib.harvest(seed, crop)
			return {"soil tilled ready for growing"}
		end
	end

	if watch and planted then -- planted true when farm first planted
		crop, seed = lib.watchFarm() -- waits if required, returns seed / crop
		planted = true		
	end
	-- -- first farm is ready to go	
	Log:saveToLog("Beginning "..crop.. " management", true)
	local plotCountF = 0																-- move from front to back of farm plots. This counts no of plots moved from front
	local plotCountR = 0																-- move left to right along farm plots
	local isFarmToRight, isFarmToFront = true, true										-- flags set to true to ensure loop runs at least once
	local flagSet = false
	while true do -- start infinite loop of watching crops, farming all modules
		while isFarmToFront do															-- farm to front confirmed on first plot
			while isFarmToRight do														-- do all plots on the right side
				lib.manageTree()														-- refuel if needed
				local hasFrontFarm = false												-- local flag to imitialise isFarmToFront
				isReady, crop, seed, status = lib.isCropReady("forward")
				isFarmToRight, hasFrontFarm = lib.harvest(seed, crop)					-- harvest this plot
				if not flagSet then
					isFarmToFront = hasFrontFarm										-- external flag now set when first plot is harvested
					flagSet = true
				end
				if isFarmToRight then													-- plot just harvested sets this flag
					T:go("U1F11 D1")													-- now moved to next farm, facing crops
					plotCountR = plotCountR + 1											-- increment plot counter for return to base
					local isReady, crop, seed, status = lib.isCropReady("forward")		-- eg true, "minecraft:carrots", "7 / 7" or false, "", ""
					-- NOT waiting fror crops to be ready any more
	Log:saveToLog("farming plot no "..plotCountR.." on right, crop = "..crop..", seed = "..seed)
					lib.manageTree() 													-- refuel if required, else do nothing
					if crop == "" then 													-- if no crop then ignore this farm
	Log:saveToLog("farming plot no "..plotCountR.." no crop found, so checking for further plots")
						isFarmToRight = lib.checkFarmToRight()							-- check right border for further plot
					else
						lib.getSeedsOrCrops(seed, crop)									-- load in crop / seed
					end
				end
			end
			-- no more farms to right, so return to start position
			lib.goToLeft(plotCountR)													-- all plots to right have been checked, return to start position
			plotCountR = 0																-- reset right plot counter
			isFarmToRight = true														-- reset to ensure farm in front is harvested
			flagSet = false																-- reset so next band of farms controls isFarmToFront flag
			if isFarmToFront then														-- farm in front confirmed
				T:go("U1L1 F11D1 R1")													-- on next farm, facing crops
				plotCountF = plotCountF + 1
			end
		end
		-- no more farms in front
		lib.goToFront(plotCountF)
		plotCountR = 0																	-- reset all flags and counters
		plotCountF = 0																	-- reset forward plot counter
		isFarmToRight = true
		isFarmToFront = true
		flagSet = false
		if not R.auto then 																-- not started from startup.lua
			return {"Crop management of all modules completed"}
		end
		crop, seed = lib.watchFarm() -- waits if required, returns seed / crop
	end
	
	return {}
end

function manageFarmSetup()
	-- called from ui "Manage Farm" button
	local lib = {}
	
	function lib.disableAutostart()
		if fs.exists("start.txt") then
			fs.delete("start.txt")
		end
		if fs.exists("startup.lua") then
			fs.delete("startup.lua")
		end
	end
	
	function lib.enableAutostart()
		if not fs.exists("startup.lua") then
			local h = fs.open("startup.lua", "w")
			h.writeLine('function main()')
			h.writeLine('	if fs.exists("start.txt") then')
			h.writeLine('		local handle = fs.open("start.txt", "r")')
			h.writeLine('		local cmd = handle.readLine()')
			h.writeLine('		handle.close()')
			h.writeLine('		shell.run("tk3.lua "..cmd)')
			h.writeLine('	end')
			h.writeLine('end')
			h.writeLine('main()')
			h.close()
		end
		local h = fs.open("start.txt", "w")
		h.writeLine('farm')
		h.close()
		print("Startup files written")
	end
	
	--[[
	T:clear()
	--local pp = utils.getPrettyPrint()	
	local choices = {"Plant or harvest this farm complex"}	-- 1.
	local isManaged = fs.exists("start.txt")

	if isManaged then
		table.insert(choices, "Disable automatic farm management") -- 2.
	else
		table.insert(choices, "Enable automatic farm management") -- 2.
	end
	pp.itemColours = {colors.lime, colors.lightGray}
	if not R.networkFarm then
		table.insert(choices, "Convert to Network Storage")		-- 3.
		table.insert(pp.itemColours, colors.magenta)
	end
	if R.mysticalAgriculture then
		--table.insert(choices, "Convert to Mystical Agriculture")
		table.insert(choices, "Upgrade Mystical Agriculture soil")	--3/4
		table.insert(pp.itemColours, colors.green)
	end
	
	local userChoice, modifier = menu.menu("Choose your option", choices, pp) -- 1 to 2
	if modifier == "q" then -- quit chosen
		return {"Player has quit"}
	end
	R.subChoice = userChoice]]
	local isManaged = fs.exists("start.txt")
Log:saveToLog("manageFarmSetup() R.inventoryKey = ".. R.inventoryKey)
	if R.inventoryKey == "farm" then -- harvest now
		R.silent = false
		R.auto = false
Log:saveToLog("manageFarmSetup() calling manageFarm()")
		return manageFarm()
	elseif R.inventoryKey == "auto" then -- enable/disable auto farm
		local line = menu.clear()
		if isManaged then
			local message = ( "This turtle has been configured to"..
							  "start automatically and run the farm"..
							  "management program.\n")
			line = menu.colourText(line, message, true, true)
			if menu.getBoolean("Do you want to disable this? (y/n)", line, colors.yellow, colors.black) then
				lib.disableAutostart()
			end
			return {"Autostart disabled. Reboot to activate"}
		else -- not managed
			local message = ( "~yellow~This turtle can be configured to be\n"..
							  "a dedicated farm manager.\n\n"..
							  "~lightGray~It will then start automatically and\n"..
							  "monitor the farm complex:\n\n"..
							  "~green~harvesting~yellow~ and ~lime~replanting ~yellow~continuously.\n")
			line = menu.colourText(line, message, true, true)
			if menu.getBoolean("Do you want to enable this? (y/n)", line + 2, colors.orange, colors.black) then
				lib.enableAutostart()
			else
				return {"Player cancelled operation"}
			end
			return {"Autostart enabled. Reboot to activate"}
		end
	--elseif R.subChoice == 3 and #choices == 4 then -- convert normal farm to network storage
	elseif R.inventoryKey == "convert" then -- convert normal farm to network storage
		local isMain = false
		local line = menu.clear()
		local message = ("~yellow~You have chosen to convert this farm "..
						 "to ~magenta~network storage ~yellow~with modems."..
						 "All ~brown~chests and barrels ~red~will be removed.\n")
		line = menu.colourText(line, message, true, true)
		if menu.getBoolean("Is this the main or only plot? (y/n)", line + 3, colors.orange, colors.black) then
			isMain = true
		end
		T:checkInventoryForItem({"stone"}, {16})
		T:checkInventoryForItem({"dirt"}, {2})
		T:checkInventoryForItem({"sapling"}, {1})
		T:checkInventoryForItem({"barrel"}, {1})
		T:checkInventoryForItem({"ladder"}, {5})
		if isMain then
			T:checkInventoryForItem({"chest"}, {8})
			T:checkInventoryForItem({"wired_modem_full"}, {3})
			T:checkInventoryForItem({"computercraft:cable"}, {70})
			return createFarm("convertWithStorage")
		else
			T:checkInventoryForItem({"wired_modem_full"}, {2})
			T:checkInventoryForItem({"computercraft:cable"}, {57})
			return createFarm("convert")
		end
	--elseif R.subChoice == 3 and #choices == 3 then -- upgrade farmland with essence (network opt not present)
	--elseif R.subChoice == 3 and #choices == 3 then -- upgrade farmland with essence (network opt not present)
		--return upgradeFarmland()
	--elseif R.inventoryKey == "upgrade" then -- upgrade farmland with essence
		--return upgradeFarmland()
	end
	
	return {}
end

function measure()
	-- measure height/ depth / length
	-- R.dimension = "height", "depth", "length", "deepest"
	local doContinue = true
	local message = ""
	local blocks = 1
	local method = ""
	local measure = ""
	
	local lib = {}
	
	function lib.checkBlocks(blocks)
		blocks = blocks + 1
		doContinue = true
		if blocks > R.size then
			message = "Max "..R.dimension.." of "..R.size.." stopped measurement"
			measure = ""
			doContinue = false
		else
			measure = R.dimension.." measured: "..blocks.." blocks"
		end
		return doContinue, blocks, measure, message
	end
	
	if R.dimension == "height" then				-- height
		R.size = 64								-- catch-all to prevent going to the top of the world
		if R.subChoice == 1 then				-- obstruction above
			method = "Method: Until obstruction above"
			while turtle.up() and doContinue do
				doContinue, blocks, measure, message = lib.checkBlocks(blocks)
			end
		elseif R.subChoice == 2 then			-- end of blocks in front of turtle eg cliff, wall
			method = "Method: Until no block detected in front"
			while turtle.detect() do
				if turtle.up() then
					doContinue, blocks, measure, message = lib.checkBlocks(blocks)
				else
					message = "Obstruction above stopped measurement"
					measure = ""
					doContinue = false
				end
			end
		elseif R.subChoice == 3 then	-- search for specific block min 3 characters
			method = "Method:Until search: '"..R.data.."' met"
			while turtle.detect() and doContinue do
				if turtle.up() then
					doContinue, blocks, measure, message = lib.checkBlocks(blocks)
					if doContinue then
						local blockType = T:getBlockType("forward")
						if blockType:find(R.data) ~= nil then
							measure = "Height measured: "..blocks.." blocks"
							message = "Found "..blockType
							doContinue = false
						end
					end
				else
					message = "Obstruction above stopped measurement"
					measure = ""
					doContinue = false
				end
			end
		elseif R.subChoice == 4 then	-- When block above changes eg dragon tower height
			local blockType = T:getBlockType("up")
			local compare = blockType
			method = "Method: Until "..blockType.." changes"
			while blockType == compare and doContinue do
				T:up(1)
				doContinue, blocks, measure, message = lib.checkBlocks(blocks)
				if doContinue then
					blockType = T:getBlockType("up")
				end
			end
			measure = "Height measured: "..blocks.." blocks"
			message = "Found "..blockType
		end
		
		for i = 1, blocks do
			turtle.down()
		end
	elseif R.dimension == "depth" then	-- depth
		-- check if already over air
		local moved = false
		if turtle.detectDown() then
			T:forward(1)
			moved = true
		end
		T:go("R2D1") -- go off the edge and face cliff/pit wall
		blocks = blocks + 1
		if R.subChoice == 1 then		-- obstruction water / lava below
			local move = true
			while move do
				local blockType = T:getBlockType("down")
				if blockType:find("water") ~= nil or blockType:find("lava") ~= nil then
					message1 = blockType.." found at "..blocks
					move = false
				else
					move = turtle.down()
					if move then
						blocks = blocks + 1
					else
						measure = "Depth measured: "..blocks.." blocks"
					end
				end
			end
			method = "Method: Until obstruction below"
		elseif R.subChoice == 2 then	-- end of wall in front`
			while turtle.detect() do
				if turtle.down() then
					blocks = blocks + 1
					measure = "Depth measured: "..blocks.." blocks"
				else
					message1 = "Obstruction below stopped measurement"
					break
				end
			end
			method = "Method: Until no block detected ahead"
		elseif R.subChoice == 3 then	-- specific block detected ahead
			method = "Method:Until search: '"..R.data.."' met"
			while turtle.detect() do
				if turtle.down() then
					blocks = blocks + 1
					local blockType = T:getBlockType("forward")
					if blockType:find(R.data) ~= nil then
						measure = "Depth measured: "..blocks.." blocks"
						message = "Found "..blockType
						break
					end
				else
					message = "Obstruction below stopped measurement"
					break
				end
			end
		end
		for i = 1, blocks - 1 do
			turtle.up()
		end
		if moved then
			T:go("F1")
		end
		T:go("R2")
	elseif R.dimension == "length" then	-- length
Log:saveToLog("R.dimension == "..R.dimension..", R.subChoice  = "..R.subChoice)
		if R.subChoice == 1 then		-- obstruction ahead
			method = "Method: Until obstruction ahead"
			while turtle.forward() and doContinue  do
				doContinue, blocks, measure, message = lib.checkBlocks(blocks)
			end
		elseif R.subChoice == 2 then	-- end of ceiling above
			method = "Method: Until no block detected above"
			while turtle.detectUp() and doContinue do
				if turtle.forward() then
					doContinue, blocks, measure, message = lib.checkBlocks(blocks)
				else
					message = "Obstruction ahead stopped measurement"
					measure = ""
					doContinue = false
				end
			end
		elseif R.subChoice == 3 then	-- end of floor below
			method = "Method: Until no block detected below"
			while turtle.detectDown() and doContinue do
				if turtle.forward() then
					doContinue, blocks, measure, message = lib.checkBlocks(blocks)
				else
					message = "Obstruction ahead stopped measurement"
					measure = ""
					doContinue = false
				end
			end
		elseif R.subChoice == 4 then	-- search for specific block up min 3 characters
			method = "Method:Until search: '"..R.data.."' above met"
			while turtle.detectUp() and doContinue do
				if turtle.forward() then
					doContinue, blocks, measure, message = lib.checkBlocks(blocks)
					if doContinue then
						local blockType = T:getBlockType("up")
						if blockType:find(R.data) ~= nil then
							message = "Found "..blockType
							measure = "Length measured: "..blocks.." blocks"
							doContinue = false
						end
					end
				else
					message = "Obstruction ahead stopped measurement"
					measure = ""
					doContinue = false
				end
			end
		elseif R.subChoice == 5 then	-- search for specific block down min 3 characters
			method = "Method:Until search: '"..R.data.."' below met"
			--while turtle.detectDown() and doContinue do
			while doContinue do
				if turtle.forward() then
					doContinue, blocks, measure, message = lib.checkBlocks(blocks)
					if doContinue then
						local blockType = T:getBlockType("down")
						if blockType:find(R.data) ~= nil then
							message = "Found "..blockType
							measure = "Length measured: "..blocks.." blocks"
							doContinue = false
						end
					end
				else
					message = "Obstruction ahead stopped measurement"
					measure = ""
					doContinue = false
				end
			end
		end
		T:turnRight(2)	-- head home
		for i = 1, blocks do
			turtle.forward()
		end
		T:turnRight(2)
	elseif R.dimension == "deepest" then	-- depth of stretch of water
		--R.length = 0 to auto calculate
		R.width = 1
		R.silent = true
		R.useBlockType = ""
		R.data = "clearWaterPlants"
		local data = clearWaterPlants()
		R.height = data[1]
		local length = data[2]
		T:go ("R2F"..length - 1 .."R2U1")
		return {R.height, "Greatest depth measured: ".. R.height, "Width of water: "..R.length}
	end
	--if message == "" then
		--return{method, measure}
	--else
		return{blocks, method, measure, message}
	--end
end

function measureDeepest()
	return measure()
end

function measureDepth()
	return measure()
end

function measureHeight()
	return measure()
end

function measureLength()
	Log:saveToLog("measureLength() called")
	return measure()
end

function mineBedrockArea()
	--[[ 
	Assume on level 5 or -59
	for 1, width do
		for 1, length do
			go down until bedrock, digging/replacing all directions
			return to 5 / -59
			move forward 1 blocks
		end
		turn right/ forward 2 turn right
	end
	]]	
	
	local lib = {}
	
	function lib.clearColumn()
		local level = 0
		--T:go("L1x1R2x1L1")
		local success = T:down(1)
		while success do
			level = level + 1
			if R.data == "leaveExposed" then
				T:go("R1x1R1x1R1x1R1x1", false, 0, true)
			else
				T:go("R1C1R1C1R1C1R1C1", false, 0, true)
			end
			success = T:down(1)
		end
		if R.data == "leaveExposed" then
			T:go("U"..level)
		else
			T:go("U"..level.."C2")
		end
	end
	
	local goRight = true
	for i = 1, R.width do
		for j = 1, R.length do
			lib.clearColumn()
			T:forward(1)
		end
		if goRight then
			T:go("R1F1R1")
		else
			T:go("L1F1L1")
		end
		goRight = not goRight
	end
	return {"Bedrock area cleared of minerals"}
end

function oceanMonumentColumns()
	-- utility to find corners and build columns to surface
	local lib = {}
	
	function lib.buildColumn()
		local depth = 0
		while T:isWater("forward") do
			T:go("U1C2")
			depth = depth + 1
		end
		return depth
	end
	
	function lib.buildTower()
		T:go("F1C2 F1C2 F1C2")
		T:go("L1F1 L1C2 F1C2 F1C2 F1C2")
		T:go("R1F1 R1C2 F1C2 F1C2 F1C2")
		T:go("L1F1 L1C2 F1C2 F1C2 F1C2")
		
		T:go("R2")
		for i = 1, 4 do
			T:go("U1C2")
			for j = 1, 4 do
				T:go("F1C2 F1C2 F1C2 R1")
			end
		end
	end
	
	R.silent = true
	local blockType = T:getBlockType("down")
	while blockType:find("water") == nil do
		T:down(1) -- if on a platform will break through
		blockType = T:getBlockType("down")
	end
	--R.useBlockType = "prismarine", R.data = "oceanMonumentColumns" from getTask
	--local tempData = R.data
	--R.data = "clearWaterPlants"
	local result = clearWaterPlants()[1]	-- should be {""} -> ""
	if result ~= "" then
		return {result}
	else
		--on corner of monument, facing out to ocean
		local depth = lib.buildColumn()
		-- now above surface, block below at surface level
		for i = 1, 4 do
			T:turnRight(1)
			R.length = 57
			createPath() -- roughly at next corner
			if i < 4 then
				T:down(depth-2) -- roughly at correct depth
				local waterBelow = utils.clearVegetation("down")
				while waterBelow do
					T:down(1)
					waterBelow = utils.clearVegetation("down")
				end
				blockType = T:getBlockType("down")
				while blockType:find("prismarine") ~= nil do
					T:forward(1)
					blockType = T:getBlockType("down")
				end
				turtle.back()
				depth = lib.buildColumn()
			end
		end
		-- completed retaining paths. Build small tower for easy access
		lib.buildTower()
	end
	
	return {}
end

function placeRedstoneTorch()
	local moves = 2
	local blockType = T:getBlockType("down")
	if R.data == "level" then
		T:turnLeft(1)
		utils.goBack(1)
		if blockType:find("rail") ~= nil then
			 moves = 3
		end
		T:down(moves)
		T:go("F1R1")
		--clsTurtle.place(self, blockType, damageNo, direction, leaveExisting)
		T:place(R.useBlockType, "forward", false)
		utils.goBack(1)
		T:place("minecraft:redstone_torch", "forward", true)
		T:turnLeft(1)
		utils.goBack(1)
		T:up(moves)
		T:go("F1R1F1")
	elseif R.data == "up" then -- sloping rail up/down is relative to direction facing
		moves = 3
		T:turnLeft(1)
		utils.goBack(1)
		if blockType:find("rail") ~= nil then
			 moves = 4
		end
		T:down(moves)
		T:go("F1L1")
		T:place("minecraft:redstone_torch", "up", false)
		
		T:turnRight(1)
		utils.goBack(1)
		T:up(moves)
		T:go("F1R1")
	end
	return {}
end

function plantTreefarm()
	-- F["assessTreeFarm"].call() already run
	-- R.logType = eg "minecraft:dark_oak_log"
	-- R.useBlockType = eg "minecraft:oak_sapling"
	-- R.subChoice = 1,2,3 single, double, mangrove
	-- R.networkFarm = true 
	local lib = {}
	
	function lib.emptyInventory()
		if not T:isEmpty() then
			U.useSticksAsFuel()
Log:saveToLog("==> lib.emptyInventory() call --> U.sendItemToNetworkStorage('barrel', 'sapling, 64")
			U.sendItemToNetworkStorage("barrel", "sapling", 64)
			U.sendItemToNetworkStorage("barrel", "propagule", 64)
			U.sendItemToNetworkStorage("barrel", "apple", 64)
			U.sendItemToNetworkStorage("barrel", "dirt", 64)
			U.sendItemToNetworkStorage("chest", "all", 0)
		end
	end
	
	function lib.createIsland(sapling, count, exit)
		-- place 4 dirt with saplings on all 4
		-- sapling count/type already checked
		T:forward(2) -- assume starting outside planting area
		for i = 1, 4 do
			T:go("R1F1")
			T:place("dirt", "down", false, "", true)
		end
		T:up(1)
		if count >= 4 then
			for i = 1, 4 do
				T:go("R1F1")
				T:place(sapling, "down", false, "", true)
			end
		end
		if exit == "forward" then
			T:go("F1D1")
		elseif exit == "right" then
			T:go("R1F2D1")
		elseif exit == "left" then
			T:go("L1F1D1")
		elseif exit == "back" then
			T:go("R2F2D1")
		end
	end
	
	function lib.createSingle(sapling, exit)
		-- place single dirt with sapling on top
		-- sapling count/type already checked
		T:place("dirt", "down", false, "", true)
		T:up(1)
		if not T:place(sapling, "down", false, "", true) then 	-- try specific sapling
			T:place("sapling", "down", false, "", true)			-- any available sapling
		end
		if exit == "forward" then
			T:go("F1D1")
		elseif exit == "right" then
			T:go("R1F1D1")
		elseif exit == "left" then
			T:go("L1F1D1")
		elseif exit == "back" then
			T:go("R2F1D1")
		end
	end
	
	function lib.getMangroveSupplies()
		-- getItemFromNetwork(storageType, itemRequired, countRequired, toTurtleSlot, ignoreStock)
		local turtleSlot, turtleCount = U.getItemFromNetwork("barrel", "minecraft:dirt", 169, nil, true)
		if turtleCount < 169 then
			turtleSlot, turtleCount = U.getItemFromNetwork("chest", "minecraft:dirt", 169 - turtleCount, nil, true)
			if turtleCount < 169 then	-- ask player for saplings
				T:checkInventoryForItem({"dirt"}, {169 - turtleCount})
			end
		end
		turtleSlot, turtleCount = U.getItemFromNetwork("barrel", "minecraft:mangrove_propagule", 25)
		if turtleCount == 0 then	-- ask player for saplings
			T:checkInventoryForItem({"mangrove_propagule"}, {25}, true, "Mangrove propagules required")
		end
	end
	
	function lib.getSaplings()
		-- getItemFromNetwork(storageType, itemRequired, countRequired, toTurtleSlot, ignoreStock)
		local turtleSlot, turtleCount = U.getItemFromNetwork("barrel", "minecraft:dirt", 16, nil, true)
		if turtleCount < 16 then
			turtleSlot, turtleCount = U.getItemFromNetwork("chest", "minecraft:dirt", 16 - turtleCount, nil, true)
			if turtleCount < 16 then	-- ask player for dirt
				T:checkInventoryForItem({"dirt"}, {16 - turtleCount})
			end
		end
		turtleSlot, turtleCount = U.getItemFromNetwork("barrel", R.useBlockType, 16)
		if turtleCount == 0 then	-- ask player for saplings
			T:checkInventoryForItem({R.useBlockType}, {16}, true, "saplings required")
		end
	end
	
	function lib.plantMangrove()
		T:go("L1F6 R1F1 U1")
		createFloorCeiling({width = 13, length = 13, up = false, down = true,
							height = 0, subChoice = 0, useBlockType = "minecraft:dirt",
							inventory = T:getInventory()})
		
		--T:go("U1F5 R1F5 L1")			-- lower left of planting area, facing Back
		T:go("U1F4 R1F4 L1")			-- lower left of planting area, facing Back
		for x = 1, 5 do
			for i = 1, 5 do
				T:place("propagule", "down")	-- left 1
				if i < 5 then
					T:forward(1)
				end
			end
			if x % 2 == 1 then
				if x < 5 then
					T:go("R1F1R1")
				end
			else
				T:go("L1F1L1")
			end
		end
		T:go("L1F2 L1F2 D2U2 F7R2 D2")
		--[[
		T:place("propagule", "down")	-- left 1
		T:forward(1)
		T:place("propagule", "down")	-- left 2
		T:forward(1)
		T:place("propagule", "down")	-- left 3/top 1

		T:go("R1F1")
		T:place("propagule", "down")	-- top 2
		T:forward(1)
		T:place("propagule", "down")	-- top 3/right 1
		T:go("R1F1")
		
		T:place("propagule", "down")	-- right 2
		T:forward(1)
		T:place("propagule", "down")	-- right 3/bottom 1
		T:go("R1F1")
		T:place("propagule", "down")	-- bottom 2]]
		
		--T:go("R1F1R2 D2U2 F7R2 D2")
	end
	
	function lib.plantSingle()
		--local sapling, count = lib.checkSaplings(firstChoice, secondChoice)
		local saplingSlot, name, count = T:getSaplingSlot(R.useBlockType)
		if count >= 1 then
			T:go("U1L1 F3R1 F4") -- outside first area
			for i = 1, 3 do	-- column 1/4
				lib.createSingle(sapling, "forward")
				T:forward(1)
			end
			for i = 1, 2 do
				lib.createSingle(sapling, "right") -- place 4th dirt/saling and exit to right
				T:forward(1)
			end
			for i = 1, 2 do -- column 2/4
				lib.createSingle(sapling, "forward")
				T:forward(1)
			end
			for i = 1, 2 do
				lib.createSingle(sapling, "left") -- place 4th dirt/saling and exit to right
				T:forward(1)
			end
			for i = 1, 2 do -- column 3/4
				lib.createSingle(sapling, "forward")
				T:forward(1)
			end
			for i = 1, 2 do
				lib.createSingle(sapling, "right") -- place 4th dirt/saling and exit to right
				T:forward(1)
			end
			for i = 1, 3 do -- column 4/4
				lib.createSingle(sapling, "forward")
				T:forward(1)
			end
			T:go("R1F3 R1F2L1") -- in-between 2 trees
			if R.auto then
				harvestTreeFarm()
			else
				T:go("L1F4R2D1")
			end
		else
			return "No saplings to plant"
		end
		
		return ""
	end
	
	function lib.plantDouble()
		-- assume placed 4 blocks from start
		--local sapling, count = lib.checkSaplings(saplings, firstChoice, secondChoice)
		local saplingSlot, sapling, count = T:getSaplingSlot(R.useBlockType)
		if count >= 4 then
			T:go("U1L1 F3R1 F3") -- outside first area
			lib.createIsland(sapling, count, "forward")
			saplingSlot, sapling, count = T:getSaplingSlot(R.useBlockType)
			T:go("F2")
			lib.createIsland(sapling, count, "right")
			saplingSlot, sapling, count = T:getSaplingSlot(R.useBlockType)
			T:go("F2")
			lib.createIsland(sapling, count,  "right")
			saplingSlot, sapling, count = T:getSaplingSlot(R.useBlockType)
			T:go("F2")
			lib.createIsland(sapling, count, "forward")
			T:go("R1F4 R1F1 L1") 			-- on left side of double tree
			if R.auto then
				harvestTreeFarm()
			else
				T:go("L1F4 L1F1 L1D1")	-- back to start
			end
		else
			return "Insufficient saplings to plant"
		end
		return ""
	end
	
	menu.clear()
	menu.colourPrint("plantTreefarm starting: size "..R.subChoice, colors.lime)

	local message = U.wrapModem(true)	-- initialises or creates lists of where an item can be found: GLOBAL LISTS!
	if message ~= "" then return {message} end
	lib.emptyInventory()

	if R.subChoice == 3 then	-- mangrove
		lib.getMangroveSupplies()
		lib.plantMangrove()
	else
		lib.getSaplings()
		-- check type/size of farm
		local message = ""
		if R.subChoice == 1 then 			-- 16 single trees
			message = lib.plantSingle()		-- always ""
		elseif R.subChoice == 2 then 		-- 4 double trees (4 saplings)
			message = lib.plantDouble()		-- "" or error about numbers 
		end
	end
	lib.emptyInventory()
	if message == "" then					-- planted successfully
		message = "Planted tree farm with "..R.useBlockType
	end
	return {message}
end

function quickMine()
	--[[
	mine valuable blocks from specified area
	R.subChoice:
	1 At mine area start, on the floor
	2 At mine area start, on the ceiling
	3 On floor, start 1 block ahead
	4 On ceiling, start 1 block ahead
	5 On floor diagonally to left"
	]]
	local lib = {}
	
	function lib.refuel(direction)
		if T:getWater(direction)  then
			T:refuel(1000, false)
		end
	end
	
	function lib.mine()
		-- starts on ceiling
		local isValuable, blockType
		for i = 1, R.length do
			local fillUp = R.up
			local fillDown = R.down
			isValuable, blockType = T:isValuable("down")
			if isValuable then
				T:dig("down")
			elseif blockType:find("water") ~= nil then
				fillDown = true
			elseif blockType:find("lava") ~= nil then
				lib.refuel("down")
				fillDown = true
			end
			isValuable, blockType = T:isValuable("up")
			if isValuable then
				T:dig("up")
			elseif blockType:find("water") ~= nil then
				fillUp = true
			elseif blockType:find("lava") ~= nil then
				lib.refuel("up")
				fillUp = true
			end
			--if not turtle.detectUp() and fillUp then
			if fillUp then
				T:fillVoid("up")
			end
			--if not turtle.detectDown() and fillDown then
			if fillDown then
				T:fillVoid("down")
			end
			if i < R.length then 
				T:forward(1)
			end
		end
	end
	
	menu.clear()
	menu.colourPrint("QuickMine rectangle: R.subChoice "..R.width.. " x "..R.length, colors.lightBlue)
	local outbound = true
	
	if turtle.detectDown() then	--assume on floor
		T:up(1)
	end

	if R.subChoice == 3 or R.subChoice == 4 or R.direction == "F1" then
		T:go("F1")
	elseif R.subChoice == 5 or R.direction == "R1F1L1F1" then
		T:go("R1 F1L1 F1")
	end
	
	for w = 1, R.width do
		lib.mine()
		if w < R.width then
			if outbound then
				T:go("R1F1R1")
			else
				T:go("L1F1L1")
			end
			outbound = not outbound
		end
		if T:getFirstEmptySlot() == 0 then
			T:dumpRefuse("forward", 1)
		end
	end
	if outbound then
		T:go("L1F"..R.width - 1 .."L1F"..R.length - 1)
	else
		T:go("R1F"..R.width - 1 .."R1")
	end
	
	return {}
end

function quickMineCorridor()
	--[[
	R.subChoice
	1: At corridor start, on the floor
	2: At corridor start, on the ceiling
	3: On floor, start 1 block ahead
	4: On ceiling, start 1 block ahead
	]]
	
	while turtle.down() do end	-- move to floor level
	if R.subChoice == 3 or R.subChoice == 4 or R.direction == "F1" then
		T:forward(1)
	end
	
	local width = R.width - 1
	local length = R.length - 1
	R.silent = true
	R.length = length
	createCorridor(true) -- put floor and ceiling for R.length, place torch at start
	T:turnRight(1)
	R.length = width
	createCorridor(true)
	T:turnRight(1)
	R.length = length
	createCorridor(true)
	T:turnRight(1)
	R.length = width
	createCorridor(true)
	T:turnRight(1)
	
	return {}
end

function sandFillArea()
	-- clearRectangle with sand drop
	-- could be 1 wide x xx length (trench) up and return
	-- could be 2+ x 2+
	-- even no of runs return after last run
	-- odd no of runs forward, back, forward, reverse and return
	local success = false
	local maxMove = 2
	local directReturn = true
	if R.width % 2 == 1 then
		directReturn = false
	end
	while turtle.detectDown() and maxMove > 0 do	
		T:forward(1)
		maxMove = maxMove - 1
	end
	if R.width == 1 then -- trench ahead, so fill then return
		for i = 1, R.length - 1 do
			success = utils.dropSand()
			T:forward(1, false)
		end
		success = utils.dropSand()
		T:go("R2F"..(R.length - 1).."R2", false, 0, false)
	else --2 or more columns
		if directReturn then -- R.width = 2,4,6,8 etc
			for i = 1, R.width, 2 do -- i = 1,3,5,7 etc
				-- move along R.length, dropping sand
				for j = 1, R.length - 1 do
					success = utils.dropSand()
					T:forward(1, false)
				end
				success = utils.dropSand()
				T:go("R1F1R1") --turn right and return on next column
				for j = 1, R.length - 1 do
					success = utils.dropSand()
					T:forward(1, false)
				end
				success = utils.dropSand()
				if i < R.width - 2 then -- eg R.width = 8, i compares with 6: 1, 3, 5, 7
					T:go("L1F1L1")
				end
			end
			T:go("R1F"..R.width - 1 .."R1") --return home
		else
			for i = 1, R.width, 2 do -- i = 1,3,5,7 etc
				-- move along R.length, dropping sand
				for j = 1, R.length - 1 do
					success = utils.dropSand()
					T:forward(1, false)
				end
				success = utils.dropSand()
				T:go("R1F1R1") --turn right and return on next column
				for j = 1, R.length - 1 do
					success = utils.dropSand()
					T:forward(1, false)
				end
				success = utils.dropSand()
				T:go("L1F1L1")
			end
			-- one more run then return
			for j = 1, R.length - 1 do
				success = utils.dropSand()
				T:forward(1, false)
			end
			success = utils.dropSand()
			T:go("R2F"..R.length.."R1F"..R.width - 1 .."R1")
		end
	end
	return {}
end

function test()
	-- go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
	-- allows testing any new functions.
	-- use tk3 test
	Log:saveToLog("test() started", true)
	menu.clear()
	-- insert code below

	return {"function 'test' executed successfully"}
end

function test2()
	R.upperLevel = 106
	R.lowerLevel = 63
	
	local lib = {}
	
	function lib.addPipe()
		for j = 1, 4 do
			-- go(path, useTorch, torchInterval, leaveExisting, preferredBlock)
			T:go("C1R1", false, 0, true)
		end
	end
	
	function lib.placeKelp()
		T:place("minecraft:kelp", "forward")
		T:up(1)
	end
	
	local drop = 0
	menu.colourPrint("Wait for my return!", colors.yellow)
	R.height = math.abs(R.upperLevel - R.lowerLevel)
Log:saveToLog("createBubbleColumn(): R.height = "..R.height, true)

	local atBedrock = false
	local blockType = T:getBlockType("down")
	for i = 1, R.height do
		if blockType:find("bedrock") == nil then	-- not at bedrock
			T:down(1)
			drop = drop + 1
			lib.addPipe()
			if i == 1 then
				T:placeWater("forward")
			end
			blockType = T:getBlockType("down")
		else 										-- at bedrock
			atBedrock = true
			break
		end
	end
	if atBedrock then
		T:up(1)
		drop = drop - 1
	else
		T:dig("down")
	end
	if not T:place("minecraft:soul_sand", "down") then
		T:place("minecraft:dirt", "down")
	end
	T:go("R2F1R2C2")
	lib.placeKelp()
	T:place("sign", "down", false, "UP!")
	lib.placeKelp()
	T:place("sign", "down", false, "GOING")
	for i = 1, drop - 2 do
		lib.placeKelp()
	end
	while turtle.down() do end	-- on top of signs				
	T:go("F1D1x2 U1B1")			-- break kelp and move over it, down 1, break last piece, return to column
	for i = 1, drop - 2 do
		T:go("U1C2")
	end
	
	return {"Bubble column completed "..drop.. " blocks"}
end

function undermineDragonTowers()
	--[[
	        -13, -40....12, -40						NNW (4)   	NNE (5)
			
	    -34, -25............33, -25				NWW	(2)				NEE (9)
		
	-42, -1....................42, 0		W (1)						E (8)
	
	     -34, 24............33,24				SWW	(3)				SEE (10)
		 
		      -13,39....12, 39						SSW	(7)		SSE (6)
	
	North towers centres 25 blocks apart, 40 blocks north of axis
	Mid-North towers 67 blocks apart, 25 blocks north of axis
	W-E centres 84 blocks apart, on 0 axis
	Mid-south towers 67 blocks apart, 24 blocks south of axis
	South towers centres 25 blocks apart, 39 blocks south of axis
	]]
	
	local lib = {}
	function lib.findNextTower(maxDistance, withMarker)
		local distance = 0
		local blockTypeF = T:getBlockType("forward")
		local blockTypeD = T:getBlockType("down")
		for i = 1, maxDistance do
			if blockTypeF ~= "minecraft:obsidian" and blockTypeD ~= "minecraft:obsidian" then -- not in a tower
				if withMarker and blockTypeD ~= "minecraft:obsidian" then -- used to mark 0 coordinate
					T:place("cobble", "down", false) -- place cobblestone or cobbled deepslate to mark zero coordinate
				end
			else	-- obsidian found, could still be in an earlier tower
				if i > 10 then
					break
				end
			end
			T:go("F1x0")
			distance = distance + 1
			blockTypeF = T:getBlockType("forward")
			blockTypeD = T:getBlockType("down")
		end
		if distance == maxDistance then -- obsidian not found ? wrong place/ direction
			print("Obsidian not found")
			error()
		end
		-- will now be at side of a tower
		lib.findCentre() -- move into tower to find the other side
		return distance
	end
	
	function lib.findCentre()
		local width = 0
		-- while obsidian in front or below (previously entered tower) measure width and return to centre
		local blockTypeF = T:getBlockType("forward")
		local blockTypeD = T:getBlockType("down")
		while blockTypeF == "minecraft:obsidian" or blockTypeD == "minecraft:obsidian" do
			T:go("F1x0")
			width = width + 1
			blockTypeF = T:getBlockType("forward")
			blockTypeD = T:getBlockType("down")
		end
		-- will always go outside the tower 1 block. width of 5 block tower = 6
		T:go("R2F"..math.ceil(width / 2)) --return to centre of tower
		T:turnLeft(1) -- now find another edge of the tower, dig forward until out of obsidian
		for i = 1, math.ceil(width) do  -- give additional loops if missed centre
			blockTypeF = T:getBlockType("forward")
			blockTypeD = T:getBlockType("down")
			if blockTypeF == "minecraft:obsidian" or blockTypeD == "minecraft:obsidian" then
				T:go("F1x0")
			else
				break
			end
		end
		-- now outside different edge of the tower
		-- reverse and move width/2, dig up + 1 to mark centre, face original direction
		T:go("L2F"..math.ceil(width / 2).."R1U2x1")
		T:place("minecraft:end_stone", "forward", false) -- place endstone to mark facing direction
		T:down(2)
	end
	
	function lib.findPath(maxLength)
		local blockTypeD = T:getBlockType("down")
		local distance = 0
		while blockTypeD:find("cobble") == nil and distance < maxLength do
			T:go("F1x0")							-- return to 0 axis, 
			distance = distance + 1
			blockTypeD = T:getBlockType("down")
		end
		return distance
	end
	
	-- start at 0,y,0, facing West
	T:dig("up")									-- in case not already done
	local maxLength = 0
	local blockTypeD
	local distance = lib.findNextTower(45, true)-- find W tower (1) and mark trail with cobble
	T:turnRight(2)						
	for i = 1, 8 do								-- head back East 8 blocks, turn left (facing north)
		T:go("F1x0")							-- this path may be off-axis, so dig double height
	end
	T:turnLeft(1)
	lib.findNextTower(30)						-- find NWW tower (2)
	T:turnRight(2)
	distance = lib.findPath(30)
	distance = distance + lib.findNextTower(30)	-- find SWW tower (3)
	T:turnRight(2)
	distance = lib.findPath(30)
	T:turnRight(1) 								-- should be on cobble path
	for i = 1, 21 do							-- move East 21 blocks, turn left facing North
		T:go("F1x0")
	end
	T:turnLeft(1)
	
	distance = lib.findNextTower(45)		-- find NNW tower (4)
	T:turnRight(1)							
	distance = lib.findNextTower(30)		-- find NNE tower (5)
	T:turnRight(1)
	distance = lib.findNextTower(85)		-- find SSE tower (6)
	T:turnRight(1)

	distance = lib.findNextTower(30)		-- find SSW tower (7)
	T:turnRight(1)
	distance = lib.findPath(40)				-- head North to 0 axis
	T:go("R1F13") 							-- return to 0,0 facing East
	distance = lib.findNextTower(45, true)	-- find E tower (8)
	
	T:turnRight(2)						
	for i = 1, 9 do
		T:go("F1x0")						-- this path may be off-axis, so dig double height
	end
	T:turnRight(1)
	
	distance = lib.findNextTower(30)		-- find NEE tower (9)
	T:turnRight(2)
	distance = lib.findPath(30) -- return to 0 axis
	distance = lib.findNextTower(30)		-- find SEE tower (10)
	T:turnRight(2)
	distance = lib.findPath(30) 			-- return to 0 axis
	T:go("L1F33")							-- return to 0, 0
	
	return {}
end

function updateLists()
	U.updateList("barrel")
	U.updateList("chest")
	return {"lists: U.chestItems / U.barrelItems updated"}
end

function upgradeFarmland()
	local essences = {":inferium", ":prudentium", ":tertium", ":imperium", ":supremium", ":awakened" , ":insanium"}
	
	local lib = {}
	
	function lib.isHigherTeir(essence, farmLand)
		-- eg "ma:prudentium_essence", "mc:farmland"
		local teir = 0
		for index = 1, #essences do
			if farmLand:find(essences[index]) ~= nil then
				teir = index	-- 0 if vanilla, else eg 2 for prudentium
				break
			end 
		end
		for index = 1, #essences do
			if essence:find(essences[index]) ~= nil then
				if index > teir then
					return true
				end
			end 
		end
		return false
	end
	
	function lib.upgrade(essence, slot)
		-- essence is the slot no of any essence
		turtle.select(slot)
		local blockType = T:getBlockType("up")
		if blockType:find("farmland") ~= nil then			-- farmland found (vanilla or modded)
			if lib.isHigherTeir(essence, blockType) then	-- eg "ma:inferium", mc:farmland"
				turtle.placeUp()
			end
		end
	end
	-- check if any essence still onboard
	T:checkInventoryForItem({"essence"}, {95}, false)
	-- return slotData.lastSlot, total, slotData -- integer, integer, table
	local name = ""
	local slot, amount, data = T:getItemSlot("essence")
	name = data.mostName or ""
	local empty = T:getFirstEmptySlot()
	
	if slot > 0 then
		T:go("D2")
		local outward = true
		for w = 1, 10 do
			for i = 1, 9 do
				if turtle.getItemCount(slot) == 0 then
					slot, amount, data = T:getItemSlot("essence")
					name = data.mostName or ""
					if slot == 0 then
						slot = empty
					end
				end
				lib.upgrade(name, slot)
				if w == 1 and i == 1 then
					T:go("F1R2 C1R2")
				elseif w == 10 and i == 1 then
					
				else
					T:forward(1)
				end
			end
			if outward then
				lib.upgrade(name, slot)
				if w == 1 then
					T:go("L1F1 L2C1 R1")
				elseif w == 9 then
					T:go("L1F1 L1F1 L2C1 L2")
				else
					T:go("L1F1L1")
				end
			else
				if w < 10 then
					lib.upgrade(name, slot)
					T:go("R1F1R1")
				else
					T:go("L1F1 L2C1 R2F8 L1U1 C2U2") -- 1 above normal position
				end
			end
			outward = not outward
		end
		-- sometimes original essence pops out of the ground when upgraded, so rescue it
		for w = 1, 10 do
			for i = 1, 9 do
				turtle.suckDown()
				turtle.suck()
				T:forward(1)
			end
			if outward then
				turtle.suckDown()
				turtle.suck()
				T:go("L1F1L1")
			else
				if w < 10 then
					turtle.suckDown()
					turtle.suck()
					T:go("R1F1R1")
				else
					T:go("L1F9 L1D1") -- normal position
				end
			end
			outward = not outward
		end
	end
	return ({"Farmland Upgraded"})
end

local function sceneLoader()
--Log:saveToLog("sceneLoader() started")
	T:clear()										-- clear terminal, reset cursor to 1,1 and reset colours
	--local message = U.loadStorageLists()			-- initialises or creates lists of where an item can be found: GLOBAL LISTS!
	--local message = U.wrapModem()	-- initialises or creates lists of where an item can be found: GLOBAL LISTS!
	--if message ~= "" then return {message} end
	-- essential libraries:
	local Event 	= require("lib.Events")
	local SM 		= require("lib.SceneMgr")
	_G.events 		= Event(false)					-- global variable: self.handlers = {}
--Log:saveToLog("Loading all scenes")
	--sm = SM("scenes", {"MainMenu", "Menu", "SetupStorage", "SelectItems", "Craft", "ManageTurtle", "TaskOptions", "GetItems", "Quit", "Help"})
	_G.sm = SM("scenes", {"MainMenu", "TaskOptions", "GetItems", "Quit", "Help"}) -- SM:new(sceneDir, scenes)
	sm:getSceneByName("Quit"):setText("tk3 Toolkit Closing...")
	U.populateAllItems()							-- create a table of displayNames of all items for use in search functions
--Log:saveToLog("Switching to MainMenu")
	sm:switch("MainMenu")

	while true do	-- gameLoop
		if U.executeTask then
--Log:saveToLog("sceneLoader exiting with '"..U.currentTask.."'")
--Log:saveToLog("R settings = "..textutils.serialise(U.compareR(), {compact = true}))
			local description = F[U.currentTask].description
			if description ~= nil then
				-- check for insertion of variables
				if description:find("$") ~= nil then
					local words = U.split(description, "$")
					description = ""
					for _, word in ipairs(words) do
						if word:find("R.") == nil then
							description = description..word
						else
							if word:find("%(") == nil then
								local key = word:sub(3)
								Log:saveToLog("key = "..key)
								description = description..tostring(R[key])
							else
								local expression = U.parseExpression(word, "tk3.sceneLoader()")
								description = description..tostring(expression)
							end
--Log:saveToLog("description = "..description)
						end
					end
				end
				menu.clear()
				menu.colourText(description)
			end
			local fuel = F[U.currentTask].fuel
			if fuel ~= nil then
				fuel = U.parseExpression(fuel, "tk3.sceneLoader()")
--Log:saveToLog("fuel = "..fuel)
				utils.checkFuelNeeded(fuel)
			end
			return {U.currentTask}
		end
		local sceneName = sm:getCurrentSceneName()
		local inputData = nil
		if sceneName == "Quit" then
			-- fade out then quit. No user input required
			for i = 1, 3 do
				sleep(1)
				sm:update()
				sm:draw()
			end
			T:clear()
			return {"GUI toolkit completed"}
		elseif sceneName == "GetItems" then
			-- U.getInput(withTimer, interval, withInventory)
			inputData = U.getInput(false, 3, true) -- get inventory data
			-- inputData = {"turtle_inventory"}
			-- inputData = {"key", keyCode, is_held} 
			-- inputData = "mouse_click", button = 1, x = 4, y = 4
			--Log:saveToLog("sceneLoader() inputData = "..textutils.serialise(inputData, {compact = true}))
			sm:update(inputData)
			sm:draw()
		else
			inputData = U.getInput(false)	-- U.getInput(withTimer, interval, withInventory)
			sm:update(inputData)
			sm:draw()
		end
	end
	return {"GUI toolkit exited unexpectedly"}
end

local function main()
	local result = {}
	T:clear()
	local doContinue = false
	if args[1] ~= nil then
		if args[1]:sub(1,1) == "h" then
			local help =
[[... = any following characters

tk3 v...     = mc/ccTweaked versions
tk3 log      = enable logging
tk3 log d... = enable logging + debug
tk3 find     = writes locate.txt 
tk3 test     = runs test()
tk3 farm     = runs manageFarm()



Enter to exit]]
			menu.colourPrint(help, colours.yellow)
			read()
		elseif args[1] == "attack" then
			R.auto = true
			if args[2] == nil then
				attack()
			else
				if args[2]:find("u") ~= nil then
					attack("up")
				elseif args[2]:find("f") ~= nil then
					attack("forward")
				elseif args[2]:find("d") ~= nil then
					attack("down")
				end
			end
		elseif args[1] == "log" then
			if args[2] ~= nil then
				if args[2]:sub(1,1) == "d" then
					dbug = true	-- set dbug flag
					menu.colourPrint("Logging and debugging enabled", colors.lime)
				end
			else
				menu.colourPrint("Logging enabled", colors.lime)
			end
			if Log:getLogExists() then
				if menu.getBoolean("Delete existing log file? (y/n)", 3, colors.orange) then
					Log:deleteLog()
					menu.colourPrint("Log file deleted", colors.yellow)
				end
			end
			Log:setUseLog(true)
			doContinue = true
			utils.waitForInput()
		elseif args[1] == "farm" then
			R.silent = true
			R.data = "farm"
			R.auto = true
			manageFarm()
		elseif args[1] == "composter" then
			R.silent = true
			composter() -- use file to read status
		elseif args[1] == "find" then
			-- missing turtle: player used 'tk3 find'
			Log:setUseLog(true)
			Log:setLogFileName("locate.txt")
			Log:appendLine("Booting succeeded")
			Log:appendLine("Block ahead: "..T:getBlockType("forward"))
			Log:appendLine("Block above: "..T:getBlockType("up"))
			Log:appendLine("Block below: "..T:getBlockType("down"))
		elseif args[1] == "test" then
			test()
		elseif args[1] == "test2" then
			test2()
		elseif args[1]:find("v") ~= nil then
			print("_HOST:")
			print()
			print(_HOST)
			print()
			print("Minecraft major version: "..mcMajorVersion)
			print("Minecraft minor version: "..mcMinorVersion)
			print("ccTweaked major version: "..ccMajorVersion)
			print("ccTweaked minor version: "..ccMinorVersion)
			print("tk3 version:             "..version)
			print("\nEnter to exit")
			read()
		end
	else
		doContinue = true
	end
	if doContinue then
		print("Minecraft major version: "..mcMajorVersion)
		print("Bedrock level: "..U.bedrock)
		if Log:getUseLog() then
			if Log:saveToLog("Started with logging enabled", true) then
				--menu.colourPrint("\nEnter to continue...", colors.lightBlue)
				--sleep(2)
				--read()
			end
		else
			print("Logging disabled")
		end	
		sleep(1)
		--T:setEquipment()	-- forces equipped items into inventory and back again (bug in fabric version)
		
		U.currentTask = ""
		U.copyR()	-- copy current values of R
		result = sceneLoader() -- eg {"createMine"}
		--if fList[result[1]] ~= nil then
		if F[result[1]] ~= nil then
			local task = result[1]		-- eg {"createMine"}
			Log:saveToLog("tk3.main() task = "..task.."()")
utils.logRvalues()
			result = F[task].call()		-- eg createMine()
		end
	end
	T:clear()
	table.insert(result, "Thank you for using 'survival toolkit'")
	local clr = {colors.yellow, colors.orange, colors.green, colors.lightBlue}
	local count = 1
	for _, value in ipairs(result) do
		menu.colourPrint(tostring(value), clr[count])
		count = count + 1
		if count > #clr then
			count = 1
		end
	end
end 

_G.F = require("lib.data.taskInventory")	-- has to be placed after all function definitions
-- Note checkFileSystem() runs BEFORE main()
main()
