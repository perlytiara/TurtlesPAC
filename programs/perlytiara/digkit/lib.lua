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
  Carve a rectangular portal outline in the wall ahead.
  Default: 3 wide × 5 tall, starting at the bottom-right corner.
  Start facing into the wall. The turtle returns to the same cell and heading.
]]
function M.carvePortalOutlineBottomRight(width, height)
  M.assertTurtle()
  local w = tonumber(width) or 3
  local h = tonumber(height) or 5
  if w < 1 then w = 1 end
  if h < 1 then h = 1 end

  -- Start at bottom-right and dig that first block.
  M.dig()

  -- Up the right side to top-right.
  for _ = 1, h - 1 do
    M.up()
    M.dig()
  end

  -- Across the top from right to left.
  for _ = 1, w - 1 do
    M.turnLeft()
    M.forward()
    M.turnRight()
    M.dig()
  end

  -- Down the left side to bottom-left.
  for _ = 1, h - 1 do
    M.down()
    M.dig()
  end

  -- Back across bottom to return to bottom-right start.
  for _ = 1, w - 1 do
    M.turnRight()
    M.forward()
    M.turnLeft()
    M.dig()
  end

  return true
end

function M.carvePortalHole()
  return M.carvePortalOutlineBottomRight(3, 5)
end

return M
