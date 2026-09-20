# WindowsLib API — v1.0.0

## WindowsLib (global)

```luau
WindowsLib.Version -> "1.0.0"
WindowsLib.CreateWindow(cfg) -> Window
WindowsLib:AddTheme({ Name = "X", Accent = Color3, ... }) -> theme
WindowsLib:GetThemes() -> { "Amber", "Dark", ... }
WindowsLib:GetTheme() -> theme, name
WindowsLib:SetTheme("Dark") -> theme | nil   -- updates windows made with default theme
WindowsLib:OnThemeChange(function(name, theme) end) -> connection
```

`CreateWindow` config:

| Key | Type | Default | Notes |
|---|---|---|---|
| Title | string | "WindowsLib" | Window title |
| Subtitle | string | "" | Shown after ` • ` |
| Theme | string \| table | "Dark" | Name, or `{ Base="Dark", Accent=... }` partial |
| Size | UDim2 | 560x400 | Main frame |
| Position | UDim2 | center | Main frame |
| ToggleKey | Enum.KeyCode \| string | nil | Toggles visibility |
| ConfigFolder | string | "WindowsLib" | `writefile` folder |

## Window

```luau
Window:Tab({ Title = "Main" }) -> Tab
Window:Notify({ Title, Content, Duration=3 })
Window:SetTheme("Violet") | Window:SetTheme({ Accent = Color3 })
Window:Toggle(force?) | Window:Show() | Window:Hide() | Window:Destroy()
Window:SaveConfig("default") -> ok, info
Window:LoadConfig("default") -> ok, count
Window.Config:List() -> files
```

## Tab

```luau
Tab:Section({ Title = "Controls" }) -> Section
```

## Section elements

All element constructors take a table and return a handle with `Get`/`Set`. Toggles/sliders/dropdowns/inputs/colorpickers accept `Flag = "unique"` for config save/load.

```luau
Section:Label("Hello")
Section:Paragraph({ Text = "..." })
Section:Divider()
Section:Button({ Title="Go", Callback=function() end })
Section:Toggle({ Title="Fly", Default=false, Flag="fly", Callback=function(v) end }) -> { Get, Set, SetCallback }
Section:Slider({ Title="Speed", Min=16, Max=200, Default=16, Step=1, Flag="speed", Callback=function(v) end })
Section:Dropdown({ Title="Mode", Options={"A","B"}, Default="A", Flag="mode", Callback=function(v) end }) -> { Get, Set, SetOptions }
Section:Input({ Title="Name", Default="", Placeholder="...", Flag="name", Callback=function(text, enter) end })
Section:Keybind({ Title="Toggle", Default=Enum.KeyCode.F, OnPress=function() end, Callback=function(key) end })
Section:ColorPicker({ Title="Accent", Default=Color3, Flag="accent", Callback=function(c) end })
```

Handles:

```luau
toggle:Set(true) toggle:Get() -> bool
slider:Set(120) slider:Get() -> number
dropdown:Set("B") dropdown:Get() -> string
input:Set("hi") input:Get() -> string
keybind:Set(Enum.KeyCode.G) keybind:Get() -> KeyCode
picker:Set(Color3) picker:Get() -> Color3
```

## Configs

Flags auto-register. Save writes `<ConfigFolder>/<name>.json` via `writefile` (falls back to memory in Studio).

```luau
Window:SaveConfig("default")
Window:LoadConfig("default")
```

## Notes

- Pure Instances: `ScreenGui` in `gethui()` (protected) else `CoreGui` else `PlayerGui`.
- Fonts: Gotham family. No external assets.
- ColorPicker v1 cycles presets on click (dependency-free). Full HSV editor is roadmap.
- Dropdown list auto-closes after 6s.
