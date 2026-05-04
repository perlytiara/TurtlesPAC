local version = 20260121.0800
local Scene 		= require("lib.Scene")
local Button 		= require("lib.ui.Button")
local MultiButton 	= require("lib.ui.MultiButton")
local Label 		= require("lib.ui.Label")
local S 			= Scene:derive("MainMenu")
local help 			= require("lib.help")
-- computers are 51 x 19, turtles are 39 x 13
local WIDTH, HEIGHT = term.getSize()-- 51 x 19 computer terminal

local function createButtons(names, fromDB, defaultCaption)
	local buttons = {}
	for index = 1, #names do
		if fromDB then
			local key = names[index]
--Log:saveToLog("index = "..index..", names[index] (key) = "..key)
			local title = F[key].title	-- eg F["createLadder"].title = "Ladder up or down"
			table.insert(buttons, {{key, title}})
			--[[
			buttons =
			{
				{{"createLadder", "Ladder up or down"}},
				{{"createStaircase", "Stairs up or down"}}
			}
			]]
		else
			if defaultCaption ~= nil then
				table.insert(buttons, {{names[index], defaultCaption}})	-- eg: {{"1","?"}, {"2","?"}, {"3","?"}}
			else
				table.insert(buttons, {{names[index], names[index]}})	-- eg: {{"Mining (includes Nether)","Mining (includes Nether)"}, ...}
			end
		end
	end 
	return buttons
end

local function createSizes(names, w, h)
	local sizes = {}
	for index = 1, #names do
		table.insert(sizes, {w, h})
	end 
	return sizes
end

function S:new(sceneMgr)
	S.super.new(self, sceneMgr)
	self.name = "MainMenu"
	--[[
		both main menu and sub-menu have a 'help' button option
		sub-menu also has 'items' option to preview items required
		user clicks on main menu buttons eg "Mining (includes Nether)" to select  a sub-menu
		user selects a sub-menu for specific action eg "Ladder up or down"
		This usually moves to selecting options for the task eg height, width, length etc.
		Next step is inventory items
		Some tasks may move straight to getting required inventory items
		Final step is to save the name of the required function to U.currentTask eg "createMine"
		Exit GUI and execute task from tk3 sceneLoader()
	]]
	-- ===============help buttons==================
	local mmHelp = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"}
	local mmHelpStyles = 
	{
		[mmHelp[1]]	 = {colors.yellow,  colors.lightGray},
		[mmHelp[2]]	 = {colors.yellow,  colors.gray},
		[mmHelp[3]]	 = {colors.yellow,  colors.lightGray},
		[mmHelp[4]]	 = {colors.yellow,  colors.gray},
		[mmHelp[5]]	 = {colors.yellow,  colors.lightGray},
		[mmHelp[6]]	 = {colors.yellow,  colors.gray},
		[mmHelp[7]]	 = {colors.yellow,  colors.lightGray},
		[mmHelp[8]]	 = {colors.yellow,  colors.gray},
		[mmHelp[9]]	 = {colors.yellow,  colors.lightGray},
		[mmHelp[10]] = {colors.yellow,  colors.gray},
		[mmHelp[11]] = {colors.yellow,  colors.lightGray},
	}
	local mmHelpSizes = createSizes(mmHelp, 1, 1)	-- {{1,1},{1,1},{1,1}...}
	local mmHelpButtons = createButtons(mmHelp, false, "?")
--Log:saveToLog("mmHelp = "..textutils.serialise(mmHelp, {compact = true}))
--Log:saveToLog("mmHelpStyles = "..textutils.serialise(mmHelpStyles, {compact = true}))
--Log:saveToLog("mmHelpSizes = "..textutils.serialise(mmHelpSizes, {compact = true}))
--Log:saveToLog("mmHelpButtons = "..textutils.serialise(mmHelpButtons, {compact = true}))
	--====================items buttons=======================
	local mmItem = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"}
	local mmItemStyles = 
	{
		[mmItem[1]]	 = {colors.lightGray,  colors.gray},
		[mmItem[2]]	 = {colors.gray,  colors.lightGray},
		[mmItem[3]]	 = {colors.lightGray,  colors.gray},
		[mmItem[4]]	 = {colors.gray,  colors.lightGray},
		[mmItem[5]]	 = {colors.lightGray,  colors.gray},
		[mmItem[6]]	 = {colors.gray,  colors.lightGray},
		[mmItem[7]]	 = {colors.lightGray,  colors.gray},
		[mmItem[8]]	 = {colors.gray,  colors.lightGray},
		[mmItem[9]]	 = {colors.lightGray,  colors.gray},
		[mmItem[10]] = {colors.gray,  colors.lightGray},
		[mmItem[11]] = {colors.lightGray,  colors.gray},
	}
	local mmItemSizes = createSizes(mmItem, 5, 1)
	local mmItemButtons = createButtons(mmItem, false, "Items")

	-- following tables are menu text for main menu (mm) and sub-menus (m1. m2 etc)
	-- =====================main menu buttons======================
		local mm = 
	{
		{{"mbMining",    "01-Mining (all dimensions)"}},
		{{"mbForestry",  "02-Forestry"}},
		{{"mbFarming",   "03-Farming"}},
		{{"mbObsidian",  "04-Obsidian, Nether & End"}},
		{{"mbCanal",     "05-Canal, bridge & walkway"}},
		{{"mbSpawner",   "06-Spawner farm tools"}},
		{{"mbArea",      "07-Area shaping & clearing"}},
		{{"mbWater",     "08-Lava and Water"}},
		{{"mbBuilding",  "09-Building and minecart"}},
		{{"mbMeasuring", "10-Measuring tools"}},
		{{"mbNetwork",   "11-Network Tools"}},
	}			
