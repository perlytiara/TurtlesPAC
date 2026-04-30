--[[
  digkit — tiny CLI for one-off digs and portal carving.

  Usage (copy folder to disk, then):
    digkit           — help
    digkit dig       — dig block in front only
    digkit go        — dig then forward one block
    digkit portal    — carve 2×3 portal hole (see lib carvePortalHole)
    digkit up|down|fwd|back — single safe move
]]

local args = { ... }
local path = shell.getRunningProgram()
local dir = path and fs.getDir(path) or ""
local libPath = fs.combine(dir, "lib.lua")
local digkit = dofile(libPath)

local function usage()
  print("digkit — simple turtle digs")
  print("  digkit dig      dig block in front")
  print("  digkit go       dig, then forward 1")
  print("  digkit portal   carve 2×3 wall (nether portal air space)")
  print("  digkit up|down|fwd|back  one safe move")
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

if cmd == "go" or cmd == "1" or cmd == "forward" then
  digkit.digForward()
  return
end

if cmd == "portal" then
  digkit.carvePortalHole()
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

if cmd == "fwd" or cmd == "f" then
  digkit.forward()
  return
end

if cmd == "back" or cmd == "b" then
  digkit.back()
  return
end

print("Unknown command: " .. tostring(args[1]))
usage()
