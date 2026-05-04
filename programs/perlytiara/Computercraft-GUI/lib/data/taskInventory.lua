local version = 20260123.1200
-- ["lbl4"] = {text = "Text here", bg = colors.black, fg = colors.lime, alignH = "centre"},
-- ["txt2"] = {text = "0", limits = {nil, nil}, r = "height", event = {"calculateHeight", "lbl2"}}
-- ...state = false,  group = {"chk1", "chk2", "chk4", "chk5"}, event = {"changeRValue", "inventoryKey", "1"}},
-- description = "QuickMine corridor: ~R.width~ x ~R.length~",

--[[
	Inventory structure:
	table of inventoryItems:
	inventory[1] = {item, quantity, required?, comment} eg {"slab", "R.length + 2", false, "Match slabs & roof blocks"}
	can also be a table of inventoryItems eg {{items}, {quantities}, {required?}, {comments}}
	Must be same number of elements in all tables eg 3 items need 3 quantities, required? and comments
	inventory[2] =
	{
		{"planks", "stairs", "stone"},
		{
			"(R.height * R.length * 2) + (R.height * R.width * 2)",
			"(R.height * R.length * 2) + (R.height * R.width * 2)",
			"(R.height * R.length * 2) + (R.height * R.width * 2)"
		},
		{true, true, true},
		{"Select block type", " for desired style", ""}
	},
quantity can be numerical or expression to be parsed
	IMPORTANT! 													"math.ceil( R.length / R.torchInterval )"  = CORRECT
	any R.xxx variable MUST be surrounded by space characters 	"math.ceil(R.length / R.torchInterval)"    = WRONG
	any operator MUST be surrounded by space characters
	fuel = "math.abs( R.upperLevel - R.lowerLevel ) * 2",	= CORRECT
	fuel = "math.abs( R.upperLevel- R.lowerLevel ) * 2",	= WRONG
]]

return
{				
	["assessFarm"] = {call = assessFarm},
	["assessTreeFarm"] = {call = assessTreeFarm},
	
	["attack"] =
	{
		call = attack,
		title = "07-Attack Dragon / mobs",
		description = "Attacking Dragon or other mob",
		fuel = 0,
		data = 
		{
			["chk1"] = {text = "Infinite?", state = true, r = "auto"},
			["chk2"] = {text = "Up?", state = true, r = "up"},
			["chk3"] = {text = "Forward?", state = true, r = "forward"},
			["chk4"] = {text = "Down?", state = true, r = "down"},
			["lbl1"] = {text = "Length of attack (seconds):"},
			["txt1"] = {text = "0", limits = {{0} , {9999}}, r = "length"}
		},
	},
	
	["buildGableRoof"] =
	{
		call = buildGableRoof,
		title = "03-Build a gable end roof",
		description = "Building gable end roof",
		fuel = "( R.height * R.length * 2) + ( R.height * R.width * 2)",
		items =
[[~red~w*l*h ~yellow~| stone, stairs or planks
~orange~l + 2 ~yellow~| slabs for ridge
]],
		inventory =
		{
			{
				{"planks", "stairs", "stone"},
				{
					"( R.height * R.length * 2) + ( R.height * R.width * 2)",
					"( R.height * R.length * 2) + ( R.height * R.width * 2)",
					"( R.height * R.length * 2) + ( R.height * R.width * 2)"
				},
				{true, true, true},
				{"Select block type", " for desired style", ""}
			},
			{"stone", "R.width * 4 + R.length", false, "For gable ends"},
			{"slab", "R.length + 2", false, "Match slabs & roof blocks"}
		},
		data = 
		{
			["lbl1"] = {text = "Gable end width (1-256):"},
			["lbl2"] = {text = "Building length (1-256):"},
			["lbl3"] = {text = "Roof height "},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "width", event = {"calculateRoof", "lbl3"}},
			["txt2"] = {text = "0", limits = {{1} , {256}}, r = "length"}
		},
	},
	
	["buildPitchedRoof"] =
	{
		call = buildPitchedRoof,
		title = "04-Build a pitched roof",
		description = "Building pitched roof",
		items =
[[~red~width*
length*
height~yellow~| stone, stairs or planks
~orange~length~yellow~| slabs for ridge
]],
		inventory =
		{
			{
				{"planks", "stairs", "stone"},
				{
					"( R.height * R.length * 2) + ( R.height * R.width * 2)",
					"( R.height * R.length * 2) + ( R.height * R.width * 2)",
					"( R.height * R.length * 2) + ( R.height * R.width * 2)"
				},  {true, true, true} , {"Select block type", " for desired style", ""}
			},
			{"slab", "R.length", false, "Match slabs & roof blocks"}
		},
		data = 
		{
			["lbl1"] = {text = "Building width (1-256):"},
			["lbl2"] = {text = "Building length (1-256):"},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1} , {256}}, r = "length"}
		},
	},
	
	["buildStructure"] =
	{
		call = buildStructure,
		title = "02-Build walled area, house",
		description = "Building walled area / house",
		fuel = "( R.height * R.length * 2) + ( R.height * R.width * 2)",
		data = 
		{
			["chk1"] = {text = {"Outside ?","forward 1", "first"}, group = {"chk1", "chk2"}, state = false, r = "forward"},
			["lbl1"] = {text = "Building width (1-256):"},
			["lbl2"] = {text = "Building length (1-256):"},
			["lbl3"] = {text = "Building height (1-50):"},
			["txt1"] = {text = "0", limits = {{1} , {256}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1} , {256}}, r = "length"},
			["txt3"] = {text = "0", limits = {{1} , {50}}, r = "height"}
		},
		items =
