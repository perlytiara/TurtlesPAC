local version = 20260116.1600
-- display help about selected task
-- terminal size = 39 x 13
--[[This line of text = 39 characters]]
local help = {}
--help.main = {}
--help.sub = {}
help["1+0"] =
[[~white~Can be used in any dimension.~brown~
1.Ladders and ~lightGray~stairs up/down    
2.Create a pre-formatted 33 x 33 blocks  
mine at chosen level.
~blue~3.Bubble lift and ~cyan~safe drop to water.~magenta~  
4.Faster version of ~white~33x33 mine pattern   
using ~magenta~corridor and ~pink~rectangle functions.~brown~
5.Mine to bedrock (inefficient)
~brown~6.Strip resources from abandoned mines.
]]
help["2+0"] =
[[~brown~1.Fell Tree (or Nether stem) for cutting any size tree / branches~lime~
2.Create a tree farm: 16 single or 4 double size (Dark oak or any type) suitable for turtle harvesting.
~brown~3.Fence or wall a rectangle keeping to contours.
~green~4.Forest harvested and replanted.
(Must be walled)
~brown~5.Convert a legacy tree farm to
network storage
]]
help["3+0"] =
[[~yellow~1.Modules built to fixed size
and placed next to each other in linear
or rectangular pattern.~lime~
2.Whole farm is managed by a dedicated
turtle, which must be equipped with a
diamond hoe as well as pickaxe.
~orange~Fuelled from a tree in each module.
~brown~3.Double chests store produce / seeds.
~magenta~4.Modems used for Network storage
]]
help["4+0"] =
[[~lightGray~1.Turtle can extract obsidian
from lava areas safely.~pink~
2.Nether portals built or removed
without needing diamond pickaxes.~orange~
3.End World dragon towers can be
undermined ready for deactivating.
4.Destroy End world tower crystals.~red~
5.Water trapped dragon killed~brown~
6.End portal stations with trapdoor
]]
help["5+0"] =
[[~white~1.Can be used in Nether and End.~lightGray~
2.Build paths over air, water or lava
(Optional roof for added protection.)
3.Tunnel through rock and place a floor
at the same time.~blue~
4.Build a water canal with towpath.~cyan~
5.Build a super-fast ice canal.~brown~
6.Platform over air, water, lava
(Sinking version removed and replaced
1 block lower each time to drain area)
]]
help["6+0"] =
[[~brown~1.Create mob farms round
existing spawners.
~cyan~Choice of bubble lift mob dropper
or ~brown~direct turtle kill

~red~2.Special version for Blaze farms.
Chamber underneath for turtle to auto-kill and harvest blazes

~orange~3.Surround a trial spawner remotely so it does not react
]]
help["7+0"] =
[[~lime~1.Clear a field including trees~magenta~
2.Clear rectangles.~pink~
3.Clear single walls.~brown~
4.Clear hollow and ~orange~solid structures.~brown~
5.Dig a trench.~gray~
6.Carve away side of a mountain.~lightBlue~
7.Place or replace floors and ceilings
8.Control turtle directly with commands 
  eg ~white~U4F6

]]
help["8+0"] =
[[~white~1.Used to drain ocean monuments and
shipwrecks. Can also be used to make
underwater base.
~blue~2.Water is cleared using sand dropping and recycling~cyan~
3.Destructive draining uses solid block
placing and recycling.~green~
4.Water plants can be removed without
damaging structures.~lightBlue~
5.Tools to manipulate water areas:
(convert to source, sloping water)
]]
help["9+0"] =
[[~lightGray~1.Build single walls
2.Build house walls
~gray~3.Pitched and gable roof styles
~orange~4.Build diagonal uphill slope~brown~
and downhill slope for placing 45 degree rail tracks or stairs.~red~
5.Placing Redstone torches under powered rails when above ground level (viaduct)

]]
help["10+0"] =
[[~yellow~Used to measure
    ~red~1.Height
    ~purple~2.Depth
    ~magenta~3.Length
    ~pink~4.Greatest depth of water
    ~yellow~5.Borehole to analyse rocks below



]]
-- index elevated to 100 for sub-menus eg Measurement tools -> help.sub[101], 102, 103 = 
help["11+0"] =
[[~yellow~1.Use a turtle next to a ~cyan~modem ~yellow~to locate ingredients and craft another item

~lime~2.Update lists of stored items so their location(s) are added to a database.




]]
help["12+0"] =
[[
]]
-- submenu items index made of main index (1-12) + submenu index (1-9)
-- if submenu index > 9 then add additional number from 1 eg 48, 49, 491, 492 etc
-- if mainindex > 9 then add additional digit eg 10 -> 101, 102, 103, etc (max 109): 11 -> 111, 112, 113 etc (max 119)
--******************MINING***********************
help["1+1"] = -- "createLadder": Ladder up/down
[[~yellow~Place turtle on the ground at ~red~^~yellow~
The ~brown~ladder ~yellow~will start at this level
and go up or down.

~lightGray~| | | | | |
~lightGray~| | |*| | | * = Ladder support block
| | |~brown~L~lightGray~| | | ~brown~L = Ladder
~lightGray~| | |~red~^~lightGray~| | | ~red~^ = Turtle
~lightGray~| | | | | |
| | | | | |

]]

help["1+2"] = -- "createStaircase": stairs up/down
[[~lightGray~Turtle on the ground at ~red~T~lime~ (Centre)

~lightGray~| | | | | | | | * = Solid block
~lightGray~| |*|*|*|*|*| | ~blue~+ = Corner slab
~lightGray~| |*|~blue~+~lightGray~|~cyan~>~lightGray~|~blue~+~lightGray~|*| | ~cyan~> = Up to east
~lightGray~| |*|~cyan~^~lightGray~|~red~T~lightGray~|~cyan~V~lightGray~|*| | ~cyan~V = Up to south
~lightGray~| |*|~blue~+~lightGray~|~cyan~<~lightGray~|~blue~+~lightGray~|*| | ~cyan~< = Up to west
~lightGray~| |*|*|*|*|*| | ~cyan~^ = Up to north
~lightGray~| | | | | | | | ~red~T = Turtle at ~lime~centre

~lightGray~If going ~blue~down~lightGray~ -> digs down first
Spine up > Clear down > Steps up
]] 

help["1+3"] = -- "createMine" Create mine at this level
[[~yellow~Press F3 to check Y level.

~lightGray~| |~red~^~lightGray~| | | ~red~^ = Turtle behind ladder
~lightGray~| |~gray~s~lightGray~| | | ~gray~s = 1 block space
~lightGray~| |*| | | * = Ladder support block
~lightGray~| |~brown~L~lightGray~| | | ~brown~L = Ladder
~lightGray~| |~brown~s~lightGray~| | | ~brown~s~gray~ = 2 spaces (inc. ladder)
~lightGray~| |~red~V~lightGray~| | | ~red~V = Turtle ahead of ladder~yellow~

]]
if U.bedrock == 0 then	--pre 1.18
	help["1+3"] = help["1+3"].."Place at Y = 5, 8, 11 ~red~(11 nether)" 
else
	help["1+3"] = help["1+3"].."Place at Y = -59, -56, -53 (11 nether)"
end

