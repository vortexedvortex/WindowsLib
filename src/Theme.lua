-- WindowsLib/src/Theme.lua
-- Modular theme registry. No dependencies.
-- Each theme is a flat table of Color3 + numbers.

local Theme = {}
Theme.__index = Theme

local function C(r, g, b)
	return Color3.fromRGB(r, g, b)
end

Theme.BuiltIn = {
	Dark = {
		Name = "Dark",
		Background = C(32, 32, 32),
		Sidebar = C(45, 45, 45),
		Panel = C(43, 43, 43),
		Element = C(55, 55, 55),
		Hover = C(65, 65, 65),
		Active = C(75, 75, 75),
		Accent = C(0, 120, 215),
		AccentText = C(255, 255, 255),
		Text = C(255, 255, 255),
		SubText = C(160, 160, 160),
		Border = C(60, 60, 60),
		Success = C(80, 200, 120),
		Warning = C(255, 200, 80),
		Error = C(255, 90, 90),
		Corner = 8,
	},
	Light = {
		Name = "Light",
		Background = C(243, 243, 243),
		Sidebar = C(236, 236, 236),
		Panel = C(255, 255, 255),
		Element = C(229, 229, 229),
		Hover = C(217, 217, 217),
		Active = C(205, 205, 205),
		Accent = C(0, 120, 215),
		AccentText = C(255, 255, 255),
		Text = C(20, 20, 20),
		SubText = C(100, 100, 100),
		Border = C(210, 210, 210),
		Success = C(40, 160, 80),
		Warning = C(200, 140, 20),
		Error = C(220, 60, 60),
		Corner = 8,
	},
	Midnight = {
		Name = "Midnight",
		Background = C(10, 14, 24),
		Sidebar = C(15, 20, 34),
		Panel = C(18, 24, 40),
		Element = C(28, 36, 56),
		Hover = C(36, 46, 70),
		Active = C(46, 58, 88),
		Accent = C(90, 140, 255),
		AccentText = C(255, 255, 255),
		Text = C(230, 238, 255),
		SubText = C(140, 155, 185),
		Border = C(40, 52, 78),
		Success = C(80, 200, 120),
		Warning = C(255, 200, 80),
		Error = C(255, 90, 90),
		Corner = 8,
	},
	Rose = {
		Name = "Rose",
		Background = C(32, 20, 26),
		Sidebar = C(44, 26, 34),
		Panel = C(46, 28, 36),
		Element = C(62, 38, 48),
		Hover = C(74, 46, 58),
		Active = C(88, 56, 70),
		Accent = C(255, 110, 150),
		AccentText = C(255, 255, 255),
		Text = C(255, 235, 240),
		SubText = C(200, 160, 175),
		Border = C(80, 50, 62),
		Success = C(80, 200, 120),
		Warning = C(255, 200, 80),
		Error = C(255, 90, 90),
		Corner = 8,
	},
	Forest = {
		Name = "Forest",
		Background = C(16, 28, 20),
		Sidebar = C(22, 38, 28),
		Panel = C(24, 40, 30),
		Element = C(34, 54, 40),
		Hover = C(42, 66, 50),
		Active = C(52, 80, 62),
		Accent = C(80, 220, 120),
		AccentText = C(10, 25, 15),
		Text = C(230, 245, 235),
		SubText = C(150, 180, 160),
		Border = C(45, 70, 55),
		Success = C(80, 220, 120),
		Warning = C(255, 200, 80),
		Error = C(255, 110, 110),
		Corner = 8,
	},
	Violet = {
		Name = "Violet",
		Background = C(24, 18, 34),
		Sidebar = C(32, 24, 46),
		Panel = C(34, 26, 48),
		Element = C(48, 38, 68),
		Hover = C(60, 48, 84),
		Active = C(74, 60, 102),
		Accent = C(150, 110, 255),
		AccentText = C(255, 255, 255),
		Text = C(240, 235, 255),
		SubText = C(175, 160, 205),
		Border = C(62, 50, 88),
		Success = C(80, 200, 120),
		Warning = C(255, 200, 80),
		Error = C(255, 90, 90),
		Corner = 8,
	},
	Sky = {
		Name = "Sky",
		Background = C(16, 28, 34),
		Sidebar = C(22, 38, 46),
		Panel = C(24, 40, 48),
		Element = C(34, 54, 66),
		Hover = C(42, 66, 80),
		Active = C(54, 82, 98),
		Accent = C(80, 200, 255),
		AccentText = C(10, 25, 35),
		Text = C(230, 245, 255),
		SubText = C(150, 180, 200),
		Border = C(45, 68, 82),
		Success = C(80, 200, 120),
		Warning = C(255, 200, 80),
		Error = C(255, 110, 110),
		Corner = 8,
	},
	Amber = {
		Name = "Amber",
		Background = C(30, 24, 16),
		Sidebar = C(40, 32, 22),
		Panel = C(42, 34, 24),
		Element = C(58, 46, 32),
		Hover = C(70, 56, 40),
		Active = C(84, 68, 50),
		Accent = C(255, 180, 60),
		AccentText = C(40, 25, 5),
		Text = C(255, 242, 225),
		SubText = C(200, 175, 140),
		Border = C(75, 60, 42),
		Success = C(100, 210, 130),
		Warning = C(255, 200, 80),
		Error = C(255, 100, 100),
		Corner = 8,
	},
}

Theme.Registry = {}
for name, tbl in pairs(Theme.BuiltIn) do
	Theme.Registry[name] = tbl
end

function Theme.Get(name)
	return Theme.Registry[name]
end

function Theme.Names()
	local out = {}
	for name in pairs(Theme.Registry) do
		table.insert(out, name)
	end
	table.sort(out)
	return out
end

function Theme.Add(tbl)
	assert(type(tbl) == "table" and type(tbl.Name) == "string", "Theme.Add needs {Name=...}")
	-- Fill missing keys from Dark so custom themes can't break rendering.
	local base = Theme.Registry.Dark
	local full = {}
	for k, v in pairs(base) do
		full[k] = v
	end
	for k, v in pairs(tbl) do
		full[k] = v
	end
	Theme.Registry[tbl.Name] = full
	return full
end

function Theme.WithOverride(baseName, override)
	local base = Theme.Registry[baseName or "Dark"] or Theme.Registry.Dark
	if type(override) ~= "table" then
		return base
	end
	local full = {}
	for k, v in pairs(base) do
		full[k] = v
	end
	for k, v in pairs(override) do
		full[k] = v
	end
	return full
end

return Theme
