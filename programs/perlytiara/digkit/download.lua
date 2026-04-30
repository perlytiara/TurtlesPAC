--[[
  Installer for digkit (CC:Tweaked, HTTP enabled).

  One-liner on the turtle:
    wget run https://raw.githubusercontent.com/perlytiara/TurtlesPAC/refs/heads/main/programs/perlytiara/digkit/download.lua

  Or: wget <url> digkit_install && digkit_install
]]

local BASE =
  "https://raw.githubusercontent.com/perlytiara/TurtlesPAC/refs/heads/main/programs/perlytiara/digkit/"

local FILES = {
  "lib.lua",
  "digkit.lua",
  "dig1.lua",
  "download.lua",
}

local function fetch(name)
  local url = BASE .. name
  local path = shell.resolve(name)
  print("Fetching " .. name .. " ...")
  local ok, err = pcall(function()
    assert(http and http.get, "http API unavailable")
    local h = http.get(url)
    assert(h, "no handle")
    local code = h.getResponseCode()
    assert(code == 200, "HTTP " .. tostring(code))
    local body = h.readAll()
    h.close()
    local f = fs.open(path, "w")
    f.write(body)
    f.close()
  end)
  if not ok then
    print("Error: " .. tostring(err))
    return false
  end
  return true
end

local function main()
  if not http then
    print("Enable HTTP in CC:Tweaked server settings.")
    return
  end
  fs.makeDir("digkit")
  shell.setDir("digkit")
  for _, name in ipairs(FILES) do
    if not fetch(name) then
      return
    end
  end
  print("Installed under digkit/. Run: digkit/digkit dig")
end

main()