help["1+4"] = -- "createSafeDrop": safe drop
[[~yellow~Turtle goes ~blue~DOWN ~yellow~to chosen level
enclosing all sides of the column.
Water placed at bottom. Returns here.
If next to a ladder, place as below:

~lightGray~| | | | | |
~lightGray~| | |*| | | * = Ladder support block
| |~red~^~brown~|L|~red~^~lightGray~| | ~brown~L = ladder
~lightGray~| | | | | | ~red~^ = Turtle facing forward
~lightGray~| | | | | |
		   
]]

help["1+5"] = -- "createBubbleLift": single column bubble lift
[[~magenta~Top-down preferred.
~yellow~Single water column above Soul Sand
using kelp and a single water source

~brown~If near a ladder, place left or right:
~lightGray~| | | | | |
~lightGray~| | |*| | | * = Ladder support block
| |~blue~^~brown~|L|~blue~^~lightGray~| | ~brown~L = ladder
~lightGray~| | | | | | ~blue~^ = Turtle facing forward
~lightGray~| | | | | | ~blue~^ = Bubble column above

~orange~Signs used at entrance]]

help["1+6"] = -- "quickMineCorridor": quick corridor system
[[~yellow~Place turtle as below:
 1. On ~blue~floor   ~yellow~(feet height)
 2. On ~lime~ceiling ~yellow~(eye height)

~lightGray~*|*|*|*|*|*|*    ~yellow~W I D T H
~lightGray~*| | | | | |*               ~orange~L
~lightGray~*| |*|*|*| |*               ~orange~E
~lightGray~*| |*|*|*| |*               ~orange~N
~lightGray~*| |*|*|*| |*               ~orange~G 
~lightGray~*|~red~^~lightGray~| | | | |*  ~red~^~lightGray~ = Turtle   ~orange~T
~lightGray~*|~cyan~P~lightGray~|*|*|*|*|*  ~cyan~P~lightGray~ = Player   ~orange~H
]]

help["1+7"] = -- "quickMine": quick mine
[[~yellow~~yellow~Place turtle as below:
 1. On ~blue~floor   ~yellow~(feet height)
 2. On ~lime~ceiling ~yellow~(eye height)
~lightGray~*|*|*|*|*|*|* 
*| | | | | |*
*| |*|*|*| |*
*| |*|*|*| |*
*| |~lime~^~lightGray~|*|*| |*
*|~red~^~lightGray~|~magenta~^~lightGray~| | | |* ~white~^~lightGray~ = turtle
*|~cyan~P~lightGray~|*|*|*|*|* ~cyan~P~lightGray~ = Player

]]

help["1+8"] = -- "mineBedrockArea": mine all blocks to bedrock
[[~yellow~Place turtle level -59 on the floor to
expose bedrock ~red~(slow and inefficient)

~lightGray~| | | |*| |*|     ~yellow~W I D T H
~lightGray~|*| | | | | |*               ~orange~L
~lightGray~| | | |*|*| |                ~orange~E
~lightGray~| | |*| | |*|                ~orange~N
~lightGray~|*| | | |*| |                ~orange~G 
~lightGray~| | | | | | |*               ~orange~T
~lightGray~|~red~^~lightGray~| | | |*| |*  ~red~^~lightGray~ = Turtle   ~orange~H

~yellow~Option to replace blocks available
]]

help["1+9"] = -- "clearMineshaft": salvage mineshaft
[[~yellow~Place turtle on the end wall of disused
mineshaft, centre block, 1 above floor.

Provide a ~cyan~diamond ~yellow~sword for
harvesting string from spider webs

~gray~-------   - = Ceiling
~lightGray~| | | |
| |~red~T~lightGray~| |  ~red~T = Turtle (facing wall)
~lightGray~| | | |
~gray~-------  - = Floor
]]
--******************FORESTRY***********************
help["2+1"] = -- "fellTree": Fell Tree
[[~yellow~Place turtle as below.
~brown~Chest ~yellow~ONLY required if ~blue~0 ~yellow~fuel

Plan view:

~green~   | | | |
~green~   | |~lime~T~green~| |  ~lime~T = Tree
~green~   | |~red~^~green~| |  ~red~^ = Turtle
~green~   | | | |
]]

help["2+2"] = -- "createTreefarm": Create treefarm
[[~yellow~New, extend left/back=~red~^ ~orange~Extend Right=^
~lightGray~|*|~blue~ | | | | | | ~brown~|D| |D| ~blue~| | ~lightGray~|*|
~lightGray~|*|~blue~ | | ~brown~|D|D|~blue~ | | | | | | | ~lightGray~|*|
~lightGray~|*|~blue~ | | ~brown~|D|D|~blue~ | ~brown~|D| |D| ~blue~| | ~lightGray~|*|
~lightGray~|*|~blue~ | | | | | | | | | | | | ~lightGray~|*|
~lightGray~|*|~blue~ | | | | | | | | | | | | ~lightGray~|*|
~lightGray~|*|~blue~ | | | | | | | | | | | | ~lightGray~|*|
~lightGray~|~red~^~lightGray~|*|*|*|*|*|*~magenta~|M|~lightGray~*|*|*|*|*|*|~orange~^|
~lime~4 ~brown~double trees~green~ or 16 ~brown~single trees
~brown~D = Dirt, ~magenta~M = Modem
~red~^~yellow~ = Turtle ~red~(new/left/back) ~orange~^ on right
]]

help["2+3"] = -- "plantTreefarm": Plant treefarm / Harvest treefarm
[[~yellow~Place turtle as below ~lightGray~^ ~magenta~^
~lime~|*|~blue~ | | | | | | | ~green~or |*|~blue~ | | ~brown~|D| |D| |
~lime~|*|~blue~ | | ~brown~|D|D|~blue~ | | ~green~or |*|~blue~ | | | | | | |
~lime~|*|~blue~ | | ~brown~|D|D|~blue~ | | ~green~or |*|~blue~ | | ~brown~|D| |D| |
~lime~|*|~blue~ | | | | | | | ~green~or |*|~blue~ | | | | | | |
~lime~|*|~blue~ | | | | | | | ~green~or |*|~blue~ | | | | | | |
~lime~|*|*|*|*|~lightGray~^~lime~|*| ~magenta~|^| ~green~or |*|*|*|*|~lightGray~^~green~|*|*~magenta~|^|
~lime~ 4 ~brown~double trees~green~   or  16 ~brown~single trees
~brown~D = dirt
~lightGray~^ = Turtle on marker (Legacy storage)
~magenta~^ = Turtle on Modem (Network storage)
]]

help["2+4"] = help["2+3"] 
help["2+5"] = -- "createEnclosure":
[[~yellow~Place turtle at ~red~^

~lightGray~|F|F|F|F|F|F|F| F = Fence or Wall
~lightGray~|F|~brown~B~lime~| | | |~brown~B~lightGray~|F| ~brown~B = Barrel (corners)
~lightGray~|F|~lime~ | | | | ~lightGray~|F|
~lightGray~|F|~lime~ | | | |~cyan~T~lightGray~|F| ~cyan~T = Tree
~lightGray~|F|~lime~ |~cyan~T~lime~| | | ~lightGray~|F|
~lightGray~|F|~lime~ | | | | ~lightGray~|F|
~lightGray~|F|~brown~B~lime~| |~cyan~T~lime~| |~brown~B~lightGray~|F| 
~lightGray~|~red~^~lightGray~|F|F|F|F|F|F| ~red~^ = Turtle

~yellow~Fence/Wall follows land contours
]]