[[~red~width 
length
height~yellow~| stone planks or bricks
~yellow~      | quantities calculated
]],
		inventory =
		{
			{
				{"stone", "planks", "bricks"},
				{
					"( R.height * R.length * 2) + ( R.height * R.width * 2)",
					"( R.height * R.length * 2) + ( R.height * R.width * 2)",
					"( R.height * R.length * 2) + ( R.height * R.width * 2)"
				},
				{true, true, true},
				{"", "", ""}
			}
		}
	},
	
	["buildWall"] =
	{
		call = buildWall,
		title = "01-Build a wall",
		description = "Building wall",
		fuel = " R.width * R.length * 2",
		items =
[[~red~length~yellow~| stone or fence
]],
		inventory = 
		{
			{{"wall", "fence"}, {"math.ceil(( R.width + R.length ) * 2.3)", "math.ceil(( R.width + R.length ) * 2.3)"}, true, ""},
		},
		data = 
		{
			["chk1"] = {text = {"Outside ?","forward 1", "first"}, group = {"chk1", "chk2"}, state = false, r = "forward"},
			["chk2"] = {text = {"Above ?","down 1", "first"}, group = {"chk1", "chk2"}, state = false, r = "down"},
			["lbl1"] = {text = "Length of the wall (1-256):"},
			["lbl2"] = {text = "Height of the wall (1-256):"},
			["txt1"] = {text = "0", limits = {{1} , {256}}, r = "length"},
			["txt2"] = {text = "0", limits = {{1} , {256}}, r = "height"},
		},
		inventory =
		{
			{{"stone", "planks", "bricks"}, {"R.height * R.length", "R.height * R.length", "R.height * R.length"}, {true, true, true}, {"", "", ""}}
		}
	},
	
	["checkFarmPosition"] = {call = checkFarmPosition},

	["clearAndReplantTrees"] =
	{
		call = clearAndReplantTrees,
		title = "06-Harvest & replant forest",
		description = "Harvesting / replanting forest",
		fuel = 2000,
		data =
		{
			["chk1"] = {text = {"re-plant", "saplings ?", "", ""}, state = false, r = "auto"},
			["lbl1"] = {text = "Width of the area (1-64)"},
			["lbl2"] = {text = "Length of the area (1-64)"},
			["txt1"] = {text = "0", limits = {{0}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{0}, {64}}, r = "length"}
		},
		items = 
[[~green~1     ~yellow~| chest for crafting fuel
64    ~yellow~| saplings mixed types
]],
		inventory =
		{
			{"minecraft:chest", 1, false, ""},
			{"sapling", 64, false, ""}
		}
	},
	
	["clearArea"] =
	{
		call = clearArea,
		title = "01-Clear field (inc trees)",
		fuel = "R.width * R.length * 3",
		description = "Clearing area",
		data =
		{
			["chk1"] = {text = {"Dirt layer", "on top ?", ""}, state = false, r = {"useBlockType", "dirt", ""}},
			["lbl1"] = {text = "Width of the area (1-64)"},
			["lbl2"] = {text = "Length of the area (1-64)"},
			["txt1"] = {text = "0", limits = {{0}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{0}, {64}}, r = "length"}
		},
		items =
[[~green~width*
length~yellow~| dirt if resurfacing is required]],
		inventory =
		{
			{"minecraft:dirt", "R.width * R.length", false, "if required"}
		}
	},
	
	["clearBuilding"] =
	{
		call = clearBuilding,
		title = "05-Clear hollow structure",
		description = "Clearing building",
		fuel = "( R.width * R.length ) + (( R.width + R.length ) * R.height )",
		data = 
		{
			["chk1"] = {text = {"Bottom","to top",""}, group = {"chk1", "chk2"}, state = true,  r = "goUp"},
			["chk2"] = {text = {"Top to", "bottom", ""}, group = {"chk1", "chk2"}, state = false,  r = "goDown"},
			["chk3"] = {text = {"Remove","ceiling?",""}, state = false, r = "ceiling"},
			["chk4"] = {text = {"Outside ?","forward 1", "first"}, state = true, r = "forward"},
			["chk5"] = {text = {"Above ?","down 1", "first"}, state = false, r = "down"},
			["chk6"] = {text = {"Remove","floor?",""}, state = false, r = "floor"},
			["lbl1"] = {text = "Structure width (1-256):"},
			["lbl2"] = {text = "Structure length (1-256):"},
			["lbl3"] = {text = "Structure height / depth (1-256):"},
			["txt1"] = {text = "0", limits = {{1} , {256}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1}, {256}}, r = "length"},
			["txt3"] = {text = "0", limits = {{1} , {256}}, r = "height"}
		}
	},
	
	["clearMineshaft"] =
	{
		call = clearMineshaft,
		title = "09-Rob disused mineshaft",
		description = "Asset stripping mineshaft",
		items =
[[~green~1      ~yellow~| UNUSED diamond sword for webs
~green~1      ~yellow~| torch per 8 blocks
]],
		data =
		{
			["chk1"] = {text = "Get cobwebs?", state = true, r = {"data", "addSword", ""}},
			["lbl1"] = {text = "Torch spacing? 0 to 64, default 9:"},
			["txt1"] = {text = "9", limits = {{0} , {64}}, r = "torchInterval"}
		},
		inventory = 
		{
			{"minecraft:torch" , "R.torchInterval", false, ""},
			{"minecraft:diamond_sword", 1, false, "For cobwebs"}
		},
	},

	["clearMountainSide"] =
	{
		call = clearMountainSide,
		title = "08-Carve mountain side",
		description = "Mountain landscaping",
		fuel  = "R.length * R.width * 10",
		data = 
		{
			["chk1"] = {text = "Left side", state = false, r = "left"},
			["chk2"] = {text = "Right side", state = false, r = "right"},
			["lbl1"] = {text = "Remove how many vertical rows?"},
			["lbl2"] = {text = "length of row 1 to 255 default 64"},
			["txt1"] = {text = "0", limits = {{1}, {255}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1} , {255}}, r = "length"}
		}
	},

 	["clearPerimeter"] =
	{
		call = clearPerimeter,
		title = "04-Clear perimeter wall",
		description = "Clearing perimeter",
		fuel = "( R.width + R.length ) * 2",
		data =
		{
			["chk1"] = {text = {"Outside ?","forward 1", "first"}, state = false, r = "forward"},
			["lbl1"] = {text = "Perimeter width (1-256):"},
			["lbl2"] = {text = "Perimeter length (1-256):"},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1}, {256}}, r = "length"}
		}
	},
	
	["clearRectangle"] =
	{
		call = clearRectangle,
		title = "02-Clear a rectangle & u/d",
		description = "Clearing rectangle",
		fuel = "R.width * R.length",
		data =
		{
			["chk1"] = {text = "Dig up?", state = false, r = "up"},
			["chk2"] = {text = "Dig down?", state = false, r = "down"},
			["chk3"] = {text = {"Start", "outside","area ?"}, state = false, r = {"direction", "F", ""}},
			["lbl1"] = {text = "Rectangle width (1-256):"},
			["lbl2"] = {text = "Rectangle length (1-256:"},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1}, {256}}, r = "length"}
		}
	}, 
	
	["clearSandCube"] =
	{
		call = clearSandCube,
		title = "04-Remove volume of sand",
		description = "Removing sand",
		fuel = "R.length * R.width * 4",
		data =
		{
			["lbl1"] = {text = "Width of sand:"},
			["lbl2"] = {text = "Length of sand:"},
			["txt1"] = {text = "0", limits = {{0}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{0}, {64}}, r = "length"}
		},
	},
	
	["clearSandWall"] =
	{
		call = clearSandWall,
		title = "02-Remove sand wall",
		description = "Clearing sand wall",
		fuel = 200,
		data =
		{
			["chk1"] = {text = {"Stop at","end of", "sand"}, group = {"chk1", "chk2"}, state = true, r = {"data", "", "return"}},
			["chk2"] = {text = {"Return to","starting","position"}, group = {"chk1", "chk2"}, state = false, r = {"data", "return", ""}},
			["lbl1"] = {text = "Length of sand (0 = auto-detect):"},
			["txt1"] = {text = "0", limits = {{0} , {64}}, r = "length"}
		}
	},

	["clearSolid"] =
	{
		call = clearSolid,
		title = "06-Clear solid structure",
		description = "Clearing solid structure",
		fuel = "( R.width * R.length ) + (( R.width + R.length ) * R.height )",
		data = 
		{
			["chk1"] = {text = {"Bottom","to top",""}, state = true, group = {"chk1", "chk2"}, r = "goUp"},
			["chk2"] = {text = {"Top to", "bottom", ""}, state = false, group = {"chk1", "chk2"}, r = "goDown"},
			["chk4"] = {text = {"Outside ?","forward 1", "first"}, state = true, r = "forward"},
			["chk5"] = {text = {"Above ?","down 1", "first"}, state = false, r = "down"},
			["lbl1"] = {text = "Structure length (1-256)"},
			["lbl2"] = {text = "Structure width (1-256)"},
			["lbl3"] = {text = "Structure height (1-256)"},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "length"},
			["txt2"] = {text = "0", limits = {{1} , {256}}, r = "width"},
			["txt3"] = {text = "0", limits = {{1} , {256}}, r = "height"}
		}
	},
	
	["clearWall"] =
	{
		call = clearWall,
		title = "03-Clear linear wall",
		description = "Clearing wall",
		fuel = "R.length * R.height",
		data =
		{
			["chk1"] = {text = {"Bottom","to top",""}, state = true, group = {"chk1", "chk2"}, r = {"subChoice", 1, 2}},
			["chk2"] = {text = {"Top to", "bottom", ""}, state = false, group = {"chk1", "chk2"}, r = {"subChoice", 2, 1}},
			["chk4"] = {text = {"Outside ?","forward 1","first"}, state = false, r = "forward"},
			["chk5"] = {text = {"Above ?","down 1", "first"}, state = false, r = "down"},
			["lbl1"] = {text = "Length of wall (1-256):"},
			["lbl2"] = {text = "Height of wall (1-50):"},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "length"},
			["txt2"] = {text = "0", limits = {{1}, {50}}, r = "height"}
		}
	}, 	
	
	["clearWaterPlants"] =
	{
		call = clearWaterPlants,
		title = "08-Clear water plants",
		description = "Clearing Water Plants",
		data =
		{
			["lbl1"] = {text = "Width of water 1 = single, 0 = auto):"},
			["lbl2"] = {text = "Length of water (0 = auto detect):"},
			["lbl3"] = {text = "Warning", bg = colors.black, fg = colors.red, alignH = "centre"},
			["lbl4"] = {text = "If width > 1 turtle moves RIGHT!", bg = colors.black, fg = colors.lime, alignH = "centre"},
			["lbl5"] = {text = "", bg = colors.black, fg = colors.red, alignH = "centre"},
			["txt1"] = {text = "0", limits = {{0}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{0}, {64}}, r = "length"}
		},
		items = 
[[~green~16    ~yellow~| sand
~green~16    ~yellow~| stone to replace slabs]],
		inventory =
		{
			{{"sand", "stone"}, {64, 64}, {false, false}, {"",""}}
		}
	},
	
	["convertEssence"] =
	{
		call = convertEssence,
		title = "Convert Mystic Agriculture Essence",
		description = "Converting MA Essence",
		data =
		{
			["chk1"] = {text = "Inf -> Pru", state = true, r = {"subChoice", 1, 0}},
			["chk2"] = {text = "Pru -> Ter", state = true, r = {"subChoice", 2, 0}},
			["chk3"] = {text = "Ter -> Imp", state = true, r = {"subChoice", 3, 0}},
			["chk4"] = {text = "Imp -> Sup", state = true, r = {"subChoice", 4, 0}},
			["chk5"] = {text = "Sub -> Ins", state = true, r = {"subChoice", 5, 0}},
			["lbl1"] = {text = "Inf = Inferium, Pru = Prudentium  "},
			["lbl2"] = {text = "Ter = Tertium, Imp = Imperium     "},
			["lbl3"] = {text = "Sup = Supremium, Ins = Insanium   "},
			["lbl5"] = {text = "Quantity? (0 = all)"},
			["txt5"] = {text = "0", limits = {{0}, {1024}}, r = "size"}
		}
	},
	
	["convertFarm"] =
	{
		call = convertFarm,
		title = "06-Convert legacy farm",
		description = "Converting legacy farm",
		fuel = 900,
		items =
[[	
~red~16    ~yellow~| stone
~red~2     ~yellow~| ~dirt
~red~1     ~yellow~| sapling (spruce preferred)
~red~1     ~yellow~| barrel
~red~5     ~yellow~| ladders
~orange~8     ~yellow~| chests (if storage added)
~orange~2-3   ~yellow~| full wired modems
~orange~57-70 ~yellow~| computercraft cable
]],
		inventory = 
		{
			["convert"] = 
			{
				{"stone", 16, true, ""},
				{"dirt", 2, true, ""},
				{"sapling", 1, true, ""},
				{"barrel", 1, true, ""},
				{"ladder", 5, true, ""},
				{"wired_modem_full", 2, true, ""},
				{"computercraft:cable", 57, true, ""}
			},
			
			["convertStorage"] =
			{
				{"stone", 16, true, ""},
				{"dirt", 2, true, ""},
				{"sapling", 1, true, ""},
				{"barrel", 1, true, ""},
				{"ladder", 5, true, ""},
				{"chest", 8, true, ""},
				{"wired_modem_full", 3, true, ""},
				{"computercraft:cable", 70, true, ""}
			}
		},		
		data = 
		{
			["chk1"] = {text = {"`lg¬gray`Include   ","`red¬gray`network`lg¬gray`   ", "storage ? "},	state = false, r = {"inventoryKey", "convertStorage", "convert"}},
		}
	},
	
	["convertTreefarm"] =
	{
		call = convertTeeefarm,
		title = "07-Convert legacy tree farm",
		description = "Converting legacy tree farm",
		fuel = 900,
		items =
[[	
~red~1     ~yellow~| hopper
~red~1     ~yellow~| log to indicate sapling type
~red~2     ~yellow~| ~barrels
~red~3     ~yellow~| full wired modems
~red~8     ~yellow~| chests (if storage added)
~red~24    ~yellow~| computercraft cable (with storage)
]],
		inventory =
		{
			["convert"] =
			{
				{"log", 1, true, "log = sapling type"},
				{"barrel", 2, true, ""},
				{"minecraft:hopper", 1, true, ""},
				{"wired_modem_full", 2, true, ""},
				{"computercraft:cable", 22, true, ""}
			},
			["convertStorage"] =
			{
				{"log", 1, true, "log = sapling type"},
				{"barrel", 2, true, ""},
				{"minecraft:hopper", 1, true, ""},
				{"chest", 8, true, ""},
				{"wired_modem_full", 3, true, ""},
				{"computercraft:cable", 24, true, ""}
			}
		},
		data = 
		{
			["chk1"] = {text = {"`lg¬gray`Include   ","`red¬gray`network`lg¬gray`   ", "storage ? "},	state = true, r = {"inventoryKey", "convertStorage", "convert"}},
		},
	},
	
 	["convertWater"] =
	{
		call = convertWater,
		title = "Convert water to source",
		description = "Converting water to source",
		data =
		{
			["lbl1"] = {text = "Water width  (0 = auto detect):"},
			["lbl2"] = {text = "Water length (0 = auto detect):"},
			["lbl3"] = {text = "Water depth  (0 = auto detect):"},
			["txt1"] = {text = "0", limits = {{0}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{0}, {64}}, r = "length"},
			["txt3"] = {text = "0", limits = {{0}, {64}}, r = "height"}
		},
		items =
[[~red~12    ~yellow~| buckets or water buckets
~red~128   ~yellow~| slabs
]],
		inventory =
		{
			{{"water_bucket", "bucket"}, {12, 12}, {true, true}, { "", ""}},
			{"slab", 128, true, ""}
		}
	},	
	
	["craftItem"] = 
	{
		call = craftItem,
		title = "01-Craft an Item",
		fuel = 0,
		description = "Craft any item",
		inventory =
		{
			{{"chest", "barrel"}, {1, 1}, {true, true}, {"", ""}}
		}
	},
	
	["createBlazeGrinder"] = 
	{
		call = createBlazeGrinder,
		title = "05-Blaze farm grinder",
		fuel = 900,
		description = "Building grinder for blaze farm",
		items =
[[
~red~81    ~yellow~| slabs
~red~88    ~yellow~| nether bricks
~red~4     ~yellow~| lava buckets
~red~1     ~yellow~| chest / barrel
~red~1     ~yellow~| hopper     
]],
		inventory =
		{
			{"brick", 88, true, ""},
			{"slab", 81, true, ""},
			{"lava", 4, true, ""},
			{"sign", 1, true, ""},
			{"hopper", 1, true, ""},
			{{"chest", "barrel"}, {1, 1}, {true, true}, {"", ""}}
		}
	},
	
	["createBorehole"] =
	{
		call = createBorehole,
		title = "05-Borehole: Analyse blocks below",
		description = "Borehole: Analysing blocks below",
		data =
		{
			["lbl1"] = {text = "Current level (F3):"},
			["lbl2"] = {text = "Go down to level:"},
			["txt1"] = {text = "0", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}, r = "height"},
			["txt2"] = {text = "0", limits = {{"R.height - 2"} , {"U.bedrock + 5"}}, r = "depth"}
		}
	},

	["createBoatLift"] =
	{
		call = createBoatLift,
		title = "07-Boat bubble lift",
		fuel = "R.height * 20",
		description = "Building boat bubble lift",
		data =
		{
			["lbl1"] = {text = "Levels to go up:"},
			["txt1"] = {text = "", limits = {{1} , {"U.ceiling - 2"}}, r = "height"}
		},
		items =
[[~red~2     ~yellow~| buckets or water buckets
~red~2height
* 10  ~yellow~| stone
~red~2height
* 2   ~yellow~| gates
~red~2height
*2 + 2~yellow~| soul sand
]],
		inventory = 
		{
			{{"minecraft:bucket","minecraft:water_bucket"}, {2, 2}, {true, true}, { "", ""}},
			{"stone", "R.height * 10"},
			{"gate", "R.height * 2"},
			{"minecraft:soul_sand", "R.height * 2 + 2"}
		}
	},
	
	["createBubbleLift"] =
	{
		call = createBubbleLift,
		fuel = "math.abs( R.upperLevel - R.lowerLevel ) * 3",
		title = "05-Single column bubble lift",
		description = "Building bubble lift",
		items =
[[~green~h * 2 ~yellow~| stone
~orange~1     ~yellow~| soul sand OR
~orange~1     ~yellow~| dirt as placeholder
~red~1     ~yellow~| water bucket
~red~height~yellow~| kelp
~orange~2     ~yellow~| signs
]],
		inventory = 
		{
			{"minecraft:water_bucket", 1, true, ""},
			{"minecraft:kelp", "math.abs( R.upperLevel - R.lowerLevel )", true, ""},
			{{"minecraft:soul_sand", "minecraft:dirt"}, {1, 1}, {true, true},  {"if available", ""}},
			{"stone", "math.abs( R.upperLevel - R.lowerLevel ) * 2", false, ""}, -- estimate only
			{"sign", 2, false, ""},
		},
		data =
		{
			["chk1"] = {text = "Go UP?", state = false, group = {"chk1", "chk2"}, required = true, r = "up"},
			["chk2"] = {text = "Go DOWN?", state = true, group = {"chk1", "chk2"}, required = true, r = "down"},
			["lbl1"] = {text = "Current level (F3):"},
			["lbl2"] = {text = "Go to level:"},
			["txt1"] = {text = "0", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}, r = "startLevel", event = {"calculateHeight", "lbl2"}},
			["txt2"] = {text = "0", limits = {nil, nil}, r = "destinationLevel", event = {"calculateHeight", "lbl2"}}
		}
	},
	
	["createClayfarm"] =
	{
		call = createClayfarm,
		title = "08-Create clay farm",
		description = "Farm for mud and clay",
		fuel = 300,
		items =
[[~red~2     ~yellow~| water bucket
~red~64    ~yellow~| stone
~red~102   ~yellow~| slabs
~red~100   ~yellow~| pointed dripstone 
]],
		inventory =
		{
			{"water_bucket", 2, true, ""},
			{"stone", 64, true, ""},
			{"slab", 102, true, ""},
			{"pointed_dripstone", 100, true, ""},
		},
	},
	
	["createCorridor"] =
	{
		call = createCorridor,
		title = "02-Covered path or tunnel",
		description = "Building covered path or tunnel",
		data =
		{
			["chk1"] = {text = {"Seal off", "water or ", "lava?"}, state = false, r = {"data", "seal", ""}},
			["lbl1"] = {text = "Tunnel / path length (1-256):"},
			["lbl2"] = {text = "Torch spacing? 0 - 64, (default 9):"},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "length"},
			["txt2"] = {text = "0", limits = {{0} , {64}}, r = "torchInterval"}
		},
		items =
