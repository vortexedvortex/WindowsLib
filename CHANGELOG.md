# Changelog

## 1.0.0 — 2026-09-20

- From-scratch Windows-first lib: `CreateWindow` + chrome (min/close), sidebar tabs, content pages, notifications.
- Modular `src/`: `Theme`, `Util`, `ConfigManager`, `init`.
- 8 themes + `AddTheme` + live `SetTheme` + partial override.
- Elements: Label, Paragraph, Divider, Button, Toggle, Slider, Dropdown, Input, Keybind, ColorPicker (preset-cycle v1).
- Flags + JSON save/load (`writefile` or memory fallback).
- Single-file `dist/WindowsLib.lua` for `loadstring`.
- `example.lua`, `docs/API.md`, `docs/THEMES.md`.

### Roadmap

- Resizable window, HSV color editor, dependency boxes (`VisibleIf`), multi-select dropdown, config UI tab, acrylic/blur toggle, mobile toggle button.