help["2+6"] = -- "clearAndReplantTrees" manage walled forest
[[~yellow~A rectangular walled area of forest:
Place turtle at ~red~^

~lightGray~|F|F|F|F|F|F|F| F = Fence or wall
~lightGray~|F|~brown~B~lime~| | | |~brown~B~lightGray~|F| ~brown~B = Barrel (corners)
~lightGray~|F|~lime~ | | | | ~lightGray~|F|
~lightGray~|F|~lime~ | | | |~cyan~T~lightGray~|F| ~cyan~T = Tree
~lightGray~|F|~lime~ |~cyan~T~lime~| | | ~lightGray~|F|
~lightGray~|F|~lime~ | | | | ~lightGray~|F|
~lightGray~|F|~red~^~lime~| |~cyan~T~lime~| |~brown~B~lightGray~|F| ~red~^ = Turtle ~brown~(on Barrel)
~lightGray~|F|F|F|F|F|F|F|

]]

help["2+7"] = -- "convertTreefarm": Convert treefarm
[[~yellow~Convert Treefarm to network

~lightGray~|*|~blue~ | | | | | | ~brown~|D| |D| ~blue~| | ~lightGray~|*|
~lightGray~|*|~blue~ | | ~brown~|D|D|~blue~ | | | | | | | ~lightGray~|*|
~lightGray~|*|~blue~ | | ~brown~|D|D|~blue~ | ~brown~|D| |D| ~blue~| | ~lightGray~|*|
~lightGray~|*|~blue~ | | | | | | | | | | | | ~lightGray~|*|
~lightGray~|*|~blue~ | | | | | | | | | | | | ~lightGray~|*|
~lightGray~|*|~blue~ | | | | | | | | | | | | ~lightGray~|*|
~lightGray~|*|*|*|*|~red~T~lightGray~|*|*|*|*|*|*|*|*|*|*|

~red~T~yellow~ = Turtle ~red~On Polished stone
~yellow~Optional Storage area beneath farm
]]
--******************FARMING***********************
help["3+1"] = -- "createFarm" Create modular crop farm
[[~yellow~Place turtle on the ground as below ~red~^

~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~lightGray~* = Wall
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| |
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| |
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | 
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~magenta~M = Modem
~brown~|B|B~green~| | |~lightGray~or |*| ~green~| | ~brown~B = Barrel or Chest
~brown~|B|~blue~W~green~| | |~lightGray~or ~magenta~|M|~blue~W~green~| | ~blue~W = Water
~lime~|~red~^~lime~|~brown~B|B|~lightGray~*|or ~brown~|~red~^~brown~|~magenta~M|~lightGray~*| ~red~^ = Turtle
~brown~Legacy   ~lightGray~or ~magenta~Network ~yellow~Size = 12 x 12
]]

help["3+2"] = -- "createFarmExtension" Extend farm
[[~yellow~Place on any ~brown~T ~blue~T ~magenta~T~yellow~ facing < > ^ v

~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~lightGray~* = Wall
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| |
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| |
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~magenta~M = Modem
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~brown~B = Barrel or Chest
~brown~|B|B~green~| | |~lightGray~or |*| ~green~| | ~blue~W = Water
~brown~|B~blue~|T| ~green~| |~lightGray~or ~magenta~|M|~blue~T~green~| | ~orange~S = Sapling or Tree
~orange~|S|~brown~T|B|~lightGray~*|or ~brown~|B~magenta~|T|~lightGray~*| ~brown~T ~lightGray~= Turtle (~blue~T ~magenta~T~lightGray~)
~brown~Legacy   ~lightGray~or ~magenta~Network ~yellow~Size = 12 x 12
]]

help["3+3"] = -- "manageFarmSetup": Manual harvest and auto setup
[[~yellow~Place ~blue~> ~yellow~to manage farm

Legacy      Network farm
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~lightGray~* = Wall
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| |
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~magenta~M = Modem
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~brown~B = Barrel or Chest
~brown~|B|B~green~| | |~lightGray~or |*| ~green~| | C = Crop (first)
~brown~|B|~blue~>~green~|C| |~lightGray~or ~magenta~|M|~blue~>~green~|C| ~blue~> = Turtle on Water
~lightGray~|*|~brown~B|B|~lightGray~*|or ~brown~|B~magenta~|M|~lightGray~*|

~blue~>~yellow~ plant, harvest or manage auto-start
]]

help["3+4"] = -- "createFence": build fence or wall
[[~yellow~Build a ~brown~fence ~yellow~or ~lightGray~wall ~yellow~to chosen length.

Turtle goes ~orange~BACKWARDS ~yellow~when started.

Start: length = 6, Turtle facing right

~lightGray~| |~red~>~lightGray~| | | | | | | ~red~> = Turtle

Finish:

~lightGray~| |F|F|F|F|F|F| | F = Fence or Wall
]]
help["3+5"] = -- "createEnclosure": build rectangular fence or wall
[[~yellow~Build a ~brown~fence ~yellow~or ~lightGray~wall ~yellow~
rectangular area.

~lightGray~| | | | | | | | ~brown~F = Fence or Wall
~lightGray~| ~brown~|F|F|F|F|F~lightGray~| |
~lightGray~| ~brown~|F| | | |F~lightGray~| |
~lightGray~| ~brown~|F| | | |F~lightGray~| |
~lightGray~| ~brown~|F| | | |F~lightGray~| |
~lightGray~| |~red~^~brown~|F|F|F|F| | ~red~^ = Turtle
~lightGray~| | | | | | | |

]]

help["3+6"] = -- "convertFarm": Convert legacy farm
[[~yellow~Place here~blue~ >~yellow~ for conversion
(Normal start position for farming turtle)
Legacy      Network farm
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~lightGray~* = Wall
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| |
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~magenta~M = Modem
~lightGray~|*|~green~ | | |   ~lightGray~|*| ~green~| | ~brown~B = Barrel or Chest
~brown~|B|B~green~| | |~lightGray~to |*| ~green~| | C = Crop (first)
~brown~|B|~blue~>~green~|C| |~lightGray~to ~magenta~|M|~blue~W~green~|C| ~blue~> = Turtle / Water
~lightGray~|T|~brown~B|B|~lightGray~*|to ~brown~|B~magenta~|M|~lightGray~*|~lightGray~ T = Tree or stone

~yellow~Converts farm to network storage
]]

help["3+7"] = -- "upgradeFarmland": upgrade farmland
[[~red~Mystical Agriculture MOD only!

~yellow~Upgrades the farm soil using essence

Place Turtle in normal position above
water in lower left corner.

It will go through the water and place
essence on soil from underneath.
]]

help["3+8"] = -- "makeMud": make mud or clay from dirt
[[~yellow~Makes mud and/or clay from dirt.
Use an enclosure for drying clay
same size as a farm (10 x 10 inner).

~brown~Place dripstone tips under the field
~green~Place Turtle above water outside the
lower left corner, at border height:

~lightGray~|*|~brown~M|M|M|M|M|M|M|M|M|M|~lightGray~*|
~lightGray~|*|*|*|*|*|*|*|*|*|*|*|*|
~lightGray~|*|~red~T|~blue~W|~lightGray~*|
~lightGray~|*|~blue~W|W|~lightGray~*|
]]
--******************OBSIDIAN LAVA***********************

