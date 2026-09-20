# WindowsLib

A brand-new, window-first Roblox UI library built from scratch in pure Luau. No forks, no `HttpGet` dependencies at runtime, no icon packs to download.

Windows 11-inspired chrome (titlebar + minimize/close, sidebar tabs, rounded 8px, Fluent tweens), modular source, 8 built-in themes + custom themes, live theme switching, flag-based configs, executor + Studio support.

## Why not a pre-made lib / built-in UI?

 researched WindUI, Rayfield, LinoriaLib, KyriLib, Steam-lib, AcrylicUI before designing:

| Learned from | Taken into WindowsLib |
|---|---|
| WindUI `CreateWindow` + `Tab` + `SetTheme`/`AddTheme`/`OnThemeChange`, 16 themes | Theme registry, `AddTheme`, `SetTheme`, `GetThemes`, live update |
| Rayfield `ToggleUIKeybind`, `ConfigurationSaving` | `ToggleKey`, `ConfigFolder`, `SaveConfig`/`LoadConfig` |
| Linoria dependency boxes, groupboxes | `Section` grouping, `Flag` system (deps roadmap) |
| KyriLib `apply_theme` partial override, preset dropdown | `SetTheme({Accent=...})` partial override |
| Steam-lib `Library/Theme/Utility/Components` | `src/Theme.lua`, `src/Util.lua`, `src/ConfigManager.lua`, `src/init.lua` |
| Acrylic mobile toggle, resizable | Touch drag, toggle key, minimize (resize roadmap) |

Improvised: Windows OS metaphor (chrome buttons, sidebar like Settings app), zero-asset rendering (no external images so it works offline and stays undetected), single-file `dist` for `loadstring` + modular `src` for contributors.

## Layout

```text
WindowsLib/
  README.md
  CHANGELOG.md
  LICENSE
  example.lua
  src/
    Theme.lua          -- 8 themes + Add/WithOverride
    Util.lua           -- Create/Tween/Drag/SafeParent
    ConfigManager.lua  -- Flags + JSON save/load
    init.lua           -- WindowsLib.CreateWindow + Window/Tab/Section
  dist/
    WindowsLib.lua     -- single-file build (loadstring this)
  docs/
    API.md
    THEMES.md
```

## Quick start (executor)

```luau
local WindowsLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOU/WindowsLib/main/dist/WindowsLib.lua"))()

local Window = WindowsLib.CreateWindow({
  Title = "My Hub",
  Theme = "Dark",
  ToggleKey = Enum.KeyCode.RightShift,
  ConfigFolder = "MyHub",
})

local Tab = Window:Tab({ Title = "Main" })
local Sec = Tab:Section({ Title = "Controls" })

Sec:Button({ Title = "Hi", Callback = function() Window:Notify({ Title = "Hi" }) end })
Sec:Toggle({ Title = "Fly", Default = false, Flag = "fly", Callback = print })
Sec:Slider({ Title = "Speed", Min = 16, Max = 200, Default = 16, Flag = "speed", Callback = print })
```

See `example.lua` and `docs/API.md`.

## Studio (modular)

1. Copy `src/` into `ReplicatedStorage.WindowsLib.src`.
2. `local WindowsLib = require(game.ReplicatedStorage.WindowsLib.src.init)`.

## Build dist

`dist/WindowsLib.lua` is built from `src/` (strip `require` + trailing `return`s, concatenate). Rebuild after editing `src/` — see `CHANGELOG.md`.

## Docs

- `docs/API.md` — full Window/Tab/Section/element reference.
- `docs/THEMES.md` — theme keys, `AddTheme`, gradients roadmap.
- Better than plain `.md`? For GitHub keep Markdown (renders natively). Optionally add Mintlify/MkDocs later; API is already split so it ports cleanly.

## License

MIT — see `LICENSE`.
