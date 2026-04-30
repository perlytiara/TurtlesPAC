--[[
  digkit library — small turtle dig/move helpers for other scripts.

  Usage:
    local digkit = dofile("digkit/lib.lua")
    digkit.digForward()
    digkit.carvePortalHole()
]]

local M = {}

local function hasTurtle()
  return pcall(function()
    return turtle.getFuelLevel()
  end)
end

function M.assertTurtle()
  if not hasTurtle() then
    error("digkit: must run on a turtle", 2)
  end
end

--- Dig until the block in front is air (or nothing to dig).
function M.dig()
  M.assertTurtle()
  while turtle.detect() do
    if not turtle.dig() then
      break
    end
  end
  return true
end

function M.digUp()
  M.assertTurtle()
  while turtle.detectUp() do
    if not turtle.digUp() then
      break
    end
  end
  return true
end

function M.digDown()
  M.assertTurtle()
  while turtle.detectDown() do
    if not turtle.digDown() then
      break
    end
  end
  return true
end

function M.forward()
  M.assertTurtle()
  while not turtle.forward() do
    if turtle.detect() then
      turtle.dig()
    end
    turtle.attack()
  end
  return true
end

function M.back()
  M.assertTurtle()
  while not turtle.back() do
    turtle.attack()
  end
  return true
end

function M.up()
  M.assertTurtle()
  while not turtle.up() do
    if turtle.detectUp() then
      turtle.digUp()
    end
    turtle.attackUp()
  end
  return true
end

function M.down()
  M.assertTurtle()
  while not turtle.down() do
    if turtle.detectDown() then
      turtle.digDown()
    end
    turtle.attackDown()
  end
  return true
end

function M.turnLeft()
  M.assertTurtle()
  turtle.turnLeft()
  return true
end

function M.turnRight()
  M.assertTurtle()
  turtle.turnRight()
  return true
end

--- Clear the block ahead, then step forward one block.
function M.digForward()
  M.dig()
  M.forward()
  return true
end

--- Only step forward (digging if blocked).
function M.step()
  return M.forward()
end

--[[
  Carve a 2 wide × 3 tall hole in the wall ahead (nether portal interior).
  Stand at the bottom-left corner of the hole (as seen facing the wall),
  facing into the wall. Afterward the turtle returns to the same cell and heading.
]]
function M.carvePortalHole()
  M.assertTurtle()
  -- Bottom row: left, then right
  M.dig()
  M.turnRight()
  M.forward()
  M.turnLeft()
  M.dig()
  M.turnRight()
  M.back()
  M.turnLeft()
  -- Middle row
  M.up()
  M.dig()
  M.turnRight()
  M.forward()
  M.turnLeft()
  M.dig()
  M.turnRight()
  M.back()
  M.turnLeft()
  -- Top row
  M.up()
  M.dig()
  M.turnRight()
  M.forward()
  M.turnLeft()
  M.dig()
  M.turnRight()
  M.back()
  M.turnLeft()
  -- Return to start height
  M.down()
  M.down()
  return true
end

return M