--"lavaRefuel", "harvestObsidian", "createPortal", "demolishPortal",
--"createStripMine", "undermineDragonTowers", "deactivateDragonTower",
--"createDragonTrap", "attackMob","createPortalPlatform", "harvestShulkers"
help["4+1"] = -- "lavaRefuel": lava Refuel
[[~yellow~Place turtle next to lava lake 
Left or Right side
Or single strip

~orange~|L|L|L|L|L| L = Lava
|L|L|L|L|L|
|L|L|L|L|L|
|L|L|L|L|L|
|L|L|L|L|L| ~red~^ = Turtle
~gray~|~red~^~gray~| | | |~red~^~gray~|
]]

help["4+2"] = -- "harvestObsidian": Harvest obsidian
[[~yellow~Place turtle on any block on the left 
side facing the obsidian field.

~gray~|O|O|O|O|O| O = Obsidian
|O|O|O|O|O|
|O|O|O|O|O|
|O|O|O|O|O|
|~red~^~gray~|O|O|O|O| ~red~^ = Turtle
|~red~^~gray~| | | | |
]]

help["4+3"] = -- "createPortal": build Nether portal
[[~yellow~Place turtle on the ground as below ~red~> ~pink~^
~yellow~Start ~red~> ~yellow~(facing right) or ~pink~^ ~yellow~ahead
  
~lightGray~| |~red~>~lightGray~|O|O|*| | |    |*|O|O|*| face view             
   ~pink~^~lightGray~               |O|~purple~+ +~lightGray~|O|
                   |O|~purple~+ +~lightGray~|O|
~yellow~Result (plan)      ~lightGray~|O|~purple~+ +~lightGray~|O|
~lightGray~| |O|O|O|O| | |    |*|O|O|*|
                   ~green~--------- ground
~yellow~width=4, ~orange~height=5 ~red~(frame size)
]]

help["4+4"] = help["4+3"] -- "demolishPortal": Demolish Nether portal

help["4+5"] = -- "createStripMine": Netherite stripping
[[~yellow~Press F3+G for chunk boundaries
Netherite stripmine plan view
               
~lightGray~|*|*|*~lime~N~lightGray~*|*|*|
~lightGray~|*|*|*~lime~|~lightGray~*|*|*| ~lime~-| = Chunk Boundaries
~lightGray~|*|~red~^~lightGray~|*~lime~|~lightGray~*|~red~^~lightGray~|*|  ~red~^ = Turtle
~lime~W*-*-*~blue~+~lime~*-*-*E  ~blue~+ = Boundaries junction
~lightGray~|*|*|*~lime~|~lightGray~*|*|*|
~lightGray~|*|*|*~lime~|~lightGray~*|*|*|  ~yellow~North of WE
~lightGray~|*|*|*~lime~S~lightGray~*|*|*|  ~yellow~1 block from NS
~lightBlue~Chunk boundaries levels ~orange~8-22 ~red~(14/15)
]]

help["4+6"] = -- "undermineDragonTowers": Find dragon tower centres
[[~yellow~Place turtle on the ground ~red~<~yellow~ facing ~red~West.
coordinates x = 0, z = 0
~lime~x
                 ~lightGray~N
~lime~a~lightGray~   -1        | | | |  
~lime~x~lightGray~    0       ~red~W~lightGray~| |~red~<~lightGray~| |E  ~red~< = Turtle
~lime~i~lightGray~    1        | | | |  
~lime~s~lightGray~                S
    ~green~z axis    ~lightGray~-1 0 1
  
Centre of the dragon arena ~lime~X = 0, ~green~Z = 0
~yellow~                           facing ~red~West 
]]

help["4+7"] = -- "deactivateDragonTower": deactivate dragon tower
[[~yellow~Place turtle in ceiling facing endstone

Plan view    Side view
~gray~             |*|*|*|*|*|
    |*|      |*|*|*|*|*|
  |*|*|*|    |*|*|*|*|*|
|*|*|*|*|*|  |*|*|*|*|*|  * ~lightGray~= Obsidian
~gray~|*|*|~yellow~E~gray~|*|*|  |*|*|*|*|*|  ~yellow~E ~lightGray~= Endstone
~gray~  |*|~red~^~gray~|*|    |*|*|~red~T~gray~|*|*|~red~ ^T ~lightGray~= Turtle
~gray~    |*|      |*|*| |*|*|
             |*|*| |*|*|
]]

help["4+8"] = -- "createDragonTrap": build dragon water trap
[[~yellow~Place turtle on the ground at 100,49,0

|*|*|*|*|*|*|*|*|*|   ~lightGray~= Dragon Island


~yellow~    Facing WEST
~gray~    |*|*|*|*|*|     * ~lightGray~= Obsidian plate
~gray~    |*|*|*|*|*|
~yellow~  S ~gray~|*|*|~red~T~gray~|*|*| ~yellow~N   ~red~T ~lightGray~= Turtle
~gray~    |*|*|*|*|*|
    |*|*|*|*|*|
~yellow~         E]]

help["4+9"] = -- "attackMob": re-start attack
[[~yellow~Re-start dragon attack on overhead
platform

~blue~|W|~lightGray~ |*|~red~<~lightGray~|*|*|*|*|*|

~blue~W = water source on obsidian
~red~< = Turtle
]]

help["4+10"] = -- "createPortalPlatform": build end portal staging
[[~yellow~Place turtle under end world portal

~gray~        |B|     B ~lightGray~= Bedrock
~gray~      |B|B|B|
        ~purple~|P|     P ~lightGray~= Portal
~gray~      |B|B|B|
        |B|
         ~green~|		
         ~green~|      ~lime~Height measured first		
         ~green~|		
~red~         T	     T ~lightGray~= Turtle	
~yellow~  |*|*|*|*|*|*| ~red~Inventory AFTER height
]]
	
help["4+11"] = -- "harvestShulkers": Shulker harvest
[[~blue~1) ~yellow~Place turtle <64 blocks from shulker
Directly above, below or at same level
~lime~2) ~yellow~Place turtle in pit centre wall
~lightGray~            |*|*|*|*|*|
~lightGray~            |*| |~red~^~lightGray~| |*|
~lightGray~            |*|~red~<~lightGray~| |~red~>~lightGray~|*|
~lightGray~            |*| |~red~v~lightGray~| |*|
~lightGray~            |*|*|*|*|*|
~magenta~3) ~yellow~Tower top or outer wall. Place in
corner against the ceiling. It will go
up, clear roof or walls and return.
]]
--******************CANAL PATHWAY***********************
--"createPath", "createCorridor", "createWaterCanal",
--"createIceCanal", "createPlatform", "createSinkingPlatform", "createBoatLift"
help["5+1"] = --"createPath": Single path
[[~yellow~Place turtle on the ground as below ~red~^

~yellow~Start:~blue~  |-|-|-|    - = air/water
~orange~        |-|-|-|    - = lava
~blue~        |-|-|-|
~lightGray~        |*|~red~^~lightGray~|*|    ~red~^ = Turtle

~yellow~Result:~blue~ |-|~lightGray~*|~blue~-|    - = air/water
~orange~        |-|~lightGray~*|~orange~-|    - = lava
~blue~        |-|~lightGray~*|~blue~-|
~lightGray~        |*|*|*|    * = Solid block
]]