[[~red~2length
* 2   ~yellow~| stone
~green~1     ~yellow~| torch per 8 blocks
]],
		inventory =
		{
			{"stone", "R.length * 2", false, ""},
			{"minecraft:torch", "math.ceil( R.length / R.torchInterval )", false, ""}
		}
	},
	
	["createDiveColumn"] =
	{
		call = createDiveColumn,
		title = "08-Place underwater doors",
		description = "Placing doors...",
		fuel = 200,
		items =
[[	
~red~10-64 ~yellow~| door
~red~10-64 ~yellow~| dirt
]],
		data = 
		{
			["chk1"] = {text = {"Click here","to assess", "depth"}, state = false, event = {"executeCall", "findSeabed", "inventory"}}
		},
		-- default inventory, this is altered in code after depth is found 
		inventory = 
		{
			{"door", 20, true, ""},
			{"dirt", 20, true, ""},
		}
	},
	["createDirectedPath"] =
	{
		call = createDirectedPath,
		title = "10-Direct movement control",
		fuel = 200,
		data =
		{
			["chk1"] = {text = {"Simple", "path with", "no roof"}, state = true,  group = {"chk1", "chk2"}, r = {"subChoice", 1, 2}},
			["chk2"] = {text = {"Covered", "path 2 ", "block high"}, state = false, group = {"chk1", "chk2"}, r = {"subChoice", 2, 1}},
			["chk4"] = {text = {"Type Cmd: ",
								"eg F2L1   ",
								"          "},  state = true, group = {"chk4", "chk5"}, r = {"data", "cmd", "menu"}},
			["chk5"] = {text = "Menu: GUI", 	state = false, group = {"chk4", "chk5"}, r = {"data", "menu", "cmd"}},
		}
	},
	
	["createDragonTrap"] =
	{
		call = createDragonTrap,
		title = "08-Build dragon water trap",
		description = "Building dragon water trap",
		fuel = 256,
		items =
[[~red~356   ~yellow~| stone
~red~1     ~yellow~| obsidian
~red~145   ~yellow~| ladder
~red~1     ~yellow~| water bucket
]],
		inventory =
		{
			{"stone", 356, true, ""},
			{"minecraft:obsidian", 1, true, ""},
			{"minecraft:ladder", 145, true, ""},
			{"minecraft:water_bucket", 1, true, ""}
		},
		data = 
		{
			["lbl1"] = {text = "Place turtle on obsidian at", bg = colors.black, fg = colors.lime, alignH = "centre"},
			["lbl2"] = {text = "100,49,0 facing West", bg = colors.black, fg = colors.lime, alignH = "centre"}
		}
	},
	
	["createEnclosure"] =
	{
		call = createEnclosure,
		title = "05-Fenced or walled enclosure",
		description = "Building land enclosure",
		fuel = "( R.length + R.width ) * 2",
		items =
[[	
~red~l*w*2 ~yellow~| stone or fence
~green~1     ~yellow~| torch per 8 blocks
~green~4     ~yellow~| barrels if required for storage
]],
		inventory =
		{
			["default"] =
			{
				{{"stone", "fence"}, {"( R.length + R.width ) * 2", "( R.length + R.width ) * 2"}, {true, true}, {"", ""}},
				{"minecraft:torch", "math.ceil((( R.length + R.width ) * 2) / R.torchInterval )", false, ""}
			},
			["barrel"] =
			{
				{{"stone", "fence"}, {"( R.length + R.width ) * 2", "( R.length + R.width ) * 2"}, {true, true}, {"", ""}},
				{"minecraft:torch", "math.ceil((( R.length + R.width ) * 2) / R.torchInterval )", false, ""},
				{"minecraft:barrel", 4, false, "for storage"}
			}
		},
		data = 
		{
			["chk1"] = {text = {"Place", "Barrels in", "corners ?"}, state = false, r = {"inventoryKey", "barrel", "default"}},
			["lbl1"] = {text = "Width of the area (1-64)"},
			["lbl2"] = {text = "Length of the area (1-64)"},
			["lbl3"] = {text = "Torch spacing? (0-64)"},
			["txt1"] = {text = "0", limits = {{0}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{0} , {64}}, r = "length"},
			["txt3"] = {text = "0", limits = {{0} , {64}}, r = "torchInterval"}
		}
	},
	
	["createFence"] =
	{
		call = createFence,
		title = "04-Build linear fence, wall",
		description = "Building fence or wall",
		fuel = "R.length",
		items =
[[	
~red~length~yellow~| stone or fence
~green~1     ~yellow~| torch per 8 blocks
]],
		inventory =
		{
			{{"stone", "fence"}, {"R.length", "R.length"}, {true, true}, {"", ""}},
			{"minecraft:torch", "math.ceil( R.length / R.torchInterval )", false, ""}
		},
		data = 
		{
			["lbl1"] = {text = "Length of the area (1-64)"},
			["lbl2"] = {text = "Torch spacing? (0-64)"},
			["txt1"] = {text = "0", limits = {{0} , {64}}, r = "length"},
			["txt2"] = {text = "0", limits = {{0} , {64}}, r = "torchInterval"}
		}
	},
	
	["createFarm"] =
	{
		-- only used to create new farm, optionally complete with network storage
		call = createFarm,
		title ="01-Create modular crop farm",
		description = "Creating modular crop farm",
		fuel = 300,
		items =
[[~red~64    ~yellow~| stone
~red~1     ~yellow~| dirt
~red~4     ~yellow~| water bucket
~red~1     ~yellow~| barrel
~red~1     ~yellow~| sapling ~lime~(spruce preferred)
~green~<= 8  ~yellow~| chests if no storage
~red~3     ~cyan~| full size wired modems
~red~54    ~cyan~| Computercraft cable
~red~44    ~yellow~| Computercraft cable
~green~5     ~yellow~| ladders
]],
		inventory =
		{
			{"stone", 64, true, ""},
			{"dirt", 1, false, "more if needed"},
			{"water_bucket", 4, true, ""},
			{"barrel", 1, true, ""},
			{"sapling", 1, true, ""},
			{"chest", 8, false, "If adding storage"},
			{"modem", 3, true, "3 if adding storage"},
			{"computercraft:cable", 54, true, ""},
			{"ladder", 5, false, "access to basement"},
		},
		data =
		{
			["chk1"] = {text = {"Add", "network","storage"}, state = true, required = true, r = {"goDown"}},
		}
	},
	
	["createFarmExtension"] =
	{
		-- only used to extend existing networked fam to right, or behind
		call = createFarmExtension,
		title = "02-Extend modular crop farm",
		description = "Extending modular crop farm",
		fuel = 300,
		items =
[[~red~54-74 ~yellow~| stone 74 for pumpkin
~red~1     ~yellow~| dirt
~red~4     ~yellow~| water bucket
~red~1     ~yellow~| barrel
~red~1     ~yellow~| sapling (spruce preferred)
~red~2     ~yellow~| full size wired modems
~red~44    ~yellow~| Computercraft cable
~green~5     ~yellow~| ladders
]],
		inventory =
		{
			{"stone", 74, true, "NOT pumpkin/melon = 54"},
			{"dirt", 1, false, "more if needed"},
			{"water_bucket", 4, true, ""},
			{"barrel", 1, true, ""},
			{"sapling", 1, true, "spruce best"},
			{"modem", 2, true, ""},
			{"computercraft:cable", 44, true, ""},
			{"ladder", 5, false, "access to basement"},
		},
		data =
		{
			["chk1"] = {text = {"To right", "of current","Farm"}, state = true, group = {"chk1", "chk2"}, required = true, r = {"data", "right", "back"}},
			["chk2"] = {text = {"Behind", "current", "farm"}, state = false, group = {"chk1", "chk2"}, required = true, r = {"data", "back", "right"}},
			["chk3"] = {text = {"For", "melon", "or pumpkin"}, state = false, required = true, r = {"misc"}},
		}
	},
	
	["createFloorCeiling"] =
	{
		call = createFloorCeiling,
		title = "09-Place a floor or ceiling",
		description = "Placing floor or ceiling",
		fuel = "R.width * R.length",
		data = 
		{
			["chk1"] = {text = "Ceiling", state = false, r = "ceiling"},
			["chk2"] = {text = {"Remove", "& replace", "existing"}, state = true, group = {"chk2", "chk3"}, r = {"subChoice", 1, 2}},	-- use R.data and give value "chamber" if selected
			["chk3"] = {text = {"Overlay", "existing", ""}, state = false, group = {"chk2", "chk3"}, r = {"subChoice", 2, 1}},
			["chk4"] = {text = {"Random", "blocks", "pattern"}, state = false, group = {"chk4", "chk5", "chk6"}, r = {"data", "random", ""}},
			["chk5"] = {text = {"Striped", "blocks", "pattern"}, state = false, group = {"chk4", "chk5", "chk6"}, r = {"data", "striped", ""}},
			["chk6"] = {text = {"Checkboard", "blocks", "pattern"}, state = false, group = {"chk4", "chk5", "chk6"}, r = {"data", "checked", ""}},
			["lbl1"] = {text = "Width of floor / ceiling (1-64):"},
			["lbl2"] = {text = "Length of floor / ceiling (1-64):"},
			["lbl3"] = {text = "---Enter 0 for on-site placement---"},
			["lbl4"] = {text = "--If in deep water or above reach--"},
			["lbl5"] = {text = "Enter approx depth/height:"},
			["txt1"] = {text = "0", limits = {{0}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{0}, {64}}, r = "length"},
			["txt5"] = {text = "0", limits = {{0}, {64}}, r = "height"}
		},
		items =
[[~green~w * l   ~yellow~| stone
      ~yellow~| Mix multiple blocks to produce
      ~orange~| patterned ~brown~floors ~yellow~and ~cyan~ceilings
]],
		inventory =
		{
			{"stone", "R.width * R.length", true, ""}
		}
	},
	
	["createLadder"] =
	{
		call = createLadder,
		title = "01-Ladder up or down",
		fuel = "math.abs( R.upperLevel - R.lowerLevel ) * 2",
		description = "Creating ladder",
		items = 
[[~red~1     ~yellow~| ladder per level
~red~h * 4 ~yellow~| stone
~green~h / 4 ~yellow~| torches
~green~1     ~yellow~| bucket for lava refuel]],
		inventory =
		{
			{"minecraft:bucket", 1, false, ""},
			{"minecraft:ladder", "math.abs( R.upperLevel - R.lowerLevel )", true, ""},
			{"minecraft:torch", "math.abs(math.ceil(( R.upperLevel - R.lowerLevel ) / 3))", false, ""},
			{"stone", "math.abs( R.upperLevel - R.lowerLevel )", true, ""},
		},
		data = 
		{
			["chk1"] = {text = "In Nether?", state = false, u = {"bedrock", 0, -64}, r = "inNether"},
			["chk2"] = {text = "In Air?", state = false},
			["chk3"] = {text = "Build Base?", state = false, r = {"data", "chamber", ""}},	-- use R.data and give value "chamber" if selected
			--["chk4"] = {text = "Go UP?", state = false, group = {"chk4", "chk5"}, required = true, r = "goUp"},
			["chk4"] = {text = "Go UP?", state = false, group = {"chk4", "chk5"}, required = true, r = "up"},
			--["chk5"] = {text = "Go DOWN?", state = true, group = {"chk4", "chk5"}, required = true, r = "goDown"},
			["chk5"] = {text = "Go DOWN?", state = true, group = {"chk4", "chk5"}, required = true, r = "down"},
			["chk6"] = {text = {"Stop at","Stronghold","or Trial?"}, state = true, required = true, r = "auto"},
			["lbl1"] = {text = "Current level (F3):", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}},
			["lbl2"] = {text = "Go to level:", limits = {{"U.bedrock + 5"} , {"startLevel", 2}}},
			["txt1"] = {text = "0", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}, r = "startLevel", event = {"calculateHeight", "lbl2"}},
			["txt2"] = {text = "0", limits = {nil, nil}, r = "destinationLevel", event = {"calculateHeight", "lbl2"}}
		}
	},
	
	["createMine"] =
	{
		call = createMine,
		title = "03-Create mine at this level",
		description = "Creating a mine at this level",
		fuel = 960,
		items =
[[
~red~64    ~yellow~| stone
~red~1     ~yellow~| chest or barrel
~green~9    ~yellow~| torch
~green~1     ~yellow~| bucket
]],
		inventory =
		{
			{"minecraft:torch", 9, false, ""},
			{"minecraft:bucket", 1, false, ""},
			{"stone", 64, true, ""},
			{{"chest", "barrel"}, {1, 1}, {true, true}, {"", ""}}
		},
		data = 
		{
			["chk1"] = {text = "In Nether?", state = false, u = {"bedrock", 0, -64}, r = "inNether"},
			["lbl1"] = {text = "Width set to 33"},
			["lbl2"] = {text = "Length set to 33"},
			["lbl3"] = {text = "Torch spacing fixed pattern"},
		}
	},
	
	["createIceCanal"] =
	{
		call = createIceCanal,
		title = "04-Ice canal options",
		fuel = 2048,
		description = "Building ice canal",
		data = 
		{
			["chk1"] = {text = {"`black¬yellow`T`gray¬white`     `black¬yellow`T`gray¬white`  _",
								"`white¬brown` `white¬blue`~~`white¬brown`    `white¬lb`*`gray¬white` `white¬brown` ",
								"`white¬brown`          "},
								state = false,  group = {"chk1", "chk2", "chk4", "chk5"}, event = {"changeRValue", "inventoryKey", "1"}},
								
			["chk2"] = {text = {"`gray¬white` `black¬yellow`T`gray¬white`    _`black¬yellow`T`gray¬white` _",
								"`white¬brown` `white¬blue`~~`white¬brown`    `white¬lb`*`gray¬white` `white¬brown` ",
								"`white¬brown`          "},
								state = false,  group = {"chk1", "chk2", "chk4", "chk5"}, event = {"changeRValue", "inventoryKey", "2"}},
			
			["chk3"] = {text = {"Turtle","Places ice","below"} , state = false, event = {"changeRValue", "floor", "chk3"}},
			
			["chk4"] = {text = {"`gray¬white`  `black¬yellow`T`gray¬white`   _ `black¬yellow`T`gray¬white`_",
								"`white¬brown` `white¬blue`~~`white¬brown`    `white¬lb`*`gray¬white` `white¬brown` ",
								"`white¬brown`          "},
								state = true,  group = {"chk1", "chk2", "chk4", "chk5"}, event = {"changeRValue", "inventoryKey", "3"}},
								
			["chk5"] = {text = {"`gray¬white`   `black¬yellow`T`gray¬white`  _  `black¬yellow`T",
								"`white¬brown` `white¬blue`~~`white¬brown`    `white¬lb`*`gray¬white` `white¬brown` ",
								"`white¬brown`          "},
								state = false,  group = {"chk1", "chk2", "chk4", "chk5"}, event = {"changeRValue", "inventoryKey", "4"}},
			
			["chk6"] = {text = {"Convert", "existing","H2O canal"},	state = false, r = {"data", "convert", "new"}},
			
			["lbl1"] = {text = "Canal length (0 = continuous):"},
			["lbl2"] = {text = "Torch spacing? (0-64 default 9):"},
			["txt1"] = {text = "0", limits = {{0}, {512}}, r = "length"},
			["txt2"] = {text = "0", limits = {{0}, {64}}, event = {"changeRValue", "torchInterval", "txt2"}},
		},
		items =
[[~red~length ~yellow~| slabs
~green~length
 / 8  ~yellow~| stone (NOT bricks)
~orange~length
 / 2  ~yellow~| packed ice or blue ice
~green~1     ~yellow~| torch per 8 blocks
]],
		inventory =
		{
			["path"] =	-- 4 turtles, towpath only (positions 1 and 4)
			{
				{"slab", "R.length", true, "Add slabs to req length"},
			},
			["pathT"] =	-- 4 turtles, towpath only (positions 1 and 4) with torches
			{
				{"slab", "R.length", true, "Add slabs to req length"},
				{"stone", "math.ceil( R.length / R.torchInterval )", true, "NOT bricks!"},
				{"minecraft:torch", "math.ceil( R.length / R.torchInterval )", false, "if required"},
			},
			["ice"] =	-- 4 turtles ice only (positions 2 and 3)
			{
				{{"minecraft:packed_ice", "minecraft:blue_ice"}, {"math.ceil( R.length / 2)", "math.ceil( R.length / 2)"}, {false, false}, {"", ""}}
			},
		}
	}, 

	["createLadderToWater"] =
	{
		call = createLadderToWater,
		title = "09-Create ladder to water",
		description = "Creating a ladder to water",
		data =
		{
			["lbl1"] = {text = "Estimated height above water (F3):"},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "height"}
		},
		items =
