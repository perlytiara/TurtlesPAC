--[[
  digkit — tiny CLI for one-off digs and portal carving.

  Usage (copy folder to disk, then):
    digkit           — help
    digkit dig       — dig block in front only
    digkit go        — dig then forward one block
    digkit portal    — carve 3×5 portal outline from bottom-right start
    digkit portal W H — same command with custom width/height
    digkit up|down|fwd|back — single safe move
]]

local args = { ... }
local path = shell.getRunningProgram()
local dir = path and fs.getDir(path) or ""
local libPath = fs.combine(dir, "lib.lua")
local digkit = dofile(libPath)

local function usage()
  print("digkit — simple turtle digs")
  print("  digkit dig       dig block in front")
  print("  digkit go        dig, then forward 1")
  print("  digkit portal    carve 3×5 outline (start at bottom-right)")
  print("  digkit portal W H   custom outline size")
  print("  digkit up|down|fwd|forward|back|left|right")
  print("  digkit update    redownload digkit from GitHub")
end

local cmd = args[1] and args[1]:lower() or "help"

if cmd == "help" or cmd == "?" or cmd == "-h" then
  usage()
  return
end

if cmd == "dig" then
  digkit.dig()
  return
end

if cmd == "go" or cmd == "1" then
  digkit.digForward()
  return
end

if cmd == "update" then
  local inst = fs.combine(dir, "digkit-install.lua")
  if fs.exists(inst) then
    shell.run(inst .. " update")
  else
    print("Missing digkit/digkit-install.lua — run wget digkit-install from the repo.")
  end
  return
end

if cmd == "portal" then
  local w = tonumber(args[2]) or 3
  local h = tonumber(args[3]) or 5
  digkit.carvePortalOutlineBottomRight(w, h)
  return
end

if cmd == "up" then
  digkit.up()
  return
end

if cmd == "down" then
  digkit.down()
  return
end

if cmd == "fwd" or cmd == "f" or cmd == "forward" then
  digkit.forward()
  return
end

if cmd == "back" or cmd == "b" then
  digkit.back()
  return
end

if cmd == "left" or cmd == "tl" or cmd == "l" then
  digkit.turnLeft()
  return
end

if cmd == "right" or cmd == "tr" or cmd == "r" then
  digkit.turnRight()
  return
end

print("Unknown command: " .. tostring(args[1]))
usage()
