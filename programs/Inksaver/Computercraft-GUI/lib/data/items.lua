local version = 20251219.2200

return
{
  building =
  {
    {
      name = "minecraft:bamboo_block",
      displayName = "Block of Bamboo",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:bamboo"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:stripped_bamboo_block",
      displayName = "Block of Stripped Bamboo",
    },
    {
      name = "minecraft:bamboo_planks",
      displayName = "Bamboo Planks",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:bamboo_block"]={1,},}},{quantity = 1, ratio = 2, ingredients = {["minecraft:stripped_bamboo_block"]={1,},}},},
    },
    {
      name = "minecraft:oak_log",
      displayName = "Oak Log",
    },
    {
      name = "minecraft:stripped_oak_log",
      displayName = "Stripped Oak Log",
    },
    {
      name = "minecraft:oak_wood",
      displayName = "Oak Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:oak_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_oak_wood",
      displayName = "Stripped Oak Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stripped_oak_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:oak_planks",
      displayName = "Oak Planks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:oak_log"]={1,},}},},
    },
    {
      name = "minecraft:oak_stairs",
      displayName = "Oak Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:oak_planks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:oak_slab",
      displayName = "Oak Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:oak_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:oak_fence",
      displayName = "Oak Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:oak_planks"]={5,7,9,11,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:oak_fence_gate",
      displayName = "Oak Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:oak_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:oak_door",
      displayName = "Oak Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:oak_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:oak_trapdoor",
      displayName = "Oak Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:oak_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:oak_pressure_plate",
      displayName = "Oak Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:oak_button",
      displayName = "Oak Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={6,},}},},
    },
    {
      name = "minecraft:oak_boat",
      displayName = "Oak Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:spruce_log",
      displayName = "Spruce Log",
    },
    {
      name = "minecraft:stripped_spruce_log",
      displayName = "Stripped Spruce Log",
    },
    {
      name = "minecraft:spruce_wood",
      displayName = "Spruce Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:spruce_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_spruce_wood",
      displayName = "Stripped Spruce Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stripped_spruce_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:spruce_planks",
      displayName = "Spruce Planks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:spruce_log"]={1,},}},},
    },
    {
      name = "minecraft:spruce_stairs",
      displayName = "Spruce Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:spruce_planks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:spruce_slab",
      displayName = "Spruce Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:spruce_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:spruce_fence",
      displayName = "Spruce Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:spruce_planks"]={5,7,9,11,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:spruce_fence_gate",
      displayName = "Spruce Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:spruce_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:spruce_door",
      displayName = "Spruce Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:spruce_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:spruce_trapdoor",
      displayName = "Spruce Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:spruce_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:spruce_pressure_plate",
      displayName = "Spruce Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:spruce_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:spruce_button",
      displayName = "Spruce Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:spruce_planks"]={6,},}},},
    },
    {
      name = "minecraft:spruce_boat",
      displayName = "Spruce Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:spruce_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:birch_log",
      displayName = "Birch Log",
    },
    {
      name = "minecraft:stripped_birch_log",
      displayName = "Stripped Birch Log",
    },
    {
      name = "minecraft:birch_wood",
      displayName = "Birch Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:birch_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_birch_wood",
      displayName = "Stripped Birch Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stripped_birch_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:birch_planks",
      displayName = "Birch Planks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:birch_log"]={1,},}},},
    },
    {
      name = "minecraft:birch_stairs",
      displayName = "Birch Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:birch_planks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:birch_slab",
      displayName = "Birch Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:birch_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:birch_fence",
      displayName = "Birch Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:birch_planks"]={5,7,9,11,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:birch_fence_gate",
      displayName = "Birch Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:birch_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:birch_door",
      displayName = "Birch Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:birch_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:birch_trapdoor",
      displayName = "Birch Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:birch_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:birch_pressure_plate",
      displayName = "Birch Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:birch_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:birch_button",
      displayName = "Birch Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:birch_planks"]={6,},}},},
    },
    {
      name = "minecraft:birch_boat",
      displayName = "Birch Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:birch_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:jungle_log",
      displayName = "Jungle Log",
    },
    {
      name = "minecraft:stripped_jungle_log",
      displayName = "Stripped Jungle Log",
    },
    {
      name = "minecraft:jungle_wood",
      displayName = "Jungle Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:jungle_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_jungle_wood",
      displayName = "Stripped Jungle Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stripped_jungle_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:jungle_planks",
      displayName = "Jungle Planks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:jungle_log"]={1,},}},},
    },
    {
      name = "minecraft:jungle_stairs",
      displayName = "Jungle Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:jungle_planks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:jungle_slab",
      displayName = "Jungle Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:jungle_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:jungle_fence",
      displayName = "Jungle Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:jungle_planks"]={5,7,9,11,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:jungle_fence_gate",
      displayName = "Jungle Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:jungle_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:jungle_door",
      displayName = "Jungle Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:jungle_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:jungle_trapdoor",
      displayName = "Jungle Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:jungle_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:jungle_pressure_plate",
      displayName = "Jungle Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:jungle_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:jungle_button",
      displayName = "Jungle Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:jungle_planks"]={6,},}},},
    },
    {
      name = "minecraft:jungle_boat",
      displayName = "Jungle Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:jungle_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:acacia_log",
      displayName = "Acacia Log",
    },
    {
      name = "minecraft:stripped_acacia_log",
      displayName = "Stripped Acacia Log",
    },
    {
      name = "minecraft:acacia_wood",
      displayName = "Acacia Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:acacia_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_acacia_wood",
      displayName = "Stripped Acacia Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stripped_acacia_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:acacia_planks",
      displayName = "Acacia Planks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:acacia_log"]={1,},}},},
    },
    {
      name = "minecraft:acacia_stairs",
      displayName = "Acacia Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:acacia_planks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:acacia_slab",
      displayName = "Acacia Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:acacia_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:acacia_fence",
      displayName = "Acacia Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stick"]={6,10,},["minecraft:acacia_planks"]={5,7,9,11,},}},},
    },
    {
      name = "minecraft:acacia_fence_gate",
      displayName = "Acacia Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:acacia_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:acacia_door",
      displayName = "Acacia Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:acacia_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:acacia_trapdoor",
      displayName = "Acacia Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:acacia_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:acacia_pressure_plate",
      displayName = "Acacia Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:acacia_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:acacia_button",
      displayName = "Acacia Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:acacia_planks"]={6,},}},},
    },
    {
      name = "minecraft:acacia_boat",
      displayName = "Acacia Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:acacia_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:dark_oak_log",
      displayName = "Dark Oak Log",
    },
    {
      name = "minecraft:stripped_dark_oak_log",
      displayName = "Stripped Dark Oak Log",
    },
    {
      name = "minecraft:dark_oak_wood",
      displayName = "Dark Oak Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:dark_oak_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_dark_oak_wood",
      displayName = "Stripped Dark Oak Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stripped_dark_oak_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:dark_oak_planks",
      displayName = "Dark Oak Planks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:dark_oak_log"]={1,},}},},
    },
    {
      name = "minecraft:dark_oak_stairs",
      displayName = "Dark Oak Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:dark_oak_planks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:dark_oak_slab",
      displayName = "Dark Oak Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:dark_oak_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:dark_oak_fence",
      displayName = "Dark Oak Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stick"]={6,10,},["minecraft:dark_oak_planks"]={5,7,9,11,},}},},
    },
    {
      name = "minecraft:dark_oak_fence_gate",
      displayName = "Dark Oak Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:dark_oak_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:dark_oak_door",
      displayName = "Dark Oak Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:dark_oak_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:dark_oak_trapdoor",
      displayName = "Dark Oak Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:dark_oak_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:dark_oak_pressure_plate",
      displayName = "Dark Oak Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:dark_oak_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:dark_oak_button",
      displayName = "Dark Oak Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:dark_oak_planks"]={6,},}},},
    },
    {
      name = "minecraft:dark_oak_boat",
      displayName = "Dark Oak Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:dark_oak_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:mangrove_log",
      displayName = "Mangrove Log",
    },
    {
      name = "minecraft:stripped_mangrove_log",
      displayName = "Stripped Mangrove Log",
    },
    {
      name = "minecraft:mangrove_wood",
      displayName = "Mangrove Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:mangrove_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_mangrove_wood",
      displayName = "Stripped Mangrove Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stripped_mangrove_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:mangrove_planks",
      displayName = "Mangrove Planks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:mangrove_log"]={1,},}},},
    },
    {
      name = "minecraft:mangrove_stairs",
      displayName = "Mangrove Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:mangrove_planks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:mangrove_slab",
      displayName = "Mangrove Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:mangrove_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:mangrove_fence",
      displayName = "Mangrove Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:mangrove_planks"]={5,7,9,11,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:mangrove_fence_gate",
      displayName = "Mangrove Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:mangrove_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:mangrove_door",
      displayName = "Mangrove Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:mangrove_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:mangrove_trapdoor",
      displayName = "Mangrove Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:mangrove_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:mangrove_pressure_plate",
      displayName = "Mangrove Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:mangrove_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:mangrove_button",
      displayName = "Mangrove Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:mangrove_planks"]={6,},}},},
    },
    {
      name = "minecraft:mangrove_boat",
      displayName = "Mangrove Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:mangrove_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cherry_log",
      displayName = "Cherry Log",
    },
    {
      name = "minecraft:stripped_cherry_log",
      displayName = "Stripped Cherry Log",
    },
    {
      name = "minecraft:cherry_wood",
      displayName = "Cherry Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:cherry_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_cherry_wood",
      displayName = "Stripped Cherry Wood",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stripped_cherry_log"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:cherry_planks",
      displayName = "Cherry Planks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:cherry_log"]={1,},}},},
    },
    {
      name = "minecraft:cherry_stairs",
      displayName = "Cherry Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:cherry_planks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:cherry_slab",
      displayName = "Cherry Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:cherry_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:cherry_fence",
      displayName = "Cherry Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:cherry_planks"]={5,7,9,11,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:cherry_fence_gate",
      displayName = "Cherry Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:cherry_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:cherry_door",
      displayName = "Cherry Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:cherry_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:cherry_trapdoor",
      displayName = "Cherry Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:cherry_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cherry_pressure_plate",
      displayName = "Cherry Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cherry_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:cherry_button",
      displayName = "Cherry Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cherry_planks"]={6,},}},},
    },
    {
      name = "minecraft:cherry_boat",
      displayName = "Cherry Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cherry_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:bamboo_stairs",
      displayName = "Bamboo Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:bamboo_planks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:bamboo_slab",
      displayName = "Bamboo Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:bamboo_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:bamboo_fence",
      displayName = "Bamboo Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stick"]={6,10,},["minecraft:bamboo_planks"]={5,7,9,11,},}},},
    },
    {
      name = "minecraft:bamboo_fence_gate",
      displayName = "Bamboo Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:bamboo_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:bamboo_door",
      displayName = "Bamboo Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:bamboo_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:bamboo_trapdoor",
      displayName = "Bamboo Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:bamboo_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:bamboo_pressure_plate",
      displayName = "Bamboo Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:bamboo_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:bamboo_button",
      displayName = "Bamboo Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:bamboo_planks"]={6,},}},},
    },
    {
      name = "minecraft:bamboo_boat",
      displayName = "Bamboo Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:bamboo_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:crimson_stem",
      displayName = "Crimson Stem",
    },
    {
      name = "minecraft:crimson_hyphae",
      displayName = "Crimson Hyphae",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:crimson_stem"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_crimson_stem",
      displayName = "Stripped Crimson Stem",
    },
    {
      name = "minecraft:stripped_crimson_hyphae",
      displayName = "Stripped Crimson Hyphae",
    },
    {
      name = "minecraft:crimson_slab",
      displayName = "Crimson Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:crimson_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:crimson_fence",
      displayName = "Crimson Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stick"]={6,10,},["minecraft:crimson_planks"]={5,7,9,11,},}},},
    },
    {
      name = "minecraft:crimson_fence_gate",
      displayName = "Crimson Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:crimson_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:crimson_door",
      displayName = "Crimson Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:crimson_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:crimson_trapdoor",
      displayName = "Crimson Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:crimson_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:crimson_pressure_plate",
      displayName = "Crimson Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:crimson_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:crimson_button",
      displayName = "Crimson Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:crimson_planks"]={6,},}},},
    },
    {
      name = "minecraft:crimson_boat",
      displayName = "Crimson Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:crimson_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:warped_stem",
      displayName = "Warped Stem",
    },
    {
      name = "minecraft:warped_hyphae",
      displayName = "Warped Hyphae",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:warped_stem"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stripped_warped_stem",
      displayName = "Stripped Warped Stem",
    },
    {
      name = "minecraft:stripped_warped_hyphae",
      displayName = "Stripped Warped Hyphae",
    },
    {
      name = "minecraft:warped_slab",
      displayName = "Warped Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:warped_planks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:warped_fence",
      displayName = "Warped Fence",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:warped_planks"]={5,7,9,11,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:warped_fence_gate",
      displayName = "Warped Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:warped_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:warped_door",
      displayName = "Warped Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:warped_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:warped_trapdoor",
      displayName = "Warped Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:warped_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:warped_pressure_plate",
      displayName = "Warped Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:warped_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:warped_button",
      displayName = "Warped Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:warped_planks"]={6,},}},},
    },
    {
      name = "minecraft:warped_boat",
      displayName = "Warped Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:warped_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:stone",
      displayName = "Stone",
      smelt = {"minecraft:cobblestone"}
    },
    {
      name = "minecraft:stone_stairs",
      displayName = "Stone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:stone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:stone_slab",
      displayName = "Stone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:stone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:stone_wall",
      displayName = "Stone Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:stone"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:stone_pressure_plate",
      displayName = "Stone Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone"]={1,2,},}},},
    },
    {
      name = "minecraft:cobblestone",
      displayName = "Cobblestone",
    },
    {
      name = "minecraft:cobblestone_stairs",
      displayName = "Cobblestone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:cobblestone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:cobblestone_slab",
      displayName = "Cobblestone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:cobblestone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:cobblestone_wall",
      displayName = "Cobblestone Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:cobblestone"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:mossy_cobblestone",
      displayName = "Mossy Cobblsetone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:vines"]={6,},["minecraft:cobblestone"]={5,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:moss_block"]={6,},["minecraft:cobblestone"]={5,},}},},
    },
    {
      name = "minecraft:mossy_cobblestone_stairs",
      displayName = "Mossy Cobblsetone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:mossy_cobblestone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:mossy_cobblestone_slab",
      displayName = "Mossy Cobblsetone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:mossy_cobblestone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:mossy_cobblestone_wall",
      displayName = "Mossy Cobblsetone Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:mossy_cobblestone"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:smooth_stone",
      displayName = "Smooth Stone",
      smelt = {"minecraft:stone"}
    },
    {
      name = "minecraft:smooth_stone_stairs",
      displayName = "Smooth Stone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:smooth_stone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:smooth_stone_slab",
      displayName = "Smooth Stone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:smooth_stone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:stone_bricks",
      displayName = "Stone Bricks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:stone"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:stone_brick_stairs",
      displayName = "Stone Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:stone_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:stone_brick_slab",
      displayName = "Stone Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:stone_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:stone_brick_wall",
      displayName = "Stone Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:stone_bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cracked_stone_bricks",
      displayName = "Cracked Stone Bricks",
      smelt = {"minecraft:stone_bricks"}
    },
    {
      name = "minecraft:chiseled_stone_bricks",
      displayName = "Chiseled Stone Bricks",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone_brick_slab"]={6,10,},}},},
    },
    {
      name = "minecraft:mossy_stone_bricks",
      displayName = "Mossy Stone Bricks",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:vines"]={6,},["minecraft:stone_bricks"]={5,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:moss_block"]={6,},["minecraft:stone_bricks"]={5,},}},},
    },
    {
      name = "minecraft:mossy_stone_brick_stairs",
      displayName = "Mossy Stone Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:mossy_stone_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:mossy_stone_brick_slab",
      displayName = "Mossy Stone Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:mossy_stone_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:mossy_stone_brick_wall",
      displayName = "Mossy Stone Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:mossy_stone_bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:granite",
      displayName = "Granite",
    },
    {
      name = "minecraft:granite_stairs",
      displayName = "Granite Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:granite"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:granite_slab",
      displayName = "Granite Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:granite"]={9,10,11,},}},},
    },
    {
      name = "minecraft:granite_wall",
      displayName = "Granite Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:granite"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_granite",
      displayName = "Polished Granite",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_granite"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:polished_granite_stairs",
      displayName = "Polished Granite Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_granite"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_granite_slab",
      displayName = "Polished Granite Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:polished_granite"]={9,10,11,},}},},
    },
    {
      name = "minecraft:diorite",
      displayName = "Diorite",
    },
    {
      name = "minecraft:diorite_stairs",
      displayName = "Diorite Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:diorite"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:diorite_slab",
      displayName = "Diorite Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:diorite"]={9,10,11,},}},},
    },
    {
      name = "minecraft:diorite_wall",
      displayName = "Diorite Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:diorite"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_diorite",
      displayName = "Polished Diorite",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_diorite"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:polished_diorite_stairs",
      displayName = "Polished Diorite Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_diorite"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_diorite_slab",
      displayName = "Polished Diorite Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:polished_diorite"]={9,10,11,},}},},
    },
    {
      name = "minecraft:andesite",
      displayName = "Andesite",
    },
    {
      name = "minecraft:andesite_stairs",
      displayName = "Andesite Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:andesite"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:andesite_slab",
      displayName = "Andesite Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:andesite"]={9,10,11,},}},},
    },
    {
      name = "minecraft:andesite_wall",
      displayName = "Andesite Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:andesite"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_andesite",
      displayName = "Polished Andesite",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_andesite"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:polished_andesite_stairs",
      displayName = "Polished Andesite Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_andesite"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_andesite_slab",
      displayName = "Polished Andesite Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:polished_andesite"]={9,10,11,},}},},
    },
    {
      name = "minecraft:deepslate",
      displayName = "Deepslate",
      smelt = {"minecraft:cobbled_deepslate"}
    },
    {
      name = "minecraft:cobbled_deepslate",
      displayName = "Cobbled Deepslate",
    },
    {
      name = "minecraft:cobbled_deepslate_stairs",
      displayName = "Cobbled Deepslate Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:cobbled_deepslate"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:cobbled_deepslate_slab",
      displayName = "Cobbled Deepslate Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:cobbled_deepslate"]={9,10,11,},}},},
    },
    {
      name = "minecraft:cobbled_deepslate_wall",
      displayName = "Cobbled Deepslate Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:cobbled_deepslate"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:chiseled_deepslate",
      displayName = "Chiseled Deepslate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cobbled_deepslate_slab"]={6,10,},}},},
    },
    {
      name = "minecraft:polished_deepslate",
      displayName = "Polished Deepslate",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_deepslate"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:polished_deepslate_stairs",
      displayName = "Polished Deepslate Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_deepslate"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_deepslate_slab",
      displayName = "Polished Deepslate Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:polished_deepslate"]={9,10,11,},}},},
    },
    {
      name = "minecraft:polished_deepslate_wall",
      displayName = "Polished Deepslate Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:polished_deepslate"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:deepslate_bricks",
      displayName = "Deepslate Bricks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_deepslate"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:deepslate_brick_stairs",
      displayName = "Deepslate Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:deepslate_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:deepslate_brick_slab",
      displayName = "Deepslate Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:deepslate_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:deepslate_brick_wall",
      displayName = "Deepslate Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:deepslate_bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cracked_deepslate_bricks",
      displayName = "Cracked Deepslate Bricks",
      smelt = {"minecraft:deepslate_bricks"}
    },
    {
      name = "minecraft:deepslate_tiles",
      displayName = "Deepslate Tiles",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:deepslate_bricks"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:deepslate_tile_stairs",
      displayName = "Deepslate Tile Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:deepslate_tiles"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:deepslate_tile_slab",
      displayName = "Deepslate Tile Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:deepslate_tiles"]={9,10,11,},}},},
    },
    {
      name = "minecraft:deepslate_tile_wall",
      displayName = "Deepslate Tile Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:deepslate_tiles"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cracked_deepslate_tiles",
      displayName = "Cracked Deepslate Tiles",
      smelt = {"minecraft:deepslate_tiles"}
    },
    {
      name = "minecraft:reinforced_deepslate",
      displayName = "Reinforced Deepslate",
    },
    {
      name = "minecraft:bricks",
      displayName = "Bricks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:brick"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:brick_stairs",
      displayName = "Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:brick_slab",
      displayName = "Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:brick_wall",
      displayName = "Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:packed_mud",
      displayName = "Packed Mud",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:wheat"]={7,},["minecraft:mud"]={6,},}},},
    },
    {
      name = "minecraft:mud_bricks",
      displayName = "Mud Bricks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:packed_mud"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:mud_brick_stairs",
      displayName = "Mud Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:mud_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:mud_brick_slab",
      displayName = "Mud Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:mud_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:mud_brick_wall",
      displayName = "Mud Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:mud_bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:sandstone",
      displayName = "Sandstone",
    },
    {
      name = "minecraft:sandstone_stairs",
      displayName = "Sandstone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:sandstone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:sandstone_slab",
      displayName = "Sandstone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:sandstone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:sandstone_wall",
      displayName = "Sandstone Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:sandstone"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:chiseled_sandstone",
      displayName = "Chiseled Sandstone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:sandstone_slab"]={6,10,},}},},
    },
    {
      name = "minecraft:smooth_sandstone",
      displayName = "Smooth Sandstone",
      smelt = {"minecraft:sandstone"}
    },
    {
      name = "minecraft:smooth_sandstone_stairs",
      displayName = "Smooth Sandstone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:smooth_sandstone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:smooth_sandstone_slab",
      displayName = "Smooth Sandstone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:smooth_sandstone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:cut_sandstone",
      displayName = "Cut Sandstone",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:sandstone"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:cut_sandstone_stairs",
      displayName = "Cut Sandstone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:cut_sandstone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:red_sandstone",
      displayName = "Red Sandstone",
    },
    {
      name = "minecraft:red_sandstone_stairs",
      displayName = "Red Sandstone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:red_sandstone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:red_sandstone_slab",
      displayName = "Red Sandstone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:red_sandstone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:red_sandstone_wall",
      displayName = "Red Sandstone Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:red_sandstone"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:chiseled_red_sandstone",
      displayName = "Chiseled Red Sandstone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_sandstone_slab"]={6,10,},}},},
    },
    {
      name = "minecraft:smooth_red_sandstone",
      displayName = "Smooth Red Sandstone",
      smelt = {"minecraft:red_sandstone"}
    },
    {
      name = "minecraft:smooth_red_sandstone_stairs",
      displayName = "Smooth Red Sandstone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:smooth_red_sandstone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:smooth_red_sandstone_slab",
      displayName = "Smooth Red Sandstone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:smooth_red_sandstone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:cut_red_sandstone",
      displayName = "Cut Red Sandstone",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:red_sandstone"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:cut_red_sandstone_stairs",
      displayName = "Cut Red Sandstone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:cut_red_sandstone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:prismarine",
      displayName = "Prismarine",
    },
    {
      name = "minecraft:prismarine_stairs",
      displayName = "Prismarine Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:prismarine"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:prismarine_slab",
      displayName = "Prismarine Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:prismarine"]={9,10,11,},}},},
    },
    {
      name = "minecraft:prismarine_wall",
      displayName = "Prismarine Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:prismarine"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:prismarine_bricks",
      displayName = "Prismarine Bricks",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:prismarine_shard"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:prismarine_brick_stairs",
      displayName = "Prismarine Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:prismarine_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:prismarine_brick_slab",
      displayName = "Prismarine Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:prismarine_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:dark_prismarine",
      displayName = "Dark Prismarine",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:black_dye"]={6,},["minecraft:prismarine_shard"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:dark_prismarine_stairs",
      displayName = "Dark Prismarine Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:dark_prismarine"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:dark_prismarine_slab",
      displayName = "Dark Prismarine Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:dark_prismarine"]={9,10,11,},}},},
    },
    {
      name = "minecraft:netherrack",
      displayName = "Netherrack",
    },
    {
      name = "minecraft:nether_bricks",
      displayName = "Nether Bricks",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:nether_brick"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:nether_brick_stairs",
      displayName = "Nether Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:nether_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:nether_brick_slab",
      displayName = "Nether Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:nether_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:nether_brick_wall",
      displayName = "Nether Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:nether_bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:nether_brick_pressure_plate",
      displayName = "Nether Brick Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:nether_bricks"]={1,2,},}},},
    },
    {
      name = "minecraft:cracked_nether_bricks",
      displayName = "Cracked Nether Bricks",
      smelt = {"minecraft:nether_bricks"}
    },
    {
      name = "minecraft:cracked_nether_brick_stairs",
      displayName = "Cracked Nether Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:cracked_nether_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:cracked_nether_brick_slab",
      displayName = "Cracked Nether Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:cracked_nether_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:cracked_nether_brick_wall",
      displayName = "Cracked Nether Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:cracked_nether_bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cracked_nether_brick_pressure_plate",
      displayName = "Cracked Nether Brick Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cracked_nether_bricks"]={1,2,},}},},
    },
    {
      name = "minecraft:chiseled_nether_bricks",
      displayName = "Chiseled Nether Bricks",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:nether_brick_slab"]={6,10,},}},},
    },
    {
      name = "minecraft:red_nether_bricks",
      displayName = "Red Nether Bricks",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:nether_wart"]={5,10,},["minecraft:nether_brick"]={6,9,},}},},
    },
    {
      name = "minecraft:red_nether_brick_stairs",
      displayName = "Red Nether Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:nether_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:red_nether_brick_slab",
      displayName = "Red Nether Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:nether_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:red_nether_brick_wall",
      displayName = "Red Nether Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:nether_bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:basalt",
      displayName = "Basalt",
    },
    {
      name = "minecraft:smooth_basalt",
      displayName = "Smooth Basalt",
      smelt = {"minecraft:basalt"}
    },
    {
      name = "minecraft:polished_basalt",
      displayName = "Polished Basalt",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_basalt"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:blackstone",
      displayName = "Blackstone",
    },
    {
      name = "minecraft:blackstone_stairs",
      displayName = "Blackstone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:blackstone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:blackstone_slab",
      displayName = "Blackstone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:blackstone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:blackstone_wall",
      displayName = "Blackstone Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:blackstone"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:gilded_blackstone",
      displayName = "Gilded Blackstone",
    },
    {
      name = "minecraft:chiseled_polished_blackstone",
      displayName = "Chiseled Polished Blackstone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:polished_blackstone_slab"]={6,10,},}},},
    },
    {
      name = "minecraft:polished_blackstone",
      displayName = "Polished Blackstone",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_blackstone"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:polished_blackstone_stairs",
      displayName = "Polished Blackstone Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_blackstone"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_blackstone_slab",
      displayName = "Polished Blackstone Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:polished_blackstone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:polished_blackstone_wall",
      displayName = "Polished Blackstone Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:polished_blackstone"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_blackstone_pressure_plate",
      displayName = "Polished Blackstone Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:polished_blackstone"]={1,2,},}},},
    },
    {
      name = "minecraft:polished_blackstone_button",
      displayName = "Polished Blackstone Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:polished_blackstone"]={6,},}},},
    },
    {
      name = "minecraft:polished_blackstone_bricks",
      displayName = "Polished Blackstone Bricks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_blackstone"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:polished_blackstone_brick_stairs",
      displayName = "Polished Blackstone Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:polished_blackstone_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:polished_blackstone_brick_slab",
      displayName = "Polished Blackstone Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:polished_blackstone_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:polished_blackstone_brick_wall",
      displayName = "Polished Blackstone Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:polished_blackstone_bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cracked_polished_blackstone_bricks",
      displayName = "Cracked Polished Blackstone Bricks",
      smelt = {"minecraft:polished_blackstone_bricks"}
    },
    {
      name = "minecraft:end_stone",
      displayName = "End Stone",
    },
    {
      name = "minecraft:end_stone_bricks",
      displayName = "End Stone Bricks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:end_stone"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:end_stone_brick_stairs",
      displayName = "End Stone Brick Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:end_stone_bricks"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:end_stone_brick_slab",
      displayName = "End Stone Brick Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:end_stone_bricks"]={9,10,11,},}},},
    },
    {
      name = "minecraft:end_stone_brick_wall",
      displayName = "End Stone Brick Wall",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:end_stone_bricks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:purpur_block",
      displayName = "Purpur Block",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:popped_chorus_fruit"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:purpur_pillar",
      displayName = "Purpur Pillar",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:purpur_slab"]={6,10,},}},},
    },
    {
      name = "minecraft:purpur_stairs",
      displayName = "Purpur Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:purpur_block"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:purpur_slab",
      displayName = "Purpur Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:purpur_block"]={9,10,11,},}},},
    },
    {
      name = "minecraft:ancient_debris",
      displayName = "Ancient Debris",
    },
    {
      name = "minecraft:netherite_scrap",
      displayName = "Netherite Scrap",
      smelt = {"minecraft:ancient_debris"}
    },
    {
      name = "minecraft:charcoal",
      displayName = "Charcoal",
      smelt = {"log", "wood"}
    },
    {
      name = "minecraft:coal_block",
      displayName = "Block of Coal",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:coal"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:coal",
      displayName = "Coal",
      smelt = {"minecraft:coal_ore", "minecraft:deepslate_coal_ore"}
    },
    {
      name = "minecraft:iron_block",
      displayName = "Block of Iron",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:iron_ingot",
      displayName = "Iron Ingot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_nugget"]={1,2,3,5,6,7,9,10,11,},}},{quantity = 1, ratio = 9, ingredients = {["minecraft:iron_block"]={1,},}},},
      smelt = {"minecraft:raw_iron"}
    },
    {
      name = "minecraft:iron_nugget",
      displayName = "Iron Nugget",
      recipes = {{quantity = 1, ratio = 9, ingredients = {["minecraft:iron_ingot"]={1,},}},},
      smelt = {"iron_item"}
    },
    {
      name = "minecraft:iron_bars",
      displayName = "Iron Bars",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:iron_ingot"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:iron_door",
      displayName = "Iron Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:iron_ingot"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:iron_trapdoor",
      displayName = "Iron Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:iron_ingot"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:heavy_weighted_pressure_plate",
      displayName = "Heavy Weighted Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={5,6,},}},},
    },
    {
      name = "minecraft:chain",
      displayName = "Chain",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_nugget"]={2,10,},["minecraft:iron_ingot"]={6,},}},},
    },
    {
      name = "minecraft:gold_block",
      displayName = "Block of Gold",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:gold_ingot",
      displayName = "Gold Ingot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_nugget"]={1,2,3,5,6,7,9,10,11,},}},{quantity = 1, ratio = 9, ingredients = {["minecraft:gold_block"]={1,},}},},
      smelt = {"minecraft:raw_gold"}
    },
    {
      name = "minecraft:nether_gold",
      displayName = "Nether Gold",
    },
    {
      name = "minecraft:gold_nugget",
      displayName = "Gold Nugget",
      recipes = {{quantity = 1, ratio = 9, ingredients = {["minecraft:gold_ingot"]={1,},}},},
      smelt = {"golden_item"}
    },
    {
      name = "minecraft:gold_ingot",
      displayName = "Gold Ingot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_nugget"]={1,2,3,5,6,7,9,10,11,},}},{quantity = 1, ratio = 9, ingredients = {["minecraft:gold_block"]={1,},}},},
      smelt = {"minecraft:raw_gold", "minecraft:nether_gold"}
    },
    {
      name = "minecraft:light_weighted_pressure_plate",
      displayName = "Light Weighted Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={5,6,},}},},
    },
    {
      name = "minecraft:redstone_block",
      displayName = "Block of Redstone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:emerald_block",
      displayName = "Block of Emerald",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:emerald"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:emerald",
      displayName = "Emerald",
      smelt = {"minecraft:emerald_ore", "minecraft:deepslate_emerald_ore"}
    },
    {
      name = "minecraft:lapis_lazuli_block",
      displayName = "Block of Lapis Lazuli",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lapis_lazuli"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:lapis_lazuli",
      displayName = "Lapis Lazuli",
      smelt = {"minecraft:lapis_lazuli_ore", "minecraft:deepslate_lapis_lazuli_ore"}
    },
    {
      name = "minecraft:diamond_block",
      displayName = "Block of Diamond",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:diamond",
      displayName = "Diamond",
      smelt = {"minecraft:diamond_ore", "minecraft:deepslate_diamond_ore"}
    },
    {
      name = "minecraft:netherite_block",
      displayName = "Block of Netherite",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:netherite_ingot"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:nether_quartz_ore",
      displayName = "Nether Quartz Ore",
    },
    {
      name = "minecraft:quartz",
      displayName = "Quartz",
      smelt = {"minecraft:nether_quartz_ore"}
    },
    {
      name = "minecraft:quartz_block",
      displayName = "Block of Quartz",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:quartz"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:quartz_stairs",
      displayName = "Quartz Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:quartz_block"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:quartz_slab",
      displayName = "Quartz Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:quartz_block"]={9,10,11,},}},},
    },
    {
      name = "minecraft:chiseled_quartz_block",
      displayName = "Chiseled Quartz Block",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:quartz_slab"]={6,10,},}},},
    },
    {
      name = "minecraft:quartz_bricks",
      displayName = "Quartz Bricks",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:quartz_block"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:quartz_pillar",
      displayName = "Quartz Pillar",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:quartz_block"]={1,5,},}},},
    },
    {
      name = "minecraft:smooth_quartz_block",
      displayName = "Smooth Quartz Block",
      smelt = {"minecraft:quartz_block"}
    },
    {
      name = "minecraft:smooth_quartz_stairs",
      displayName = "Smooth Quartz Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:smooth_quartz_block"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:smooth_quartz_slab",
      displayName = "Smooth Quartz Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:smooth_quartz_block"]={9,10,11,},}},},
    },
    {
      name = "minecraft:amethyst_block",
      displayName = "Block of Amethyst",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:amethyst"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:copper_block",
      displayName = "Block of Copper",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:copper_ingot"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:copper_ingot",
      displayName = "Copper Ingot",
      recipes = {{quantity = 1, ratio = 9, ingredients = {["minecraft:copper_block"]={1,},}},},
      smelt = {"minecraft:raw_copper"}
    },
    {
      name = "minecraft:cut_copper",
      displayName = "Cut Copper",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:copper_block"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:cut_copper_stairs",
      displayName = "Cut Copper Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:cut_copper"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:cut_copper_slab",
      displayName = "Cut Copper Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:cut_copper"]={9,10,11,},}},},
    },
    {
      name = "minecraft:exposed_copper",
      displayName = "Exposed Copper",
    },
    {
      name = "minecraft:exposed_cut_copper",
      displayName = "Exposed Cut Copper",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:exposed_copper_block"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:exposed_cut_copper_stairs",
      displayName = "Exposed Cut Copper Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:exposed_cut_copper"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:exposed_cut_copper_slab",
      displayName = "Exposed Cut Copper Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:exposed_cut_copper"]={9,10,11,},}},},
    },
    {
      name = "minecraft:weathered_copper",
      displayName = "Weathered Copper",
    },
    {
      name = "minecraft:weathered_cut_copper",
      displayName = "Weathered Cut Copper",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:weathered_copper_block"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:weathered_cut_copper_stairs",
      displayName = "Weathered Cut Copper Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:weathered_cut_copper"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:weathered_cut_copper_slab",
      displayName = "Weathered Cut Copper Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:weathered_cut_copper"]={9,10,11,},}},},
    },
    {
      name = "minecraft:oxidized_copper",
      displayName = "Oxidized Copper",
    },
    {
      name = "minecraft:oxidized_cut_copper",
      displayName = "Oxidized Cut Copper",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:oxidized_copper_block"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:oxidized_cut_copper_stairs",
      displayName = "Oxidized Cut Copper Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:oxidized_cut_copper"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:oxidized_cut_copper_slab",
      displayName = "Oxidised Cut Copper Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:oxidized_cut_copper"]={9,10,11,},}},},
    },
    {
      name = "minecraft:waxed_copper_block",
      displayName = "Waxed Block of Copper",
    },
    {
      name = "minecraft:waxed_cut_copper",
      displayName = "Waxed Cut Copper",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:waxed_copper_block"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:waxed_cut_copper_stairs",
      displayName = "Waxed Cut Copper Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:waxed_cut_copper"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:waxed_cut_copper_slab",
      displayName = "Waxed Cut Copper Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:waxed_cut_copper"]={9,10,11,},}},},
    },
    {
      name = "minecraft:waxed_exposed_copper_block",
      displayName = "Waxed Exposed Block of Copper",
    },
    {
      name = "minecraft:waxed_exposed_cut_copper",
      displayName = "Waxed Exposed Cut Copper",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:waxed_exposed_copper_block"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:waxed_exposed_cut_copper_stairs",
      displayName = "Waxed Exposed Cut Copper Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:waxed_exposed_cut_copper"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:waxed_exposed_cut_copper_slab",
      displayName = "Waxed Exposed Cut Copper Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:waxed_exposed_cut_copper"]={9,10,11,},}},},
    },
    {
      name = "minecraft:waxed_weathered_copper",
      displayName = "Waxed Weathered Copper",
    },
    {
      name = "minecraft:waxed_weathered_cut_copper",
      displayName = "Waxed Weathered Cut Copper",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:waxed_weathered_copper_block"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:waxed_weathered_cut_copper_stairs",
      displayName = "Waxed Weathered Cut Copper Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:waxed_weathered_cut_copper"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:waxed_weathered_cut_copper_slab",
      displayName = "Waxed Weathered Cut Copper Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:waxed_weathered_cut_copper"]={9,10,11,},}},},
    },
    {
      name = "minecraft:waxed_oxidized_copper",
      displayName = "Waxed Oxidized Copper",
    },
    {
      name = "minecraft:waxed_oxidized_cut_copper",
      displayName = "Waxed Oxidized Cut Copper",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:waxed_oxidized_copper_block"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:waxed_oxidized_cut_copper_stairs",
      displayName = "Waxed Oxidized Cut Copper Stairs",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:waxed_oxidized_cut_copper"]={1,5,6,9,10,11,},}},},
    },
    {
      name = "minecraft:waxed_oxidized_cut_copper_slab",
      displayName = "Waxed Oxidized Cut Copper Slab",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:waxed_oxidized_cut_copper"]={9,10,11,},}},},
    },
  },
  colored =
  {
    {
      name = "minecraft:white_wool",
      displayName = "Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:string"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:gray_wool",
      displayName = "Gray Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_wool"]={5,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_wool",
      displayName = "Light Gray Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_gray_dye"]={6,},["minecraft:*_wool"]={5,},}},},
    },
    {
      name = "minecraft:brown_wool",
      displayName = "Brown Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:brown_dye"]={6,},["minecraft:*_wool"]={5,},}},},
    },
    {
      name = "minecraft:red_wool",
      displayName = "Red Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_dye"]={6,},["minecraft:*_wool"]={5,},}},},
    },
    {
      name = "minecraft:orange_wool",
      displayName = "Orange Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_wool"]={5,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_wool",
      displayName = "Yellow Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_dye"]={6,},["minecraft:*_wool"]={5,},}},},
    },
    {
      name = "minecraft:lime_wool",
      displayName = "Lime Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_dye"]={6,},["minecraft:*_wool"]={5,},}},},
    },
    {
      name = "minecraft:green_wool",
      displayName = "Green Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_wool"]={5,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_wool",
      displayName = "Cyan Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_wool"]={5,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_wool",
      displayName = "Blue Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_wool"]={5,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_wool",
      displayName = "Light Blue Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_blue_dye"]={6,},["minecraft:*_wool"]={5,},}},},
    },
    {
      name = "minecraft:purple_wool",
      displayName = "Purple Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_wool"]={5,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_wool",
      displayName = "Magenta Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:magenta_dye"]={6,},["minecraft:*_wool"]={5,},}},},
    },
    {
      name = "minecraft:pink_wool",
      displayName = "Pink Wool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_wool"]={5,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:white_carpet",
      displayName = "White Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:white_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:white_dye"]={6,},["minecraft:*_carpet"]={5,},}},},
    },
    {
      name = "minecraft:gray_carpet",
      displayName = "Gray Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:gray_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_carpet"]={5,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_carpet",
      displayName = "Light Gray Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:light_gray_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:light_gray_dye"]={6,},["minecraft:*_carpet"]={5,},}},},
    },
    {
      name = "minecraft:brown_carpet",
      displayName = "Brown Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:brown_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:brown_dye"]={6,},["minecraft:*_carpet"]={5,},}},},
    },
    {
      name = "minecraft:red_carpet",
      displayName = "Red Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:red_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:red_dye"]={6,},["minecraft:*_carpet"]={5,},}},},
    },
    {
      name = "minecraft:orange_carpet",
      displayName = "Orange Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:orange_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_carpet"]={5,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_carpet",
      displayName = "Yellow Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:yellow_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_dye"]={6,},["minecraft:*_carpet"]={5,},}},},
    },
    {
      name = "minecraft:lime_carpet",
      displayName = "Lime Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:lime_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_dye"]={6,},["minecraft:*_carpet"]={5,},}},},
    },
    {
      name = "minecraft:green_carpet",
      displayName = "Green Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:green_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_carpet"]={5,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_carpet",
      displayName = "Cyan Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:cyan_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_carpet"]={5,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_carpet",
      displayName = "Blue Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:blue_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_carpet"]={5,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_carpet",
      displayName = "Light Blue Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:light_blue_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:light_blue_dye"]={6,},["minecraft:*_carpet"]={5,},}},},
    },
    {
      name = "minecraft:purple_carpet",
      displayName = "Purple Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:purple_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_carpet"]={5,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_carpet",
      displayName = "Magenta Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:magenta_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:magenta_dye"]={6,},["minecraft:*_carpet"]={5,},}},},
    },
    {
      name = "minecraft:pink_carpet",
      displayName = "Pink Carpet",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:pink_wool"]={5,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_carpet"]={5,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:terracotta",
      displayName = "Terracotta",
      smelt = {"minecraft:clay"}
    },
    {
      name = "minecraft:white_terracotta",
      displayName = "White Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:white_dye"]={6,},}},},
    },
    {
      name = "minecraft:gray_terracotta",
      displayName = "Gray Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_terracotta",
      displayName = "Light Gray Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:light_gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:brown_terracotta",
      displayName = "Brown Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:brown_dye"]={6,},}},},
    },
    {
      name = "minecraft:red_terracotta",
      displayName = "Red Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:red_dye"]={6,},}},},
    },
    {
      name = "minecraft:orange_terracotta",
      displayName = "Orange Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_terracotta",
      displayName = "Yellow Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:yellow_dye"]={6,},}},},
    },
    {
      name = "minecraft:lime_terracotta",
      displayName = "Lime Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:lime_dye"]={6,},}},},
    },
    {
      name = "minecraft:green_terracotta",
      displayName = "Green Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_terracotta",
      displayName = "Cyan Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_terracotta",
      displayName = "Blue Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_terracotta",
      displayName = "Light Blue Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:light_blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:purple_terracotta",
      displayName = "Purple Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_terracotta",
      displayName = "Magenta Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:magenta_dye"]={6,},}},},
    },
    {
      name = "minecraft:pink_terracotta",
      displayName = "Pink Terracotta",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:terracotta"]={1,2,3,5,7,9,10,11,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:white_concrete",
      displayName = "White Concrete",
    },
    {
      name = "minecraft:gray_concrete",
      displayName = "Gray Concrete",
    },
    {
      name = "minecraft:light_gray_concrete",
      displayName = "Light Gray Concrete",
    },
    {
      name = "minecraft:brown_concrete",
      displayName = "Brown Concrete",
    },
    {
      name = "minecraft:red_concrete",
      displayName = "Red Concrete",
    },
    {
      name = "minecraft:orange_concrete",
      displayName = "Orange Concrete",
    },
    {
      name = "minecraft:yellow_concrete",
      displayName = "Yellow Concrete",
    },
    {
      name = "minecraft:lime_concrete",
      displayName = "Lime Concrete",
    },
    {
      name = "minecraft:green_concrete",
      displayName = "Green Concrete",
    },
    {
      name = "minecraft:cyan_concrete",
      displayName = "Cyan Concrete",
    },
    {
      name = "minecraft:blue_concrete",
      displayName = "Blue Concrete",
    },
    {
      name = "minecraft:light_blue_concrete",
      displayName = "Light Blue Concrete",
    },
    {
      name = "minecraft:purple_concrete",
      displayName = "Purple Concrete",
    },
    {
      name = "minecraft:magenta_concrete",
      displayName = "Magenta Concrete",
    },
    {
      name = "minecraft:pink_concrete",
      displayName = "Pink Concrete",
    },
    {
      name = "minecraft:white_concrete_powder",
      displayName = "White Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gravel"]={7,9,10,11,},["minecraft:white_dye"]={1,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:gray_concrete_powder",
      displayName = "Gray Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gray_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:light_gray_concrete_powder",
      displayName = "Light Gray Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gravel"]={7,9,10,11,},["minecraft:light_gray_dye"]={1,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:brown_concrete_powder",
      displayName = "Brown Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:brown_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:red_concrete_powder",
      displayName = "Red Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gravel"]={7,9,10,11,},["minecraft:red_dye"]={1,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:orange_concrete_powder",
      displayName = "Orange Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:orange_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:yellow_concrete_powder",
      displayName = "Yellow Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:lime_concrete_powder",
      displayName = "Lime Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:green_concrete_powder",
      displayName = "Green Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:green_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:cyan_concrete_powder",
      displayName = "Cyan Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cyan_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:blue_concrete_powder",
      displayName = "Blue Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:blue_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:light_blue_concrete_powder",
      displayName = "Light Blue Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gravel"]={7,9,10,11,},["minecraft:light_blue_dye"]={1,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:purple_concrete_powder",
      displayName = "Purple Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:purple_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:magenta_concrete_powder",
      displayName = "Magenta Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gravel"]={7,9,10,11,},["minecraft:magenta_dye"]={1,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:pink_concrete_powder",
      displayName = "Pink Concrete Powder",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:pink_dye"]={1,},["minecraft:gravel"]={7,9,10,11,},["minecraft:sand"]={2,3,5,6,},}},},
    },
    {
      name = "minecraft:white_glazed_terracotta",
      displayName = "White Glazed Terracotta",
      smelt = {"minecraft:white_terracotta"}
    },
    {
      name = "minecraft:gray_glazed_terracotta",
      displayName = "Gray Glazed Terracotta",
      smelt = {"minecraft:gray_terracotta"}
    },
    {
      name = "minecraft:light_gray_glazed_terracotta",
      displayName = "Light Gray Glazed Terracotta",
      smelt = {"minecraft:light_gray_terracotta"}
    },
    {
      name = "minecraft:brown_glazed_terracotta",
      displayName = "Brown Glazed Terracotta",
      smelt = {"minecraft:brown_terracotta"}
    },
    {
      name = "minecraft:red_glazed_terracotta",
      displayName = "Red Glazed Terracotta",
      smelt = {"minecraft:red_terracotta"}
    },
    {
      name = "minecraft:orange_glazed_terracotta",
      displayName = "Orange Glazed Terracotta",
      smelt = {"minecraft:orange_terracotta"}
    },
    {
      name = "minecraft:yellow_glazed_terracotta",
      displayName = "Yellow Glazed Terracotta",
      smelt = {"minecraft:yellow_terracotta"}
    },
    {
      name = "minecraft:lime_glazed_terracotta",
      displayName = "Lime Glazed Terracotta",
      smelt = {"minecraft:lime_terracotta"}
    },
    {
      name = "minecraft:green_glazed_terracotta",
      displayName = "Green Glazed Terracotta",
      smelt = {"minecraft:green_terracotta"}
    },
    {
      name = "minecraft:cyan_glazed_terracotta",
      displayName = "Cyan Glazed Terracotta",
      smelt = {"minecraft:cyan_terracotta"}
    },
    {
      name = "minecraft:blue_glazed_terracotta",
      displayName = "Blue Glazed Terracotta",
      smelt = {"minecraft:blue_terracotta"}
    },
    {
      name = "minecraft:light_blue_glazed_terracotta",
      displayName = "Light Blue Glazed Terracotta",
      smelt = {"minecraft:light_blue_terracotta"}
    },
    {
      name = "minecraft:purple_glazed_terracotta",
      displayName = "Purple Glazed Terracotta",
      smelt = {"minecraft:purple_terracotta"}
    },
    {
      name = "minecraft:magenta_glazed_terracotta",
      displayName = "Magenta Glazed Terracotta",
      smelt = {"minecraft:magenta_terracotta"}
    },
    {
      name = "minecraft:pink_glazed_terracotta",
      displayName = "Pink Glazed Terracotta",
      smelt = {"minecraft:pink_terracotta"}
    },
    {
      name = "minecraft:glass",
      displayName = "Glass",
      smelt = {"minecraft:sand", "minecraft:red_sand"}
    },
    {
      name = "minecraft:white_stained_glass",
      displayName = "White Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:white_dye"]={6,},}},},
    },
    {
      name = "minecraft:gray_stained_glass",
      displayName = "Gray Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_stained_glass",
      displayName = "Light Gray Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:light_gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:brown_stained_glass",
      displayName = "Brown Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:brown_dye"]={6,},}},},
    },
    {
      name = "minecraft:red_stained_glass",
      displayName = "Red Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:red_dye"]={6,},}},},
    },
    {
      name = "minecraft:orange_stained_glass",
      displayName = "Orange Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_stained_glass",
      displayName = "Yellow Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:yellow_dye"]={6,},}},},
    },
    {
      name = "minecraft:lime_stained_glass",
      displayName = "Lime Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:lime_dye"]={6,},}},},
    },
    {
      name = "minecraft:green_stained_glass",
      displayName = "Green Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_stained_glass",
      displayName = "Cyan Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_stained_glass",
      displayName = "Blue Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_stained_glass",
      displayName = "Light Blue Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:light_blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:purple_stained_glass",
      displayName = "Purple Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_stained_glass",
      displayName = "Magenta Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:magenta_dye"]={6,},}},},
    },
    {
      name = "minecraft:pink_stained_glass",
      displayName = "Pink Stained Glass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glass"]={1,2,3,5,7,9,10,11,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:glass_pane",
      displayName = "Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:white_stained_glass_pane",
      displayName = "White Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:white_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:gray_stained_glass_pane",
      displayName = "Gray Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:gray_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:light_gray_stained_glass_pane",
      displayName = "Light Gray Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:light_gray_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:brown_stained_glass_pane",
      displayName = "Brown Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:brown_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:red_stained_glass_pane",
      displayName = "Red Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:red_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:orange_stained_glass_pane",
      displayName = "Orange Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:orange_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:yellow_stained_glass_pane",
      displayName = "Yellow Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:yellow_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:lime_stained_glass_pane",
      displayName = "Lime Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:lime_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:green_stained_glass_pane",
      displayName = "Green Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:green_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cyan_stained_glass_pane",
      displayName = "Cyan Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:cyan_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:blue_stained_glass_pane",
      displayName = "Blue Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:blue_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:light_blue_stained_glass_pane",
      displayName = "Light Blue Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:light_blue_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:purple_stained_glass_pane",
      displayName = "Purple Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:purple_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:magenta_stained_glass_pane",
      displayName = "Magenta Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:magenta_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:pink_stained_glass_pane",
      displayName = "Pink Stained Glass Pane",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:pink_stained_glass"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:white_shulker_box",
      displayName = "White Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:white_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:gray_shulker_box",
      displayName = "Gray Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_shulker_box",
      displayName = "Light Gray Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_gray_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:brown_shulker_box",
      displayName = "Brown Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:brown_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:red_shulker_box",
      displayName = "Red Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:orange_shulker_box",
      displayName = "Orange Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_shulker_box",
      displayName = "Yellow Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:lime_shulker_box",
      displayName = "Lime Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:green_shulker_box",
      displayName = "Green Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_shulker_box",
      displayName = "Cyan Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_shulker_box",
      displayName = "Blue Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_shulker_box",
      displayName = "Light Blue Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_blue_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:purple_shulker_box",
      displayName = "Purple Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_shulker_box",
      displayName = "Magenta Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:magenta_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:pink_shulker_box",
      displayName = "Pink Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:white_bed",
      displayName = "White Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:white_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:white_dye"]={6,},}},},
    },
    {
      name = "minecraft:gray_bed",
      displayName = "Gray Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gray_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_bed",
      displayName = "Light Gray Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:light_gray_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:light_gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:brown_bed",
      displayName = "Brown Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:brown_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:brown_dye"]={6,},}},},
    },
    {
      name = "minecraft:red_bed",
      displayName = "Red Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:red_dye"]={6,},}},},
    },
    {
      name = "minecraft:orange_bed",
      displayName = "Orange Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:orange_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_bed",
      displayName = "Yellow Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:yellow_dye"]={6,},}},},
    },
    {
      name = "minecraft:lime_bed",
      displayName = "Lime Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:lime_dye"]={6,},}},},
    },
    {
      name = "minecraft:green_bed",
      displayName = "Green Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:green_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_bed",
      displayName = "Cyan Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cyan_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_bed",
      displayName = "Blue Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:blue_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_bed",
      displayName = "Light Blue Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:light_blue_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:light_blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:purple_bed",
      displayName = "Purple Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:purple_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_bed",
      displayName = "Magenta Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:magenta_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:magenta_dye"]={6,},}},},
    },
    {
      name = "minecraft:pink_bed",
      displayName = "Pink Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:pink_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:candle",
      displayName = "Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:string"]={2,},["minecraft:honeycomb"]={6,},}},},
    },
    {
      name = "minecraft:white_candle",
      displayName = "White Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:white_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:gray_candle",
      displayName = "Gray Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_candle",
      displayName = "Light Gray Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_gray_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:brown_candle",
      displayName = "Brown Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:brown_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:red_candle",
      displayName = "Red Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:orange_candle",
      displayName = "Orange Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_candle",
      displayName = "Yellow Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:lime_candle",
      displayName = "Lime Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:green_candle",
      displayName = "Green Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_candle",
      displayName = "Cyan Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_candle",
      displayName = "Blue Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_candle",
      displayName = "Light Blue Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_blue_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:purple_candle",
      displayName = "Purple Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_candle",
      displayName = "Magenta Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:magenta_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:pink_candle",
      displayName = "Pink Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:white_banner",
      displayName = "White Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:white_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:gray_banner",
      displayName = "Gray Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gray_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:light_gray_banner",
      displayName = "Light Gray Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:light_gray_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:brown_banner",
      displayName = "Brown Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:brown_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:red_banner",
      displayName = "Red Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:orange_banner",
      displayName = "Orange Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:orange_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:yellow_banner",
      displayName = "Yellow Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:lime_banner",
      displayName = "Lime Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:green_banner",
      displayName = "Green Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:green_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:cyan_banner",
      displayName = "Cyan Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cyan_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:blue_banner",
      displayName = "Blue Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:blue_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:light_blue_banner",
      displayName = "Light Blue Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:light_blue_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:purple_banner",
      displayName = "Purple Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:purple_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:magenta_banner",
      displayName = "Magenta Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:magenta_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:pink_banner",
      displayName = "Pink Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:pink_wool"]={1,2,3,5,6,7,},}},},
    },
  },
  natural =
  {
    {
      name = "minecraft:grass_block",
      displayName = "Grass Block",
    },
    {
      name = "minecraft:podzol",
      displayName = "Podzol",
    },
    {
      name = "minecraft:mycelium",
      displayName = "Mycelium",
    },
    {
      name = "minecraft:dirt_path",
      displayName = "Dirt Path",
    },
    {
      name = "minecraft:dirt",
      displayName = "Dirt",
    },
    {
      name = "minecraft:coarse_dirt",
      displayName = "Coarse Dirt",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:dirt"]={5,10,},["minecraft:gravel"]={6,9,},}},},
    },
    {
      name = "minecraft:rooted_dirt",
      displayName = "Rooted Dirt",
    },
    {
      name = "minecraft:farmland",
      displayName = "Farmland",
    },
    {
      name = "minecraft:mud",
      displayName = "Mud",
    },
    {
      name = "minecraft:clay",
      displayName = "Clay",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:clay_ball"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:gravel",
      displayName = "Gravel",
    },
    {
      name = "minecraft:sand",
      displayName = "Sand",
    },
    {
      name = "minecraft:sandstone",
      displayName = "Sandstone",
    },
    {
      name = "minecraft:red_sand",
      displayName = "Red Sand",
    },
    {
      name = "minecraft:red_sandstone",
      displayName = "Red Sandstone",
    },
    {
      name = "minecraft:ice",
      displayName = "Ice",
    },
    {
      name = "minecraft:packed_ice",
      displayName = "Packed Ice",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:ice"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:blue_ice",
      displayName = "Blue Ice",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:packed_ice"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:snow_block",
      displayName = "Snow Block",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:snowball"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:snow",
      displayName = "Snow",
    },
    {
      name = "minecraft:moss_block",
      displayName = "Moss Block",
    },
    {
      name = "minecraft:moss_carpet",
      displayName = "Moss Carpet",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:moss_block"]={5,6,},}},},
    },
    {
      name = "minecraft:stone",
      displayName = "Stone",
    },
    {
      name = "minecraft:deepslate",
      displayName = "Deepslate",
    },
    {
      name = "minecraft:granite",
      displayName = "Granite",
    },
    {
      name = "minecraft:diorite",
      displayName = "Diorite",
    },
    {
      name = "minecraft:andesite",
      displayName = "Andesite",
    },
    {
      name = "minecraft:calcite",
      displayName = "Calcite",
    },
    {
      name = "minecraft:tuff",
      displayName = "Tuff",
    },
    {
      name = "minecraft:dripstone_block",
      displayName = "Dripstone Block",
    },
    {
      name = "minecraft:pointed_dripstone",
      displayName = "Pointed Dripstone",
    },
    {
      name = "minecraft:prismarine",
      displayName = "Prismarine",
    },
    {
      name = "minecraft:magma_block",
      displayName = "Magma Block",
    },
    {
      name = "minecraft:obsidian",
      displayName = "Obsidian",
    },
    {
      name = "minecraft:crying_obsidian",
      displayName = "Crying Obsidian",
    },
    {
      name = "minecraft:netherrack",
      displayName = "Netherrack",
    },
    {
      name = "minecraft:crimson_nylium",
      displayName = "Crimson Nylium",
    },
    {
      name = "minecraft:warped_nylium",
      displayName = "Warped Nylium",
    },
    {
      name = "minecraft:soul_sand",
      displayName = "Soul Sand",
    },
    {
      name = "minecraft:soul_soil",
      displayName = "Soul Soil",
    },
    {
      name = "minecraft:bone_block",
      displayName = "Bone Block",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:bonemeal"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:blackstone",
      displayName = "Blackstone",
    },
    {
      name = "minecraft:basalt",
      displayName = "Basalt",
    },
    {
      name = "minecraft:smooth_basalt",
      displayName = "Smooth Basalt",
    },
    {
      name = "minecraft:end_stone",
      displayName = "End Stone",
    },
    {
      name = "minecraft:coal_ore",
      displayName = "Coal Ore",
    },
    {
      name = "minecraft:deepslate_coal_ore",
      displayName = "Deepslate Coal Ore",
    },
    {
      name = "minecraft:iron_ore",
      displayName = "Iron Ore",
    },
    {
      name = "minecraft:deepslate_iron_ore",
      displayName = "Deepslate Iron Ore",
    },
    {
      name = "minecraft:copper_ore",
      displayName = "Copper Ore",
    },
    {
      name = "minecraft:deepslate_copper_ore",
      displayName = "Deepslate Copper Ore",
    },
    {
      name = "minecraft:gold_ore",
      displayName = "Gold Ore",
    },
    {
      name = "minecraft:deepslate_gold_ore",
      displayName = "Deepslate Gold Ore",
    },
    {
      name = "minecraft:redstone_ore",
      displayName = "Redstone Ore",
    },
    {
      name = "minecraft:deepslate_redstone_ore",
      displayName = "Deepslate Redstone Ore",
    },
    {
      name = "minecraft:emerald_ore",
      displayName = "Emerald Ore",
    },
    {
      name = "minecraft:deepslate_emerald_ore",
      displayName = "Deepslate Emerald Ore",
    },
    {
      name = "minecraft:lapis_lazuli_ore",
      displayName = "Lapis Lazuli Ore",
    },
    {
      name = "minecraft:deepslate_lapis_lazuli_ore",
      displayName = "Deepslate Lapis Lazuli Ore",
    },
    {
      name = "minecraft:diamond_ore",
      displayName = "Diamond Ore",
    },
    {
      name = "minecraft:deepslate_diamond_ore",
      displayName = "Deepslate Diamond Ore",
    },
    {
      name = "minecraft:nether_gold_ore",
      displayName = "Nether Gold Ore",
    },
    {
      name = "minecraft:nether_quartz_ore",
      displayName = "Nether Quartz Ore",
    },
    {
      name = "minecraft:ancient_debris",
      displayName = "Ancient Debris",
    },
    {
      name = "minecraft:raw_iron_block",
      displayName = "Block of Raw Iron",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:raw_iron"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:raw_copper_block",
      displayName = "Block of Raw Copper",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:raw_copper"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:raw_gold_block",
      displayName = "Block of Raw Gold",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:raw_gold"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:glowstone",
      displayName = "Glowstone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glowstone_dust"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:amethyst_block",
      displayName = "Block of Amethyst",
    },
    {
      name = "minecraft:budding_amethyst",
      displayName = "Budding Amethyst",
    },
    {
      name = "minecraft:small_amethyst_bud",
      displayName = "Small Amethyst Bud",
    },
    {
      name = "minecraft:medium_amethyst_bud",
      displayName = "Medium Amethyst Bud",
    },
    {
      name = "minecraft:large_amethyst_bud",
      displayName = "Large Amethyst Bud",
    },
    {
      name = "minecraft:amethyst_cluster",
      displayName = "Amethyst Cluster",
    },
    {
      name = "minecraft:oak_log",
      displayName = "Oak Log",
    },
    {
      name = "minecraft:spruce_log",
      displayName = "Spruce Log",
    },
    {
      name = "minecraft:birch_log",
      displayName = "Birch Log",
    },
    {
      name = "minecraft:jungle_log",
      displayName = "Jungle Log",
    },
    {
      name = "minecraft:acacia_log",
      displayName = "Acacia Log",
    },
    {
      name = "minecraft:dark_oak_log",
      displayName = "Dark Oak Log",
    },
    {
      name = "minecraft:mangrove_log",
      displayName = "Mangrove Log",
    },
    {
      name = "minecraft:mangrove_roots",
      displayName = "Mangrove roots",
    },
    {
      name = "minecraft:muddy_mangrove_roots",
      displayName = "Muddy Mangrove Roots",
    },
    {
      name = "minecraft:cherry_log",
      displayName = "Cherry Log",
    },
    {
      name = "minecraft:mushroom_stem",
      displayName = "Mushroom Stem",
    },
    {
      name = "minecraft:crimson_stem",
      displayName = "Crimson Stem",
    },
    {
      name = "minecraft:warped_stem",
      displayName = "Warped Stem",
    },
    {
      name = "minecraft:oak_leaves",
      displayName = "Oak Leaves",
    },
    {
      name = "minecraft:spruce_leaves",
      displayName = "Spruce Leaves",
    },
    {
      name = "minecraft:birch_leaves",
      displayName = "Birch Leaves",
    },
    {
      name = "minecraft:jungle_leaves",
      displayName = "Jungle Leaves",
    },
    {
      name = "minecraft:acacia_leaves",
      displayName = "Acacia Leaves",
    },
    {
      name = "minecraft:dark_oak_leaves",
      displayName = "Dark Oak Leaves",
    },
    {
      name = "minecraft:mangrove_leaves",
      displayName = "Mangrove Leaves",
    },
    {
      name = "minecraft:cherry_leaves",
      displayName = "Cherry Leaves",
    },
    {
      name = "minecraft:azalea_leaves",
      displayName = "Azalea Leaves",
    },
    {
      name = "minecraft:flowering_azalea_leaves",
      displayName = "Flowering Azalea Leaves",
    },
    {
      name = "minecraft:brown_mushroom_block",
      displayName = "Brown Mushroom Block",
    },
    {
      name = "minecraft:red_mushroom_block",
      displayName = "Red Mushroom Block",
    },
    {
      name = "minecraft:nether_wart_block",
      displayName = "Nether Wart Block",
    },
    {
      name = "minecraft:warped_wart_block",
      displayName = "Warped Wart Block",
    },
    {
      name = "minecraft:shroomlight",
      displayName = "Shroomlight",
    },
    {
      name = "minecraft:oak_sapling",
      displayName = "Oak Sapling",
    },
    {
      name = "minecraft:spruce_sapling",
      displayName = "Spruce Sapling",
    },
    {
      name = "minecraft:birch_sapling",
      displayName = "Birch Sapling",
    },
    {
      name = "minecraft:jungle_sapling",
      displayName = "Jungle Sapling",
    },
    {
      name = "minecraft:acacia_sapling",
      displayName = "Acacia Sapling",
    },
    {
      name = "minecraft:dark_oak_sapling",
      displayName = "Dark Oak Sapling",
    },
    {
      name = "minecraft:mangrove_propagule",
      displayName = "Mangrove Propagule",
    },
    {
      name = "minecraft:cherry_sapling",
      displayName = "Cherry Sapling",
    },
    {
      name = "minecraft:azalea",
      displayName = "Azalea",
    },
    {
      name = "minecraft:flowering_azalea",
      displayName = "Flowering Azalea",
    },
    {
      name = "minecraft:brown_mushroom",
      displayName = "Brown Mushroom",
    },
    {
      name = "minecraft:red_mushroom",
      displayName = "Red Mushroom",
    },
    {
      name = "minecraft:crimson_fungus",
      displayName = "Crimson Fungus",
    },
    {
      name = "minecraft:warped_fungus",
      displayName = "Warped Fungus",
    },
    {
      name = "minecraft:grass",
      displayName = "Grass",
    },
    {
      name = "minecraft:fern",
      displayName = "Fern",
    },
    {
      name = "minecraft:dead_bush",
      displayName = "Dead Bush",
    },
    {
      name = "minecraft:dandelion",
      displayName = "Dandelion",
    },
    {
      name = "minecraft:poppy",
      displayName = "Poppy",
    },
    {
      name = "minecraft:blue_orchid",
      displayName = "Blue Orchid",
    },
    {
      name = "minecraft:allium",
      displayName = "Allium",
    },
    {
      name = "minecraft:azure_bluet",
      displayName = "Azure Bluet",
    },
    {
      name = "minecraft:red_tulip",
      displayName = "Red Tulip",
    },
    {
      name = "minecraft:orange_tulip",
      displayName = "Orange Tulip",
    },
    {
      name = "minecraft:white_tulip",
      displayName = "White Tulip",
    },
    {
      name = "minecraft:pink_tulip",
      displayName = "Pink Tulip",
    },
    {
      name = "minecraft:oxeye_daisy",
      displayName = "Oxeye Daisy",
    },
    {
      name = "minecraft:cornflower",
      displayName = "Cornflower",
    },
    {
      name = "minecraft:lily_of_the_valley",
      displayName = "Lily of the Valley",
    },
    {
      name = "minecraft:torchflower",
      displayName = "Torchflower",
    },
    {
      name = "minecraft:wither_rose",
      displayName = "Wither Rose",
    },
    {
      name = "minecraft:pink_petals",
      displayName = "Pink Petals",
    },
    {
      name = "minecraft:spore_blossom",
      displayName = "Spore Blossom",
    },
    {
      name = "minecraft:bamboo",
      displayName = "Bamboo",
    },
    {
      name = "minecraft:sugar_cane",
      displayName = "Sugar Cane",
    },
    {
      name = "minecraft:cactus",
      displayName = "Cactus",
    },
    {
      name = "minecraft:crimson_roots",
      displayName = "Crimson Roots",
    },
    {
      name = "minecraft:warped_roots",
      displayName = "Warped Roots",
    },
    {
      name = "minecraft:nether_sprouts",
      displayName = "Nether Sprouts",
    },
    {
      name = "minecraft:weeping_vines",
      displayName = "Weeping Vines",
    },
    {
      name = "minecraft:twisted_vines",
      displayName = "Twisted vines",
    },
    {
      name = "minecraft:vines",
      displayName = "Vines",
    },
    {
      name = "minecraft:tall_grass",
      displayName = "Tall Grass",
    },
    {
      name = "minecraft:large_fern",
      displayName = "Large Fern",
    },
    {
      name = "minecraft:sunflower",
      displayName = "Sunflower",
    },
    {
      name = "minecraft:lilac",
      displayName = "Lilac",
    },
    {
      name = "minecraft:rose_bush",
      displayName = "Rose Bush",
    },
    {
      name = "minecraft:peony",
      displayName = "Peony",
    },
    {
      name = "minecraft:pitcher_plant",
      displayName = "Pitcher Plant",
    },
    {
      name = "minecraft:big_dripleaf",
      displayName = "Big Dripleaf",
    },
    {
      name = "minecraft:small_dripleaf",
      displayName = "Small Dripleaf",
    },
    {
      name = "minecraft:chorus_plant",
      displayName = "Chorus Plant",
    },
    {
      name = "minecraft:chorus_flower",
      displayName = "Chorus Flower",
    },
    {
      name = "minecraft:glow_lichen",
      displayName = "Glow Lichen",
    },
    {
      name = "minecraft:hanging_roots",
      displayName = "Hanging Roots",
    },
    {
      name = "minecraft:frogspawn",
      displayName = "Frogspawn",
    },
    {
      name = "minecraft:turtle_egg",
      displayName = "Turtle Egg",
    },
    {
      name = "minecraft:sniffer_egg",
      displayName = "Sniffer Egg",
    },
    {
      name = "minecraft:wheat_seeds",
      displayName = "Wheat Seeds",
    },
    {
      name = "minecraft:cocoa_beans",
      displayName = "Cocoa Beans",
    },
    {
      name = "minecraft:pumpkin_seeds",
      displayName = "Pumpkin Seeds",
    },
    {
      name = "minecraft:melon_seeds",
      displayName = "Melon Seeds",
    },
    {
      name = "minecraft:beetroot_seeds",
      displayName = "Beetroot Seeds",
    },
    {
      name = "minecraft:torchflower_seeds",
      displayName = "Torchflower Seeds",
    },
    {
      name = "minecraft:pitcher_pod",
      displayName = "Pitcher Pod",
    },
    {
      name = "minecraft:glow_berries",
      displayName = "Glow Berries",
    },
    {
      name = "minecraft:sweet_berries",
      displayName = "Sweet Berries",
    },
    {
      name = "minecraft:nether_wart",
      displayName = "Nether Wart",
    },
    {
      name = "minecraft:lily_pad",
      displayName = "Lily Pad",
    },
    {
      name = "minecraft:seagrass",
      displayName = "Seagrass",
    },
    {
      name = "minecraft:sea_pickle",
      displayName = "Sea Pickle",
    },
    {
      name = "minecraft:kelp",
      displayName = "Kelp",
    },
    {
      name = "minecraft:dried_kelp_block",
      displayName = "Dried Kelp Block",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:dried_kelp"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:tube_coral_block",
      displayName = "Tube Coral Block",
    },
    {
      name = "minecraft:brain_coral_block",
      displayName = "Brain Coral Block",
    },
    {
      name = "minecraft:bubble_coral_block",
      displayName = "Bubble Coral Block",
    },
    {
      name = "minecraft:fire_coral_block",
      displayName = "Fire Coral Block",
    },
    {
      name = "minecraft:horn_coral_block",
      displayName = "Horn Coral Block",
    },
    {
      name = "minecraft:dead_tube_coral_block",
      displayName = "Dead Tube Coral Block",
    },
    {
      name = "minecraft:dead_brain_coral_block",
      displayName = "Dead Brain Coral Block",
    },
    {
      name = "minecraft:dead_bubble_coral_block",
      displayName = "Dead Bubble Coral Block",
    },
    {
      name = "minecraft:dead_fire_coral_block",
      displayName = "Dead Fire Coral Block",
    },
    {
      name = "minecraft:dead_horn_coral_block",
      displayName = "Dead Horn Coral Block",
    },
    {
      name = "minecraft:tube_coral",
      displayName = "Tube Coral",
    },
    {
      name = "minecraft:brain_coral",
      displayName = "Brain Coral",
    },
    {
      name = "minecraft:bubble_coral",
      displayName = "Bubble Coral",
    },
    {
      name = "minecraft:fire_coral",
      displayName = "Fire Coral",
    },
    {
      name = "minecraft:horn_coral",
      displayName = "Horn coral",
    },
    {
      name = "minecraft:dead_tube_coral",
      displayName = "Dead Tube Coral",
    },
    {
      name = "minecraft:dead_brain_coral",
      displayName = "Dead Brain Coral",
    },
    {
      name = "minecraft:dead_bubble_coral",
      displayName = "Dead Bubble Coral",
    },
    {
      name = "minecraft:dead_fire_coral",
      displayName = "Dead Fire Coral",
    },
    {
      name = "minecraft:dead_horn_coral",
      displayName = "Dead Horn Coral",
    },
    {
      name = "minecraft:tube_coral_fan",
      displayName = "Tube Coral Fan",
    },
    {
      name = "minecraft:brain_coral_fan",
      displayName = "Brain Coral Fan",
    },
    {
      name = "minecraft:bubble_coral_fan",
      displayName = "Bubble Coral Fan",
    },
    {
      name = "minecraft:fire_coral_fan",
      displayName = "Fire Coral Fan",
    },
    {
      name = "minecraft:horn_coral_fan",
      displayName = "Horn Coral Fan",
    },
    {
      name = "minecraft:sponge",
      displayName = "Sponge",
      smelt = {"minecraft:wet_sponge"}
    },
    {
      name = "minecraft:wet_sponge",
      displayName = "Wet Sponge",
    },
    {
      name = "minecraft:melon",
      displayName = "Melon",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:melon_slice"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:pumpkin",
      displayName = "Pumpkin",
    },
    {
      name = "minecraft:carved_pumpkin",
      displayName = "Carved Pumpkin",
    },
    {
      name = "minecraft:jack_o_lantern",
      displayName = "Jack o'Lantern",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:carved_pumpkin"]={6,},["minecraft:torch"]={10,},}},},
    },
    {
      name = "minecraft:hay_bale",
      displayName = "Hay Bale",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:wheat"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:bee_nest",
      displayName = "Bee Nest",
    },
    {
      name = "minecraft:honeycomb_block",
      displayName = "Honeycomb Block",
    },
    {
      name = "minecraft:slime_block",
      displayName = "Slime Block",
    },
    {
      name = "minecraft:honey_block",
      displayName = "Honey block",
    },
    {
      name = "minecraft:ochre_froglight",
      displayName = "Ochre Froglight",
    },
    {
      name = "minecraft:verdant_froglight",
      displayName = "Verdant Froglight",
    },
    {
      name = "minecraft:pearlescent_froglight",
      displayName = "Pearlescent Froglight",
    },
    {
      name = "minecraft:sculk",
      displayName = "Sculk",
    },
    {
      name = "minecraft:sculk_vein",
      displayName = "Sculk Vein",
    },
    {
      name = "minecraft:sculk_catalyst",
      displayName = "Sculk Catalyst",
    },
    {
      name = "minecraft:sculk_shreiker",
      displayName = "Sculk Shreiker",
    },
    {
      name = "minecraft:sculk_sensor",
      displayName = "Sculk Sensor",
    },
    {
      name = "minecraft:cobweb",
      displayName = "Cobweb",
    },
    {
      name = "minecraft:bedrock",
      displayName = "Bedrock",
    },
  },
  functional =
  {
    {
      name = "minecraft:torch",
      displayName = "Torch",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:stick"]={5,},["minecraft:coal"]={1,},}},{quantity = 1, ratio = 4, ingredients = {["minecraft:stick"]={5,},["minecraft:charcoal"]={1,},}},},
    },
    {
      name = "minecraft:soul_torch",
      displayName = "Soul Torch",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:stick"]={5,},["minecraft:coal"]={1,},["minecraft:soul_sand"]={9,},}},},
    },
    {
      name = "minecraft:redstone_torch",
      displayName = "Redstone Torch",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={1,},["minecraft:stick"]={5,},}},},
    },
    {
      name = "minecraft:lantern",
      displayName = "Lantern",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_nugget"]={1,2,3,5,7,9,10,11,},["minecraft:torch"]={6,},}},},
    },
    {
      name = "minecraft:soul_lantern",
      displayName = "Soul Lantern",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_nugget"]={1,2,3,5,7,9,10,11,},["minecraft:soul_torch"]={6,},}},},
    },
    {
      name = "minecraft:chain",
      displayName = "Chain",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_nugget"]={2,10,},["minecraft:iron_ingot"]={6,},}},},
    },
    {
      name = "minecraft:end_rod",
      displayName = "End Rod",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:blaze_rod"]={1,},["minecraft:popped_chorus_fruit"]={5,},}},},
    },
    {
      name = "minecraft:sea_lantern",
      displayName = "Sea Lantern",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:prismarine_crystals"]={2,5,6,7,10,},["minecraft:prismarine_shard"]={1,3,9,11,},}},},
    },
    {
      name = "minecraft:redstone_lamp",
      displayName = "Redstone Lamp",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,5,7,10,},["minecraft:glowstone"]={6,},}},},
    },
    {
      name = "minecraft:glowstone",
      displayName = "Glowstone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glowstone_dust"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:shroomlight",
      displayName = "Shroomlight",
    },
    {
      name = "minecraft:ochre_froglight",
      displayName = "Ochre Froglight",
    },
    {
      name = "minecraft:verdant_froglight",
      displayName = "Verdant Froglight",
    },
    {
      name = "minecraft:pearlescent_froglight",
      displayName = "Pearlescent Froglight",
    },
    {
      name = "minecraft:crying_obsidian",
      displayName = "Crying Obsidian",
    },
    {
      name = "minecraft:glow_lichen",
      displayName = "Glow Lichen",
    },
    {
      name = "minecraft:magama_block",
      displayName = "Magama Block",
    },
    {
      name = "minecraft:crafting_table",
      displayName = "Crafting Table",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:stonecutter",
      displayName = "Stonecutter",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone"]={9,10,11,},["minecraft:iron_ingot"]={6,},}},},
    },
    {
      name = "minecraft:cartography_table",
      displayName = "Cartography Table",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={5,6,9,10,},["minecraft:paper"]={1,2,},}},},
    },
    {
      name = "minecraft:fletching_table",
      displayName = "Fletching Table",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={5,6,9,10,},["minecraft:flint"]={1,2,},}},},
    },
    {
      name = "minecraft:smithing_table",
      displayName = "Smithing Table",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={5,6,9,10,},["minecraft:iron_ingot"]={1,2,},}},},
    },
    {
      name = "minecraft:grindstone",
      displayName = "Grindstone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={1,3,},["minecraft:stone_slab"]={2,},["minecraft:oak_planks"]={5,7,},}},},
    },
    {
      name = "minecraft:loom",
      displayName = "Loom",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:string"]={5,6,},["minecraft:oak_planks"]={9,10,},}},},
    },
    {
      name = "minecraft:furnace",
      displayName = "Furnace",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cobblestone"]={1,2,3,5,7,9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:cobbled_deepslate"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:smoker",
      displayName = "Smoker",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={2,5,7,10,},["minecraft:furnace"]={6,},}},},
    },
    {
      name = "minecraft:blast_furnace",
      displayName = "Blast Furnace",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={1,2,3,5,7,},["minecraft:furnace"]={6,},["minecraft:smooth_stone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:camp_fire",
      displayName = "Camp fire",
    },
    {
      name = "minecraft:soul_camp_fire",
      displayName = "Soul Camp fire",
    },
    {
      name = "minecraft:anvil",
      displayName = "Anvil",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_block"]={1,2,3,},["minecraft:iron_ingot"]={6,9,10,11,},}},},
    },
    {
      name = "minecraft:chipped_anvil",
      displayName = "Chipped Anvil",
    },
    {
      name = "minecraft:damaged_anvil",
      displayName = "Damaged Anvil",
    },
    {
      name = "minecraft:composter",
      displayName = "Composter",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_slab"]={1,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:note_block",
      displayName = "Note block",
    },
    {
      name = "minecraft:jukebox",
      displayName = "Jukebox",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,2,3,5,7,9,10,11,},["minecraft:diamond"]={6,},}},},
    },
    {
      name = "minecraft:enchanting_table",
      displayName = "Enchanting Table",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:obsidian"]={6,9,10,11,},["minecraft:book"]={2,},["minecraft:diamond"]={5,7,},}},},
    },
    {
      name = "minecraft:end_crystal",
      displayName = "End Crystal",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:ghast_tear"]={10,},["minecraft:eye_of_ender"]={6,},["minecraft:glass"]={1,2,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:brewing_stand",
      displayName = "Brewing Stand",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:blaze_rod"]={2,},["minecraft:cobblestone"]={5,6,7,},}},},
    },
    {
      name = "minecraft:cauldron",
      displayName = "Cauldron",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={1,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:bell",
      displayName = "Bell",
    },
    {
      name = "minecraft:beacon",
      displayName = "Beacon",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:obsidian"]={9,10,11,},["minecraft:nether_star"]={6,},["minecraft:glass"]={1,2,3,5,7,},}},},
    },
    {
      name = "minecraft:conduit",
      displayName = "Conduit",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:nautilus_shell"]={1,2,3,5,7,9,10,11,},["minecraft:heart_of_the_sea"]={6,},}},},
    },
    {
      name = "minecraft:lodestone",
      displayName = "Lodestone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chiseled_stone_bricks"]={1,2,3,5,7,9,10,11,},["minecraft:netherite_ingot"]={6,},}},},
    },
    {
      name = "minecraft:ladder",
      displayName = "Ladder",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stick"]={1,3,5,6,7,9,11,},}},},
    },
    {
      name = "minecraft:scaffolding",
      displayName = "Scaffolding",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:string"]={2,},["minecraft:bamboo"]={1,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:bee_nest",
      displayName = "Bee Nest",
    },
    {
      name = "minecraft:beehive",
      displayName = "Beehive",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,2,3,9,10,11,},["minecraft:honeycomb"]={5,6,7,},}},},
    },
    {
      name = "minecraft:lightning_rod",
      displayName = "Lightning Rod",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:copper_ingot"]={2,6,10,},}},},
    },
    {
      name = "minecraft:flower_pot",
      displayName = "Flower Pot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:brick"]={5,7,10,},}},},
    },
    {
      name = "minecraft:decorated_pot",
      displayName = "Decorated Pot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:pottery_sherd"]={2,5,7,10,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:brick"]={2,5,7,10,},}},},
    },
    {
      name = "minecraft:armor_stand",
      displayName = "Armor Stand",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={1,2,3,6,9,11,},["minecraft:smooth_stone_slab"]={10,},}},},
    },
    {
      name = "minecraft:item_frame",
      displayName = "Item Frame",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={1,2,3,5,7,9,10,11,},["minecraft:leather"]={6,},}},},
    },
    {
      name = "minecraft:glow_item_frame",
      displayName = "Glow Item Frame",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:glow_ink_sac"]={1,},["minecraft:item_frame"]={2,},}},},
    },
    {
      name = "minecraft:painting",
      displayName = "Painting",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={1,2,3,5,7,9,10,11,},["minecraft:paper"]={6,},}},},
    },
    {
      name = "minecraft:bookshelf",
      displayName = "Bookshelf",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,2,3,9,10,11,},["minecraft:book"]={5,6,7,},}},},
    },
    {
      name = "minecraft:chiseled_bookshelf",
      displayName = "Chiseled Bookshelf",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,2,3,9,10,11,},["minecraft:oak_slab"]={5,6,7,},}},},
    },
    {
      name = "minecraft:lectern",
      displayName = "Lectern",
    },
    {
      name = "minecraft:tinted_glass",
      displayName = "Tinted Glass",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:amethyst_shard"]={2,5,7,10,},["minecraft:glass"]={6,},}},},
    },
    {
      name = "minecraft:oak_sign",
      displayName = "Oak Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:oak_planks"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:oak_hanging_sign",
      displayName = "Oak Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:oak_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:spruce_sign",
      displayName = "Spruce Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:spruce_planks"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:spruce_hanging_sign",
      displayName = "Spruce Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:spruce_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:birch_sign",
      displayName = "Birch Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:birch_planks"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:birch_hanging_sign",
      displayName = "Birch Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:birch_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:jungle_sign",
      displayName = "Jungle Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:jungle_planks"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:jungle_hanging_sign",
      displayName = "Jungle Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:jungle_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:acacia_sign",
      displayName = "Acacia Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stick"]={10,},["minecraft:acacia_planks"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:acacia_hanging_sign",
      displayName = "Acacia Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:acacia_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:dark_oak_sign",
      displayName = "Dark Oak Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stick"]={10,},["minecraft:dark_oak_planks"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:dark_oak_hanging_sign",
      displayName = "Dark Oak Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:dark_oak_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:mangrove_sign",
      displayName = "Mangrove Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:mangrove_planks"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:mangrove_hanging_sign",
      displayName = "Mangrove Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:mangrove_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cherry_sign",
      displayName = "Cherry Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:cherry_planks"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:cherry_hanging_sign",
      displayName = "Cherry Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:cherry_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:bamboo_sign",
      displayName = "Bamboo Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stick"]={10,},["minecraft:bamboo_planks"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:bamboo_hanging_sign",
      displayName = "Bamboo Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:bamboo_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:crimson_sign",
      displayName = "Crimson Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:stick"]={10,},["minecraft:crimson_planks"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:crimson_hanging_sign",
      displayName = "Crimson Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:crimson_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:warped_sign",
      displayName = "Warped Sign",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:warped_planks"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:warped_hanging_sign",
      displayName = "Warped Hanging Sign",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:chain"]={1,3,},["minecraft:warped_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:chest",
      displayName = "Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:barrel",
      displayName = "Barrel",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,3,5,7,9,11,},["minecraft:oak_slab"]={2,10,},}},},
    },
    {
      name = "minecraft:ender_chest",
      displayName = "Ender Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:obsidian"]={1,2,3,5,7,9,10,11,},["minecraft:eye_of_ender"]={6,},}},},
    },
    {
      name = "minecraft:shulker_box",
      displayName = "Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:shulker_shell"]={2,10,},["minecraft:chest"]={6,},}},},
    },
    {
      name = "minecraft:white_shulker_box",
      displayName = "White Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:white_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:gray_shulker_box",
      displayName = "Gray Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_shulker_box",
      displayName = "Light Gray Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_gray_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:brown_shulker_box",
      displayName = "Brown Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:brown_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:red_shulker_box",
      displayName = "Red Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:orange_shulker_box",
      displayName = "Orange Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_shulker_box",
      displayName = "Yellow Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:lime_shulker_box",
      displayName = "Lime Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:green_shulker_box",
      displayName = "Green Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_shulker_box",
      displayName = "Cyan Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_shulker_box",
      displayName = "Blue Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_shulker_box",
      displayName = "Light Blue Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_blue_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:purple_shulker_box",
      displayName = "Purple Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_shulker_box",
      displayName = "Magenta Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:magenta_dye"]={6,},["minecraft:*_shulker_box"]={5,},}},},
    },
    {
      name = "minecraft:pink_shulker_box",
      displayName = "Pink Shulker Box",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_shulker_box"]={5,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:white_bed",
      displayName = "White Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:white_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:white_dye"]={6,},}},},
    },
    {
      name = "minecraft:gray_bed",
      displayName = "Gray Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gray_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_bed",
      displayName = "Light Gray Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:light_gray_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:light_gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:brown_bed",
      displayName = "Brown Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:brown_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:brown_dye"]={6,},}},},
    },
    {
      name = "minecraft:red_bed",
      displayName = "Red Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:red_dye"]={6,},}},},
    },
    {
      name = "minecraft:orange_bed",
      displayName = "Orange Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:orange_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_bed",
      displayName = "Yellow Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:yellow_dye"]={6,},}},},
    },
    {
      name = "minecraft:lime_bed",
      displayName = "Lime Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:lime_dye"]={6,},}},},
    },
    {
      name = "minecraft:green_bed",
      displayName = "Green Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:green_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_bed",
      displayName = "Cyan Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cyan_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_bed",
      displayName = "Blue Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:blue_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_bed",
      displayName = "Light Blue Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:light_blue_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:light_blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:purple_bed",
      displayName = "Purple Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:purple_wool"]={5,6,7,},["minecraft:*_planks"]={9,10,11,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_bed",
      displayName = "Magenta Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:magenta_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:magenta_dye"]={6,},}},},
    },
    {
      name = "minecraft:pink_bed",
      displayName = "Pink Bed",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={9,10,11,},["minecraft:pink_wool"]={5,6,7,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:*_bed"]={5,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:candle",
      displayName = "Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:string"]={2,},["minecraft:honeycomb"]={6,},}},},
    },
    {
      name = "minecraft:white_candle",
      displayName = "White Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:white_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:gray_candle",
      displayName = "Gray Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:gray_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_gray_candle",
      displayName = "Light Gray Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_gray_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:brown_candle",
      displayName = "Brown Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:brown_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:red_candle",
      displayName = "Red Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:orange_candle",
      displayName = "Orange Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:orange_dye"]={6,},}},},
    },
    {
      name = "minecraft:yellow_candle",
      displayName = "Yellow Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:lime_candle",
      displayName = "Lime Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:green_candle",
      displayName = "Green Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:green_dye"]={6,},}},},
    },
    {
      name = "minecraft:cyan_candle",
      displayName = "Cyan Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:cyan_dye"]={6,},}},},
    },
    {
      name = "minecraft:blue_candle",
      displayName = "Blue Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:blue_dye"]={6,},}},},
    },
    {
      name = "minecraft:light_blue_candle",
      displayName = "Light Blue Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:light_blue_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:purple_candle",
      displayName = "Purple Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:purple_dye"]={6,},}},},
    },
    {
      name = "minecraft:magenta_candle",
      displayName = "Magenta Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:magenta_dye"]={6,},["minecraft:candle"]={5,},}},},
    },
    {
      name = "minecraft:pink_candle",
      displayName = "Pink Candle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:candle"]={5,},["minecraft:pink_dye"]={6,},}},},
    },
    {
      name = "minecraft:white_banner",
      displayName = "White Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:white_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:gray_banner",
      displayName = "Gray Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gray_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:light_gray_banner",
      displayName = "Light Gray Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:light_gray_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:brown_banner",
      displayName = "Brown Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:brown_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:red_banner",
      displayName = "Red Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:orange_banner",
      displayName = "Orange Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:orange_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:yellow_banner",
      displayName = "Yellow Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:yellow_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:lime_banner",
      displayName = "Lime Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lime_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:green_banner",
      displayName = "Green Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:green_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:cyan_banner",
      displayName = "Cyan Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cyan_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:blue_banner",
      displayName = "Blue Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:blue_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:light_blue_banner",
      displayName = "Light Blue Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:light_blue_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:purple_banner",
      displayName = "Purple Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:purple_wool"]={1,2,3,5,6,7,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:magenta_banner",
      displayName = "Magenta Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:magenta_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:pink_banner",
      displayName = "Pink Banner",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:pink_wool"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:ominous_banner",
      displayName = "Ominous Banner",
    },
    {
      name = "minecraft:skeleton_skull",
      displayName = "Skeleton Skull",
    },
    {
      name = "minecraft:wither_skeleton_skull",
      displayName = "Wither Skeleton Skull",
    },
    {
      name = "minecraft:player_head",
      displayName = "Player Head",
    },
    {
      name = "minecraft:zombie_head",
      displayName = "Zombie Head",
    },
    {
      name = "minecraft:creeper_head",
      displayName = "Creeper Head",
    },
    {
      name = "minecraft:piglin_head",
      displayName = "Piglin Head",
    },
    {
      name = "minecraft:dragon_head",
      displayName = "Dragon Head",
    },
    {
      name = "minecraft:dragon_egg",
      displayName = "Dragon Egg",
    },
    {
      name = "minecraft:eye_of_ender",
      displayName = "Eye of Ender",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:blaze_powder"]={1,},["minecraft:ender_pearl"]={2,},}},},
    },
  },
  redstone =
  {
    {
      name = "minecraft:redstone_ore",
      displayName = "Redstone Ore",
    },
    {
      name = "minecraft:redstone",
      displayName = "Redstone Dust",
      recipes = {{quantity = 1, ratio = 9, ingredients = {["minecraft:redstone_block"]={1,},}},},
      smelt = {"minecraft:redstone_ore", "minecraft:deepslate_redstone_ore"}
    },
    {
      name = "minecraft:redstone_torch",
      displayName = "Redstone Torch",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={1,},["minecraft:stick"]={5,},}},},
    },
    {
      name = "minecraft:redstone_block",
      displayName = "Block of Redstone",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:redstone_repeater",
      displayName = "Redstone Repeater",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={6,},["minecraft:redstone_torch"]={5,7,},["minecraft:stone"]={9,10,11,},}},},
    },
    {
      name = "minecraft:redstone_comparator",
      displayName = "Redstone Comparator",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone"]={9,10,11,},["minecraft:redstone_torch"]={2,5,7,},["minecraft:quartz"]={6,},}},},
    },
    {
      name = "minecraft:target",
      displayName = "Target",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,5,7,10,},["minecraft:hay_bale"]={6,},}},},
    },
    {
      name = "minecraft:lever",
      displayName = "Lever",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={1,},["minecraft:cobblestone"]={5,},}},},
    },
    {
      name = "minecraft:oak_button",
      displayName = "Oak Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_log"]={6,},}},},
    },
    {
      name = "minecraft:stone_button",
      displayName = "Stone Button",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cobblestone"]={6,},}},},
    },
    {
      name = "minecraft:oak_pressure_plate",
      displayName = "Oak Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,2,},}},},
    },
    {
      name = "minecraft:stone_pressure_plate",
      displayName = "Stone Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone"]={1,2,},}},},
    },
    {
      name = "minecraft:light_weighted_pressure_plate",
      displayName = "Light Weighted Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={5,6,},}},},
    },
    {
      name = "minecraft:heavy_weighted_pressure_plate",
      displayName = "Heavy Weighted Pressure Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={5,6,},}},},
    },
    {
      name = "minecraft:sculk_sensor",
      displayName = "Sculk Sensor",
    },
    {
      name = "minecraft:calibrated_sculk_sensor",
      displayName = "Calibrated Sculk Sensor",
    },
    {
      name = "minecraft:sculk_shreiker",
      displayName = "Sculk Shreiker",
    },
    {
      name = "minecraft:amethyst_block",
      displayName = "Block of Amethyst",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:amethyst_shard"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:white_wool",
      displayName = "White Wool",
    },
    {
      name = "minecraft:tripwire_hook",
      displayName = "Tripwire Hook",
    },
    {
      name = "minecraft:string",
      displayName = "String",
    },
    {
      name = "minecraft:lectern",
      displayName = "Lectern",
    },
    {
      name = "minecraft:daylight_detector",
      displayName = "Daylight Detector",
    },
    {
      name = "minecraft:lightning_rod",
      displayName = "Lightning Rod",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:copper_ingot"]={2,6,10,},}},},
    },
    {
      name = "minecraft:piston",
      displayName = "Piston",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={1,2,3,},["minecraft:iron_ingot"]={6,},["minecraft:redstone"]={10,},["minecraft:cobblestone"]={5,7,9,11,},}},},
    },
    {
      name = "minecraft:sticky_piston",
      displayName = "Sticky Piston",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:slime_ball"]={6,},["minecraft:piston"]={10,},}},},
    },
    {
      name = "minecraft:slime_block",
      displayName = "Slime Block",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:slime_ball"]={1,2,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:honey_block",
      displayName = "Honey Block",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:honey_bottle"]={1,2,5,6,},}},},
    },
    {
      name = "minecraft:dispenser",
      displayName = "Dispenser",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={10,},["minecraft:bow"]={6,},["minecraft:cobblestone"]={1,2,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:dropper",
      displayName = "Dropper",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={10,},["minecraft:cobblestone"]={1,2,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:hopper",
      displayName = "Hopper",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={6,},["minecraft:iron_ingot"]={1,3,5,7,10,},}},},
    },
    {
      name = "minecraft:chest",
      displayName = "Chest",
    },
    {
      name = "minecraft:barrel",
      displayName = "Barrel",
    },
    {
      name = "minecraft:chiseled_bookshelf",
      displayName = "Chiseled Bookshelf",
    },
    {
      name = "minecraft:furnace",
      displayName = "Furnace",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cobblestone"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:trapped_chest",
      displayName = "Trapped Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={6,},["minecraft:tripwire_hook"]={5,},}},},
    },
    {
      name = "minecraft:jukebox",
      displayName = "Jukebox",
    },
    {
      name = "minecraft:observer",
      displayName = "Observer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={5,6,},["minecraft:cobblestone"]={1,2,3,9,10,11,},["minecraft:quartz"]={7,},}},},
    },
    {
      name = "minecraft:note_block",
      displayName = "Note Block",
    },
    {
      name = "minecraft:composter",
      displayName = "Composter",
    },
    {
      name = "minecraft:cauldron",
      displayName = "Cauldron",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={1,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:rail",
      displayName = "Rail",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:stick"]={6,},["minecraft:iron_ingot"]={1,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:powered_rail",
      displayName = "Powered Rail",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:redstone"]={10,},["minecraft:gold_ingot"]={1,3,5,7,9,11,},["minecraft:stick"]={6,},}},},
    },
    {
      name = "minecraft:detector_rail",
      displayName = "Detector Rail",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:redstone"]={10,},["minecraft:iron_ingot"]={1,3,5,7,9,11,},["minecraft:stone_pressure_plate"]={6,},}},},
    },
    {
      name = "minecraft:activator_rail",
      displayName = "Activator Rail",
    },
    {
      name = "minecraft:minecart",
      displayName = "Minecart",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:hopper_minecart",
      displayName = "Minecart with Hopper",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:minecart"]={7,},["minecraft:hopper"]={6,},}},},
    },
    {
      name = "minecraft:chest_minecart",
      displayName = "Minecart with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={6,},["minecraft:minecart"]={7,},}},},
    },
    {
      name = "minecraft:furnace_minecart",
      displayName = "Minecart with Furnace",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:furnace"]={6,},["minecraft:minecart"]={7,},}},},
    },
    {
      name = "minecraft:tnt_minecart",
      displayName = "Minecart with TNT",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:minecart"]={7,},["minecraft:tnt"]={6,},}},},
    },
    {
      name = "minecraft:oak_chest_boat",
      displayName = "Oak Boat with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_boat"]={5,},["minecraft:chest"]={6,},}},},
    },
    {
      name = "minecraft:bamboo_chest_raft",
      displayName = "Bamboo Raft with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={6,},["minecraft:bamboo_raft"]={7,},}},},
    },
    {
      name = "minecraft:oak_door",
      displayName = "Oak Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:oak_planks"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:iron_door",
      displayName = "Iron Door",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:iron_ingot"]={1,2,5,6,9,10,},}},},
    },
    {
      name = "minecraft:oak_fence_gate",
      displayName = "Oak Fence Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={5,7,9,11,},["minecraft:oak_planks"]={6,10,},}},},
    },
    {
      name = "minecraft:oak_trapdoor",
      displayName = "Oak Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:oak_planks"]={5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:iron_trapdoor",
      displayName = "Iron Trapdoor",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:iron_ingot"]={5,6,9,10,},}},},
    },
    {
      name = "minecraft:tnt",
      displayName = "TNT",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gunpowder"]={1,3,6,9,11,},["minecraft:sand"]={2,5,7,10,},}},},
    },
    {
      name = "minecraft:redstone_lamp",
      displayName = "Redstone Lamp",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,5,7,10,},["minecraft:glowstone"]={6,},}},},
    },
    {
      name = "minecraft:bell",
      displayName = "Bell",
    },
    {
      name = "minecraft:big_dripleaf",
      displayName = "Big Dripleaf",
    },
    {
      name = "minecraft:armor_stand",
      displayName = "Armor Stand",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={1,2,3,6,9,11,},["minecraft:smooth_stone_slab"]={10,},}},},
    },
    {
      name = "minecraft:redstone_ore",
      displayName = "Redstone Ore",
    },
  },
  tools =
  {
    {
      name = "minecraft:wooden_shovel",
      displayName = "Wooden Shovel",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={2,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:wooden_pickaxe",
      displayName = "Wooden Pickaxe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={1,2,3,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:wooden_axe",
      displayName = "Wooden Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={1,2,5,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:wooden_hoe",
      displayName = "Wooden Hoe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={1,2,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:stone_shovel",
      displayName = "Stone Shovel",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobblestone"]={2,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobbled_deepslate"]={2,},}},},
    },
    {
      name = "minecraft:stone_pickaxe",
      displayName = "Stone Pickaxe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobblestone"]={1,2,3,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobbled_deepslate"]={1,2,3,},}},},
    },
    {
      name = "minecraft:stone_axe",
      displayName = "Stone Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobblestone"]={1,2,5,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobbled_deepslate"]={1,2,5,},}},},
    },
    {
      name = "minecraft:stone_hoe",
      displayName = "Stone Hoe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobblestone"]={1,2,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobbled_deepslate"]={1,2,},}},},
    },
    {
      name = "minecraft:iron_shovel",
      displayName = "Iron Shovel",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:iron_ingot"]={2,},}},},
    },
    {
      name = "minecraft:iron_pickaxe",
      displayName = "Iron Pickaxe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:iron_ingot"]={1,2,3,},}},},
    },
    {
      name = "minecraft:iron_axe",
      displayName = "Iron Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:iron_ingot"]={1,2,5,},}},},
    },
    {
      name = "minecraft:iron_hoe",
      displayName = "Iron Hoe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:iron_ingot"]={1,2,},}},},
    },
    {
      name = "minecraft:golden_shovel",
      displayName = "Golden Shovel",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={2,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:golden_pickaxe",
      displayName = "Golden Pickaxe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,3,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:golden_axe",
      displayName = "Golden Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,5,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:golden_hoe",
      displayName = "Golden Hoe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:diamond_shovel",
      displayName = "Diamond Shovel",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:diamond"]={2,},}},},
    },
    {
      name = "minecraft:diamond_pickaxe",
      displayName = "Diamond Pickaxe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:diamond"]={1,2,3,},}},},
    },
    {
      name = "minecraft:diamond_axe",
      displayName = "Diamond Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:diamond"]={1,2,5,},}},},
    },
    {
      name = "minecraft:diamond_hoe",
      displayName = "Diamond Hoe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:diamond"]={1,2,},}},},
    },
    {
      name = "minecraft:netherite_shovel",
      displayName = "Netherite",
    },
    {
      name = "minecraft:netherite_pickaxe",
      displayName = "Netherite",
    },
    {
      name = "minecraft:netherite_axe",
      displayName = "Netherite",
    },
    {
      name = "minecraft:netherite_hoe",
      displayName = "Netherite",
    },
    {
      name = "minecraft:bucket",
      displayName = "Bucket",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={5,7,10,},}},},
    },
    {
      name = "minecraft:water_bucket",
      displayName = "Water Bucket",
    },
    {
      name = "minecraft:bucket_of_cod",
      displayName = "Bucket of Cod",
    },
    {
      name = "minecraft:bucket_of_salmon",
      displayName = "Bucket of Salmon",
    },
    {
      name = "minecraft:bucket_of_tropical_fish",
      displayName = "Bucket of Tropical Fish",
    },
    {
      name = "minecraft:bucket_of_pufferfish",
      displayName = "Bucket of Pufferfish",
    },
    {
      name = "minecraft:bucket_of_axolotl",
      displayName = "Bucket of Axolotl",
    },
    {
      name = "minecraft:bucket_of_tadpole",
      displayName = "Bucket of Tadpole",
    },
    {
      name = "minecraft:lava_bucket",
      displayName = "Lava Bucket",
    },
    {
      name = "minecraft:powder_snow_bucket",
      displayName = "Powder Snow bucket",
    },
    {
      name = "minecraft:milk_bucket",
      displayName = "Milk Bucket",
    },
    {
      name = "minecraft:fishing_rod",
      displayName = "Fishing Rod",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={3,6,9,},["minecraft:string"]={7,11,},}},},
    },
    {
      name = "minecraft:flint_and_steel",
      displayName = "Flint and Steel",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:flint"]={6,},["minecraft:iron_ingot"]={9,},}},},
    },
    {
      name = "minecraft:fire_charge",
      displayName = "Fire Charge",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:coal"]={6,},["minecraft:blaze_rod"]={5,},["minecraft:gunpowder"]={10,},}},},
    },
    {
      name = "minecraft:bone_meal",
      displayName = "Bone Meal",
    },
    {
      name = "minecraft:shears",
      displayName = "Shears",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={5,10,},}},},
    },
    {
      name = "minecraft:brush",
      displayName = "Brush",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:feather"]={2,},["minecraft:copper_ingot"]={5,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:name_tag",
      displayName = "Name Tag",
    },
    {
      name = "minecraft:lead",
      displayName = "Lead",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:string"]={1,2,5,11,},["minecraft:slimeball"]={6,},}},},
    },
    {
      name = "minecraft:compass",
      displayName = "Compass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstoe_dust"]={6,},["minecraft:iron_ingot"]={2,5,7,10,},}},},
    },
    {
      name = "minecraft:recovery_compass",
      displayName = "Recovery Compass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:compass"]={6,},["minecraft:echo_shard"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:clock",
      displayName = "Clock",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={2,5,7,10,},["minecraft:redstoe_dust"]={6,},}},},
    },
    {
      name = "minecraft:spyglass",
      displayName = "Spyglass",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:amethyst_shard"]={2,},["minecraft:copper_ingot"]={6,10,},}},},
    },
    {
      name = "minecraft:empty_map",
      displayName = "Empty Map",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:compass"]={6,},["minecraft:paper"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:book_and_quill",
      displayName = "Book and Quill",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:book"]={5,},["minecraft:ink_sac"]={6,},}},},
    },
    {
      name = "minecraft:ender_pearl",
      displayName = "Ender Pearl",
    },
    {
      name = "minecraft:eye_of_ender",
      displayName = "Eye of Ender",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:blaze_powder"]={1,},["minecraft:ender_pearl"]={2,},["minecraft:feather"]={10,},}},},
    },
    {
      name = "minecraft:elytra",
      displayName = "Elytra",
    },
    {
      name = "minecraft:firework_rocket",
      displayName = "Firework Rocket",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gunpowder"]={6,9,10,},["minecraft:paper"]={5,},}},},
    },
    {
      name = "minecraft:saddle",
      displayName = "Saddle",
    },
    {
      name = "minecraft:carrot_on_a_stick",
      displayName = "Carrot on a Stick",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:carrot"]={11,},["minecraft:fishing_rod"]={6,},}},},
    },
    {
      name = "minecraft:warped_fungus_on_a_stick",
      displayName = "Warped Fungus on a Stick",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:warped_fungus"]={11,},["minecraft:fishing_rod"]={6,},}},},
    },
    {
      name = "minecraft:oak_boat",
      displayName = "Oak Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:oak_chest_boat",
      displayName = "Oak Boat with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_boat"]={5,},["minecraft:chest"]={6,},}},},
    },
    {
      name = "minecraft:spruce_boat",
      displayName = "Spruce Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:spruce_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:spruce_chest_boat",
      displayName = "Spruce Boat with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:spruce_boat"]={5,},["minecraft:chest"]={6,},}},},
    },
    {
      name = "minecraft:birch_boat",
      displayName = "Birch Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:birch_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:birch_chest_boat",
      displayName = "Birch Boat with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={6,},["minecraft:birch_boat"]={5,},}},},
    },
    {
      name = "minecraft:jungle_boat",
      displayName = "Jungle Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:jungle_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:jungle_chest_boat",
      displayName = "Jungle Boat with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={6,},["minecraft:jungle_boat"]={5,},}},},
    },
    {
      name = "minecraft:acacia_boat",
      displayName = "Acacia Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:acacia_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:acacia_chest_boat",
      displayName = "Acacia Boat with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:acacia_boat"]={5,},["minecraft:chest"]={6,},}},},
    },
    {
      name = "minecraft:dark oak_boat",
      displayName = "Dark Oak Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:dark oak_chest_boat",
      displayName = "Dark Oak Boat with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:oak_boat"]={5,},["minecraft:chest"]={6,},}},},
    },
    {
      name = "minecraft:mangrove_boat",
      displayName = "Mangrove Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:mangrove_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:mangrove_chest_boat",
      displayName = "Mangrove Boat with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={6,},["minecraft:mangrove_boat"]={5,},}},},
    },
    {
      name = "minecraft:cherry_boat",
      displayName = "Cherry Boat",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cherry_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:cherry_chest_boat",
      displayName = "Cherry Boat with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cherry_boat"]={5,},["minecraft:chest"]={6,},}},},
    },
    {
      name = "minecraft:bamboo_raft",
      displayName = "Bamboo Raft",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:bamboo_planks"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:bamboo_chest_raft",
      displayName = "Bamboo Raft with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={6,},["minecraft:bamboo_raft"]={7,},}},},
    },
    {
      name = "minecraft:rail",
      displayName = "Rail",
      recipes = {{quantity = 1, ratio = 16, ingredients = {["minecraft:stick"]={6,},["minecraft:iron_ingot"]={1,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:powered_rail",
      displayName = "Powered Rail",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:redstone"]={10,},["minecraft:gold_ingot"]={1,3,5,7,9,11,},["minecraft:stick"]={6,},}},},
    },
    {
      name = "minecraft:detector_rail",
      displayName = "Detector Rail",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:redstone"]={10,},["minecraft:iron_ingot"]={1,3,5,7,9,11,},["minecraft:stone_pressure_plate"]={6,},}},},
    },
    {
      name = "minecraft:activator_rail",
      displayName = "Activator Rail",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:stick"]={2,10,},["minecraft:iron_ingot"]={1,3,5,7,9,11,},["minecraft:redstone_torch"]={6,},}},},
    },
    {
      name = "minecraft:minecart",
      displayName = "Minecart",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:hopper_minecart",
      displayName = "Minecart with Hopper",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:minecart"]={10,},["minecraft:hopper"]={6,},}},},
    },
    {
      name = "minecraft:chest_minecart",
      displayName = "Minecart with Chest",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={6,},["minecraft:minecart"]={10,},}},},
    },
    {
      name = "minecraft:furnace_minecart",
      displayName = "Minecart with Furnace",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:furnace"]={6,},["minecraft:minecart"]={10,},}},},
    },
    {
      name = "minecraft:tnt_minecart",
      displayName = "Minecart with TNT",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:minecart"]={10,},["minecraft:tnt"]={6,},}},},
    },
    {
      name = "minecraft:goat_horn",
      displayName = "Goat Horn",
    },
    {
      name = "minecraft:music_disc",
      displayName = "Music Disc",
    },
  },
  combat =
  {
    {
      name = "minecraft:wooden_sword",
      displayName = "Wooden Sword",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={2,6,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:stone_sword",
      displayName = "Stone Sword",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:cobblestone"]={2,6,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:cobbled_deepslate"]={2,6,},}},},
    },
    {
      name = "minecraft:iron_sword",
      displayName = "Iron Sword",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:iron_ingot"]={2,6,},}},},
    },
    {
      name = "minecraft:golden_sword",
      displayName = "Golden Sword",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={2,6,},["minecraft:stick"]={10,},}},},
    },
    {
      name = "minecraft:diamond_sword",
      displayName = "Diamond Sword",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={10,},["minecraft:diamond"]={2,6,},}},},
    },
    {
      name = "minecraft:netherite_sword",
      displayName = "Netherite Sword",
    },
    {
      name = "minecraft:wooden_axe",
      displayName = "Wooden Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={1,2,5,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:stone_axe",
      displayName = "Stone Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobblestone"]={1,2,5,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:cobbled_deepslate"]={1,2,5,},}},},
    },
    {
      name = "minecraft:iron_axe",
      displayName = "Iron Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:iron_ingot"]={1,2,5,},}},},
    },
    {
      name = "minecraft:golden_axe",
      displayName = "Golden Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,5,},["minecraft:stick"]={6,10,},}},},
    },
    {
      name = "minecraft:diamond_axe",
      displayName = "Diamond Axe",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={6,10,},["minecraft:diamond"]={1,2,5,},}},},
    },
    {
      name = "minecraft:netherite_axe",
      displayName = "Netherite Axe",
    },
    {
      name = "minecraft:trident",
      displayName = "Trident",
    },
    {
      name = "minecraft:shield",
      displayName = "Shield",
    },
    {
      name = "minecraft:leather_cap",
      displayName = "Leather Cap",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:leather"]={1,2,3,5,7,},}},},
    },
    {
      name = "minecraft:leather_tunic",
      displayName = "Leather Tunic",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:leather"]={1,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:leather_pants",
      displayName = "Leather Pants",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:leather"]={1,2,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:leather_boots",
      displayName = "Leather Boots",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:leather"]={5,7,9,11,},}},},
    },
    {
      name = "minecraft:chainmail_helmet",
      displayName = "Chainmail Helmet",
    },
    {
      name = "minecraft:chainmail_chestplate",
      displayName = "Chainmail Chestplate",
    },
    {
      name = "minecraft:chainmail_leggings",
      displayName = "Chainmail Leggings",
    },
    {
      name = "minecraft:chainmail_boots",
      displayName = "Chainmail Boots",
    },
    {
      name = "minecraft:iron_helmet",
      displayName = "Iron Helmet",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={1,2,3,5,7,},}},},
    },
    {
      name = "minecraft:iron_chestplate",
      displayName = "Iron Chestplate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={1,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:iron_leggings",
      displayName = "Iron Leggings",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={1,2,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:iron_boots",
      displayName = "Iron Boots",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond"]={5,7,9,11,},}},},
    },
    {
      name = "minecraft:golden_helmet",
      displayName = "Golden Helmet",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,3,5,7,},}},},
    },
    {
      name = "minecraft:golden_chestplate",
      displayName = "Golden Chestplate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:golden_leggings",
      displayName = "Golden Leggings",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:golden_boots",
      displayName = "Golden Boots",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={5,7,9,11,},}},},
    },
    {
      name = "minecraft:diamond_helmet",
      displayName = "Diamond Helmet",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond"]={1,2,3,5,7,},}},},
    },
    {
      name = "minecraft:diamond_chestplate",
      displayName = "Diamond Chestplate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond"]={1,3,5,6,7,9,10,11,},}},},
    },
    {
      name = "minecraft:diamond_leggings",
      displayName = "Diamond Leggings",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond"]={1,2,3,5,7,9,11,},}},},
    },
    {
      name = "minecraft:diamond_boots",
      displayName = "Diamond Boots",
    },
    {
      name = "minecraft:netherite_helmet",
      displayName = "Netherite Helmet",
    },
    {
      name = "minecraft:netherite_chestplate",
      displayName = "Netherite Chestplate",
    },
    {
      name = "minecraft:netherite_leggings",
      displayName = "Netherite Leggings",
    },
    {
      name = "minecraft:netherite_boots",
      displayName = "Netherite Boots",
    },
    {
      name = "minecraft:turtle_shell",
      displayName = "Turtle Shell",
    },
    {
      name = "minecraft:leather_horse_armor",
      displayName = "Leather Horse Armor",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:leather"]={1,3,5,6,7,9,11,},}},},
    },
    {
      name = "minecraft:iron_horse_armor",
      displayName = "Iron Horse Armor",
    },
    {
      name = "minecraft:golden_horse_armor",
      displayName = "Golden Horse Armor",
    },
    {
      name = "minecraft:diamond_horse_armor",
      displayName = "Diamond Horse Armor",
    },
    {
      name = "minecraft:totem_of_undying",
      displayName = "Totem of Undying",
    },
    {
      name = "minecraft:tnt",
      displayName = "TNT",
    },
    {
      name = "minecraft:end_crystal",
      displayName = "End Crystal",
    },
    {
      name = "minecraft:snowball",
      displayName = "Snowball",
    },
    {
      name = "minecraft:egg",
      displayName = "Egg",
    },
    {
      name = "minecraft:bow",
      displayName = "Bow",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:string"]={1,5,9,},["minecraft:stick"]={2,7,10,},}},},
    },
    {
      name = "minecraft:crossbow",
      displayName = "Crossbow",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={1,3,10,},["minecraft:iron_ingot"]={2,},["minecraft:string"]={5,7,},["minecraft:tripwire_hook"]={6,},}},},
    },
    {
      name = "minecraft:firework_rocket",
      displayName = "Firework Rocket",
    },
    {
      name = "minecraft:arrow",
      displayName = "Arrow",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:feather"]={10,},["minecraft:stick"]={6,},["minecraft:flint"]={2,},}},},
    },
    {
      name = "minecraft:spectral_arrow",
      displayName = "Spectral Arrow",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:glowstone_dust"]={2,5,7,10,},["minecraft:arrow"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_splashing",
      displayName = "Arrow of Splashing",
    },
    {
      name = "minecraft:tipped_arrow",
      displayName = "Tipped Arrow",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_night_vision",
      displayName = "Arrow of Night Vision",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_invisibility",
      displayName = "Arrow of Invisibility",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_leaping",
      displayName = "Arrow of Leaping",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_fire_resistance",
      displayName = "Arrow of Fire Resistance",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_swiftness",
      displayName = "Arrow of Swiftness",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_slowness",
      displayName = "Arrow of Slowness",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_the_turtle_master",
      displayName = "Arrow of The Turtle Master",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_water_breathing",
      displayName = "Arrow of Water Breathing",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_healing",
      displayName = "Arrow of Healing",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_harming",
      displayName = "Arrow of Harming",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_poison",
      displayName = "Arrow of Poison",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_regeneration",
      displayName = "Arrow of Regeneration",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_strength",
      displayName = "Arrow of Strength",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_weakness",
      displayName = "Arrow of Weakness",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_luck",
      displayName = "Arrow of Luck",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
    {
      name = "minecraft:arrow_of_slow_falling",
      displayName = "Arrow of Slow Falling",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:arrow"]={1,2,3,5,7,9,10,11,},["minecraft:potion"]={6,},}},},
    },
  },
  food =
  {
    {
      name = "minecraft:apple",
      displayName = "Apple",
    },
    {
      name = "minecraft:golden_apple",
      displayName = "Golden Apple",
    },
    {
      name = "minecraft:enchanted_golden_apple",
      displayName = "Enchanted Golden Apple",
    },
    {
      name = "minecraft:melon_slice",
      displayName = "Melon Slice",
    },
    {
      name = "minecraft:sweet_berries",
      displayName = "Sweet Berries",
    },
    {
      name = "minecraft:glow_berries",
      displayName = "Glow Berries",
    },
    {
      name = "minecraft:chorus_fruit",
      displayName = "Chorus Fruit",
    },
    {
      name = "minecraft:popped_chorus_fruit",
      displayName = "Popped Chorus Fruit",
      smelt = {"minecraft:chorus_fruit"}
    },
    {
      name = "minecraft:carrot",
      displayName = "Carrot",
    },
    {
      name = "minecraft:golden_carrot",
      displayName = "Golden Carrot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:carrot"]={6,},["minecraft:gold_nugget"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:potato",
      displayName = "Potato",
    },
    {
      name = "minecraft:baked_potato",
      displayName = "Baked Potato",
      smelt = {"minecraft:potato"}
    },
    {
      name = "minecraft:poisonous_potato",
      displayName = "Poisonous Potato",
    },
    {
      name = "minecraft:beetroot",
      displayName = "Beetroot",
    },
    {
      name = "minecraft:kelp",
      displayName = "Kelp",
    },
    {
      name = "minecraft:dried_kelp",
      displayName = "Dried Kelp",
      smelt = {"minecraft:kelp"}
    },
    {
      name = "minecraft:raw_beef",
      displayName = "Raw Beef",
    },
    {
      name = "minecraft:steak",
      displayName = "Steak",
      smelt = {"minecraft:raw_beef"}
    },
    {
      name = "minecraft:raw_porkchop",
      displayName = "Raw Porkchop",
    },
    {
      name = "minecraft:cooked_porkchop",
      displayName = "Cooked Porkchop",
      smelt = {"minecraft:raw_porkchop"}
    },
    {
      name = "minecraft:raw_mutton",
      displayName = "Raw Mutton",
    },
    {
      name = "minecraft:cooked_mutton",
      displayName = "Cooked Mutton",
      smelt = {"minecraft:raw_mutton"}
    },
    {
      name = "minecraft:raw_chicken",
      displayName = "Raw Chicken",
    },
    {
      name = "minecraft:cooked_chicken",
      displayName = "Cooked Chicken",
      smelt = {"minecraft:raw_chicken"}
    },
    {
      name = "minecraft:raw_rabbit",
      displayName = "Raw Rabbit",
    },
    {
      name = "minecraft:cooked_rabbit",
      displayName = "Cooked Rabbit",
      smelt = {"minecraft:raw_rabbit"}
    },
    {
      name = "minecraft:raw_cod",
      displayName = "Raw Cod",
    },
    {
      name = "minecraft:cooked_cod",
      displayName = "Cooked Cod",
      smelt = {"minecraft:raw_cod"}
    },
    {
      name = "minecraft:raw_salmon",
      displayName = "Raw Salmon",
    },
    {
      name = "minecraft:cooked_salmon",
      displayName = "Cooked Salmon",
      smelt = {"minecraft:raw_salmon"}
    },
    {
      name = "minecraft:tropicl_fish",
      displayName = "Tropicl Fish",
    },
    {
      name = "minecraft:pufferfish",
      displayName = "Pufferfish",
    },
    {
      name = "minecraft:bread",
      displayName = "Bread",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:wheat"]={1,2,3,},}},},
    },
    {
      name = "minecraft:cookie",
      displayName = "Cookie",
      recipes = {{quantity = 1, ratio = 8, ingredients = {["minecraft:wheat"]={1,3,},["minecraft:cocoa_beans"]={2,},}},},
    },
    {
      name = "minecraft:cake",
      displayName = "Cake",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:wheat"]={9,10,11,},["minecraft:sugar"]={5,7,},["minecraft:milk_bucket"]={1,2,3,},["minecraft:egg"]={6,},}},},
    },
    {
      name = "minecraft:pumpkin_pie",
      displayName = "Pumpkin Pie",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:pumpkin"]={5,},["minecraft:egg"]={10,},["minecraft:sugar"]={6,},}},},
    },
    {
      name = "minecraft:rotten_flesh",
      displayName = "Rotten Flesh",
    },
    {
      name = "minecraft:spider_eye",
      displayName = "Spider Eye",
    },
    {
      name = "minecraft:mushroom_stew",
      displayName = "Mushroom Stew",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:bowl"]={10,},["minecraft:red_mushroom"]={5,},["minecraft:brown_mushroom"]={6,},}},},
    },
    {
      name = "minecraft:beetroot_soup",
      displayName = "Beetroot Soup",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:bowl"]={10,},["minecraft:beetroot"]={1,2,3,5,6,7,},}},},
    },
    {
      name = "minecraft:rabbit_stew",
      displayName = "Rabbit Stew",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:bowl"]={10,},["minecraft:cooked_rabbit"]={2,},["minecraft:carrot"]={3,},["minecraft:red_mushroom"]={6,},["minecraft:baked_potato"]={5,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:bowl"]={10,},["minecraft:cooked_rabbit"]={2,},["minecraft:carrot"]={3,},["minecraft:baked_potato"]={5,},["minecraft:brown_mushroom"]={6,},}},},
    },
    {
      name = "minecraft:suspicious_stew",
      displayName = "Suspicious Stew",
    },
    {
      name = "minecraft:milk_bucket",
      displayName = "Milk Bucket",
    },
    {
      name = "minecraft:honey_bottle",
      displayName = "Honey Bottle",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:bottle"]={5,6,9,10,},["minecraft:honey_block"]={7,},}},},
    },
    {
      name = "minecraft:water_bottle",
      displayName = "Water Bottle",
    },
    {
      name = "minecraft:potion",
      displayName = "Mundane Potion",
    },
    {
      name = "minecraft:potion",
      displayName = "Thick Potion",
    },
    {
      name = "minecraft:potion",
      displayName = "Awkward Potion",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Night Vision",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Invisibility",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Leaping",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Fire Resistance",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Swiftness",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Slowness",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of The Turtle Master",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Water Breathing",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Healing",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Harming",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Poison",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Regeneration",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Strength",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Weakness",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Luck",
    },
    {
      name = "minecraft:potion",
      displayName = "Potion of Slow Falling",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Night Vision",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Invisibility",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Leaping",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Fire Resistance",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Swiftness",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Slowness",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of The Turtle Master",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Water Breathing",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Healing",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Harming",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Poison",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Regeneration",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Strength",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Weakness",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Luck",
    },
    {
      name = "minecraft:splash_potion",
      displayName = "Splash Potion of Slow Falling",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Night Vision",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Invisibility",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Leaping",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Fire Resistance",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Swiftness",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Slowness",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of The Turtle Master",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Water Breathing",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Healing",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Harming",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Poison",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Regeneration",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Strength",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Weakness",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Luck",
    },
    {
      name = "minecraft:lingering_potion",
      displayName = "Lingering Potion of Slow Falling",
    },
  },
  ingredients =
  {
    {
      name = "minecraft:coal",
      displayName = "Coal",
      smelt = {"minecraft:coal_ore", "minecraft:deepslate_coal_ore"}
    },
    {
      name = "minecraft:charcoal",
      displayName = "Charcoal",
      smelt = {"log", "wood"}
    },
    {
      name = "minecraft:raw_iron",
      displayName = "Raw Iron",
    },
    {
      name = "minecraft:raw_copper",
      displayName = "Raw Copper",
    },
    {
      name = "minecraft:raw_gold",
      displayName = "Raw Gold",
    },
    {
      name = "minecraft:emerald",
      displayName = "Emerald",
    },
    {
      name = "minecraft:lapis_lazuli",
      displayName = "Lapis Lazuli",
    },
    {
      name = "minecraft:diamond",
      displayName = "Diamond",
    },
    {
      name = "minecraft:ancient_debris",
      displayName = "Ancient Debris",
    },
    {
      name = "minecraft:nether_quartz",
      displayName = "Nether Quartz",
    },
    {
      name = "minecraft:amethyst_shard",
      displayName = "Amethyst Shard",
    },
    {
      name = "minecraft:iron_nugget",
      displayName = "Iron Nugget",
    },
    {
      name = "minecraft:gold_nugget",
      displayName = "Gold Nugget",
    },
    {
      name = "minecraft:iron_ingot",
      displayName = "Iron Ingot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_nugget"]={1,2,3,5,6,7,9,10,11,},}},{quantity = 1, ratio = 9, ingredients = {["minecraft:iron_block"]={1,},}},},
      smelt = {"minecraft:raw_iron"}
    },
    {
      name = "minecraft:copper_ingot",
      displayName = "Copper Ingot",
      recipes = {{quantity = 1, ratio = 9, ingredients = {["minecraft:copper_block"]={1,},}},},
      smelt = {"minecraft:raw_copper"}
    },
    {
      name = "minecraft:gold_ingot",
      displayName = "Gold Ingot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_nugget"]={1,2,3,5,6,7,9,10,11,},}},{quantity = 1, ratio = 9, ingredients = {["minecraft:gold_block"]={1,},}},},
      smelt = {"minecraft:raw_gold"}
    },
    {
      name = "minecraft:netherite_scrap",
      displayName = "Netherite Scrap",
      smelt = {"minecraft:ancient_debris"}
    },
    {
      name = "minecraft:netherite_ingot",
      displayName = "Netherite Ingot",
    },
    {
      name = "minecraft:bowl",
      displayName = "Bowl",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={1,3,6,},}},},
    },
    {
      name = "minecraft:stick",
      displayName = "Stick",
      recipes = {{quantity = 1, ratio = 4, ingredients = {["minecraft:*_planks"]={1,5,},}},},
    },
    {
      name = "minecraft:flint",
      displayName = "Flint",
    },
    {
      name = "minecraft:wheat",
      displayName = "Wheat",
    },
    {
      name = "minecraft:bone",
      displayName = "Bone",
    },
    {
      name = "minecraft:bone_meal",
      displayName = "Bone Meal",
    },
    {
      name = "minecraft:string",
      displayName = "String",
    },
    {
      name = "minecraft:feather",
      displayName = "Feather",
    },
    {
      name = "minecraft:snowball",
      displayName = "Snowball",
    },
    {
      name = "minecraft:egg",
      displayName = "Egg",
    },
    {
      name = "minecraft:leather",
      displayName = "Leather",
    },
    {
      name = "minecraft:rabbit_hide",
      displayName = "Rabbit Hide",
    },
    {
      name = "minecraft:honeycomb",
      displayName = "Honeycomb",
    },
    {
      name = "minecraft:ink_sac",
      displayName = "Ink Sac",
    },
    {
      name = "minecraft:glow_ink_sac",
      displayName = "Glow Ink Sac",
    },
    {
      name = "minecraft:scute",
      displayName = "Scute",
    },
    {
      name = "minecraft:slimeball",
      displayName = "Slimeball",
    },
    {
      name = "minecraft:clay_ball",
      displayName = "Clay Ball",
    },
    {
      name = "minecraft:prismarine_shard",
      displayName = "Prismarine Shard",
    },
    {
      name = "minecraft:prismarine_crystals",
      displayName = "Prismarine Crystals",
    },
    {
      name = "minecraft:nautilus_shell",
      displayName = "Nautilus Shell",
    },
    {
      name = "minecraft:heart_of_the_sea",
      displayName = "Heart of the Sea",
    },
    {
      name = "minecraft:fire_charge",
      displayName = "Fire Charge",
    },
    {
      name = "minecraft:blaze_rod",
      displayName = "Blaze Rod",
    },
    {
      name = "minecraft:nether_star",
      displayName = "Nether Star",
    },
    {
      name = "minecraft:ender_pearl",
      displayName = "Ender Pearl",
    },
    {
      name = "minecraft:eye_of_ender",
      displayName = "Eye of Ender",
    },
    {
      name = "minecraft:shulker_shell",
      displayName = "Shulker Shell",
    },
    {
      name = "minecraft:popped_chorus_fruit",
      displayName = "Popped Chorus Fruit",
    },
    {
      name = "minecraft:echo_shard",
      displayName = "Echo Shard",
    },
    {
      name = "minecraft:disc_fragment",
      displayName = "Disc Fragment",
    },
    {
      name = "minecraft:white_dye",
      displayName = "White Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lily_of_the_valley"]={1,},}},{quantity = 1, ratio = 3, ingredients = {["minecraft:bonemeal"]={1,},}},},
    },
    {
      name = "minecraft:light_gray_dye",
      displayName = "Light Gray Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:azure_bluet"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:oxeye_daisy"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:white_tulip"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:white_dye"]={2,},["minecraft:gray_dye"]={1,},}},},
    },
    {
      name = "minecraft:gray_dye",
      displayName = "Gray Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:black_dye"]={1,},["minecraft:white_dye"]={2,},}},},
    },
    {
      name = "minecraft:black_dye",
      displayName = "Black Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:ink_sac"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:wither_rose"]={1,},}},},
    },
    {
      name = "minecraft:brown_dye",
      displayName = "Brown Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:cocoa_beans"]={1,},}},},
    },
    {
      name = "minecraft:red_dye",
      displayName = "Red Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:beetroot"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:poppy"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:rosebush"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:red_tulip"]={1,},}},},
    },
    {
      name = "minecraft:orange_dye",
      displayName = "Orange Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:torchflower"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:orange_tulip"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:red_dye"]={1,},["minecraft:yellow_dye"]={2,},}},},
    },
    {
      name = "minecraft:yellow_dye",
      displayName = "Yellow Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:dandelion"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:sunflower"]={1,},}},},
    },
    {
      name = "minecraft:lime_dye",
      displayName = "Lime Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:white_dye"]={2,},["minecraft:green_dye"]={1,},}},},
      smelt = {"minecraft:sea_pickle"}
    },
    {
      name = "minecraft:green_dye",
      displayName = "Green Dye",
      smelt = {"minecraft:cactus"}
    },
    {
      name = "minecraft:cyan_dye",
      displayName = "Cyan Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:pitcher_plant"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:blue_dye"]={1,},["minecraft:green_dye"]={2,},}},},
    },
    {
      name = "minecraft:light_blue_dye",
      displayName = "Light Blue Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:blue_orchid"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:white_dye"]={2,},["minecraft:blue_dye"]={1,},}},},
    },
    {
      name = "minecraft:blue_dye",
      displayName = "Blue Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:lapis_lazuli"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:cornflower"]={1,},}},},
    },
    {
      name = "minecraft:purple_dye",
      displayName = "Purple Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_dye"]={1,},["minecraft:blue_dye"]={2,},}},},
    },
    {
      name = "minecraft:magenta_dye",
      displayName = "Magenta Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:allium"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:lilac"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:purple_dye"]={1,},["minecraft:pink_dye"]={2,},}},},
    },
    {
      name = "minecraft:pink_dye",
      displayName = "Pink Dye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:peony"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:pink_petals"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:pink_tulip"]={1,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:red_dye"]={1,},["minecraft:white_dye"]={2,},}},},
    },
    {
      name = "minecraft:bowl",
      displayName = "Bowl",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:*_planks"]={1,3,6,},}},},
    },
    {
      name = "minecraft:brick",
      displayName = "Brick",
      smelt = {"minecraft:clay_ball"}
    },
    {
      name = "minecraft:nether_brick",
      displayName = "Nether Brick",
      smelt = {"minecraft:netherrack"}
    },
    {
      name = "minecraft:paper",
      displayName = "Paper",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:sugar_cane"]={1,2,3,},}},},
    },
    {
      name = "minecraft:book",
      displayName = "Book",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:leather"]={10,},["minecraft:paper"]={5,6,9,},}},},
    },
    {
      name = "minecraft:firework_star",
      displayName = "Firework Star",
    },
    {
      name = "minecraft:glass_bottle",
      displayName = "Glass bottle",
      recipes = {{quantity = 1, ratio = 3, ingredients = {["minecraft:glass"]={5,7,10,},}},},
    },
    {
      name = "minecraft:nether_wart",
      displayName = "Nether Wart",
    },
    {
      name = "minecraft:redstone_dust",
      displayName = "Redstone Dust",
    },
    {
      name = "minecraft:glowstone_dust",
      displayName = "Glowstone dust",
    },
    {
      name = "minecraft:gunpowder",
      displayName = "Gunpowder",
    },
    {
      name = "minecraft:dragon_s_breath",
      displayName = "Dragon's Breath",
    },
    {
      name = "minecraft:fermented_spiders_eye",
      displayName = "Fermented Spiders Eye",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:sugar"]={6,},["minecraft:spider_eye"]={10,},["minecraft:brown_mushroom"]={5,},}},},
    },
    {
      name = "minecraft:blaze_powder",
      displayName = "Blaze Powder",
      recipes = {{quantity = 1, ratio = 2, ingredients = {["minecraft:blaze_rod"]={1,},}},},
    },
    {
      name = "minecraft:sugar",
      displayName = "Sugar",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:sugar_cane"]={1,},}},},
    },
    {
      name = "minecraft:rabbit_s_foot",
      displayName = "Rabbit's Foot",
    },
    {
      name = "minecraft:glistering_melon_slice",
      displayName = "Glistering Melon Slice",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:melon_slice"]={6,},["minecraft:gold_nugget"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:spider_eye",
      displayName = "Spider Eye",
    },
    {
      name = "minecraft:pufferfish",
      displayName = "Pufferfish",
    },
    {
      name = "minecraft:magma_cream",
      displayName = "Magma Cream",
    },
    {
      name = "minecraft:golden_carrot",
      displayName = "Golden Carrot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:carrot"]={6,},["minecraft:gold_nugget"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "minecraft:ghast_tear",
      displayName = "Ghast Tear",
    },
    {
      name = "minecraft:turtle_shell",
      displayName = "Turtle Shell",
    },
    {
      name = "minecraft:phantom_membrane",
      displayName = "Phantom Membrane",
    },
    {
      name = "minecraft:banner_pattern",
      displayName = "Banner Pattern",
    },
    {
      name = "minecraft:pottery_sherd",
      displayName = "Pottery Sherd",
    },
    {
      name = "minecraft:smithing_template",
      displayName = "Smithing Template",
    },
    {
      name = "minecraft:enchanted_book",
      displayName = "Enchanted Book",
    },
    {
      name = "minecraft:experience_bottle",
      displayName = "Bottle o'Enchanting",
    },
  },
  computercraft =
  {
    {
      name = "computercraft:turtle",
      displayName = "Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:chest"]={10,},["minecraft:iron_ingot"]={1,2,3,5,7,9,11,},["computercaft:computer"]={6,},}},},
    },
    {
      name = "computercraft:mining_turtle",
      displayName = "Mining Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_pickaxe"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:felling_turtle",
      displayName = "Felling Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_axe"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:farming_turtle",
      displayName = "Farming Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_hoe"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:melee_turtle",
      displayName = "Melee Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_sword"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:digging_turtle",
      displayName = "Digging Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_shovel"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:noisy_turtle",
      displayName = "Noisy Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:speaker"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:ender_turtle",
      displayName = "Ender Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:ender_modem"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:advanced_mining_turtle",
      displayName = "Advanced Mining Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:advanced_turtle"]={6,},["minecraft:diamond_pickaxe"]={5,},}},},
    },
    {
      name = "computercraft:advanced_felling_turtle",
      displayName = "Advanced Felling Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:advanced_turtle"]={6,},["minecraft:diamond_axe"]={5,},}},},
    },
    {
      name = "computercraft:advanced_farming_turtle",
      displayName = "Advanced Farming Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:advanced_turtle"]={6,},["minecraft:diamond_hoe"]={5,},}},},
    },
    {
      name = "computercraft:advanced_melee_turtle",
      displayName = "Advanced Melee Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:advanced_turtle"]={6,},["minecraft:diamond_sword"]={5,},}},},
    },
    {
      name = "computercraft:advanced_digging_turtle",
      displayName = "Advanced Digging Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:advanced_turtle"]={6,},["minecraft:diamond_shovel"]={5,},}},},
    },
    {
      name = "computercraft:advanced_noisy_turtle",
      displayName = "Advanced Noisy Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:advanced_turtle"]={6,},["computercraft:speaker"]={5,},}},},
    },
    {
      name = "computercraft:advanced_ender_turtle",
      displayName = "Advanced Ender Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:ender_modem"]={5,},["computercraft:advanced_turtle"]={6,},}},},
    },
    {
      name = "computercraft:mining_turtle",
      displayName = "Wireless Mining  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_pickaxe"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:felling_turtle",
      displayName = "Wireless Felling  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_axe"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:farming_turtle",
      displayName = "Wireless Farming  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_hoe"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:melee_turtle",
      displayName = "Wireless Melee  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_sword"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:digging_turtle",
      displayName = "Wireless Digging  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:diamond_shovel"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:noisy_turtle",
      displayName = "Wireless Noisy  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:speaker"]={5,},["computercraft:turtle"]={6,},}},},
    },
    {
      name = "computercraft:advanced_wireless_mining_turtle",
      displayName = "Advanced Wireless Mining  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:advanced_mining_turtle"]={6,},["computercraft:wireless_modem"]={5,},}},},
    },
    {
      name = "computercraft:advanced_wireless_felling_turtle",
      displayName = "Advanced Wireless Felling  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:wireless_modem"]={5,},["computercraft:advanced_felling_turtle"]={6,},}},},
    },
    {
      name = "computercraft:advanced_wireless_farming_turtle",
      displayName = "Advanced Wireless Farming  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:wireless_modem"]={5,},["computercraft:advanced_farming_turtle"]={6,},}},},
    },
    {
      name = "computercraft:advanced_wireless_melee_turtle",
      displayName = "Advanced Wireless Melee  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:advanced_melee_turtle"]={6,},["computercraft:wireless_modem"]={5,},}},},
    },
    {
      name = "computercraft:advanced_wireless_digging_turtle",
      displayName = "Advanced Wireless Digging  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:wireless_modem"]={5,},["computercraft:advanced_digging_turtle"]={6,},}},},
    },
    {
      name = "computercraft:advanced_wireless_noisy_turtle",
      displayName = "Advanced Wireless Noisy  Turtle",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:advanced_noisy_turtle"]={6,},["computercraft:wireless_modem"]={5,},}},},
    },
    {
      name = "computercraft:computer",
      displayName = "Computer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={6,},["minecraft:glass_pane"]={10,},["minecraft:stone"]={1,2,3,5,7,9,11,},}},},
    },
    {
      name = "computercraft:advanced_computer",
      displayName = "Advanced Computer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,3,5,7,9,11,},["minecraft:redgold_ingot_dust"]={6,},["minecraft:glass_pane"]={10,},}},},
    },
    {
      name = "computercraft:pocket_computer",
      displayName = "Pocket Computer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone"]={1,2,3,5,7,9,11,},["minecraft:golden_apple"]={6,},["minecraft:glass_pane"]={10,},}},},
    },
    {
      name = "computercraft:ender_pocket_computer",
      displayName = "Ender Pocket Computer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:ender_modem"]={6,},["computercraft:pocket_computer"]={10,},}},},
    },
    {
      name = "computercraft:wireless_pocket_computer",
      displayName = "Wireless Pocket Computer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:wirelss_modem"]={6,},["computercraft:pocket_computer"]={10,},}},},
    },
    {
      name = "computercraft:advanced_pocket_computer",
      displayName = "Advanced Pocket Computer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,3,5,7,9,11,},["minecraft:golden_apple"]={6,},["minecraft:glass_pane"]={10,},}},},
    },
    {
      name = "computercraft:advanced_ender_pocket_computer",
      displayName = "Advanced Ender Pocket Computer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:ender_modem"]={6,},["computercraft:advanced_pocket_computer"]={10,},}},},
    },
    {
      name = "computercraft:advanced_wireless_pocket_computer",
      displayName = "Advanced Wireless Pocket Computer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["computercraft:wirelss_modem"]={6,},["computercraft:adavanced_pocket_computer"]={10,},}},},
    },
    {
      name = "computercraft:wireless_modem_normal",
      displayName = "Wireless Modem",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone"]={1,2,3,5,7,9,10,11,},["minecraft:ender_pearl"]={6,},}},},
    },
    {
      name = "computercraft:wireless_modem_advanced",
      displayName = "Ender Modem",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,3,5,7,9,10,11,},["minecraft:eye_of_ender"]={6,},}},},
    },
    {
      name = "computercraft:networking_cable",
      displayName = "Networking Cable",
      recipes = {{quantity = 1, ratio = 6, ingredients = {["minecraft:stone"]={2,5,7,10,},["minecraft:redstone"]={6,},}},},
    },
    {
      name = "computercraft:wired_modem",
      displayName = "Wired Modem",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone"]={1,2,3,5,7,9,10,11,},["minecraft:redstone"]={6,},}},},
    },
    {
      name = "computercraft:monitor",
      displayName = "Monitor",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone"]={1,2,3,5,7,9,10,11,},["minecraft:glass_pane"]={6,},}},},
    },
    {
      name = "computercraft:advanced_monitor",
      displayName = "Advanced Monitor",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gold_ingot"]={1,2,3,5,7,9,10,11,},["minecraft:glass_pane"]={6,},}},},
    },
    {
      name = "computercraft:speaker",
      displayName = "Speaker",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={10,},["minecraft:stone"]={1,2,3,5,7,9,11,},["minecraft:note_block"]={6,},}},},
    },
    {
      name = "computercraft:printer",
      displayName = "Printer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={6,},["minecraft:ink_sac"]={10,},["minecraft:stone"]={1,2,3,5,7,9,11,},}},},
    },
    {
      name = "computercraft:printed_page",
      displayName = "Printed Page",
    },
    {
      name = "computercraft:printed_pages",
      displayName = "Printed Pages",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:string"]={5,},["computercraft:printed_page"]={2,6,10,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:string"]={10,},["computercraft:printed_pages"]={1,2,3,},["computercraft:printed_page"]={5,6,7,},}},},
    },
    {
      name = "computercraft:printed_book",
      displayName = "Printed book",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:leather"]={6,},["minecraft:string"]={5,},["computercraft:printed_page"]={1,2,3,},}},{quantity = 1, ratio = 1, ingredients = {["minecraft:string"]={9,},["computercraft:printed_pages"]={1,2,3,},["minecraft:leather"]={10,},["computercraft:printed_page"]={5,6,7,},}},},
    },
    {
      name = "computercraft:disk_drive",
      displayName = "Disk Drive",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stone"]={1,2,3,5,7,9,11,},["minecraft:redstone"]={6,10,},}},},
    },
    {
      name = "computercraft:floppy_disk",
      displayName = "Floppy disk",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,},["minecraft:paper"]={6,},}},},
    },
  },
  morered =
  {
    {
      name = "morered:soldering_table",
      displayName = "Soldering Table",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_nether_bricks"]={5,7,9,11,},["morered:stone_plate"]={1,2,3,},["minecraft:blaze_rod"]={6,10,},}},},
    },
    {
      name = "morered:stone_plate",
      displayName = "Stone Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:smooth_stone_slab"]={5,6,7,},}},},
    },
    {
      name = "morered:latch",
      displayName = "Latch",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={5,7,},["minecraft:redstone_torch"]={2,10,},["morered:stone_plate"]={1,3,9,11,},}},},
    },
    {
      name = "morered:pulse_gate",
      displayName = "Pulse Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={5,7,},["minecraft:iron_ingot"]={6,},["morered:stone_plate"]={9,10,11,},}},},
    },
    {
      name = "morered:redwire_post",
      displayName = "Redwire Post",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={2,},["morered:red_alloy_ingot"]={6,},}},},
    },
    {
      name = "morered:redwire_post_plate",
      displayName = "Redwire Post Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:iron_ingot"]={2,},["morered:stone_plate"]={9,10,11,},["morered:red_alloy_ingot"]={6,},}},},
    },
    {
      name = "morered:redwire_post_relay_plate",
      displayName = "Redwire Post Relay Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={5,7,},["minecraft:iron_ingot"]={2,},["morered:stone_plate"]={9,10,11,},["morered:red_alloy_ingot"]={6,},}},},
    },
    {
      name = "morered:hexidecrubrometer",
      displayName = "Hexidecrubrometer",
    },
    {
      name = "morered:bundled_cable_post",
      displayName = "Bundled Cable Post",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["morered:bundled_cable"]={1,},["minecraft:iron_ingot"]={2,},}},},
    },
    {
      name = "morered:bundled_cable_relay_plate",
      displayName = "Bundled Cable Relay Plate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["morered:bundled_cable"]={2,5,7,},["minecraft:iron_ingot"]={6,},["morered:stone_plate"]={9,10,11,},}},},
    },
    {
      name = "morered:red_alloy_wire",
      displayName = "Red Alloy Wire",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["morered:red_alloy_ingot"]={5,6,7,},}},},
    },
    {
      name = "morered:white_network_cable",
      displayName = "White Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},["minecraft:white_wool"]={6,},}},},
    },
    {
      name = "morered:gray_network_cable",
      displayName = "Gray Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:gray_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:light_gray_network_cable",
      displayName = "Light Gray Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},["minecraft:light_gray_wool"]={6,},}},},
    },
    {
      name = "morered:brown_network_cable",
      displayName = "Brown Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},["minecraft:brown_wool"]={6,},}},},
    },
    {
      name = "morered:red_network_cable",
      displayName = "Red Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:orange_network_cable",
      displayName = "Orange Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:yellow_network_cable",
      displayName = "Yellow Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:lime_network_cable",
      displayName = "Lime Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:green_network_cable",
      displayName = "Green Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:cyan_network_cable",
      displayName = "Cyan Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:blue_network_cable",
      displayName = "Blue Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:light_blue_network_cable",
      displayName = "Light Blue Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},["minecraft:light_blue_wool"]={6,},}},},
    },
    {
      name = "morered:purple_network_cable",
      displayName = "Purple Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:magenta_network_cable",
      displayName = "Magenta Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:pink_network_cable",
      displayName = "Pink Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:red_wool"]={6,},["morered:red_alloy_wire"]={1,2,3,5,7,9,10,11,},}},},
    },
    {
      name = "morered:bundled_network_cable",
      displayName = "Bundled Network Cable",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["morered:network_cable"]={2,6,10,},}},},
    },
    {
      name = "morered:diode",
      displayName = "Diode",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={6,},["minecraft:redstone_torch"]={5,7,},["morered:stone_plate"]={9,10,11,},}},},
    },
    {
      name = "morered:not_gate",
      displayName = "NOT Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={5,7,},["minecraft:redstone_torch"]={6,},["morered:stone_plate"]={9,10,11,},}},},
    },
    {
      name = "morered:nor_gate",
      displayName = "NOR Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,5,7,10,},["minecraft:redstone_torch"]={6,},["morered:stone_plate"]={1,3,9,11,},}},},
    },
    {
      name = "morered:nand_gate",
      displayName = "NAND Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,6,},["minecraft:redstone_torch"]={5,7,10,},["morered:stone_plate"]={1,3,9,11,},}},},
    },
    {
      name = "morered:or_gate",
      displayName = "OR Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={5,7,10,},["minecraft:redstone_torch"]={2,6,},["morered:stone_plate"]={1,3,9,11,},}},},
    },
    {
      name = "morered:and_gate",
      displayName = "AND Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={6,},["minecraft:redstone_torch"]={2,5,7,10,},["morered:stone_plate"]={1,3,9,11,},}},},
    },
    {
      name = "morered:xor_gate",
      displayName = "XOR Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,},["minecraft:redstone_torch"]={5,6,7,},["morered:stone_plate"]={1,3,9,10,11,},}},},
    },
    {
      name = "morered:xnor_gate",
      displayName = "XNOR Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["morered:stone_plate"]={1,3,9,10,11,},["minecraft:redstone_torch"]={2,5,6,7,},}},},
    },
    {
      name = "morered:multiplexer",
      displayName = "Multiplexer",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,5,7,10,},["minecraft:iron_ingot"]={6,},["morered:stone_plate"]={1,3,9,11,},}},},
    },
    {
      name = "morered:two_input_and_gate",
      displayName = "Two Input AND Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={6,},["minecraft:redstone_torch"]={2,5,7,},["morered:stone_plate"]={1,3,9,10,11,},}},},
    },
    {
      name = "morered:two_input_nand_gate",
      displayName = "Two Input NAND Gate",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,6,},["minecraft:redstone_torch"]={5,7,},["morered:stone_plate"]={1,3,9,10,11,},}},},
    },
    {
      name = "morered:bitwise_diode",
      displayName = "Bitwise Diode",
    },
    {
      name = "morered:bitwisee_not_gate",
      displayName = "Bitwisee NOT Gate",
    },
    {
      name = "morered:bitwise_or_gate",
      displayName = "Bitwise OR Gate",
    },
    {
      name = "morered:bitwise_and_gate",
      displayName = "Bitwise AND Gate",
    },
    {
      name = "morered:bitwise_xor_gate",
      displayName = "Bitwise XOR Gate",
    },
    {
      name = "morered:bitwise_xnor_gate",
      displayName = "Bitwise XNOR Gate",
    },
    {
      name = "morered:redwire_spool",
      displayName = "Redwire Spool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={3,9,},["minecraft:iron_ingot"]={2,5,7,10,},["morered:red_alloy_ingot"]={1,6,11,},}},},
    },
    {
      name = "morered:bundled_cable_spool",
      displayName = "Bundled Cable Spool",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:stick"]={3,9,},["minecraft:iron_ingot"]={2,5,7,10,},["morered:red_alloy_wire"]={1,6,11,},}},},
    },
    {
      name = "morered:red_alloy_ingot",
      displayName = "Red Alloy Ingot",
      recipes = {{quantity = 1, ratio = 1, ingredients = {["minecraft:redstone"]={2,3,5,6,},["minecraft:iron_ingot"]={1,},}},},
    },
  },
}