[[	
~red~height ~yellow~| ladder
~red~3*
height
 + 10 ~yellow~| stone
]],
		inventory =
		{
			{"minecraft:ladder", "R.height", true, "Add more to be safe!"},
			{"stone", "R.height * 3 + 10", true, ""}
		}
	},

	["createMobFarmCube"] =
	{
		call = createMobFarmCube,
		title = "01-Spawner cube NOT blaze",
		description = "Building spawner cube",
		fuel = 600,
		data = 
		{			
			["chk1"] = {text = {"`lime¬gray`  chests  ",
								"`lime¬gray` present? ",
								"`lime¬gray` `white¬brown`C`lime¬gray`  `black¬magenta`S`lime¬gray`   `white¬brown`C`lime¬gray` "},
								state = false, r = {"data", "chest", "spawner"}},

			["lbl1"] = {text = "Dungeon external width:"},
			["lbl2"] = {text = "Dungeon external length:"},
			["lbl4"] = {text = "Place Turtle on external wall", bg = colors.black, fg = colors.lime, alignH = "centre"},
			["lbl5"] = {text = "at dungeon centre", bg = colors.black, fg = colors.lime, alignH = "centre"},
			["txt1"] = {text = "0", limits = {{7}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{7}, {64}}, r = "length"},
		},
		items =
[[~red~1     ~yellow~| slab
~green~500   ~yellow~| stone. Full cube = 700
~green~1     ~yellow~| chest (If chests inside)
]],
		inventory = 
		{
			--{{"slab","stone"}, {1, 3}, {true, true}, {"", "Slab can be crafted"}},
			{"slab", 1, true, ""},
			{"stone", 512, false, "Full cube ~700 blocks"},
			{"chest", 1, false, "if chests inside"}
		}
	},

	["createMobFarmCubeBlaze"] =
	{
		call = createMobFarmCubeBlaze,
		title = "04-Blaze spawner farm",
		description = "Building blaze spawner farm",
		fuel = 2500,
		data = 
		{
			["chk1"] = {text = {"Outside", "facing", "spawner"},	state = true, group = {"chk1", "chk2", "chk3"}, r = {"subChoice", 1, 0}},
			["chk2"] = {text = {"Turtle is","on top of", "spawner"},state = false, group = {"chk1", "chk2", "chk3"}, r = {"subChoice", 2, 0}},
			["chk3"] = {text = {"In room", "below", "spawner"},		state = false, group = {"chk1", "chk2", "chk3"}, r = {"subChoice", 3, 0}},
		},
		items =
[[	
~red~122   ~yellow~| slab
~green~576   ~yellow~| approx stone. Max = 700 blocks
]],
		inventory = 
		{
			{"slab", 122, true, ""},
			{"stone", 576, false, ""}
		}
	},

	["createMobBubbleLift"] =
	{	
		call = createMobBubbleLift,
		title = "03-Create mob bubble lift",
		description = "Creating mob bubble lift",
		fuel = "R.height * 6",
		data = 
		{
			["chk1"] = {text = {"Dropzone", "on left", "side"},  state = true,  group = {"chk1", "chk2"}, r = {"subChoice", 1, 2}},
			["chk2"] = {text = {"Dropzone", "on right", "side"}, state = false, group = {"chk1", "chk2"}, r = {"subChoice", 2, 1}},
		},
		items =
[[	
~red~6     ~yellow~| slab
~green~256   ~yellow~| stone. Full cube = 700 blocks
~red~2     ~yellow~| water bucket
~green~1     ~yellow~| soul sand if not present
~green~1     ~yellow~| hopper
~green~2     ~yellow~| chest (if hopper used)
]],
		inventory =
		{
			{"slab", 6, true, "can be crafted"},
			{"minecraft:water_bucket", 2, true, ""},
			{"stone", 256, true, ""},
			{"minecraft:soul_sand", 1, false, "If not present"},
			{"hopper", 1, false, ""},
			{"chest", 2, false, "Only with hopper"}
		}
	},
	
	["createPath"] =
	{
		call = createPath,
		title = "01-Path on air, water, lava",
		description = "Building continuous path",
		data =
		{
			["chk1"] = {text = {"Shorten", "existing", "first?"}, state = false, r = {"data", "reduce", ""}},
			["lbl1"] = {text = "Length? 0 = until solid block"},
			["lbl2"] = {text = "Torch spacing? (0-64)"},
			["txt1"] = {text = "0", limits = {{0}, {1024}}, r = "length"},
			["txt2"] = {text = "0", limits = {{0}, {64}}, r = "torchInterval"},
		},
		items =
[[	
~green~length~yellow~| stone
~green~1     ~yellow~| torch per 8 blocks
]],
		inventory =
		{
			{"stone", "R.length", false, ""},
			{"minecraft:torch", "math.floor( R.length / R.torchInterval )", false, ""}
		}
	},

	["createPlatform"] =
	{
		call = createPlatform,
		title = "05-Platform",
		description = "Building a platform",
		fuel = "R.width * R.length",
		data =
		{
			["chk1"] = {text = {"Remove","blocks", "above?"}, state = true, r = "up"},
			["lbl1"] = {text = "Platform Width (1 to 256):"},
			["lbl2"] = {text = "Platform Length (1 to 256):"},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1}, {256}}, r = "length"}
		},
		items = [[~red~l * w ~yellow~| stone or dirt]],
		inventory = 
		{
			{{"stone", "dirt"}, {"R.width * R.length", "R.width * R.length"}, {true, true}, { "", ""}}
		}
	},
	
	["createPortal"] =
	{
		call = createPortal,
		title = "03-Build Nether Portal",
		description = "Building nether portal",
		fuel = "R.length * R.height * R.width",
		data = 
		{
			["chk1"] = {text = {"Bury base", "at ground", "level"}, state = false, r = {"data", "bury", ""}},
			["chk2"] = {text = {"Turtle", "is facing", "portal"}, state = true, group = {"chk2", "chk3"}, r = {"side", "F", "E"}},
			["chk3"] = {text = {"Turtle is", "at side of", "portal"}, state = false, group = {"chk2", "chk3"}, r = {"side", "E", "F"}},
			["lbl1"] = {text = "Portal width (Usually 4)"},
			["lbl2"] = {text = "Portal height (Usually 5)"},
			["lbl3"] = {text = "Portal Depth (Usually 1)"},
			["txt1"] = {text = "4", limits = {{1}, {64}}, r = "length"},
			["txt2"] = {text = "5", limits = {{2} , {64}}, r = "height"},
			["txt3"] = {text = "1", limits = {{1} , {64}}, r = "width"}
		},
		items =
[[
~red~10    ~yellow~| obsidian	
~green~width ~yellow~| stone (economise obsidian)
]],
		inventory = 
		{
			{"obsidian", "( R.length - 2 + R.height - 2) * R.width * 2", true, ""},
			{"stone", "R.width * 4", true, ""}
		}
	},
	
	["createPortalPlatform"] =
	{
		call = createPortalPlatform,
		title = "10-Build end portal stage",
		description = "Building portal ladder & platform",
		fuel = 200,
		items =
[[	
~red~10-30 ~yellow~| ladder
~red~1     ~yellow~| trapdoor
~red~20-64 ~yellow~| stone
]],
		data = 
		{
			["chk1"] = {text = {"Click here","to assess", "height"}, state = false, event = {"executeCall", "findPortal", "inventory"}}
		},
		-- default inventory, this is altered in code after height is found 
		inventory = 
		{
			{"minecraft:ladder", 30, true, ""},
			{"stone", "R.height * 4 + 18", true, ""},
			{"trapdoor", 1, true, ""}
		}
	},
	
	["createRailway"] =
	{
		call = createRailway,
		title = "05-Build rail track slope",
		description = "Building slope",
		fuel = "R.height * 2",
		data = 
		{
			["chk1"] = {text = {"Build 45", "deg. slope","upwards"},	state = true,  group = {"chk1", "chk2"}, r = "up"},
			["chk2"] = {text = {"Build 45", "deg. slope","downwards"}, 	state = false, group = {"chk1", "chk2"}, r = "down"},
			["lbl1"] = {text = "Blocks up/down (0 = to ground):"},
			["lbl2"] = {text = "How much headroom (default 2):"},
			["txt1"] = {text = "0", limits = {{1}, {256}}, r = "height"},
			["txt2"] = {text = "2", limits = {{1} , {5}}, r = "depth"}
		},
		items =
[[	
~red~height
 * 2  ~yellow~| stone
]],
		inventory = 
		{
			{"stone", "R.height * 2", true, ""}
		}
	},
	
	["createRetainingWall"] =
	{
		call = createRetainingWall,
		title = "05-Solid wall in water",
		description = "Building retaining wall in water",
		fuel = "R.length * R.height",
		data = 
		{
			["lbl1"] = {text = "Length of the wall (1-64):"},
			["lbl2"] = {text = "Fixed depth or 0 = to ocean floor:"},
			["txt1"] = {text = "0", limits = {{1}, {64}}, r = "length"},
			["txt2"] = {text = "0", limits = {{1} , {64}}, r = "depth"}
		},
		items =
[[	
~red~height~yellow~| 
~red~ *    ~yellow~|  
~red~length ~yellow~| stone
]],
		inventory =
		{
			{"stone", "R.length * R.depth", false, ""}
		}
	},
	
	["createSafeDrop"] =
	{
		call = createSafeDrop,
		fuel = "math.abs( R.upperLevel - R.lowerLevel ) * 2",
		title = "04-Safe drop to water block",
		description = "Creating safe drop $ R.height $ blocks deep",
		items =
[[~green~h * 4 ~yellow~| stone
~red~1     ~yellow~| water bucket
]],
		inventory = 
		{
			{"minecraft:water_bucket", 1, true, ""},
			{"stone", "math.abs( R.upperLevel - R.lowerLevel )", false, ""} -- estimate only
		},
		data =
		{
			["lbl1"] = {text = "Current level (F3):"},
			["lbl2"] = {text = "Go down to level:"},
			["txt1"] = {text = "0", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}, r = "startLevel", event = {"calculateHeight", "lbl2"}},
			["txt2"] = {text = "0", limits = {nil, nil}, r = "destinationLevel", event = {"calculateHeight", "lbl2"}}
		}
	},
	
	["createSandWall"] =
	{
		call = createSandWall,
		title = "01-Create sand wall",
		description = "Creating sand wall in water",
		fuel = 200,
		data =
		{
			["lbl1"] = {text = "Length of sand wall 0 = auto:"},
			["txt1"] = {text = "0", limits = {{0}, {64}}, r = "length"}
		},
		items =
[[	
~red~1024  ~yellow~| sand or gravel. Mix ok
]],
		inventory =
		{
			{{"sand", "gravel"}, {1024, 1024}, {false, false}, { "Fill inventory use both", ""}},
		}
	},

	["createSlopingWater"] =
	{
		call = createSlopingWater,
		title = "11-Create sloping water",
		description = "Creating sloping water",
		data = 
		{
			["lbl1"] = {text = "Water slope width (usually 7/8):"},
			["lbl2"] = {text = "Water slope length:"},
			["txt1"] = {text = "0", limits = {{1}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1} , {64}}, r = "length"}
		},
		items =
