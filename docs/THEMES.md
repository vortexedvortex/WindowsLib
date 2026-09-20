# WindowsLib Themes

8 built-ins: `Dark` (default), `Light`, `Midnight`, `Rose`, `Forest`, `Violet`, `Sky`, `Amber`.

## Keys

| Key | Affects |
|---|---|
| Background | Main window |
| Sidebar | Titlebar + tab list |
| Panel | Content area + notifications |
| Element | Buttons, rows, inputs |
| Hover / Active | Hover / pressed states |
| Accent / AccentText | Active tab, slider fill, toggle-on |
| Text / SubText | Primary / secondary text |
| Border | Strokes |
| Success / Warning / Error | Reserved for future badges |
| Corner | UICorner radius (number) |

## Use

```luau
WindowsLib.CreateWindow({ Theme = "Midnight" })
Window:SetTheme("Rose")
Window:SetTheme({ Accent = Color3.fromRGB(0, 200, 255) }) -- partial, live
```

## Custom

```luau
WindowsLib:AddTheme({
  Name = "MyBrand",
  Accent = Color3.fromRGB(0, 200, 255),
  -- any missing keys fall back to Dark
})
```

## Picker dropdown

```luau
Sec:Dropdown({
  Title = "Theme",
  Options = WindowsLib:GetThemes(),
  Default = "Dark",
  Callback = function(n) Window:SetTheme(n) end,
})
```

## Roadmap

Gradients (`UIGradient` stops), per-window acrylic transparency, theme editor tab (color pickers per key like KyriLib Settings).
