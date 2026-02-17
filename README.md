# TurtlesPAC (Turtles Programs And Computers)

Program archive: **programs** (main repo) and **community** (other repos) as submodules. Used as the **TurtlesPAC** submodule in [turtles.tips](https://github.com/perlytiara/turtles.tips).

- **programs/** — Main program folder (regular files, not a submodule). Source: [CC-Tweaked-TurtsAndComputers](https://github.com/perlytiara/CC-Tweaked-TurtsAndComputers).
- **community/** — Community repos as submodules. See [community/README.md](community/README.md).
- **docs/** — Credits and archive docs.

Website and data live in the turtles.tips repo, not here.

## Clone (standalone)

```bash
git clone --recurse-submodules https://github.com/perlytiara/TurtlesPAC.git
```

Or clone turtles.tips and use `turtles.tips/TurtlesPAC` (submodule).

## Update community submodules

```bash
git submodule update --remote --merge
```

Credits: [docs/credits.md](docs/credits.md).