[[	
~red~12    ~yellow~| buckets or water buckets
length ~yellow~| 
~red~ *    ~yellow~| 
~red~width ~yellow~| slabs
]],
		inventory =
		{
			{{"water_bucket", "bucket"}, {12, 12}, {true, true}, { "", ""}},
			{"slab", "R.length * R.width", true, ""}
		}
	},
	
	["createSinkingPlatform"] =
	{
		call = createSinkingPlatform,
		title = "06-Sinking platform",
		fuel = "R.width * R.length * R.height",
		description = "Building sinking platform",
		data =
		{
			["lbl1"] = {text = "Width (excluding retaining wall):"},
			["lbl2"] = {text = "Length (excluding retaining wall):"},
			["lbl3"] = {text = "Levels to go down:"},
			["txt1"] = {text = "0", limits = {{1}, {1024}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1}, {1024}}, r = "length"},
			["txt3"] = {text = "0", limits = {{1}, {"U.ceiling - 2"}}, r = "height"}
		},
		items =
[[	
~red~w * l ~yellow~| stone
]],
		inventory =
		{
			{"stone", "( R.width * R.length ) + ( R.length * R.height * 2) + ( R.width * R.height * 2)", true, ""}
		}
	},

	["createStaircase"] = 
	{
		call = createStaircase,
		title = "02-Stairs up or down",
		fuel = "math.abs( R.upperLevel - R.lowerLevel ) * 4",
		description = "Creating staircase $math.abs( R.destinationLevel - R.startLevel )$ blocks high",
		items =
[[~orange~2     ~yellow~| slabs per level
~red~h     ~yellow~| stone for spine
]],
		inventory = 
		{
			{"slab", "math.abs( R.destinationLevel - R.startLevel ) * 2", false, ""},
			{"stone", "math.abs( R.destinationLevel - R.startLevel )", true, "for centre column"}
		},
		data = 
		{
			["chk1"] = {text = "In Nether?", state = false, u = {"bedrock", 0, -64}},
			["chk2"] = {text = "In Air?", state = false},
			["chk3"] = {text = "Build Base?", state = false, r = {"data", "chamber", ""}},	-- use R.data and give value "chamber" if selected
			["chk4"] = {text = "Go UP?", state = false, group = {"chk4", "chk5"}, required = true, r = "up"},
			["chk5"] = {text = "Go DOWN?", state = true, group = {"chk4", "chk5"}, required = true, r = "down"},
			["chk6"] = {text = {"Stop at","Stronghold","or Trial?"}, state = true, required = true, r = "auto"},
			["lbl1"] = {text = "Current level (F3):", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}},
			["lbl2"] = {text = "Go to level:", limits = {{"U.bedrock + 5"} , {"startLevel", 2}}},
			["txt1"] = {text = "0", limits = {{"U.bedrock + 5"}, {"U.ceiling"}}, r = "startLevel", event = {"calculateHeight", "lbl2"}},
			["txt2"] = {text = "0", limits = {nil, nil}, r = "destinationLevel", event = {"calculateHeight", "lbl2"}}
		}
	},
	
	["createStripMine"] =
	{
		call = createStripMine,
		title = "05-Stripmine Netherite",
		description = "Stripmining Netherite",
		items =
[[	
~red~l * 4 ~yellow~| stone
~red~64    ~yellow~| cobble for chunk boundaries
~green~1     ~yellow~| bucket for fuel
~green~2     ~yellow~| torch per 16 blocks
]],
		inventory =
		{
			{"stone", "R.length * 4", true, ""},
			{"cobble", "math.floor( R.length / 16) * 4", true, "For Chunk boundaries"},
			{{"minecraft:bucket", "minecraft:lava_bucket"}, {1, 1}, {false, false}, { "For refuelling", ""}},
			{"minecraft:torch", "math.floor( R.length / 8)", false, ""}
		},
		data = 
		{
			["lbl1"] = {text = "Strip length (divisible by 16)"},
			["txt1"] = {text = "16", limits = {{16}, {512}}, r = "length"},
		}
	},

	["convertTreeFarm"] =
	{
		call = convertTreeFarm,
		title = "07-Convert Tree Farm",
		description = "Converting tree farm",
		items =
[[	
~red~1     ~yellow~| log to indicate sapling type
~red~2     ~yellow~| barrels
~red~1     ~yellow~| hopper
~red~8     ~yellow~| chests 
~red~3     ~yellow~| full wired modems
~red~24    ~yellow~| computercraft cable
]],
		inventory = 
		{
			{"log", 1, true, "Use log to indicate sapling type"},
			{"barrel", 2, true, ""},
			{"minecraft:hopper", 1, true, ""},
			{"chest", 8, true, ""},
			{"wired_modem_full", 3, true, ""},
			{"computercraft:cable", 24, true, ""}
		}
	},
	
	["createTreefarm"] =
	{
		call = createTreefarm,
		title = "02-Create or extend tree farm",
		description = "Creating tree farm",
		fuel = 900,
		items =
[[	
~red~320   ~yellow~| stone
~red~4     ~yellow~| water buckets
~red~1     ~yellow~| hopper
~red~1     ~yellow~| log to indicate sapling type
~red~2     ~yellow~| barrels
~red~8     ~yellow~| chests if adding storage
~red~2-3   ~yellow~| full wired modems + storage=3
~red~21-34 ~yellow~| computercraft cable
~green~6     ~yellow~| ladders
~green~16    ~yellow~| dirt if none in area
]],
		inventory =
		{
			["new"] =
			{
				{"stone", 320, true, ""},
				{"minecraft:water_bucket", 4, true, ""},
				{"minecraft:hopper", 1, true, ""},
				{"log", 1, true, "Log = sapling type"},
				{"minecraft:barrel", 2, true, ""},
				{"chest", 8, false, "if adding storage"},
				{"modem", 3, false, "2 if NOT adding storage"},
				{"computercraft:cable", 21, false, ""},
				{"ladder", 6, false, "access to basement"},
				{"dirt", 16, false, "if none in this area"}
			},
			["back"] =
			{
				{"stone", 320, true, ""},
				{"minecraft:water_bucket", 4, true, ""},
				{"minecraft:hopper", 1, true, ""},
				{"log", 1, true, "Log = sapling type"},
				{"minecraft:barrel", 2, true, ""},
				{"modem", 3, false, "2 if NOT adding storage"},
				{"computercraft:cable", 34, false, ""},
				{"dirt", 16, false, "if none in this area"}
			},
			["left"] =
			{
				{"stone", 320, true, ""},
				{"minecraft:water_bucket", 4, true, ""},
				{"minecraft:hopper", 1, true, ""},
				{"log", 1, true, "Log = sapling type"},
				{"minecraft:barrel", 2, true, ""},
				{"modem", 3, false, "2 if NOT adding storage"},
				{"computercraft:cable", 21, false, ""},
				{"ladder", 6, false, "access to basement"},
				{"dirt", 16, false, "if none in this area"}
			},
			["right"] =
			{
				{"stone", 320, true, ""},
				{"minecraft:water_bucket", 4, true, ""},
				{"minecraft:hopper", 1, true, ""},
				{"log", 1, true, "Log = sapling type"},
				{"minecraft:barrel", 2, true, ""},
				{"modem", 3, false, "2 if NOT adding storage"},
				{"computercraft:cable", 21, false, ""},
				{"ladder", 6, false, "access to basement"},
				{"dirt", 16, false, "if none in this area"}
			},
		},
		data = 
		{
			["chk1"] = {text = {"`red¬gray`New farm`lg¬gray`  ", "Start here", "(L corner)"} ,state = true,  group = {"chk1", "chk2", "chk4", "chk5"}, r = {"inventoryKey", "new", ""}},
			["chk2"] = {text = {"`blue¬lg`Left `gray¬lg`side ", "of current","tree farm "}, state = false, group = {"chk1", "chk2",  "chk4", "chk5"}, r = {"inventoryKey", "left", ""}},
			["chk3"] = {text = {"`lg¬gray`Include   ","`red¬gray`network`lg¬gray`   ", "storage   "},	state = false, r = "goDown"},
			["chk4"] = {text = {"`brown¬lg`Behind`gray¬lg`    ", "current   ","tree farm "},	 	state = false, group = {"chk1", "chk2", "chk4", "chk5"}, r = {"inventoryKey", "back", ""}},
			["chk5"] = {text = {"`green¬gray`Right `lg¬gray`side","of current","tree farm "}, state = false, group = {"chk1", "chk2", "chk4", "chk5"}, r = {"inventoryKey", "right", ""}},
			["chk6"] = {text = {"`gray¬lg`Clear `brown¬lg`land","`gray¬lg`and `lime¬lg`trees ", "`gray¬lg`first     "},	state = false, r = "up"},
		},
	},

	["createTrialCover"] =
	{
		call = createTrialCover,
		title = "06-Surround trial spawner",
		description = "Surrounding trial spawner",
		fuel = 200,
		items =
[[	
~red~55    ~yellow~| stone
~red~2     ~yellow~| slab
]],
		inventory =
		{
			{"stone", 55, true, ""}, -- for covering spawner
			{"slab", 2, true, ""} -- for reducing exit
		}
	},
		
	["createWaterCanal"] =
	{
		call = createWaterCanal,
		title = "03-Water canal options",
		description = "Building a water canal",
		fuel = 2048,
		data = 
		{
			["chk1"] = {text = {"`gray¬white`   `black¬yellow`T`gray¬white`      ",
								"`white¬brown`    `white¬blue`~~`white¬brown`    ",
								"`white¬brown`          "},
								state = true,  group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, event = {"changeRValue", "inventoryKey", "1"}},
								
			["chk2"] = {text = {"`gray¬white`    `black¬yellow`T`gray¬white`     ",
								"`white¬brown`    `white¬blue`~~`white¬brown`    ",
								"`white¬brown`          "},
								state = false,  group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, event = {"changeRValue", "inventoryKey", "2"}},
								
			["chk3"] = {text = {"`gray¬white`     `black¬yellow`T`gray¬white`    ",
								"`white¬brown`    `white¬blue`~~`white¬brown`    ",
								"`white¬brown`          "},
								state = false,  group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, event = {"changeRValue", "inventoryKey", "3"}},
								
			["chk4"] = {text = {"`gray¬white`      `black¬yellow`T`gray¬white`   ",
								"`white¬brown`    `white¬blue`~~`white¬brown`    ",
								"`white¬brown`          "},
								state = false,  group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, event = {"changeRValue", "inventoryKey", "4"}},
								
			["chk5"] = {text = {"`gray¬white`           ",
								"`white¬brown`    `black¬yellow`T`white¬blue`~`white¬brown`    ",
								"`white¬brown`          "},
								state = false,  group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, event = {"changeRValue", "inventoryKey", "5"}},
								
			["chk6"] = {text = {"`gray¬white`          ",
								"`white¬brown`     `white¬blue`~`black¬yellow`T`white¬brown`    ",
								"`white¬brown`          "},
								state = false,  group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, event = {"changeRValue", "inventoryKey", "6"}},
			
			["lbl1"] = {text = "How many Turtles? 2 or 4:"},
			["lbl2"] = {text = "Canal length? (0 = continuous):"},
			["lbl3"] = {text = "Torch spacing? (0-64 default 9):"},
			["txt1"] = {text = "2", limits = {{2} , {4}}, event = {"changeRValue", "turtleCount", "txt1"}},
			["txt2"] = {text = "0", limits = {{0} , {512}}, r = "length"},
			["txt3"] = {text = "0", limits = {{0} , {64}}, event = {"changeRValue", "torchInterval", "txt3"}}
		},
		items =
[[	
~orange~length ~yellow~| slabs (towpath or 2 turtle)
~orange~length ~yellow~| stone (all parts)
~orange~2      ~yellow~| water buckets (water / 2 turtle)
~green~1      ~yellow~| torch/9 blocks (path / 2 turtle)
]],
		inventory =
		{
			["4path"] =	-- 4 turtles, towpath only (positions 1 and 4)
			{
				{"slab", "R.length", true, ""}
			},
			["4pathT"] =	-- 4 turtles, towpath only (positions 1 and 4) with torches
			{
				{"slab", "R.length", true, ""},
				{"stone", "math.ceil( R.length / R.torchInterval )", false, ""},
				{"minecraft:torch", "math.ceil( R.length / R.torchInterval )", false, ""}
			},
			["4water"] =	-- 4 turtles water only (positions 2 and 3)
			{
				{"stone", "R.length", false, ""},
				{"minecraft:water_bucket", 2, false, ""},
			},
			["2"] =	-- 2 turtles, make canal and towpath
			{
				{"slab", "R.length", true, ""},
				{"stone", "R.length", false, ""},
				{"minecraft:water_bucket", 2, false, ""},
			},
			["2T"] =	-- 2 turtles, make canal and towpath with torches
			{
				{"slab", "R.length", true, ""},
				{"stone", "R.length", false, ""},	-- need stone for canal base
				{"minecraft:torch", "math.ceil( R.length / R.torchInterval )", false, ""},
				{"minecraft:water_bucket", 2, false, ""},
			},
		}
	},
	
 	["deactivateDragonTower"] = {call = deactivateDragonTower, title = "07-Deactivate Dragon Tower"},
	["demolishPortal"] =
	{
		call = demolishPortal,
		title = "04-Demolish Nether Portal",
		description = "Demolishing nether portal",
		fuel = 20,
		data = 
		{
			["chk1"] = {text = {"Base is", "buried in", "ground"}, state = false, r = {"data", "bury", ""}},
			["chk2"] = {text = {"Turtle", "is facing", "portal"}, state = true, group = {"chk2", "chk3"}, r = {"side", "F", "E"}},
			["chk3"] = {text = {"Turtle is", "at side of", "portal"}, state = false, group = {"chk2", "chk3"}, r = {"side", "E", "F"}},
			["lbl1"] = {text = "Portal width (Usually 4)"},
			["lbl2"] = {text = "Portal height (Usually 5)"},
			["lbl3"] = {text = "Thickness (Usually 1)"},
			["txt1"] = {text = "4", limits = {{1}, {64}}, r = "length"},
			["txt2"] = {text = "5", limits = {{2} , {64}}, r = "height"},
			["txt3"] = {text = "1", limits = {{1} , {64}}, r = "width"}
		},
	},

	["digTrench"] =
	{
		call = digTrench,
		title = "07-Dig a trench",
		description = "Digging trench",
		fuel = "R.height * R.length * 2",
		data = 
		{
			["lbl1"] = {text = "Trench length? 0 = continuous:"},
			["lbl2"] = {text = "Depth of the trench (1-64):"},
			["txt1"] = {text = "0", limits = {{1}, {1024}}, r = "length"},
			["txt2"] = {text = "0", limits = {{1} , {64}}, r = "height"}
		}
	},
	
	["drainWaterLava"] =
	{
		call = drainWaterLava,
		title = "06-Drain Water or Lava",
		description = "Draining water or lava",
		fuel = 2000,
		items =
[[	
~green~256   ~yellow~| stone
]],
		inventory =
		{
			{"stone", 256, false, ""}
		},
		data = 
		{
			["chk1"] = {text = {"Retaining", "walls are", "present"}, state = true, r = {"data", "enclosed", ""}},
			["lbl1"] = {text = "Width of water/lava? (0 = auto)"},
			["lbl2"] = {text = "Length of water/lava (0 = auto):"},
			["lbl3"] = {text = "Depth of water/lava (0 = auto):"},
			["txt1"] = {text = "0", limits = {{1} , {256}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1}, {256}}, r = "length"},
			["txt3"] = {text = "0", limits = {{1} , {256}}, r = "height"}
		}
	},
	
	["earlyExit"] = {call = earlyExit},
	
	["fellTree"] =
	{
		call = fellTree,
		title = "01-Fell Tree",
		description = "Tree Cutting...",
		items = [[~green~1     ~yellow~| chest if fuel is low]]
	},
	
	["findPortal"] = {call = findPortal, title = "Find End Portal"},
	["findSeabed"] = {call = findSeabed, title = "Find Water Depth"},
	
	["floodArea"] =
	{
		call = floodArea,
		title = "10-Flood rectangular area",
		description = "Flooding rectangular area",
		data =
		{
			["lbl1"] = {text = "Water width:"},
			["lbl2"] = {text = "Water length:"},
			["lbl3"] = {text = "Water depth:"},
			["txt1"] = {text = "0", limits = {{0}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{0}, {64}}, r = "length"},
			["txt3"] = {text = "0", limits = {{0}, {64}}, r = "depth"}
		},
		items =
[[~red~4     ~yellow~| water buckets
]],
		inventory =
		{
			{"water_bucket", 4, true, ""},
		}
	},
	
	["floodMobFarm"] =
	{
		call = floodMobFarm,
		title = "02-Flood mob farm floor",
		description = "Flooding mob farm floor",
		data = 
		{
			["chk1"] = {text = {"Killer", "Turtle","grinder"}, 	state = true, group = {"chk1", "chk2"}, r = {"inventoryKey", "turtle", "lift"}},
			["chk2"] = {text = {"Bubble","column","grinder"}, 	state = false,  group = {"chk1", "chk2"}, r = {"inventoryKey",  "lift", "turtle"}},
		},
		items =
[[	
~red~2     ~yellow~| water buckets
~green~2     ~yellow~| fence (Bubble lift only)
~green~2     ~yellow~| sign (Bubble lift only)
~green~1     ~yellow~| slab (Bubble lift only)
~green~1     ~yellow~| soul sand or dirt (Bubble lift only)
]],
		inventory =
		{
			["turtle"] =
			{
				{"minecraft:water_bucket", 2, true, ""},
			},
			["lift"] =
			{
				{"minecraft:water_bucket", 2, true, ""},
				{"fence", 2, false, ""},
				{"sign", 2, false, ""},
				{"slab", 1, false, ""},
				{{"minecraft:soul_sand", "minecraft:dirt"}, {1, 1}, {false, false}, {"dirt = placeholder", ""}}
			},
		}
	},
	
	["harvestObsidian"] =
	{
		call = harvestObsidian,
		title = "02-Dig obsidian field",
		description = "Digging obsidian field",
		fuel = "R.width * R.length * 3",
		items =
[[	
~green~w * l ~yellow~| stone
~green~1     ~yellow~| bucket for fuel
]],
		inventory =
		{
			{"stone", "R.width * R.length", false, ""},
			{"bucket", 1, false, ""},
		},
		data = 
		{
			["lbl1"] = {text = "Width of the area (2-64) "},
			["lbl2"] = {text = "Length of the area (2-64) "},
			["txt1"] = {text = "0", limits = {{1}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1} , {64}}, r = "length"},
		}
	},
	
	["harvestShulkers"] =
	{
		call = harvestShulkers,
		title = "11-Shulker harvester",
		description = "Collecting Shulkers",
		data = 
		{
			["chk1"] = {text = {"Shulker is", "above the", "turtle"}, 	state = true,  group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, r = {"subChoice", 1, 0}},
			["chk2"] = {text = {"Shulker is", "in front", "of turtle"}, state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, r = {"subChoice", 2, 0}},
			["chk3"] = {text = {"Shulker is", "below the", "turtle"}, 	state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, r = {"subChoice", 3, 0}},
			["chk4"] = {text = {"From pit", "up then", "down"}, 	state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, r = {"subChoice", 4, 0}},
			["chk5"] = {text = {"Go to roof", "clear and", "return"},	state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, r = {"subChoice", 5, 0}},
			["chk6"] = {text = {"Clear all", "outside", "walls"},		state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5", "chk6"}, r = {"subChoice", 6, 0}},
		}
	},

	["harvestTreeFarm"] = 
	{
		call = harvestTreeFarm,
		title = "04-Harvest tree farm",
		data = nil
	},
	
	["lavaRefuel"] =
	{
		call = lavaRefuel,
		title = "01-Refuel from lava lake",
		description = "Refuelling from lava lake",
		fuel = 0,
		items = [[~red~1     ~yellow~| bucket or lava bucket]],
		inventory =
		{
			{{"bucket", "lava_bucket"}, {1, 1}, {true, true}, {"lava if 0 fuel", ""}}
		},
		data = 
		{
			["chk1"] = {text = {"Lava is", "mostly on", "left side"}, 	state = true,  group = {"chk1", "chk2", "chk3"}, r = {"side", "L", ""}},
			["chk2"] = {text = {"Single", "strip ahead", "only"}, 	state = false,  group = {"chk1", "chk2", "chk3"}, r = {"side", "C", ""}},
			["chk3"] = {text = {"Lava is", "mostly on", "right side"}, 	state = false,  group = {"chk1", "chk2", "chk3"}, r = {"side", "R", ""}},
		}
	},
	
	["makeMud"] =
	{
		call = makeMud,
		title = "09-Make Mud / Clay",
		description = "Making mud or clay",
		fuel = 120,
		items =
[[	
~red~1     ~yellow~| glass bottle or potion
~green~100   ~yellow~| dirt max 100 for clay
]],
		inventory =
		{
			{"bottle", 1, true, "empty/full"},
			{"dirt", 100, false, ""},
		},
		data = 
		{
			["chk1"] = {text = {"Make", "mud", "blocks"},     state = true, r = "misc"},
			["chk2"] = {text = {"Manage", "clay" , "blocks"}, state = false,  r = "auto"},
			["lbl1"] = {text = "How many blocks? clay=100"},
			["txt1"] = {text = "0", limits = {{1}, {960}}, r = "size"},
		}
	},
	
	["manageFarmSetup"] =
	{
		call = manageFarmSetup,
		title = "03-Manage farm",
		description = "Managing farm",
		data = 
		{
			["chk1"] = {text = {"Plant or", "harvest", "this farm"}, 	state = true,  group = {"chk1", "chk2"}, r = {"inventoryKey", "farm", ""}},
			["chk2"] = {text = {"Autostart", "enable or" , "disable"}, 	state = false, group = {"chk1", "chk2"}, r = {"inventoryKey", "auto", ""}},
		}
	},
	
	["measureDeepest"] =
	{
		call = measureDeepest,
		title = "04-Measure greatest depth",
		description = "Measuring greatest depth",
		data = 
		{
			["lbl1"] = {text = "Water length (0 = auto detect):"},
			["txt1"] = {text = "0", limits = {{0} , {256}}, r = "length"}
		}
	},
	
	["measureDepth"] =
	{
		call = measureDepth,
		title = "02-Measure depth",
		description = "Measuring depth",
		data = 
		{
			["chk1"] = {text = {"Until H2O", "obstructed", "lava below"}, 	state = true,  group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 1, 0}},
			["chk2"] = {text = {"Until", "no blocks","in front"},	state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 2, 0}},
			["chk3"] = {text = {"Block in","front", "changes"}, 	state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 4, 0}},
			["chk4"] = {text = {"Search for", "block in", "front"}, state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 3, 0}},
			["lbl1"] = {text = "Find? eg 'ore'", width = 26},
			["txt1"] = {text = "", x = 27, width = 13, numbersOnly = false, r = "data"}
		}
	},
	
	["measureHeight"] =
	{
		call = measureHeight,
		title = "01-Measure height",
		description = "Measuring height",
		data = 
		{
			["chk1"] = {text = {"Until", "obstructed", "above"}, state = true,  group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 1, 0}},
			["chk2"] = {text = {"Until", "no blocks","in front"},state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 2, 0}},
			["chk3"] = {text = {"Block in","front", "changes"}, 	state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 4, 0}},
			["chk4"] = {text = {"Search for", "block in", "front"}, state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 3, 0}},
			["lbl1"] = {text = "Find? eg 'ore'", width = 26},
			["txt1"] = {text = "", x = 27, width = 13, numbersOnly = false, r = "data"}
		}
	},
	
	["measureLength"] =
	{
		call = measureLength,
		title = "03-Measure length",
		description = "Measuring length",
		data = 
		{
			["chk1"] = {text = {"Until", "obstructed", "ahead"}, state = true,  group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 1, 0}},
			["chk2"] = {text = {"Until", "no blocks", "above"},state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 2, 0}},
			["chk3"] = {text = {"Until", "no blocks", "below"},state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 3, 0}},
			["chk4"] = {text = {"Search for", "block", "above"}, state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 4, 0}},
			["chk5"] = {text = {"Search for", "block", "below"}, state = false, group = {"chk1", "chk2", "chk3", "chk4", "chk5"}, r = {"subChoice", 5, 0}},
			["lbl1"] = {text = "Max distance to travel before abort?"},
			["lbl2"] = {text = "Find? eg 'ore'", width = 26},
			["txt1"] = {text = "64", limits = {{2}, {64}}, r = "size"},
			["txt2"] = {text = "", x = 27, width = 13, numbersOnly = false, r = "data"}
		}
	},
	
	["mineBedrockArea"] =
	{
		call = mineBedrockArea,
		fuel = "R.width * R.length",
		title = "08-Mine bedrock level",
		items =
[[~red~64    ~yellow~| stone
~green~1     ~yellow~| bucket for lava refuelling]],
		inventory =
		{
			{"stone", 64, true, ""},
			{"minecraft:bucket", 1, false, ""}
		},
		data =
		{
			["chk1"] = {text = {"Leave all",
								"Bedrock", "exposed?"},
								state = true, group = {"chk1", "chk2"}, r = {"data", "leaveExposed", "cover"}},
			["chk2"] = {text = {"Cover all",
								"Bedrock", "after mine"},
								state = false, group = {"chk1", "chk2"}, r = {"data", "cover", "leaveExposed"}},
			["lbl1"] = {text = "Width (2-64, default 17):"},
			["lbl2"] = {text = "Length (2-64, default 17):"},
			["txt1"] = {text = "17", limits = {{2}, {64}}, r = "width"},
			["txt2"] = {text = "17", limits = {{2}, {64}}, r = "length"}
		}
	},
	
	["oceanMonumentColumns"] =
	{
		call = oceanMonumentColumns,
		title = "07-Ocean Monument corner columns",
		description = "Building Ocean Monument framework",
		fuel = 250,
		items =
[[	
~green~448   ~yellow~| stone
]],
		inventory =
		{
			{"stone", 448, true, ""}
		}
	},
	
	["placeRedstoneTorch"] =
	{
		call = placeRedstoneTorch,
		title = "06-Place trackside rs torch",
		description = "Placing rs:torch next to track",
		data =
		{
			["chk1"] = {text = {"Track is","level", "here"}, state = true, group = {"chk1", "chk2"}, r = {"data", "level", "up"}},
			["chk2"] = {text = {"Track is","going up", "or down"}, state = true, group = {"chk1", "chk2"}, r = {"data", "up", "level"}},
		},
		items =
[[	
~red~1     ~yellow~| stone
~red~1     ~yellow~| redstone torch
]],
		inventory =
		{
			{"stone", 1, true, ""},
			{"minecraft:redstone_torch", 1, true, ""}
		}
	},
	
	["plantTreefarm"] =
	{
		-- currently MainMenu.lua calls execute BEFORE data and inventory are used. 
		call = plantTreefarm,
		title = "03-Plant tree farm",
		description = "Planting tree farm",
		items =
[[	
~red~16    ~yellow~| dirt
~green~16    ~yellow~| saplings (single type only)
]],
		inventory =
		{
			{"minecraft:dirt", 16, true, ""},
			{"sapling", 16, false, "Do not mix!"}
		},
		data =
		{
			["chk1"] = {text = "16 single?", state = true, group = {"chk1", "chk2"}, r = {"subChoice", 1, 2}},
			["chk1"] = {text = "4 double?", state = true, group = {"chk1", "chk2"}, r = {"subChoice", 2, 1}},
			["lbl1"] = {text = "single = oak, birch, spruce    "},
			["lbl2"] = {text = "single = acacia, cherry        "},
			["lbl3"] = {text = "double = spruce,dark oak,jungle"}
		}
	},
	
	["quickMine"] =
	{
		call = quickMine,
		fuel = "R.width * R.length",
		title = "07-QuickMine rectangle",
		description = "Mining access rectangle",
		items =
[[~orange~64    ~yellow~| stone
~green~1     ~yellow~| bucket for lava refuel
~green~24    ~yellow~| torches
]],
		inventory =
		{
			{"stone", 64, true, ""},
			{"minecraft:bucket", 1, false, ""}
		},
		data =
		{
			["chk1"] = {text = {"`lg¬gray` `lg¬white` `lg¬brown`**mine**",
								"`lg¬gray` `lg¬white` `lg¬brown`**here**",
								"`lg¬white` `white¬red`^`lg¬white` -start "}, state = true, group = {"chk1", "chk2", "chk3"}, r = {"direction", "R1F1L1F1", ""}},
			["chk2"] = {text = {"`lg¬gray` `lg¬white` `lg¬brown`**mine**",
								"`lg¬gray` `lg¬white` `lg¬brown`**here**",
								"`lg¬white`  `white¬red`^`lg¬white` -start"}, state = false, group = {"chk1", "chk2", "chk3"}, r = {"direction", "F1", ""}},
			["chk3"] = {text = {"`lg¬gray` `lg¬white` `lg¬brown`**mine**",
								"`lg¬gray` `lg¬white` `white¬red`^`lg¬brown`*here**",
								"`lg¬white`   -start "}, state = false, group = {"chk1", "chk2", "chk3"}, r = {"direction", "", ""}},
			["lbl1"] = {text = "Width (2-64, default 15):"},
			["lbl2"] = {text = "Length (2-64, default 15):"},
			["txt1"] = {text = "15", limits = {{2}, {64}}, r = "width"},
			["txt2"] = {text = "15", limits = {{2}, {64}}, r = "length"}
		}
		
	},
	
	["quickMineCorridor"] =
	{
		call = quickMineCorridor,
		fuel = "( R.width * 2 + R.length * 2) * 2",
		title = "06-QuickMine corridor system",
		description = "QuickMine corridor: ~R.width~ x ~R.length~",
		items =
[[~orange~64    ~yellow~| stone
~green~1     ~yellow~| bucket for lava refuel
~green~8    ~yellow~| torches
]],
		inventory = 
		{
			{"stone", "R.width * 2 + R.length * 2", false, ""},
			{"minecraft:torch", "math.ceil ( ( R.width + R.length ) * 2  / R.torchInterval )", false, ""},
			{"minecraft:bucket", 1, false, ""}
		},
		data =
		{
			["chk1"] = {text = "Start Here", state = true,  group = {"chk1", "chk2"}, r = {"direction", "", "F1"}},
			["chk2"] = {text = "Go forward", state = false, group = {"chk1", "chk2"}, r = {"direction", "F1", ""}},
			["lbl1"] = {text = "Width (2-64, default 17):"},
			["lbl2"] = {text = "Length (2-64, default 17):"},
			["lbl3"] = {text = "Torch spacing? (0 - 32, default 9):"},
			["txt1"] = {text = "17", limits = {{2}, {64}}, r = "width"},
			["txt2"] = {text = "17", limits = {{2} , {64}}, r = "length"},
			["txt3"] = {text = "9", limits = {{0} , {33}}, r = "torchInterval"}
		}
	},
	
	["sandFillArea"] =
	{
		call = sandFillArea,
		title = "03-Fill area with sand",
		description = "Filling area with sand",
		items =
[[	
~green~1024   ~yellow~| sand or gravel
]],
		data = 
		{
			["lbl1"] = {text = "Width of area (1 to 64):"},
			["lbl2"] = {text = "Length of of area (1 to 64):"},
			["txt1"] = {text = "0", limits = {{1}, {64}}, r = "width"},
			["txt2"] = {text = "0", limits = {{1} , {64}}, r = "length"}
		},
		inventory =
		{
			{{"sand", "gravel"}, {1024, 1024}, {false, false}, {"", ""}}
		}
	},
	
	["undermineDragonTowers"] =
	{
		call = undermineDragonTowers,
		fuel = 500,
		title = "06-Undermine Dragon Towers",
		description = "Undermining Dragon Towers",
		items =
[[	
~green~84    ~yellow~| cobble or deepslate
]],
		inventory = 
		{
			{{"minecraft:cobblestone", "minecraft:cobbled_deepslate"}, {84, 84},  {true, true}, {"", ""}},
		},
		data = 
		{
			["lbl1"] = {text = "Place turtle on the ground facing", bg = colors.black, fg = colors.lime, alignH = "centre"},
			["lbl2"] = {text = "west, coordinates x = 0, z = 0", bg = colors.black, fg = colors.lime, alignH = "centre"}
		}
	},
	
	["updateLists"] =
	{
		call = updateLists,
		title = "02-Update Network Database",
		description = "Updating Network Storage Database"
	},
	
	["upgradeFarmland"] =
	{
		call = upgradeFarmland,
		title = "07-Upgrade MA (MOD) soil type",
		description = "Upgrading MA (MOD) soil type",
		items = "~orange~64    ~yellow~| Mystical Agriculture essence",
		inventory =
		{
			{"essence", 95, false, ""}
		}
	}
}
