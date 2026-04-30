--[[
  digkit-install — install / update digkit into ./digkit/ and add short commands
  next to this folder: dig, go, fwd, portal, digkit, etc.

  First-time (HTTP on), from the folder where you want commands (e.g. disk root):
    wget https://raw.githubusercontent.com/perlytiara/TurtlesPAC/refs/heads/main/programs/perlytiara/digkit/digkit-install.lua
    digkit-install

  Update:
    digkit-install update
]]

local BASE =
  "https://raw.githubusercontent.com/perlytiara/TurtlesPAC/refs/heads/main/programs/perlytiara/digkit/"

local DIGKIT_FILES = {
  "lib.lua",
  "digkit.lua",
  "dig1.lua",
  "digkit-install.lua",
}

local WRAPPER_COMMANDS = {
  "dig",
  "go",
  "portal",
  "fwd",
  "forward",
  "up",
  "down",
  "back",
  "left",
  "right",
}

local function fetchToPath(url, path)
  assert(http and http.get, "http API unavailable")
  local h = http.get(url)
  assert(h, "no handle")
  local code = h.getResponseCode()
  assert(code == 200, "HTTP " .. tostring(code))
  local body = h.readAll()
  h.close()
  local f = fs.open(path, "w")
  assert(f, "cannot write " .. path)
  f.write(body)
  f.close()
end

local function writeMarker(installRoot)
  local p = fs.combine(installRoot, "digkit", ".install_root")
  local f = fs.open(p, "w")
  f.write(installRoot)
  f.close()
end

local function readInstallRoot()
  local candidates = {
    fs.combine(shell.dir(), "digkit", ".install_root"),
    fs.combine(shell.dir(), ".install_root"),
  }
  for _, p in ipairs(candidates) do
    if fs.exists(p) then
      local h = fs.open(p, "r")
      if h then
        local line = h.readLine()
        h.close()
        if line and line ~= "" then
          return line
        end
      end
    end
  end
  return nil
end

local function stubSingle(cmd)
  return table.concat({
    'local me = shell.getRunningProgram()',
    'local root = fs.getDir(me)',
    'if not root or root == "" then root = "/" end',
    'local cli = fs.combine(root, "digkit", "digkit")',
    'shell.run(cli .. " ' .. cmd .. '")',
  }, "\n")
end

local stubDigkitPass = table.concat({
  'local me = shell.getRunningProgram()',
  'local root = fs.getDir(me)',
  'if not root or root == "" then root = "/" end',
  'local cli = fs.combine(root, "digkit", "digkit")',
  'local a = { ... }',
  'local s = table.concat(a, " ")',
  'if s == "" then shell.run(cli)',
  'else shell.run(cli .. " " .. s) end',
}, "\n")

local stubInstallPass = table.concat({
  'local me = shell.getRunningProgram()',
  'local root = fs.getDir(me)',
  'if not root or root == "" then root = "/" end',
  'local cli = fs.combine(root, "digkit", "digkit-install.lua")',
  'local a = { ... }',
  'local s = table.concat(a, " ")',
  'if s == "" then shell.run(cli .. " update")',
  'else shell.run(cli .. " " .. s) end',
}, "\n")

local function writeWrappers(installRoot)
  for _, c in ipairs(WRAPPER_COMMANDS) do
    local path = fs.combine(installRoot, c .. ".lua")
    local f = fs.open(path, "w")
    f.write(stubSingle(c))
    f.close()
  end
  local f = fs.open(fs.combine(installRoot, "digkit.lua"), "w")
  f.write(stubDigkitPass)
  f.close()
  f = fs.open(fs.combine(installRoot, "digkit-install.lua"), "w")
  f.write(stubInstallPass)
  f.close()
end

local function digkitPresent(root)
  return fs.exists(fs.combine(root, "digkit", "lib.lua"))
end

local function normalizeInstallRoot()
  local r = shell.dir()
  local name = fs.getName(r)
  if name == "digkit" then
    return fs.getDir(r)
  end
  return r
end

local function installFromNet(installRoot)
  if not http then
    print("Enable HTTP in CC:Tweaked server settings.")
    return false
  end
  fs.makeDir(fs.combine(installRoot, "digkit"))
  for _, name in ipairs(DIGKIT_FILES) do
    local url = BASE .. name
    local path = fs.combine(installRoot, "digkit", name)
    print("Fetching digkit/" .. name .. " ...")
    local ok, err = pcall(function()
      fetchToPath(url, path)
    end)
    if not ok then
      print("Error: " .. tostring(err))
      return false
    end
  end
  writeMarker(installRoot)
  writeWrappers(installRoot)
  print("")
  print("Installed at " .. fs.combine(installRoot, "digkit"))
  print("From THIS folder you can run: dig, go, fwd, forward, portal, up, down, back, left, right, digkit, digkit-install")
  print("(Stay here, or add this folder to shell path in startup.)")
  return true
end

local args = { ... }

local function main()
  local sub = args[1] and args[1]:lower() or nil

  if sub == "help" or sub == "-h" or sub == "?" then
    print("digkit-install          download digkit + command stubs (needs HTTP)")
    print("digkit-install update   redownload from GitHub")
    return
  end

  local installRoot = readInstallRoot() or normalizeInstallRoot()

  if sub == "update" then
    if not digkitPresent(installRoot) and not readInstallRoot() then
      print("No digkit here. wget digkit-install.lua and run digkit-install first.")
      return
    end
    if not http then
      print("Enable HTTP for update.")
      return
    end
    installFromNet(installRoot)
    return
  end

  -- default / explicit install
  if sub and sub ~= "install" then
    print("Usage: digkit-install | digkit-install update | digkit-install help")
    return
  end

  if not http then
    print("Enable HTTP for install.")
    return
  end

  installFromNet(installRoot)
end

main()