help["5+2"] = -- "createCorridor": Covered walkway / tunnel
[[~yellow~Place ~red~^ T~yellow~ at start of path or tunnel

~yellow~Plan view    Face view

~lightGray~|*|~green~*~lightGray~|*|      *|*|*|*|*   ~green~* = new block
~lightGray~|*|~green~*~lightGray~|*|      *|*|~green~*~lightGray~|*|*
~lightGray~|*|~green~*~lightGray~|*|      *|*| |*|*
~lightGray~|*|~green~*~lightGray~|*|      *|*|~red~T~lightGray~|*|*   ~red~^ T = Turtle
   ~red~^~lightGray~         ~green~- - * - -   ground

~green~Floor + ceiling ~yellow~placed for your safety!
]]

help["5+3"] = -- "createWaterCanal": new/existing canal
[[~yellow~plan view

~lightGray~|*|~blue~-|-~lightGray~|*|
~lightGray~|*|~blue~-|-~lightGray~|*|    ~yellow~Cross section view
~lightGray~|*|~blue~-|-~lightGray~|*|     ~lime~1 ~orange~2 ~brown~3 ~green~4  ~lightGray~= on ground
~lightGray~|~lime~^~lightGray~|~blue~^~lightGray~|~cyan~^~lightGray~|~green~^~lightGray~|    |*|~blue~5~lightGray~|~cyan~6~lightGray~|*| ~lightGray~= in water

~yellow~New canal       ~lime~1 ~orange~2 ~brown~3 ~green~4 ~yellow~ground level-63
~yellow~Extend existing ~lime~1     ~green~4 ~yellow~ground level-63
~yellow~Extend existing   ~blue~5 ~cyan~6   ~yellow~water  level-62
]]

help["5+4"] = -- "createIceCanal": ice canal
[[~lime~New ~yellow~ice canal or ~lightBlue~convert ~yellow~existing water

~lightGray~ |*| | |*| 	 * = Slab
~lightGray~ |~orange~T~lightGray~|~blue~I~lightGray~| |*| 	 ~blue~I = Ice (packed or blue)
~lightGray~ |*| | |*| 	| | = Air (empty block)
~lightGray~ |*|~blue~I~lightGray~| |~orange~T~lightGray~|   ~orange~T = Torch (optional)
~lime~  1 2 3 4    New ice canal
~lightBlue~  5 6 7 8    Convert water canal

~red~All turtles placed at ground level!
~lime~1-4 ~lightGray~for ~lime~new ~lightGray~canal ~lightBlue~5-8 ~lightGray~to ~lightBlue~convert ~lightGray~water
]]

help["5+5"] = -- "createPlatform": Platform
[[~yellow~Place ~red~^~yellow~ any level air, water or lava.~lightGray~

| | | | | | | |
| |*|*|*|*|*| |  * = Block
| |*|*|*|*|*| |
| |*|*|*|*|*| |
| |*|*|*|*|*| |
| |~red~^~lightGray~|*|*|*|*| |  ~red~^ = Turtle~lightGray~
| | | | | | | |

Blocks placed under the turtle
]]
-- help["5+6"] = -- "createSinkingPlatform": 	
-- [[~yellow~Turtle position ~red~> T ~gray~(~red~V ~gray~to enclose)
-- ~yellow~Plan view                      ~gray~Start:~red~V
-- ~blue~|~red~>~blue~| | | | | | ~yellow~to ~lightGray~|*|*|*|*|*|~red~V~lightGray~|~gray~ enclose
                            -- ~gray~*  area
-- ~yellow~Side view
 -- ~red~T
-- ~blue~| | | | | | | ~yellow~to ~lightGray~|*|*|*|*|*|*|
-- ~blue~| | | | | | |    ~lightGray~|*|*|*|*|*|*|
-- ~blue~| | | | | | |    ~lightGray~|*|*|*|*|*|*|
-- ~yellow~|S|~blue~ | | |~yellow~S|S|    |S|~lightGray~*|*|*|~yellow~S|S|
-- ~yellow~|S|S|S|S|S|S|    |S|S|S|S|S|S|
-- ]]
help["5+6"] = -- "createSinkingPlatform": Sinking platform
[[~yellow~Place ~red~^~yellow~ above water.~lightGray~
Builds a hollow box down into water
or lava. w and l are internal sizes
| |*|*|*|*|*| |  * = Block
| |*|*|*|*|*| |
| |*|*|*|*|*| |
| |*|*|*|*|*| |
| |~red~^~lightGray~|*|*|*|*| |  ~red~^ = Turtle~lightGray~
| | | | | | | |

Blocks placed under the turtle
]]

help["5+7"] = -- "createBoatLift": boat bubble lift
[[~yellow~Boat Lift (Ice or Water)
Place turtle left side. ~blue~Source~yellow~ to right

Start~lightGray~        |*|~blue~ | ~lightGray~|*| ~yellow~Finish
~lightGray~             |*|~blue~ | ~lightGray~|*|
             |*|~cyan~S|S|~lightGray~*| ~cyan~S ~lightGray~= Soul sand
|*|*|*|*|    |*|~brown~S|S~lightGray~|*| ~brown~S = ~lightGray~Sand + gate
|~red~^~lightGray~|~blue~W|W~lightGray~|*|    |*~blue~|W|W|~lightGray~*| ~red~^ ~lightGray~= Turtle
|*|~blue~W|W~lightGray~|*|    |*|~blue~W|W~lightGray~|*|
|*|~blue~ | ~lightGray~|*|    |*|~blue~ | ~lightGray~|*| ~yellow~Ice canal needs
~lightGray~|*|~blue~ | ~lightGray~|*|    |*|~blue~ | ~lightGray~|*| ~yellow~2x2 water source
]]

help["5+8"] = -- "createDiveColumn": series of underwated doors
[[~yellow~Builds a series of open doors
from the water bed to surface.

~brown~Place turtle above water with max one
block below if required.

~orange~Depth will be measured when checkbox
clicked.

~red~Inventory will then be updated.
]]

--******************MOB FARM TOOLS***********************

help["6+1"] = -- "createMobFarmCube": 9x9 cube round spawner
[[~red~NOT ~yellow~for Blaze spawners!
Plan view          Side view~lightGray~
        T          T = Outside dungeon
 |*|*|*|*|*|*|*|   |*|*|*|*|*|*|*| Top
 |*| | | | | |*|   |*| | | | | |*|
 |*| | | | | |*|   |*| | | | | |*|
T|*| | |~orange~S~lightGray~| | |*|T  |*| | |~magenta~T~lightGray~| | |*|
 |*| | |~magenta~T~lightGray~| | |*|   |*|*|*|~orange~S~lightGray~|*|*|*| Base
 |*| | | | | |*|   * = Dungeon Wall
 |*|*|*|*|*|*|*|   ~orange~S = Spawner
~lightGray~        T          T = Turtle outside
~magenta~T~lightGray~ = On top or facing (~red~0 chests only~lightGray~)
]]

help["6+2"] = -- "floodMobFarm" Flood spawner chamber
[[~yellow~ Plan view (truncated)    Side view

~lightGray~ |*| | | | | | | | | |*|  |*| | | | | |
~red~>~lightGray~|*| | | | |~purple~S~lightGray~| | | | |*|~red~<~lightGray~ |*| | | | |~purple~S~lightGray~|
 |*| | | | | | | | | |*|  |*| | | | | |
 |*| | | | | | | | | |*|  |*| | | | | |
 |*| | | | | | | | | |*|  |*| | | | | |
 |*| | | | | | | | | |*|  |*| | | | | |
 |*|*|*|*|*|*|*|*|*|*|*| ~red~T~lightGray~|*|*|*|*|*|*|
            ~red~^
~purple~S ~lightGray~= Spawner ~red~<> ^ T ~lightGray~= Turtle
]]

