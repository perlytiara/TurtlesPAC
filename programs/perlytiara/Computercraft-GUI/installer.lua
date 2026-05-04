local url = "https://raw.githubusercontent.com/perlytiara/TurtlesPAC/main/programs/perlytiara/Minecraft-Toolkit/updater.lua"
local response, message = http.get(url)
local data = response.readAll()
response.close()
f = fs.open("updater.lua", "w")
f.write(data)
f.close()
shell.run("updater.lua")
