--[[
  dig1 — run once: dig the block in front (no move).

  For dig+forward use: digkit go
  Or: local d = dofile("digkit/lib.lua"); d.digForward()
]]

local path = shell.getRunningProgram()
local dir = path and fs.getDir(path) or ""
local digkit = dofile(fs.combine(dir, "lib.lua"))

digkit.dig()