help["6+3"] = -- "createMobBubbleLift": Build bubble lift kill zone
[[~yellow~Bubble lift: Plan view at start~lightGray~
 |*| | | | | | | | | |*|
 |*| | | | |~brown~F~lightGray~| | | | |*|
 |*|*|*|*|*|~brown~F~lightGray~|*|*|*|*|*|  ~brown~F ~lightGray~= Fence
           ~brown~|~red~^~brown~|~lightGray~= Turtle on ~brown~Soul Sand
		   
~yellow~Plan view completed~lightGray~		   
 |*| | | | |~brown~F~lightGray~| | | | |*|
 |*|*|*|*|*|~brown~F~lightGray~|*|*|*|*|*|  ~brown~F ~lightGray~= Fence
~yellow~kill zone~lightGray~|*|~blue~S~lightGray~|*|~yellow~kill zone ~lightGray~Left / Right
           ~lightGray~|*|        ~blue~S ~lightGray~= Bubble lift
]]

help["6+4"] = -- "createMobFarmCubeBlaze": 9x9 cube round blaze spawner
[[~yellow~Place turtle as indicated:
Plan view          Side view

~lightGray~|*|*|*|*|*|*|*|*|~red~< direct line of sight
~lightGray~|*| | | | | | | |   ~red~T = Turtle
~lightGray~|*| | | | | | | |
|*| | | |~purple~S~lightGray~| | | |~red~<           T
~lightGray~|*| | | | | | | |   |*| | | |~purple~S~lightGray~| | | |~red~T
~lightGray~|*| | | | | | | |   |*| | | | | | | |
~lightGray~|*| | | | | | | |   |*| | | | | | | |
~lightGray~|*|*|*|*|*|*|*|*|   |*| | | | | | | |
~yellow~Facing at any distance or floor below
]]

help["6+5"] = -- "createBlazeGrinder": killzone under blaze spawnet
[[~yellow~Place turtle as indicated for kill zone
Plan view          Side view

~lightGray~|*|*|*|*|*|*|*|*|  ~lime~< T = Turtle
~lightGray~|*| | | | | | | |  
~lightGray~|*| | | | | | | |
|*| | | |~purple~S~lightGray~| | | |~lime~<
~lightGray~|*| | | | | | | |   |*| | | |~purple~S~lightGray~| | | |
~lightGray~|*| | | | | | | |   |*| | | | | | | |
~lightGray~|*| | | | | | | |   |*| | | | | | | |
~lightGray~|*|*|*|*|*|*|*|*|   |*| | | | | | | |~lime~T
]]

help["6+6"] = -- "createTrialCover": Build 3*3*3 wall around trial spawner
[[~yellow~Turtle moves toward spawner
Place at spawner level.

~orange~Can be behind a wall for protection
of player.

~red~Turtle embeds in wall with attack
working
]]

help["6+7"] = -- "attack"
[[~yellow~Turtle placed close to mobs
~orange~Attack can be all or any of:
    - up
    - forward
    - down
~cyan~Timed or continuous
~yellow~For mob farms place outside entrance.
Direction = forward. 

~red~Blaze apawner ~yellow~under centre of floor
Direction = up
~lime~Stand close for XP!]]

--******************AREA SHAPING***********************

help["7+1"] = -- "clearArea": Clear field
[[~yellow~Clear field

~lightGray~| | | | | |  Remove ~lime~trees ~lightGray~and ~pink~flowers
~lightGray~| | | | | |  Fill ~gray~holes
~lightGray~| | | | | |  Remove blocks > ground
| | | | | |
| | | | | |
|~red~^~lightGray~| | | | |  ~red~^ ~lightGray~= Turtle position

~yellow~Optional use ~brown~dirt ~yellow~as surface
]]

help["7+2"] = -- "clearRectangle": Clear rectangle
[[~yellow~Clear rectangle

~lightGray~| | | | | |  Remove all blocks
~lightGray~| | | | | |  Optional dig ~lime~up
~lightGray~| | | | | |  Optional dig ~blue~down
~lightGray~| | | | | |
| | | | | |
|~red~^~lightGray~| | | | |  ~red~^ ~lightGray~= Turtle position
 ~red~^

~yellow~Can be used to clear 3 layers at a time
]]

help["7+3"] = -- "clearWall": Clear wall
[[~yellow~Clear wall
Plan view         Side view
                  ~gray~T ~lightBlue~T
~red~>~lightGray~|~orange~>~lightGray~|*|*|*|*|*|    ~cyan~T~lightGray~|~blue~T~lightGray~|*|*|*|*|*| Top
~lightGray~                   |*|*|*|*|*|*|
                   |*|*|*|*|*|*|
                   |*|*|*|*|*|*|
                   |*|*|*|*|*|*|
                  ~lime~T~lightGray~|~green~T~lightGray~|*|*|*|*|*| Base
				  
T = Turtle top / bottom/ inside / out
~yellow~Bottom to top or top to bottom
]]

help["7+4"] = -- "clearPerimeter": Clear rectangle (perimeter only) 
[[~yellow~Clear rectangle ~red~perimeter only

~yellow~Plan view
~lightGray~| | | | | |  Remove all blocks
~lightGray~| |*|*|*| |  Optional dig ~lime~up
~lightGray~| |*|*|*| |  Optional dig ~blue~down
~lightGray~| |*|*|*| |
| |*|*|*| |
|~red~^~lightGray~| | | | |  ~red~^ ~lightGray~= Turtle position
~red~ ^
~yellow~Can be used to clear 3 layers at a time
]]

help["7+5"] = -- "clearBuilding": Clear structure floor/walls/ceiling hollow and solid
[[~yellow~Demolish cube structure
Plan view        Side view
               ~gray~T ~lightBlue~T
~lightGray~|*|*|*|*|*|*|  ~cyan~T~lightGray~|~blue~T~lightGray~|*|*|*|*|*|
|*|*|*|*|*|*|   |*|*|*|*|*|*|
|*|*|*|*|*|*|   |*|*|*|*|*|*|
|*|*|*|*|*|*|   |*|*|*|*|*|*|
|*|*|*|*|*|*|   |*|*|*|*|*|*|
|~lime~^~lightGray~|*|*|*|*|*|  ~lime~T~lightGray~|~green~T~lightGray~|*|*|*|*|*|
 ~green~^
~lightGray~^ T = Turtle (top/base in/out)
]]

help["7+6"] = help["7+5"]-- "clearSolid"

help["7+7"] = -- "digTrench": Dig a trench
[[~yellow~Dig a trench (Plan view)

~lightGray~      |~red~>~lightGray~| | | | | | |
  
| |    ~red~>~lightGray~ = Turtle
| |    
| |
| |
| |    
|~red~^~lightGray~|    ~red~^~lightGray~ = Turtle
]]

help["7+8"] = -- "clearMountainSide": Carve mountain
[[~yellow~Mountain carving     ~red~T ^ = Turtle
~yellow~Side view            Plan view

~lightGray~        |*|              |*|*|      ~yellow~L
~gray~ 	    |*~lightGray~|*|            ~gray~|*~lightGray~|*|*|*|    ~yellow~E
~gray~      |*~lightGray~|*|*|*|      ~gray~|*|*~lightGray~|*|*|*|*|  ~yellow~N
~gray~      |*~lightGray~|*|*|*|      ~gray~|*|*~lightGray~|*|*|*|*|  ~yellow~G
~gray~      |*~lightGray~|*|*|*|       ~red~^~gray~|*~lightGray~|*|*|*|    ~yellow~T
~gray~    |*|*~lightGray~|*|*|*|*|        |*|*|      ~yellow~H
   ~red~T~gray~|*|*~lightGray~|*|*|*|*|
    ~yellow~<--> no. of rows <-->
]]

