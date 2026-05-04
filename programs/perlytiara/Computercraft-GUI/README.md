# Computercraft-GUI
An improved version of the Toolkit with mouse and/or keyboard control
Downloading tk3.lua and running it in a ccTweaked (Computercraft) Turtle will download the rest of the files in this repository, along with a number of utilities from the older Minecraft-Toolkit repository.

Screenshots:

<img width="751" height="397" alt="image" src="https://github.com/user-attachments/assets/5b2a7241-7111-4556-a5e7-3001f991b7ed" />

<img width="756" height="396" alt="image" src="https://github.com/user-attachments/assets/70619eeb-aa16-4621-bf2f-186dbae58eba" />

The Advanced Turtle allows clicking with the mouse on buttons and checkboxes. Clicking in a textbox sets it's focus for typing.

The standard Turtle does not have a mouse input, so keyboard instructions are given on the bottom line.

For example to select a checkbox, type it's index number displayed next to it and hit Enter. Repeat to change the state:

<img width="746" height="385" alt="image" src="https://github.com/user-attachments/assets/36747da7-69ab-4b0b-b45b-8c700d3fb296" />

Use the 'b' key to emulate the 'Back' button, 'q' for 'Quit', 'n' for 'Next', 'c' to clear the keyboard input buffer

Use installer.lua or start the lua prompt and use these lines individually:

url = "https://raw.githubusercontent.com/Inksaver/Minecraft-Toolkit/refs/heads/main/updater.lua"

response, message = http.get(url)

data = response.readAll()

response.close()

f = fs.open("updater.lua", "w")

f.write(data)

f.close()


Exit lua and run updater.lua



