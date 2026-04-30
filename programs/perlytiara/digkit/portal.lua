--[[
  portal.lua - standalone turtle portal carver (no digkit dependency)

  Start position:
    - Turtle at bottom-right corner of portal outline
    - Facing the wall to carve

  Default size:
    - width = 3
    - height = 5

  Usage:
    portal
    portal 3 5
]]

local args = { ... }

local function fail(msg)
  print("portal: " .. tostring(msg))
  return false
end

local function ensureTurtle()
  if not turtle then
    return fail("must run on a turtle")
  end
  return true
end

local function hasFuel()
  local fuel = turtle.getFuelLevel()
  if fuel == "unlimited" then
    return true
  end
  return fuel > 0
end

local function tryMove(moveFn, detectFn, digFn, attackFn, label)
  local retries = 16
  for _ = 1, retries do
    if moveFn() then
      return true
    end

    if not hasFuel() then
      return fail("out of fuel while moving " .. label)
    end

    if detectFn and detectFn() and digFn then
      digFn()
    end

    if attackFn then
      attackFn()
    end

    sleep(0.08)
  end
  return fail("could not move " .. label .. " (blocked or protected)")
end

local function digFront()
  local tries = 16
  for _ = 1, tries do
    if not turtle.detect() then
      return true
    end
    if turtle.dig() then
      sleep(0.03)
    else
      turtle.attack()
      sleep(0.08)
    end
  end
  return fail("could not clear front block")
end

local function moveForward()
  return tryMove(
    turtle.forward,
    turtle.detect,
    turtle.dig,
    turtle.attack,
    "forward"
  )
end

local function moveUp()
  return tryMove(
    turtle.up,
    turtle.detectUp,
    turtle.digUp,
    turtle.attackUp,
    "up"
  )
end

local function moveDown()
  return tryMove(
    turtle.down,
    turtle.detectDown,
    turtle.digDown,
    turtle.attackDown,
    "down"
  )
end

local function stepLeft()
  turtle.turnLeft()
  local ok = moveForward()
  turtle.turnRight()
  return ok
end

local function stepRight()
  turtle.turnRight()
  local ok = moveForward()
  turtle.turnLeft()
  return ok
end

local function main()
  if not ensureTurtle() then
    return
  end

  local width = tonumber(args[1]) or 3
  local height = tonumber(args[2]) or 5
  if width < 1 then width = 1 end
  if height < 1 then height = 1 end

  -- bottom-right
  if not digFront() then return end

  -- right side up
  for _ = 1, height - 1 do
    if not moveUp() then return end
    if not digFront() then return end
  end

  -- top row right -> left
  for _ = 1, width - 1 do
    if not stepLeft() then return end
    if not digFront() then return end
  end

  -- left side down
  for _ = 1, height - 1 do
    if not moveDown() then return end
    if not digFront() then return end
  end

  -- bottom row left -> right (return to start)
  for _ = 1, width - 1 do
    if not stepRight() then return end
    if not digFront() then return end
  end

  print("portal: done (" .. width .. "x" .. height .. ")")
end

main()