help["7+9"] = -- "createFloorCeiling": (Re)place floor or ceiling
[[~yellow~Place / Replace floor or ceiling

Plan view      Side view
~lightGray~| | | | | |    |*|*|*|*|*|
| | | | | |     T          Ceiling
| | | | | |
| | | | | |
| | | | | |     T          Floor
|~red~^~lightGray~| | | | |    |*|*|*|*|*|

~red~^ ~lightGray~T = Turtle position

]]

help["7+10"] = -- "createDirectedPath": Direct control
[[~yellow~Place turtle anywhere!
Menu or direct command interface.

~lightGray~Commands:

direction + ~blue~number ~yellow~eg ~white~f2 ~yellow~= forward ~blue~2

~yellow~f = forward  ~orange~b = backward
~lime~l = left     ~red~r = right
~lightGray~u = up       ~cyan~d = down

]]

--******************WATER AND MONUMENT********************
--"CREATESANDWALL", "CLEARSANDWALL", "SANDFILLAREA", "CLEARSANDCUBE", "CREATERETAININGWALL",
--"DRAINWATERLAVA", "CREATESINKINGPLATFORM", "OCEANMONUMENTCOLUMNS", "CLEARWATERPLANTS",
--"CREATELADDERTOWATER", "CONVERTWATER", "CREATESLOPINGWATER"
help["8+1"] = -- "createSandWall"
[[~blue~Drop sand or gravel wall
~yellow~Place turtle on water/lava surface
]]

help["8+2"] = -- "clearSandWall"
[[~blue~Clear sand wall
~yellow~Place turtle on or near sand.
]]

help["8+3"] = -- "sandFillArea"
[[~lightBlue~Fill area with sand
~yellow~Place  on left corner of area
]]

help["8+4"] = -- "clearSandCube"
[[~lightBlue~Clear sand filled area
~yellow~Place on left corner of sand field
]]

help["8+5"] = -- "createRetainingWall" Ocean monument build retaining walls
[[~yellow~Turtle positions ~red~> ^ < V

~lightGray~|*|~red~>~lightGray~|*|*|*|*|*|~red~<~lightGray~|*|  ~red~NOT ~lightGray~corner blocks!
|~red~V~lightGray~|             |~red~V~lightGray~|
|*|             |*|
|*|             |*|
|*|             |*|
|*|             |*|
|*|             |*|  ~yellow~Fill inventory~lightGray~
|~red~^~lightGray~|             |~red~^~lightGray~|  ~yellow~with stone.~lightGray~
|*|~red~>~lightGray~|*|*|*|*|*|~red~<~lightGray~|*|  ~yellow~Add when asked
]]

help["8+6"] = -- "drainWaterLava":  build wall from water or lava surface downwards
[[~yellow~Clear volume of water

Plan view
~lightGray~|*|*|*|*|*|*|*|*|  * = Stone
|*|*~blue~| | |~lightGray~*|*~blue~| |~lightGray~*|  ~blue~| ~lightGray~= Water
|*~blue~| | | | | | |~lightGray~*|
|*~blue~| | | | | | |~lightGray~*|
|*~blue~| | | | | | |~lightGray~*|
|*~blue~| | | | | |~lightGray~*|*|
|*|~red~^~lightGray~|*~blue~| | | | |~lightGray~*|  ~red~^ ~lightGray~= Turtle
|*|*|*|*|*|*|*|*|  ~yellow~Width~blue~: ~yellow~6, ~orange~length~blue~:~orange~ 6
]]

help["8+7"] = -- "oceanMonumentColumns": Ocean monument 4 corner pillars
[[~lime~Rectangle at surface + corner posts
~yellow~Turtle placement  ~red~V~lime~ < ^ > ~yellow~over monument

~red~******    ******  * ~lightGray~= Avoid this area
~red~******    ******  V do not face front
******    ******  ~lime~< ^ > ~lightGray~Ideal facing~lightGray~
******    ******
~green~******~lime~++++~green~******  ~lime~+ ~lightGray~= Ideal position~green~
******~lime~++++~green~******  ~green~* ~lightGray~= Good position
~green~****************
****************  Or any corner < 12 
****************  blocks from edge
]]

help["8+8"] = -- "clearWaterPlants": clear plants before sand draining
[[~yellow~Place ~red~T~yellow~urtle at water edge.
Returns max ~blue~d~yellow~epth. ~yellow~Water ~green~p~yellow~lants~yellow~ removed

   ~red~T                       T
~lightGray~|*|*| ~blue~| | | | | | | | | | ~lightGray~|*|
|*|*| ~blue~| | | | | | | | | ~lightGray~|*|*|
|*|*| ~blue~| | | | | | | ~lightGray~|*|*|*|*|
|*|*|*| ~blue~| | |~green~p~blue~| | ~lightGray~|*|*|*|*|*|
|*|*|*| ~blue~| | |~green~p~lightGray~|*|*|*|*|*|*|*|
|*|*|*|*~blue~|d~lightGray~|*|*|*|*|*|*|*|*|*|
|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
]]

help["8+9"] = -- "createLadderToWater": Ladder to water/lava
[[~yellow~Ladder to water / lava: Plan view

 ~blue~- ~red~- ~blue~- ~red~- ~blue~- ~red~- ~blue~-    ~blue~- ~red~- ~blue~- ~red~- ~blue~- ~red~- ~blue~-
 ~red~- ~blue~- ~red~- ~blue~- ~red~- ~blue~- ~red~-    ~red~- ~blue~- ~red~-~lightGray~|*|- ~blue~- ~red~-
 ~blue~- ~red~- ~blue~- ~red~- ~blue~- ~red~- ~blue~-    ~blue~- ~red~-~lightGray~|*|~brown~L~lightGray~|*|~red~- ~blue~- ~~lightGray~
|*|*|*|~red~^~lightGray~|*|*|*|  |*|*|*|*|*|*|*|
|*|*|*|*|*|*|*|  |*|*|*|*|*|*|*|
|*|*|*|*|*|*|*|  |*|*|*|*|*|*|*|

~red~^ ~lightGray~= Turtle facing water / lava
~brown~L ~lightGray~= Ladder
]]

help["8+10"] = -- "floodArea": 
[[~yellow~Place turtle on the left corner of the top
of retaining wall facing empty area
]]

help["8+11"] =  -- "createSlopingWater" Create sloping water
[[~yellow~Place turtle on the left corner of the top
of retaining wall facing water.
The source blocks are placed ahead to
selected length
]]

help["8+12"] = -- Ocean monument drain and remove 1 of 4 quarters
[[~yellow~Turtle positions ~red~> ^ < V
~green~|*|*|*|*|*~brown~|*|*|*|~red~V~brown~|*|
~green~|~red~>~green~|- - - - ~brown~- - - -|*|
~green~|*|- - - - ~brown~- - - -|*| ~lightGray~1 Turtle removes
~green~|*|- - - - ~brown~- - - -|*| ~lightGray~1 coloured area
~green~|*|- - - - ~brown~- - - -|*|
~orange~|*|- - - - ~lime~- - - -|*| ~lightGray~6 chests / area
~orange~|*|- - - - ~lime~- - - -|*| ~lightGray~Follow turtle
~orange~|*|- - - - ~lime~- - - -|*|
~orange~|*|- - - - ~lime~- - - -|~red~<~lime~| ~lightGray~30,000 fuel each!
~orange~|*|~red~^~orange~|*|*|*~lime~|*|*|*|*|*| ~lightGray~3,000 stone each!
]] 