--Log:saveToLog("mm[1][1] = "..textutils.serialise(mm[1], {compact = true}))
--Log:saveToLog("mm[1][1][1] = "..mm[1][1][1])
	local mmStyles = 
	{
		--[mm[1][1][1]]]	= {colors.white,  colors.gray},
		--[mm[2][1][1]]]	= {colors.white,  colors.lightGray},
		["mbMining"]	= {colors.white, colors.gray},
		["mbForestry"]  = {colors.black, colors.green},
		["mbFarming"]  	= {colors.black, colors.lime},
		["mbObsidian"]  = {colors.white, colors.red},
		["mbCanal"]  	= {colors.black, colors.orange},
		["mbSpawner"]  	= {colors.white, colors.gray},
		["mbArea"]  	= {colors.black, colors.yellow},
		["mbWater"]  	= {colors.white, colors.blue},
		["mbBuilding"]  = {colors.black, colors.cyan},
		["mbMeasuring"] = {colors.white, colors.gray},
		["mbNetwork"] 	= {colors.black, colors.pink},
	}
	--local mmSizes = createSizes(mm, WIDTH - 1, 1)	-- size (w, h) of each individual button
	local mmSizes = {{WIDTH - 1, 1}, {WIDTH - 1, 1}, {WIDTH - 1, 1}, {WIDTH - 1, 1}, {WIDTH - 1, 1}, {WIDTH - 1, 1},
					{WIDTH - 1, 1}, {WIDTH - 1, 1}, {WIDTH - 1, 1}, {WIDTH - 1, 1}, {WIDTH - 1, 1}}
	--local mmButtons = mm
	-- =============other buttons===============
	-- uses the function names as keys. buttons created by getting button title from taskInventory database
	local m1 = {"createLadder", "createStaircase", "createMine",
				"createSafeDrop", "createBubbleLift", "quickMineCorridor",
				"quickMine", "mineBedrockArea", "clearMineshaft"}
	self.m1 = m1
	local m1Styles = 
	{
		[m1[1]] = {colors.white, colors.brown}, 	-- Ladder up or down
		[m1[2]] = {colors.white, colors.gray}, 		-- Stairs up or down
		[m1[3]] = {colors.black, colors.lightGray}, -- Create mine at this level
		[m1[4]] = {colors.white, colors.blue}, 		-- Safe drop to water block
		[m1[5]] = {colors.black, colors.cyan}, 		-- Single column bubble lift
		[m1[6]] = {colors.black, colors.magenta}, 	-- QuickMine corridor system
		[m1[7]] = {colors.black, colors.pink}, 		-- QuickMine rectangle
		[m1[8]] = {colors.white, colors.gray}, 		-- Mine bedrock level
		[m1[9]] = {colors.white, colors.brown} 		-- Rob disused mineshaft
	}
	local m1Sizes = createSizes(m1, WIDTH - 6, 1)
	local m1Buttons = createButtons(m1, true, nil)
			
	local m2 = {"fellTree", "createTreefarm", "plantTreefarm",
				"harvestTreeFarm", "createEnclosure", "clearAndReplantTrees","convertTreefarm"}
	self.m2 = m2
	local m2Styles = 
	{
		[m2[1]] = {colors.white, colors.brown}, 	-- Fell Tree
		[m2[2]] = {colors.black, colors.lightGray}, -- Create tree farm
		[m2[3]] = {colors.black, colors.lime}, 		-- Plant tree farm
		[m2[4]] = {colors.black, colors.green}, 	-- Harvest tree farm
		[m2[5]] = {colors.white, colors.brown}, 	-- Fence or wall an enclosure
		[m2[6]] = {colors.black, colors.lime}, 		-- Harvest and replant forest
		[m2[7]] = {colors.white, colors.gray} 		-- Convert Tree farm
	}
	local m2Sizes = createSizes(m2, WIDTH - 6, 1)
	local m2Buttons = createButtons(m2, true, nil)
					
	local m3 = {"createFarm", "createFarmExtension", "manageFarmSetup", "createFence", "createEnclosure", "convertFarm", "upgradeFarmland", "createClayfarm", "makeMud" }			
	self.m3 = m3
	local m3Styles = 
	{
		[m3[1]] = {colors.black, colors.yellow}, 	-- Create modular crop farm
		[m3[2]] = {colors.black, colors.green}, 	-- Extend modular crop farm
		[m3[3]] = {colors.black, colors.lime}, 		-- Manage modular crop farm
		[m3[4]] = {colors.white, colors.orange}, 	-- Build single wall or fence
		[m3[5]] = {colors.white, colors.brown}, 	-- Build wall or fence enclosure
		[m3[6]] = {colors.white, colors.gray}, 		-- Convert farm
		[m3[7]] = {colors.black, colors.magenta}, 	-- Mystical Agriculture convert essence
		[m3[8]] = {colors.white, colors.brown}, 	-- Create clay farm
		[m3[9]] = {colors.black, colors.gray} 		-- Make mud or clay
	}
	local m3Sizes = createSizes(m3, WIDTH - 6, 1)
	local m3Buttons = createButtons(m3, true)
					
	local m4 = {"lavaRefuel", "harvestObsidian", "createPortal", "demolishPortal",
				"createStripMine", "undermineDragonTowers", "deactivateDragonTower",
				"createDragonTrap", "attack","createPortalPlatform", "harvestShulkers"}
	self.m4 = m4
	local m4Styles = 
	{
		[m4[1]] = {colors.black, colors.red}, 		-- lavaRefuel
		[m4[2]] = {colors.black, colors.lightGray}, -- Dig obsidian field
		[m4[3]] = {colors.black, colors.purple}, 	-- Build Nether Portal
		[m4[4]] = {colors.white, colors.gray}, 		-- Demolish Nether Portal
		[m4[5]] = {colors.black, colors.red},		-- Netherite stripping
		[m4[6]] = {colors.black, colors.orange}, 	-- Undermine Dragon Towers
		[m4[7]] = {colors.black, colors.yellow}, 	-- Deactivate Dragon Tower
		[m4[8]] = {colors.white, colors.blue}, 		-- Build dragon water trap
		[m4[9]] = {colors.white, colors.purple}, 	-- restart attack
		[m4[10]] = {colors.black, colors.lightGray},-- Build portal minecart station
		[m4[11]] = {colors.black, colors.red}		-- Shulker harvesting
	}
	local m4Sizes = createSizes(m4, WIDTH - 6, 1)
	local m4Buttons = createButtons(m4, true)

	local m5 = {"createPath", "createCorridor", "createWaterCanal", "createIceCanal",
				"createPlatform", "createSinkingPlatform", "createBoatLift", "createDiveColumn"}
	self.m5 = m5
	local m5Styles = 
	{
		[m5[1]] = {colors.black, colors.lightGray}, -- Continuous path
		[m5[2]] = {colors.white, colors.gray}, 		-- Covered walkway / tunnel
		[m5[3]] = {colors.white, colors.blue}, 		-- Water canal
		[m5[4]] = {colors.black, colors.lightBlue}, -- Ice canal (4 options)
		[m5[5]] = {colors.white, colors.brown}, 	-- Platform
		[m5[6]] = {colors.white, colors.blue}, 		-- Sinking platform for oceans
		[m5[7]] = {colors.black, colors.cyan}, 		-- Boat bubble lift
		[m5[8]] = {colors.black, colors.blue} 		-- Dive Column
	}
	local m5Sizes = createSizes(m5, WIDTH - 6, 1)
	local m5Buttons = createButtons(m5, true)
	
	local m6 = {"createMobFarmCube", "floodMobFarm", "createMobBubbleLift",
				"createMobFarmCubeBlaze", "createBlazeGrinder", "createTrialCover", "attack"}
	self.m6 = m6
	local m6Styles = 
	{
		[m6[1]] = {colors.white, colors.gray}, 		-- Cube around spawner (NOT blaze)
		[m6[2]] = {colors.white, colors.blue}, 		-- Flood mob farm floor
		[m6[3]] = {colors.black, colors.cyan}, 		-- Create mob bubble lift
		[m6[4]] = {colors.black, colors.red}, 		-- Cube around Blaze spawner
		[m6[5]] = {colors.black, colors.magenta},	-- createBlazeGrinder
		[m6[6]] = {colors.black, colors.orange},	-- Surround trial spawner
		[m6[7]] = {colors.black, colors.red}		-- Attack
	}
	local m6Sizes = createSizes(m6, WIDTH - 6, 1)
	local m6Buttons = createButtons(m6, true)
					
	local m7 = {"clearArea", "clearRectangle", "clearWall",
				"clearPerimeter", "clearBuilding",
				"clearSolid", "digTrench", "clearMountainSide",
				"createFloorCeiling", "createDirectedPath"}
	self.m7 = m7
	local m7Styles = 
	{
		[m7[1]] = {colors.black, colors.lime}, 		-- Clear field (inc trees)
		[m7[2]] = {colors.black, colors.magenta}, 	-- Clear a rectangle (+ u/d opt)
		[m7[3]] = {colors.black, colors.pink}, 		-- Clear single wall up/down
		[m7[5]] = {colors.black, colors.purple}, 	-- Clear rectangular wall section
		[m7[5]] = {colors.white, colors.brown}, 	-- Clear hollow structure up/down
		[m7[6]] = {colors.black, colors.orange}, 	-- Clear solid structure up/down
		[m7[7]] = {colors.white, colors.brown}, 	-- Dig a trench
		[m7[8]] = {colors.white, colors.gray}, 		-- Carve mountain side
		[m7[9]] = {colors.black, colors.lightBlue}, -- Place a floor or ceiling
		[m7[10]] = {colors.white, colors.red} 		-- Direct control of movement
	}
	local m7Sizes = createSizes(m7, WIDTH - 6, 1)
	local m7Buttons = createButtons(m7, true)
					
	local m8 = {"createSandWall", "clearSandWall", "sandFillArea", "clearSandCube", "createRetainingWall",
				"drainWaterLava", "oceanMonumentColumns","clearWaterPlants",
				"createLadderToWater", "floodArea", "createSlopingWater"}
	self.m8 = m8
	local m8Styles = 
	{
		[m8[1]] = {colors.black, colors.yellow}, 	-- Vertical sand wall from surface
		[m8[2]] = {colors.yellow, colors.black}, 	-- Create enclosed area of sand
		[m8[3]] = {colors.black, colors.yellow}, 	-- Remove sand wall
		[m8[4]] = {colors.yellow, colors.black}, 	-- Clear volume of sand
		[m8[5]] = {colors.black, colors.lightGray},	-- create retaining wall
		[m8[6]] = {colors.white, colors.blue}, 		-- Clear volume of water or lava
		[m8[7]] = {colors.black, colors.white}, 	-- Ocean monument corner columns
		[m8[8]] = {colors.black, colors.lime}, 		-- Clear water plants
		[m8[9]] = {colors.black, colors.lightBlue}, -- Ladder down to water/lava
		[m8[10]] = {colors.white, colors.blue}, 	-- Convert all water to source
		[m8[11]] = {colors.white, colors.cyan} 		-- Create sloping water
	}
	local m8Sizes = createSizes(m8, WIDTH - 6, 1)
	local m8Buttons = createButtons(m8, true)
				
	local m9 = {"buildWall", "buildStructure", "buildGableRoof",
				"buildPitchedRoof", "createRailway", "placeRedstoneTorch"}
	self.m9 = m9
	local m9Styles = 
	{
		[m9[1]] = {colors.black, colors.yellow},	-- build a wall
		[m9[2]] = {colors.black, colors.orange},	-- build rectangular structure
		[m9[3]] = {colors.black, colors.lightGray},	-- gable end roof
		[m9[4]] = {colors.white, colors.gray},		-- pitched roof
		[m9[5]] = {colors.white, colors.brown}, 	-- Build track up / down
		[m9[6]] = {colors.white, colors.red}, 		-- Place Redstone:torch level track
	}
	local m9Sizes = createSizes(m9, WIDTH - 6, 1)
	local m9Buttons = createButtons(m9, true)
		
	local m10 = {"measureHeight", "measureDepth", "measureLength", "measureDeepest", "createBorehole"}
	self.m10 = m10
	local m10Styles = 
	{
		[m10[1]] = {colors.black, colors.red}, 		-- Measure height
		[m10[2]] = {colors.black, colors.purple}, 	-- Measure depth
		[m10[3]] = {colors.black, colors.magenta}, 	-- Measure length
		[m10[4]] = {colors.black, colors.pink}, 	-- Measure greatest depth
		[m10[5]] = {colors.black, colors.lightBlue}	-- Borehole: Analyse blocks below
	}
	local m10Sizes = createSizes(m10, WIDTH - 6, 1)
	local m10Buttons = createButtons(m10, true)
	
	local m11 = {"craftItem", "updateLists"}
	self.m11 = m11
	local m11Styles = 
	{
		[m11[1]] = {colors.white, colors.brown}, 	-- Craft item
		[m11[2]] = {colors.black, colors.yellow},	-- update lists
	}
	local m11Sizes = createSizes(m11, WIDTH - 6, 1)
	local m11Buttons = 
	{
		{{"craft", "01-Craft an Item"}},
		{{"updateLists", "02-Update Network Storage Database"}}
	}
	self.mm = mm
	-- set the colours of the main menu buttons
	
	self.subMenuList =
	{
		[mm[1]]  = "mbMining",
		[mm[2]]  = "mbForestry",
		[mm[3]]  = "mbFarming",
		[mm[4]]  = "mbObsidian",
		[mm[5]]  = "mbCanal",
		[mm[6]]  = "mbSpawner",
		[mm[7]]  = "mbArea",
		[mm[8]]  = "mbWater",
		[mm[9]]  = "mbBuilding",
		[mm[10]] = "mbMeasuring",
		[mm[11]] = "mbNetwork"
	}

	--self.subMenuList = {}
	--for i = 1, #self.mm do
		--self.subMenuList[mm[i]]  = self.mm[i]
	--end	
	self.infoText = {"Type number -> Enter or q(uit)"}
	-- MB:new(name, x, y, w, h, text, fg, bg, alignH, alignV, buttons, sizes, styles, activeFG, activeBG)	
	self.btnQuit  = Button("btnQuit", 1, 1, 6, 1, "Quit", colors.lime, colors.lightGray, "centre", "centre", 0, "q", self.name)
	self.btnBack  = Button("btnBack", 1, 1, 6, 1, "Back", colors.lime, colors.gray, "centre", "centre", 0, "b", self.name)
	self.lblTitle = Label("lblTitle", 7,  1, WIDTH - 12, 1, "Main Menu", colors.lime, colors.black, "centre", "centre")
	self.lblInfo  = Label("lblInfo", 1,  13, WIDTH, 1, self.infoText[1], colors.lime, colors.black, "left", "centre")
	
	self.mbHelp   = MultiButton("mbHelp", 39, 2, 2, 11, "", colors.black, colors.yellow,
								"centre", "centre", mmHelpButtons, mmHelpSizes, mmHelpStyles, colors.yellow, colors.black)
	
	self.mbItems  = MultiButton("mbItems", 34, 2, 5, 12, "", colors.white, colors.brown,
								"centre", "centre", mmItemButtons, mmItemSizes, mmItemStyles, colors.brown, colors.white)
								
	self.mbMain   = MultiButton("mbMain", 1, 2, WIDTH - 1, 11, "", colors.white, colors.black,
								"centre", "centre", mm, mmSizes, mmStyles, colors.white, colors.gray)
	
	--self.mbMining = MultiButton(self.subMenuList[mm[1]], 1, 2, WIDTH - 6, #m1, "", colors.white, colors.black,
	self.mbMining = MultiButton(mm[1][1][1], 1, 2, WIDTH - 6, #m1, "", colors.white, colors.black,
								"right", "centre", m1Buttons, m1Sizes, m1Styles, m1Styles[m1[1]][1], m1Styles[m1[1]][2])
								
	self.mbForestry = MultiButton(mm[2][1][1], 1, 2, WIDTH - 6, #m2, "", colors.white, colors.black,
								"right", "centre", m2Buttons, m2Sizes, m2Styles, m2Styles[m2[1]][1], m2Styles[m2[1]][2])
								
	self.mbFarming = MultiButton(mm[3][1][1], 1, 2, WIDTH - 6, #m3, "", colors.white, colors.black,
								"right", "centre", m3Buttons, m3Sizes, m3Styles, m3Styles[m3[1]][1], m3Styles[m3[1]][2])
								
	self.mbObsidian = MultiButton(mm[4][1][1], 1, 2, WIDTH - 6, #m4, "", colors.white, colors.black,
								"right", "centre", m4Buttons, m4Sizes, m4Styles, m4Styles[m4[1]][1], m4Styles[m4[1]][2])
								
	self.mbCanal = MultiButton(mm[5][1][1], 1, 2, WIDTH - 6, #m5, "", colors.white, colors.black,
								"right", "centre", m5Buttons, m5Sizes, m5Styles, m5Styles[m5[1]][1], m5Styles[m5[1]][2])
								
	self.mbSpawner = MultiButton(mm[6][1][1], 1, 2, WIDTH - 6, #m6, "", colors.white, colors.black,
								"right", "centre", m6Buttons, m6Sizes, m6Styles, m6Styles[m6[1]][1], m6Styles[m6[1]][2])
								
	self.mbArea = MultiButton(mm[7][1][1], 1, 2, WIDTH - 6, #m7, "", colors.white, colors.black,
								"right", "centre", m7Buttons, m7Sizes, m7Styles, m7Styles[m7[1]][1], m7Styles[m7[1]][2])
								
	self.mbWater = MultiButton(mm[8][1][1], 1, 2, WIDTH - 6, #m8, "", colors.white, colors.black,
								"right", "centre", m8Buttons, m8Sizes, m8Styles, m8Styles[m8[1]][1], m8Styles[m8[1]][2])
	
	self.mbBuilding = MultiButton(mm[9][1][1], 1, 2, WIDTH - 6, #m9, "", colors.white, colors.black,
								"right", "centre", m9Buttons, m9Sizes, m9Styles, m9Styles[m9[1]][1], m9Styles[m9[1]][2])
	
	self.mbMeasuring = MultiButton(mm[10][1][1], 1, 2, WIDTH - 6, #m10, "", colors.white, colors.black,
								"right", "centre", m10Buttons, m10Sizes, m10Styles, m10Styles[m10[1]][1], m10Styles[m10[1]][2])
								
	self.mbNetwork = MultiButton(mm[11][1][1], 1, 2, WIDTH - 6, #m11, "", colors.white, colors.black,
								"right", "centre", m11Buttons, m11Sizes, m11Styles, m11Styles[m11[1]][1], m11Styles[m11[1]][2])
								
								
	self.em:add(self.btnQuit,		"btnQuit")
	self.em:add(self.btnBack,		"btnBack")
	self.em:add(self.lblTitle,		"lblTitle")
	self.em:add(self.lblInfo,		"lblInfo")
	self.em:add(self.mbMain,		"mbMain")
	self.em:add(self.mbHelp,		"mbHelp")
	self.em:add(self.mbItems,		"mbItems")
	self.em:add(self.mbMining,		mm[1][1][1])
	self.em:add(self.mbForestry,	mm[2][1][1])
	self.em:add(self.mbFarming, 	mm[3][1][1])
	self.em:add(self.mbObsidian,	mm[4][1][1])
	self.em:add(self.mbCanal,		mm[5][1][1])
	self.em:add(self.mbSpawner,		mm[6][1][1])
	self.em:add(self.mbArea,		mm[7][1][1])
	self.em:add(self.mbWater,		mm[8][1][1])
	self.em:add(self.mbBuilding,	mm[9][1][1])
	self.em:add(self.mbMeasuring,	mm[10][1][1])
	self.em:add(self.mbNetwork,		mm[11][1][1])
	
	self.btnClick = function(button) self:onBtnClick(button) end
	self.mbClick = function(mb) self:onMbClick(mb) end
	
	U.subMenuName = ""
	U.subMenuIndex = 0
	U.currentMB = ""
--Log:saveToLog(self.name.." created")
	self:hideMultiButtonsExcept("Main Menu", "mbMain")
end

function S:enter()
	S.super.enter(self)
	_G.events:hook("onBtnClick", self.btnClick)
	_G.events:hook("onMbClick", self.mbClick)
end

function S:exit()
	S.super.exit(self)
	_G.events:unhook("onBtnClick", self.btnClick)
	_G.events:unhook("onMbClick", self.mbClick)
end

function S:getSubMenuIndex()
--Log:saveToLog("S:getSubMenuIndex() U.subMenuName = "..U.subMenuName)
	if U.subMenuName ~= "" then
		for k, v in ipairs(self.mm) do
--Log:saveToLog("S:getSubMenuIndex() k = "..k.."\nv = "..textutils.serialise(v, {compact = true}))
			if v[1][1] == U.subMenuName then	-- eg for v =  {{"mbNetwork",   "11-Network Tools"}},
				U.subMenuIndex = k
				return k
			end
		end
	end
end

function S:hideMultiButtonsExcept(title, except)
	-- hide all multibuttons, title, quit and back buttons
	-- except is the name of the multiButton that should be visible
Log:saveToLog("MainMenu:hideMultiButtonsExcept("..title..", "..except..")")
	self.btnQuit:setVisible(false)
	self.btnBack:setVisible(false)
	
	self.mbMain:setVisible(false)
	self.mbHelp:setVisible(false)
	self.mbItems:setVisible(false)
	self.mbMining:setVisible(false)
	self.mbForestry:setVisible(false)
	self.mbFarming:setVisible(false)
	self.mbObsidian:setVisible(false)
	self.mbCanal:setVisible(false)
	self.mbSpawner:setVisible(false)
	self.mbArea:setVisible(false)
	self.mbWater:setVisible(false)
	self.mbBuilding:setVisible(false)
	self.mbMeasuring:setVisible(false)
	self.mbNetwork:setVisible(false)
	--self.mbSpare:setVisible(false)
	
	self.lblTitle:setText(title)	-- set title text
	self.mbHelp:setVisible(true)
	--self.mbHelp:enable(true)
	
	if except ~= nil then
		U.currentMB = except
		
		local entity = self.em:getEntity(except)		-- the multiButton to set visible
		entity:setVisible(true)
		local count = entity:getButtonCount()
		local buttons = {}								-- adjust help/items to match current menu items
		for i = 1, count do
			table.insert(buttons, tostring(i))			-- eg {"1","2","3","4","5","6","7","8","9"}
		end
		self.mbHelp:setButtonIsVisible(buttons, true)	-- set help buttons visibility
		if except == "mbMain" then						-- is it the top level menu button?
			self.btnQuit:setVisible(true)				-- set quit visible
		else
			self.btnBack:setVisible(true)				-- set back, help and Items buttons visible
			self.mbItems:setVisible(true)
			self.mbItems:setButtonIsVisible(buttons, true)	-- set items buttons visibility
		end
	end
end

function S:onBtnClick(button)	-- button from Button object
	local activeButtons = nil
--Log:saveToLog("S:onBtnClick("..button.name..")")
	if button.name == "btnBack" then	-- only when submenu is visble
		--if U.currentMB == "mbMain" then
			U.subMenuName = ""
			U.subMenuIndex = 0
			U.currentTask = ""
			U.keyboardInput = ""
			self.lblInfo:setText(self.infoText[1])
			--self:hideMultiButtonsExcept("Main Menu", {"mbMain, mbHelp"})
			self:hideMultiButtonsExcept("Main Menu", "mbMain")
		-- else
			-- U.currentMB = "mbMain"
			-- self:hideMultiButtonsExcept("Main Menu", "mbMain")
		-- end
	elseif button.name == "btnQuit" then
		self.sceneMgr:switch("Quit")
	end
end

function S:onMbClick(mb)
	-- mb is the whole multibutton object
	-- mb.name is the name of entire multibutton. 
	-- each individual button has its own name / caption
Log:saveToLog("MainMenu:onMbClick:START: mb.name = "..mb.name..", U.subMenuName = "..U.subMenuName)
	--U.fc = U.fc + 1
	R.inventoryKey = ""	-- rarely used but can cause problems if set to anything else
	if U.subMenuName == "" then		-- not a menu
		if mb.name == "mbHelp" then		-- help menu clicked on show help.main 
			-- button name eg "1" = index of menu item eg "Mining (...)"
			local index = tonumber(mb.selectedButtonName)
--Log:saveToLog("mb.selectedButtonName = "..mb.selectedButtonName)
			local key = mb.selectedButtonName.."+0"	-- eg "1+0"
--Log:saveToLog("help button key = "..key)
			-- self.mm[1] = {{"mbMining", "Mining (includes Nether)"}},
			-- self.mm[1][1] = {"mbMining", "Mining (includes Nether)"},
			-- self.mm[1][1][1] = "mbMining"
			if help[key] ~= nil then
				-- S:setup(title, key, items)
				self.sceneMgr:getSceneByName("Help"):setup(self.mm[index][1][2], key) 
				self.sceneMgr:switch("Help")
			end
		elseif mb.name == "mbMain" then	-- main menu clicked on
			U.subMenuName = mb.selectedButtonName	-- eg "Mining (Includes Nether)" --> mbMining
			U.subMenuIndex = mb.selectedButtonIndex
--Log:saveToLog("\tU.subMenuName set to "..U.subMenuName..", index = "..U.subMenuIndex)
			--self:hideMultiButtonsExcept(mb.selectedButtonCaption, {U.trim(U.subMenuName), "mbHelp"})	-- title, except multibutton.name
			self:hideMultiButtonsExcept(mb.selectedButtonCaption, U.trim(U.subMenuName))	-- title, except multibutton.name
		end
	else	-- now viewing a subMenu eg "mbMining"
--Log:saveToLog("U.subMenuName = "..U.subMenuName)
		local data = nil
		if mb.name == "mbHelp" or mb.name == "mbItems" then		-- help menu clicked on, so must be active sub-menu
			-- find which sub-menu is active: U.subMenuName
			-- button name eg "1" = index of sub-menu item eg "Mining (...)"
			-- need to get index of submenu to use in help.[mainindex+subindex]
--Log:saveToLog("mb.selectedButtonName = "..tostring(mb.selectedButtonName)..", U.subMenuIndex = "..tostring(U.subMenuIndex))
			local index = tonumber(mb.selectedButtonName)
			local key = ""
			local helpKey = ""
			local sIndex = U.subMenuIndex
			if sIndex == 0 then
				sIndex = self:getSubMenuIndex()
			end
--Log:saveToLog("sIndex = "..sIndex)
			if sIndex == 1 then		-- {{"mbMining", "Mining (includes Nether)"}},
				key = self.m1[index]			--  m1 = {"createLadder", "createStaircase", "createMine"...}
			elseif sIndex == 2 then	-- {{"mbForestry", "Forestry"}},
				key = self.m2[index]
			elseif sIndex == 3 then
				key = self.m3[index]
			elseif sIndex == 4 then
				key = self.m4[index]
			elseif sIndex == 5 then
				key = self.m5[index]
			elseif sIndex == 6 then
				key = self.m6[index]
			elseif sIndex == 7 then
				key = self.m7[index]
			elseif sIndex == 8 then
				key = self.m8[index]
			elseif sIndex == 9 then
				key = self.m9[index]
			elseif sIndex == 10 then
				key = self.m10[index]
			elseif sIndex == 11 then
				key = self.m11[index]
			elseif sIndex == 12 then
				key = self.m12[index]
			end
Log:saveToLog("F[key] key =  "..tostring(key))
			if key == nil then return end
			local title = F[key].title
			if mb.name == "mbItems" then
--Log:saveToLog("item button key = "..key..", title = "..title)
				if F[key].items == nil then
					self.lblInfo:setText("No Items to display")
				else
					-- items can be changed from default here
					-- if key == "createFarmExtension" then
						-- F["assessFarm"].call()
						-- if R.networkFarm then
							-- F["createFarmExtension"].items =
-- [[~red~64    ~yellow~stone
-- ~red~128   ~yellow~dirt
-- ~red~4     ~yellow~water bucket
-- ~red~1     ~yellow~barrel
-- ~red~1     ~yellow~sapling (spruce preferred)
-- ~green~5     ~yellow~ladder
-- ~green~2     ~yellow~full size wired modems
-- ~green~57    ~yellow~Computercraft cable
-- ]]
						-- else
							-- F["createFarmExtension"].items =
-- [[~red~64    ~yellow~stone
-- ~red~128   ~yellow~dirt
-- ~red~4     ~yellow~water bucket
-- ~red~1     ~yellow~barrel
-- ~green~5     ~yellow~5 chests
-- ~red~1     ~yellow~sapling (spruce preferred)
-- ]]
						-- end
					-- end
					self.sceneMgr:getSceneByName("Help"):setup(title, key, true)	-- using Help scene to display items
					self.sceneMgr:switch("Help")
				end
			elseif mb.name == "mbHelp" then
				local mainIndex = 0
--Log:saveToLog("checking for = "..U.subMenuName)
				for k, v in ipairs(self.mm) do
					if v[1][1] == U.subMenuName then
						mainIndex = k	-- eg 1  to 12
						break
					end 
				end

				helpKey = tostring(mainIndex).."+"..tostring(index)
--Log:saveToLog("help button key = "..helpKey..", self.mm[index][1][1] = "..tostring(self.mm[index][1][1]))
				if help[helpKey] ~= nil then
					self.sceneMgr:getSceneByName("Help"):setup(title, helpKey)
					self.sceneMgr:switch("Help")
				end
			end
		else
			--if mb.name == self.subMenuList[self.mm[1]] then	-- [mm[1]]  = "mbMining",
--Log:saveToLog("self.mm[1][1][1] = "..self.mm[1][1][1])
--Log:saveToLog("self.mm[2][1][1] = "..self.mm[2][1][1])
--Log:saveToLog("mb.selectedButtonName = "..mb.selectedButtonName)
			if U.subMenuName == self.mm[1][1][1] then	-- mm[1]  = "mbMining",
				-- setup captions for controls default is mining.ladder / stairs
				if mb.selectedButtonName == self.m1[1] then -- ladder
					--R.goDown = true	-- down is default direction
					R.down = true	-- down is default direction
					R.auto = true	-- stop at stronghold/trial chamber
					U.currentTask = "createLadder"	
				elseif mb.selectedButtonName == self.m1[2] then -- stairs
					R.down = true
					R.auto = true	-- stop at stronghold/trial chamber
					U.currentTask = "createStaircase"
				elseif mb.selectedButtonName == self.m1[3] then -- mine at this level
					U.currentTask = "createMine"
				elseif mb.selectedButtonName == self.m1[4] then -- drop to water
					R.down = true
					U.currentTask = "createSafeDrop"
				elseif mb.selectedButtonName == self.m1[5] then -- single col bubble lift
					U.currentTask = "createBubbleLift"
					R.down = true
				elseif mb.selectedButtonName == self.m1[6] then -- quickmine corridoor
					R.width = 17
					R.length = 17
					R.torchInterval = 9
					R.floor = true
					U.currentTask = "quickMineCorridor"
				elseif mb.selectedButtonName == self.m1[7] then -- quickmine rectangle
					R.width = 15
					R.length = 15
					R.torchInterval = 9
					R.direction = "R1F1L1F1"
					U.currentTask = "quickMine"
				elseif mb.selectedButtonName == self.m1[8] then -- mine bedrock
					R.data = "leaveExposed"
					R.width = 17
					R.length = 17
					U.currentTask = "mineBedrockArea"
				elseif mb.selectedButtonName == self.m1[9] then -- rob mineshaft
					R.torchInterval = 9
					U.currentTask = "clearMineshaft"
				end
			--elseif mb.name == self.subMenuList[self.mm[2]] then	-- "mbForestry"
			elseif U.subMenuName == self.mm[2][1][1] then	-- "mbForestry"
				if mb.selectedButtonName == self.m2[1] then 	-- Fell Tree
					-- no options go straight to inventory
					U.currentTask = "fellTree"
				elseif mb.selectedButtonName == self.m2[2] then -- Create tree farm
					R.width = 15
					R.length = 15
					R.networkFarm = true
					R.inventoryKey = "new"
					U.currentTask = "createTreefarm"			-- uses network to get supplies
					--U.executeTask = true
				elseif mb.selectedButtonName == self.m2[3] then -- Plant tree farm
--Log:saveToLog("Starting plantTreeFarm")
					self.lblInfo:setText("Assessing tree farm...")
					F["assessTreeFarm"].call() -- R.networkFarm or R.earlyGame are set here
					if R.message ~= "" then
						--return {R.message}	-- location error
						U.currentTask = "earlyExit"
						U.executeTask = true
					end
					if R.logType:find("mangrove") ~= nil then
						R.subChoice = 3 -- mangrove
					elseif R.logType:find("spruce") ~= nil or R.logType:find("dark_oak") ~= nil then
						R.subChoice = 2	-- double trees
					else
						R.subChoice = 1	-- single trees
					end
					U.currentTask = "plantTreefarm"				-- uses network to get supplies
					U.executeTask = true						-- starts task immediately
				elseif mb.selectedButtonName == self.m2[4] then -- Harvest tree farm
					F["assessTreeFarm"].call() -- R.networkFarm or R.earlyGame are set here
					if R.message ~= "" then
						--return {R.message}	-- location error
						U.currentTask = "earlyExit"
						U.executeTask = true
					end
					U.currentTask = "harvestTreeFarm"		-- uses network to get supplies
					U.executeTask = true
				elseif mb.selectedButtonName == self.m2[5] then -- Fence or wall an enclosure
					R.inventoryKey = "default"
					U.currentTask = "createEnclosure"
				elseif mb.selectedButtonName == self.m2[6] then -- Harvest and replant forest
					R.auto = false;								-- true to replant saplings
					U.currentTask = "clearAndReplantTrees"
				elseif mb.selectedButtonName == self.m2[7] then -- Convert tree farm to network
					R.inventoryKey = "convertStorage"
					R.down = true								-- disabled in convertTreeFarm if R.data = "convert"
					U.currentTask = "convertTreefarm"			-- uses network to get supplies
				end 
			--elseif mb.name == self.subMenuList[self.mm[3]] then	-- "mbFarming"
			elseif U.subMenuName == self.mm[3][1][1] then		-- "mbFarming"
				if mb.selectedButtonName == self.m3[1] then 	-- Create modular crop farm
					R.networkFarm = true
					R.data = "new"								-- if user selects network farm, storage will be placed
					R.goDown = true								-- build network storage below farm
					U.currentTask = "createFarm"
				elseif mb.selectedButtonName == self.m3[2] then -- Extend modular crop farm
					F["assessFarm"].call()
-- *********  EXAMPLE data change before displaying task options menu   *********
					--[[
					data =
					{
						["chk1"] = {text = {"Use", "network","storage"}, state = false, required = true, r = {"networkFarm"}},
						["chk2"] = {text = {"To right", "of current","Farm"}, state = true, group = {"chk2", "chk3"}, required = true, r = {"data", "right", "back"}},
						["chk3"] = {text = {"Behind", "current", "farm"}, state = false, group = {"chk2", "chk3"}, required = true, r = {"data", "back", "right"}},
					}
					]]
					
					--F["createFarmExtension"].data["chk1"].state = R.networkFarm
					-- if R.networkFarm then
						-- F["createFarmExtension"].inventory =
						-- {
							-- {"stone", 64, true, ""},
							-- {"dirt", 128, false, ""},
							-- {"water_bucket", 4, true, ""},
							-- {"barrel", 1, true, ""},
							-- {"sapling", 1, true, ""},
							-- {"ladder", 5, true, ""},
							-- {"wired_modem_full", 2, true, ""},
							-- {"computercraft:cable", 57, true, ""}
						-- }
					-- else
						-- F["createFarmExtension"].inventory =
						-- {
							-- {"stone", 64, true, ""},
							-- {"dirt", 128, false, ""},
							-- {"water_bucket", 4, true, ""},
							-- {"barrel", 1, true, ""},
							-- {"chest", 5, true, ""},
							-- {"sapling", 1, true, ""}
						-- }
					-- end
					R.data = "right"							-- default value
					U.currentTask = "createFarmExtension"
				elseif mb.selectedButtonName == self.m3[3] then -- Manage farm:plant,harvest,convert
					F["checkFarmPosition"].call()				-- now facing crops, R.ready = true/false, R.networkFarm = true/false
					R.inventoryKey = "farm"
					U.currentTask = "manageFarmSetup"
				elseif mb.selectedButtonName == self.m3[4] then -- Build single wall or fence
					U.currentTask = "createFence"
				elseif mb.selectedButtonName == self.m3[5] then -- Build wall or fence enclosure
					R.inventoryKey = "default"
					U.currentTask = "createEnclosure"
				elseif mb.selectedButtonName == self.m3[6] then -- Convert farm to network storage
					R.inventoryKey = "convert"
					U.currentTask = "convertFarm"
				elseif mb.selectedButtonName == self.m3[7] then -- Mystical Agriculture soil upgrade
					U.currentTask = "upgradeFarmland"
				elseif mb.selectedButtonName == self.m3[8] then -- Create clay farm							
					U.currentTask = "createClayfarm"
				elseif mb.selectedButtonName == self.m3[9] then -- Make mud or clay
					R.misc = true								-- make mud true
					U.currentTask = "makeMud"
				end 
			--elseif mb.name == self.subMenuList[self.mm[4]] then	-- "mbObsidian"
			elseif U.subMenuName == self.mm[4][1][1] then		-- "mbObsidian"
				if mb.selectedButtonName == self.m4[1] then 	-- "lavaRefuel"
					R.side = "L"
					U.currentTask = "lavaRefuel"
				elseif mb.selectedButtonName == self.m4[2] then 	-- "Dig obsidian field"
					U.currentTask = "harvestObsidian"
				elseif mb.selectedButtonName == self.m4[3] then -- "Build Nether Portal"
					R.width = 1
					R.length = 4
					R.height = 5
					R.side = "F"
					U.currentTask = "createPortal"
				elseif mb.selectedButtonName == self.m4[4] then -- "Demolish Nether Portal"
					R.width = 1
					R.length = 4
					R.height = 5
					R.side = "F"
					U.currentTask = "demolishPortal"
				elseif mb.selectedButtonName == self.m4[5] then -- "Stripmine Netherite"
					R.width = 1
					R.length = 16
					R.torchInterval = 16
					R.data = "seal"
					U.currentTask = "createStripMine"
				elseif mb.selectedButtonName == self.m4[6] then -- "Undermine Dragon Towers"
					U.currentTask = "undermineDragonTowers"
				elseif mb.selectedButtonName == self.m4[7] then -- "Deactivate Dragon Tower"
					U.currentTask = "deactivateDragonTower"
				elseif mb.selectedButtonName == self.m4[8] then -- "Build dragon water trap"
					U.currentTask = "createDragonTrap"
				elseif mb.selectedButtonName == self.m4[9] then -- "restart attack mode"
					R.auto = true
					R.length = 1
					U.currentTask = "attack"
				elseif mb.selectedButtonName == self.m4[10] then -- "Build portal ladder & platform"
					U.currentTask = "createPortalPlatform"
				elseif mb.selectedButtonName == self.m4[11] then -- "Shulker harvester"
					R.subChoice = 1
					U.currentTask = "harvestShulkers"
				end 
			--elseif mb.name == self.subMenuList[self.mm[5]] then	-- "mbCanal"
			elseif U.subMenuName == self.mm[5][1][1] then	-- "mbCanal"
				if mb.selectedButtonName == self.m5[1] then 	-- "Simple path on air, water or lava"
					U.currentTask = "createPath"
				elseif mb.selectedButtonName == self.m5[2] then -- "Covered path or tunnel"
					U.currentTask = "createCorridor"
				elseif mb.selectedButtonName == self.m5[3] then -- "Water canal (mulitple options)"
					R.position = 1
					R.length = 512
					R.turtleCount = 2
					R.inventoryKey = "2"	-- default 2 turtles, left side on towpath
					U.currentTask = "createWaterCanal"
				elseif mb.selectedButtonName == self.m5[4] then -- "Ice canal (multiple options)"
					R.data = "new"
					R.position = 2
					R.length = 512
					R.inventoryKey = "ice"	-- default place ice
					U.currentTask = "createIceCanal"
				elseif mb.selectedButtonName == self.m5[5] then -- "Platform"
					U.currentTask = "createPlatform"
				elseif mb.selectedButtonName == self.m5[6] then -- "Sinking platform"
					U.currentTask = "createSinkingPlatform"
				elseif mb.selectedButtonName == self.m5[7] then -- "Boat bubble lift"
					U.currentTask = "createBoatLift"
				elseif mb.selectedButtonName == self.m5[8] then -- "Dive column"
					U.currentTask = "createDiveColumn"
				end 
			--elseif mb.name == self.subMenuList[self.mm[6]] then	-- "mbSpawner"	
			elseif U.subMenuName == self.mm[6][1][1] then	-- "mbSpawner"	
				-- {"createMobFarmCube", "floodMobFarm", "createMobBubbleLift", "createMobFarmCubeBlaze", "createBlazeGrinder", "createTrialCover"}
				if mb.selectedButtonName == self.m6[1] then 	-- "Cube around spawner (NOT blaze)"
					R.subChoice = 2	-- default starting position lower left
--Log:saveToLog("Starting createMobFarmCube")
					U.currentTask = "createMobFarmCube"
				elseif mb.selectedButtonName == self.m6[2] then -- "Flood mob farm floor"
					R.inventoryKey = "turtle"
					U.currentTask = "floodMobFarm"
				elseif mb.selectedButtonName == self.m6[3] then -- "Create mob bubble lift"
					R.subChoice = 1
					U.currentTask = "createMobBubbleLift"
				elseif mb.selectedButtonName == self.m6[4] then -- "Cube around Blaze spawner"
					R.data = "blaze"
					U.currentTask = "createMobFarmCubeBlaze"
				elseif mb.selectedButtonName == self.m6[5] then -- "createBlazeGrinder"
					U.currentTask = "createBlazeGrinder"
				elseif mb.selectedButtonName == self.m6[6] then -- "Surround trial spawner"
					R.height = 3
					R.width = 5
					R.length = 5
					U.currentTask = "createTrialCover"
				elseif mb.selectedButtonName == self.m6[7] then -- "Attack mob"
					R.auto = true
					R.up = true
					R.forward = true
					R.down = true
					U.currentTask = "attack"
				end 
			--elseif mb.name == self.subMenuList[self.mm[7]] then	-- "mbArea"
			elseif U.subMenuName == self.mm[7][1][1] then	-- "mbArea"
				if mb.selectedButtonName == self.m7[1] then 	-- "Clear field (inc trees)"
					U.currentTask = "clearArea"
				elseif mb.selectedButtonName == self.m7[2] then -- "Clear a rectangle (+ u/d opt)"
					R.up = false
					R.down = false
					U.currentTask = "clearRectangle"
				elseif mb.selectedButtonName == self.m7[3] then -- "Clear single wall up/down"
					R.width = 1
					U.currentTask = "clearWall"
				elseif mb.selectedButtonName == self.m7[4] then -- "Clear rectangular wall section"
					R.height = 1
					U.currentTask = "clearPerimeter"
				elseif mb.selectedButtonName == self.m7[5] then -- "Clear hollow structure up/down"
					R.goUp = true
					R.forward = true
					U.currentTask = "clearBuilding"
				elseif mb.selectedButtonName == self.m7[6] then -- "Clear solid structure up/down"
					R.goUp = true
					R.forward = true
					U.currentTask = "clearSolid"
				elseif mb.selectedButtonName == self.m7[7] then -- "Dig a trench"
					U.currentTask = "digTrench"
				elseif mb.selectedButtonName == self.m7[8] then -- "Carve mountain side"
					U.currentTask = "clearMountainSide"
				elseif mb.selectedButtonName == self.m7[9] then -- "Place a floor or ceiling"
					R.floor = true	-- defaults to floor
					U.currentTask = "createFloorCeiling"
				elseif mb.selectedButtonName == self.m7[10] then -- "Direct control of movement"
					U.currentTask = "createDirectedPath"
				end 
			--elseif mb.name == self.subMenuList[self.mm[8]] then	-- "mbWater"
			elseif U.subMenuName == self.mm[8][1][1] then	-- "mbWater"
				if mb.selectedButtonName == self.m8[1] then 	-- createSandWall
					U.currentTask = "createSandWall"
					R.width	= 1
				elseif mb.selectedButtonName == self.m8[2] then -- clearSandWall
					R.width	= 1
					U.currentTask = "clearSandWall"
				elseif mb.selectedButtonName == self.m8[3] then -- sandFillArea
					U.currentTask = "sandFillArea"
					R.width = 1
				elseif mb.selectedButtonName == self.m8[4] then -- clearSandCube
					U.currentTask = "clearSandCube"
				elseif mb.selectedButtonName == self.m8[5] then -- createRetainingWall
					U.currentTask = "createRetainingWall"
					R.data = "withPath" -- ensures turtle will break through path
					R.width = 1
				elseif mb.selectedButtonName == self.m8[6] then -- drainWaterLava
					R.data = "enclosed"
					U.currentTask = "drainWaterLava"
				--elseif mb.selectedButtonName == self.m8[7] then -- createSinkingPlatform
					--U.currentTask = "createSinkingPlatform"
				elseif mb.selectedButtonName == self.m8[7] then -- oceanMonumentColumns
					R.useBlockType = "prismarine"
					R.data = "oceanMonumentColumns"
					R.length = 56
					U.currentTask = "oceanMonumentColumns"
				elseif mb.selectedButtonName == self.m8[8] then -- clearWaterPlants
					R.data = "clearWaterPlants"
					U.currentTask = "clearWaterPlants"
				elseif mb.selectedButtonName == self.m8[9] then -- createLadderToWater
					U.currentTask = "createLadderToWater"
				elseif mb.selectedButtonName == self.m8[10] then -- convertWater
					U.currentTask = "floodArea"
				elseif mb.selectedButtonName == self.m8[11] then -- createSlopingWater
					U.currentTask = "createSlopingWater"
				end 
			--elseif mb.name == self.subMenuList[self.mm[9]] then	-- "mbBuilding"
			elseif U.subMenuName == self.mm[9][1][1] then	-- "mbBuilding"
				if mb.selectedButtonName == self.m9[1] then 	-- "Build a wall"
					R.width = 1
					U.currentTask = "buildWall"
				elseif mb.selectedButtonName == self.m9[2] then -- "Build a walled area / house"
					U.currentTask = "buildStructure"
				elseif mb.selectedButtonName == self.m9[3] then -- "Build a gable end roof"
					U.currentTask = "buildGableRoof"
				elseif mb.selectedButtonName == self.m9[4] then -- "Build a pitched roof"
					U.currentTask = "buildPitchedRoof"
				elseif mb.selectedButtonName == self.m9[5] then -- "Build up/downward track"
					R.depth = 2
					R.up = true
					U.currentTask = "createRailway"
				elseif mb.selectedButtonName == self.m9[6] then -- "Place Redstone:torch"
					U.currentTask = "placeRedstoneTorch"
				end 
			-- "measureHeight", "measureDepth", "measureLength", "measureDeepest", "createBorehole"
			elseif U.subMenuName == self.mm[10][1][1] then -- "mbMeasuring"
				if mb.selectedButtonName == self.m10[1] then 	 -- "Measure height"
					R.subChoice = 1
					R.dimension = "height"
					U.currentTask = "measureHeight"
				elseif mb.selectedButtonName == self.m10[2] then -- "Measure depth"
					R.subChoice = 1
					R.dimension = "depth"
					U.currentTask = "measureDepth"
				elseif mb.selectedButtonName == self.m10[3] then -- "Measure length"
					R.subChoice = 1
					R.size = 64
					R.dimension = "length"
					U.currentTask = "measureLength"
				elseif mb.selectedButtonName == self.m10[4] then -- "Measure greatest depth"
					R.dimension = "deepest"
					U.currentTask = "measureDeepest"
				elseif mb.selectedButtonName == self.m10[5] then -- "Borehole: Analyse blocks below"
					U.currentTask = "createBorehole"
				end 
			--elseif mb.name == self.subMenuList[self.mm[11]] then -- "mbNetwork"
			elseif U.subMenuName == self.mm[11][1][1] then -- "mbNetwork"
				if mb.selectedButtonName == self.m11[1] then 	 -- "Craft an item"
					--self.sceneMgr:switch("Craft") if implemented will need to modify switch statements
				elseif mb.selectedButtonName == self.m11[2] then -- "update saved storage lists"
					U.currentTask = "updateLists"
				end 
			end
--Log:saveToLog("U.currentTask = "..U.currentTask)
			if U.currentTask ~= "" then
				self.lblInfo:setText(self.infoText[1])
				if F[U.currentTask].data ~= nil then					-- options need to be set
--Log:saveToLog("self:onMbClick(mb) setting up 'TaskOptions' scene")
					self.sceneMgr:getSceneByName("TaskOptions"):setup()
Log:saveToLog("self:onMbClick(mb) switching to 'TaskOptions' scene")
					self.sceneMgr:switch("TaskOptions")
					return
				else
					U.keyboardInput = ""
					if F[U.currentTask].inventory ~= nil then			-- items required
						self.sceneMgr:getSceneByName("GetItems"):setup()
						self.sceneMgr:switch("GetItems")
					else
						--U.currentTask = "test"	-- debugging
						U.executeTask = true
					end
				end
			end
		end
	end
Log:saveToLog("S:onMbClick:END: (mb.name = "..mb.name..", U.subMenuName = "..U.subMenuName)
end

function S:update(data)
	self.super.update(self, data)
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
	
	if data[1] == "char" then
		local char = lib.checkInput(data[2])
Log:saveToLog("MainMenu:update data = 'char', data[2] = "..char)
		if char == "" then return end
		-- 'b' and 'q' is actioned in Button:update first even on different scenes
		-- 'h' and 'i' are actioned in multibutton Update event
		if char == "c" then
			U.keyboardInput = ""
			if U.currentMB == "mbMain" then
				self.lblInfo:setText(self.infoText[1])
			else
				self.lblInfo:setText("Input:'"..U.keyboardInput.."' 0, 1, h(elp), q(uit) or Enter")
			end
			return
		else
			if #U.keyboardInput >= 2 then return end		-- limit input to 2 characters
			U.keyboardInput = U.keyboardInput..char
			if U.currentMB == "mbMain" then
				if #U.keyboardInput == 1 then
					self.lblInfo:setText("Input:'"..U.keyboardInput.."' 0, 1, h(elp), q(uit) or Enter")
				else
					self.lblInfo:setText("Input:'"..U.keyboardInput.."' h(elp), b(ack) or Enter")
				end
			else
				if #U.keyboardInput == 1 then
					self.lblInfo:setText("Input:'"..U.keyboardInput.."' 0, 1, b, h, i(tems) or Enter")
				else
					self.lblInfo:setText("Input'" ..U.keyboardInput.."' b, h(elp), i(tems) or Enter")
				end
			end
		end
	elseif data[1] == "key" then			
Log:saveToLog("MainMenu:update data = "..data[1]..", data[2] = "..data[2])
		if data[2] == 257 then	-- Enter
			if U.keyboardInput == "" then return end
			local message = U.keyboardInput
			local action = ""
			local btnIndex = 0
			if #message == 1 then
				btnIndex = tonumber(message)			-- eg "1" = 1
			elseif #message == 2 then
				btnIndex = tonumber(message:sub(1,2))	-- eg "01h" = 1
			end
			if #message > 2 then
				action = message:sub(3,3)				-- eg "h"
			end
			-- user has chosen button 1 of mbMain
Log:saveToLog("MainMenu:update U.keyboardInput = "..U.keyboardInput..", action = "..action..", btnIndex = "..tostring(btnIndex)..", U.currentMB = "..U.currentMB)
			if btnIndex ~= nil then						-- from user eg 01 -> 1
				if U.currentMB == "mbMain" then
					--local index, name, caption = 0, "", ""
					local button = self.mbMain:getButtonByIndex(btnIndex)
Log:saveToLog("MainMenu:update local button = "..textutils.serialise(button, {compact = true}))
					U.subMenuName = button.name
					U.keyboardInput = ""
					self:hideMultiButtonsExcept(button.caption, button.name)	-- changes U.currentMB
					self.lblInfo:setText("Type eg 1, 1h(help), 1i(Items) +Enter")
				else -- i or h already dealt with, so execute choice
Log:saveToLog("MainMenu:update ready to execute. U.currentMB = "..U.currentMB)
					local entity = self.em:getEntity(U.currentMB)
					local button = entity:getButtonByIndex(btnIndex)
					
					entity:setSelectedButton("", btnIndex)
					U.subMenuIndex = btnIndex					
					U.subMenuName = U.currentMB
Log:saveToLog("MainMenu:update calling self:onMbClick("..entity.name..")")
					--U.subMenuName = button.name --?
					self:onMbClick(entity)
				end
			end		
		end	
	end
end

function S:draw()
	self.super.draw(self)
end

return S
