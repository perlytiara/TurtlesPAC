--[[
  digkit library — small turtle dig/move helpers for other scripts.

  Usage:
    local digkit = dofile("digkit/lib.lua")
    digkit.digForward()
    digkit.carvePortalHole()
]]

local M = {}
local MOVE_MAX_RETRIES = 30
local MOVE_RETRY_SLEEP = 0.15

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
  local tries = 0
  while not turtle.forward() do
    tries = tries + 1
    if turtle.detect() then
      local dug = turtle.dig()
      if not dug and turtle.detect() then
        if tries >= MOVE_MAX_RETRIES then
          return false, "blocked in front (unbreakable block or full inventory)"
        end
      end
    end
    turtle.attack()
    if tries >= MOVE_MAX_RETRIES then
      return false, "cannot move forward"
    end
    sleep(MOVE_RETRY_SLEEP)
  end
  return true
end

function M.back()
  M.assertTurtle()
  local tries = 0
  while not turtle.back() do
    tries = tries + 1
    turtle.attack()
    if tries >= MOVE_MAX_RETRIES then
      return false, "cannot move back (block behind cannot be dug)"
    end
    sleep(MOVE_RETRY_SLEEP)
  end
  return true
end

function M.up()
  M.assertTurtle()
  local tries = 0
  while not turtle.up() do
    tries = tries + 1
    if turtle.detectUp() then
      local dug = turtle.digUp()
      if not dug and turtle.detectUp() then
        if tries >= MOVE_MAX_RETRIES then
          return false, "blocked above (unbreakable block or full inventory)"
        end
      end
    end
    turtle.attackUp()
    if tries >= MOVE_MAX_RETRIES then
      return false, "cannot move up"
    end
    sleep(MOVE_RETRY_SLEEP)
  end
  return true
end

function M.down()
  M.assertTurtle()
  local tries = 0
  while not turtle.down() do
    tries = tries + 1
    if turtle.detectDown() then
      local dug = turtle.digDown()
      if not dug and turtle.detectDown() then
        if tries >= MOVE_MAX_RETRIES then
          return false, "blocked below (unbreakable block or full inventory)"
        end
      end
    end
    turtle.attackDown()
    if tries >= MOVE_MAX_RETRIES then
      return false, "cannot move down"
    end
    sleep(MOVE_RETRY_SLEEP)
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
  return M.forward()
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
    local ok, err = M.up()
    if not ok then
      return false, err
    end
    M.dig()
  end

  -- Across the top from right to left.
  for _ = 1, w - 1 do
    M.turnLeft()
    local ok, err = M.forward()
    if not ok then
      return false, err
    end
    M.turnRight()
    M.dig()
  end

  -- Down the left side to bottom-left.
  for _ = 1, h - 1 do
    local ok, err = M.down()
    if not ok then
      return false, err
    end
    M.dig()
  end

  -- Back across bottom to return to bottom-right start.
  for _ = 1, w - 1 do
    M.turnRight()
    local ok, err = M.forward()
    if not ok then
      return false, err
    end
    M.turnLeft()
    M.dig()
  end

  return true
end

function M.carvePortalHole()
  return M.carvePortalOutlineBottomRight(3, 5)
end

return M