-- Building and railway
help["9+1"] = 
[[~yellow~Build a wall

Plan view        Side view

~red~>~lightGray~| | | | | | |   |*|*|*|*|*|*|
                 |*|*|*|*|*|*|
                 |*|*|*|*|*|*|
                 |*|*|*|*|*|*|
                ~red~T~lightGray~|~red~T~lightGray~|*|*|*|*|*|

~red~> T~lightGray~ = Turtle
				 
]] -- Build a wall
help["9+2"] = 
[[~yellow~Build a walled rectangle / house

Plan view         Side view

~yellow~L ~lightGray~|*|*|*|*|*|*|   |*|*|*|*|*|*|
~yellow~e ~lightGray~|*| | | | |*|   |*|*|*|*|*|*|
~yellow~n ~lightGray~|*| | | | |*|   |*|*|*|*|*|*|
~yellow~g ~lightGray~|*| | | | |*|   |*|*|*|*|*|*|
~yellow~t ~lightGray~|~red~^~lightGray~|*|*|*|*|*|  ~red~T~lightGray~|~red~T~lightGray~|*|*|*|*|*|
~yellow~h  ~red~^
~yellow~   W i d t h      ~red~^ T ~lightGray~= Turtle

]] -- Build a rectangular structure
help["9+3"] = 
[[~yellow~Build a gable roof
Gable built on right side of turtle
Plan view       End view (width)
                     ~gray~+      gable top
~yellow~L ~lightGray~|*|*|*|*|*|      ~gray~+ + +    gable end
~yellow~e ~lightGray~|*| | | |*|    ~red~T~gray~ + + + +  gable end
~yellow~n ~lightGray~|*| | | |*|   |*|*|*|*|*| top of wall
~yellow~g ~lightGray~|*| | | |*|   |*|*|*|*|*|
~yellow~t ~lightGray~|*| | | |*|   |*|*|*|*|*|
~yellow~h ~lightGray~|~red~^~lightGray~|*|*|*|*|   |*|*|*|*|*|
~yellow~  W i d t h     W i d t h   ~red~^T ~lightGray~= Turtle
]] -- Build a gable end roof
help["9+4"] =
[[~yellow~Build a pitched roof
Width ~red~MUST ~yellow~be ~red~<= ~yellow~Length eg ~red~4~yellow~ x 6
Plan view        End view (width)

                  ~red~T ~lightGray~on top of building
~yellow~L ~lightGray~|*|*|*|*|      |*|*|*|*|
~yellow~e ~lightGray~|*| | |*|      |*|*|*|*|
~yellow~n ~lightGray~|*| | |*|      |*|*|*|*|
~yellow~g ~lightGray~|*| | |*|      |*|*|*|*|
~yellow~t ~lightGray~|*| | |*|
~yellow~h ~lightGray~|~red~^~lightGray~|*|*|*|
~yellow~  W i d t h     ~red~^ T ~lightGray~= Turtle
]]-- Build a pitched roof
help["9+5"] =
[[~yellow~Place turtle on last block before up/down

Build down            Build up~lightGray~

_____~red~T~lightGray~                        ___
|*|*|*|_                     _|*|
      |*|_                 _|*|
        |*|_             _|*|
          |*|__________~red~T~lightGray~|*|
            |*|*|*|*|*|*|		
~red~T~lightGray~ = Turtle on block, not above rail	
]] -- build down
help["9+6"] = 
[[~yellow~Place turtle on suspended railway stone
Redstone torch will go below

~lightGray~_____
~lightGray~|*|*|\                           ~red~>~lightGray~|*|
    |*|~red~<                       ~lightGray~/|*|
      ~lightGray~|*|______~red~T~lightGray~_________    /~lightGray~|*|~red~!
       ~red~!~lightGray~|*|*|*|*|*|*|*|*|\ /|*|
               ~red~!        ~lightGray~|*|*|

~red~T < > ~lightGray~= Turtle ~red~! ~lightGray~= Redstone Torch
On block or above rail, face up slope
]] -- Place redstone torch under block
--Measurement tools
help["10+1"] = 
[[~yellow~Place turtle on floor.~lightGray~
            Measured Height:
|~lightBlue~*~lightGray~|*|*|*|   ~lightBlue~7. Overhead obstruction
            ~cyan~7. ~red~NOT ~cyan~detect() ~gray~7. Change~lightGray~
  |*|*|*|
  |*|*|*|
  |~lime~S~lightGray~|*|*|   ~lime~4. Specific block found~lightGray~
  |*|*|*|
  |*|*|*|
  |*|*|*|
 ~red~T~lightGray~|*|*|~red~T~lightGray~|   ~red~T~lightGray~ = Turtle
]] -- measure height
help["10+2"] = 
[[~yellow~Depth measurement
Place turtle on the floor above pit / edge

    ~red~T~lightGray~
1|*|*|
2|*|*|
3|*|*|
4|*|*|         Measured depth: 
5|*|~lime~S~lightGray~|         ~lime~5. Specific block found
~lightGray~6              ~cyan~6. ~red~NOT ~cyan~turtle.detect()~lightGray~ 
7|*|*|~lightBlue~*~lightGray~|*| |   ~lightBlue~6. Obstruction below
]] -- measure depth
help["10+3"] = 
[[~yellow~Length measurement

~lightGray~1 2 3 4 ~lime~5~lightGray~ 6 ~lime~7 ~cyan~8 ~lightBlue~9~lightGray~ 10
                      ~cyan~8. No block up
~lightGray~*|*|*|*|*|*|~lime~S~lightGray~| |*|*|  ~lime~7. Search block
~red~T~lightGray~                |*|  ~lightBlue~9. Obstruction
~lightGray~*|*|*|*|~lime~S~lightGray~|*|*| |*|*|  ~lime~5. Search block
                      ~cyan~8. No block down

~red~T ~lightGray~= Turtle

]] -- measure length
help["10+4"] = help["8+8"] -- measure deepest section of water
help["10+5"] =
[[~yellow~Place turtle anywhere:

 1. make a ~blue~borehole~yellow~ to chosen level.

 2. Write a report called:

 3. ~lime~borehole~blue~X~lime~.txt ~yellow~( ~blue~X ~yellow~= computer ID )

 4. ~orange~Return home

]] -- Borehole: Analyse blocks below
help["11+1"] = -- craft an item
[[



~lime~Not yet implemented



]]
help["11+2"]  =
[[~yellow~If turtle moved to other network, lists
~lightGray~'barrelItems.lua' ~yellow~and ~lightGray~'chestItems.lua'
~lime~are automatically updated.
~yellow~If more storage has been added these 
lists are also automatically updated.

~cyan~This option manually updates the lists.

~yellow~For best results add/remove items
in existing ~brown~chests ~yellow~and ~brown~barrels.
~red~Add at least one item in any ~brown~chest ~red~/
~brown~barrel ~red~to include it in the new lists.]] -- explains list creation

return help
