--[[
  Legacy bootstrap: fetches the real installer (digkit-install.lua) and runs it.
  Prefer wgetting digkit-install.lua directly from the repo.
]]

local URL =
  "https://raw.githubusercontent.com/perlytiara/TurtlesPAC/refs/heads/main/programs/perlytiara/digkit/digkit-install.lua"

if not http then
  print("Enable HTTP in CC:Tweaked server settings.")
  return
end

print("Fetching digkit-install.lua ...")
local h = assert(http.get(URL))
assert(h.getResponseCode() == 200, "bad HTTP status")
local src = h.readAll()
h.close()

local loadfn = loadstring or load
local chunk, err = loadfn(src, "digkit-install")
if not chunk then
  print("Load error: " .. tostring(err))
  return
end

chunk()
