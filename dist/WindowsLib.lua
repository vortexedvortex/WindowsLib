-- WindowsLib v1.0.0 dist single-file
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


-- WindowsLib/src/Util.lua
-- Shared helpers: instance creation, tweens, dragging, safe parenting.
-- No dependencies.

local Util = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function Util.Create(className, props, children)
	local obj = Instance.new(className)
	if props then
		for k, v in pairs(props) do
			if k ~= "Parent" then
				local ok = pcall(function()
					obj[k] = v
				end)
				if not ok then
					-- Allow special keys like UICorner via children instead.
				end
			end
		end
	end
	if children then
		for _, child in ipairs(children) do
			child.Parent = obj
		end
	end
	if props and props.Parent then
		obj.Parent = props.Parent
	end
	return obj
end

function Util.Corner(parent, radius)
		CornerRadius = UDim.new(0, radius or 8),
		Parent = parent,
	})
end

function Util.Stroke(parent, color, thickness, transparency)
		Color = color or Color3.fromRGB(60, 60, 60),
		Thickness = thickness or 1,
		Transparency = transparency or 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = parent,
	})
end

function Util.Padding(parent, l, t, r, b)
		PaddingLeft = UDim.new(0, l or 8),
		PaddingTop = UDim.new(0, t or 8),
		PaddingRight = UDim.new(0, r or 8),
		PaddingBottom = UDim.new(0, b or 8),
		Parent = parent,
	})
end

function Util.Tween(obj, info, props, callback)
	local tw
	local ok = pcall(function()
		tw = TweenService:Create(obj, info or TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
		tw:Play()
	end)
	if not ok then
		for k, v in pairs(props) do
			pcall(function()
				obj[k] = v
			end)
		end
		if callback then
			task.spawn(callback)
		end
		return nil
	end
	if callback then
		tw.Completed:Once(callback)
	end
	return tw
end

function Util.Hover(button, theme, getColors)
	-- getColors: optional fn(theme) -> {Default, Hover}
	button.MouseEnter:Connect(function()
		local c = getColors and getColors(theme).Hover or theme.Hover
		Util.Tween(button, TweenInfo.new(0.15), { BackgroundColor3 = c })
	end)
	button.MouseLeave:Connect(function()
		local c = getColors and getColors(theme).Default or theme.Element
		Util.Tween(button, TweenInfo.new(0.15), { BackgroundColor3 = c })
	end)
end

function Util.Drag(frame, handle)
	handle = handle or frame
	local dragging = false
	local startPos, startInput
	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			startPos = frame.Position
			startInput = input.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - startInput
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

function Util.SafeParent(gui)
	local hui
	pcall(function()
		if typeof(gethui) == "function" then
			hui = gethui()
		end
	end)
	if hui then
		gui.Parent = hui
		pcall(function()
			if typeof(protect_gui) == "function" then
				protect_gui(gui)
			elseif syn and syn.protect_gui then
				syn.protect_gui(gui)
			end
		end)
		return true
	end
	local ok = pcall(function()
		gui.Parent = game:GetService("CoreGui")
	end)
	if not ok then
		gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	end
	return false
end

function Util.Truncate(s, n)
	s = tostring(s)
	if #s > (n or 32) then
		return string.sub(s, 1, (n or 32) - 3) .. "..."
	end
	return s
end


-- WindowsLib/src/ConfigManager.lua
-- Flag registry + JSON save/load. Executor file fns are optional (pcall).
-- No dependencies.

local HttpService = game:GetService("HttpService")

local ConfigManager = {}
ConfigManager.__index = ConfigManager

function ConfigManager.new(folder)
	local self = setmetatable({}, ConfigManager)
	self.Folder = folder or "WindowsLib"
	self.Flags = {} -- flag -> {Get=fn, Set=fn}
	return self
end

function ConfigManager:Register(flag, getFn, setFn)
	if type(flag) == "string" and type(getFn) == "function" then
		self.Flags[flag] = { Get = getFn, Set = setFn }
	end
end

function ConfigManager:Snapshot()
	local out = {}
	for flag, io in pairs(self.Flags) do
		local ok, val = pcall(io.Get)
		if ok then
			-- Color3 needs encoding for JSON.
			if typeof(val) == "Color3" then
				out[flag] = { __type = "Color3", r = val.R, g = val.G, b = val.B }
			elseif typeof(val) == "EnumItem" then
				out[flag] = { __type = "EnumItem", name = tostring(val) }
			else
				out[flag] = val
			end
		end
	end
	return out
end

function ConfigManager:Apply(data)
	if type(data) ~= "table" then
		return 0
	end
	local n = 0
	for flag, val in pairs(data) do
		local io = self.Flags[flag]
		if io and type(io.Set) == "function" then
			if type(val) == "table" and val.__type == "Color3" then
				val = Color3.new(val.r or 0, val.g or 0, val.b or 0)
			end
			local ok = pcall(io.Set, val)
			if ok then
				n += 1
			end
		end
	end
	return n
end

function ConfigManager:_path(name)
	return self.Folder .. "/" .. tostring(name or "default") .. ".json"
end

function ConfigManager:Save(name)
	local data = self:Snapshot()
	local json
	local ok = pcall(function()
		json = HttpService:JSONEncode(data)
	end)
	if not ok then
		return false, "encode failed"
	end
	local wrote = false
	pcall(function()
		if typeof(makefolder) == "function" and typeof(isfolder) == "function" then
			if not isfolder(self.Folder) then
				makefolder(self.Folder)
			end
		end
	end)
	pcall(function()
		if typeof(writefile) == "function" then
			writefile(self:_path(name), json)
			wrote = true
		end
	end)
	if wrote then
		return true, name
	end
	-- In-memory fallback (Studio / no file fns).
	self._mem = self._mem or {}
	self._mem[tostring(name or "default")] = json
	return true, "memory"
end

function ConfigManager:Load(name)
	local json
	pcall(function()
		if typeof(readfile) == "function" and typeof(isfile) == "function" then
			if isfile(self:_path(name)) then
				json = readfile(self:_path(name))
			end
		end
	end)
	if not json and self._mem then
		json = self._mem[tostring(name or "default")]
	end
	if not json then
		return false, "not found"
	end
	local data
	local ok = pcall(function()
		data = HttpService:JSONDecode(json)
	end)
	if not ok or type(data) ~= "table" then
		return false, "decode failed"
	end
	local n = self:Apply(data)
	return true, n
end

function ConfigManager:List()
	local out = {}
	pcall(function()
		if typeof(listfiles) == "function" and typeof(isfolder) == "function" then
			if isfolder(self.Folder) then
				for _, f in ipairs(listfiles(self.Folder)) do
					table.insert(out, tostring(f))
				end
			end
		end
	end)
	if self._mem then
		for k in pairs(self._mem) do
			table.insert(out, "(mem) " .. k)
		end
	end
	return out
end


-- WindowsLib/src/init.lua
-- Main module (Studio / multi-file usage):


local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local WindowsLib = {}
WindowsLib.Version = "1.0.0"
WindowsLib._themeName = "Dark"
WindowsLib._theme = Theme.Get("Dark")
WindowsLib._themeChanged = Instance.new("BindableEvent")

function WindowsLib:AddTheme(tbl)
	return Theme.Add(tbl)
end

function WindowsLib:GetThemes()
	return Theme.Names()
end

function WindowsLib:GetTheme()
	return WindowsLib._theme, WindowsLib._themeName
end

function WindowsLib:OnThemeChange(cb)
	return WindowsLib._themeChanged.Event:Connect(cb)
end

function WindowsLib:SetTheme(name)
	local t = Theme.Get(name)
	if not t then
		return nil
	end
	WindowsLib._themeName = name
	WindowsLib._theme = t
	WindowsLib._themeChanged:Fire(name, t)
	return t
end

-- Internal: apply theme key to instance property and track for live updates.
local function trackTheme(window, obj, prop, key)
	window._themed = window._themed or {}
	table.insert(window._themed, { Obj = obj, Prop = prop, Key = key })
	pcall(function()
		obj[prop] = window.Theme[key]
	end)
end

local function refreshTheme(window)
	if not window._themed then
		return
	end
	for _, rec in ipairs(window._themed) do
		pcall(function()
			if rec.Obj and rec.Obj.Parent ~= nil then
				rec.Obj[rec.Prop] = window.Theme[rec.Key]
			end
		end)
	end
end

local function makeRow(parent, theme, height)
	local row = Util.Create("Frame", {
		BackgroundColor3 = theme.Panel,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, height or 44),
		Parent = parent,
	})
	Util.Corner(row, 6)
	Util.Stroke(row, theme.Border, 1)
	Util.Padding(row, 10, 6, 10, 6)
	return row
end

local function makeLabel(parent, text, size, color, font)
	return Util.Create("TextLabel", {
		BackgroundTransparency = 1,
		Text = text,
		Font = font or Enum.Font.GothamMedium,
		TextSize = size or 13,
		TextColor3 = color,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Size = UDim2.new(1, -90, 1, 0),
		Parent = parent,
	})
end

function WindowsLib.CreateWindow(cfg)
	cfg = cfg or {}
	local themeBase = cfg.Theme
	local theme
	if type(themeBase) == "table" then
		theme = Theme.WithOverride(themeBase.Base or "Dark", themeBase)
		theme.Name = themeBase.Name or "Custom"
	elseif type(themeBase) == "string" then
		theme = Theme.Get(themeBase) or Theme.Get("Dark")
	else
		theme = WindowsLib._theme or Theme.Get("Dark")
	end

	local window = {
		Title = cfg.Title or "WindowsLib",
		Subtitle = cfg.Subtitle or "",
		Theme = theme,
		ThemeName = theme.Name or "Dark",
		Tabs = {},
		_themed = {},
		Config = ConfigManager.new(cfg.ConfigFolder or "WindowsLib"),
		_visible = true,
		_minimized = false,
	}

	local gui = Util.Create("ScreenGui", {
		Name = "WindowsLib_" .. string.gsub(window.Title, "%W", ""),
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 999,
	})
	Util.SafeParent(gui)
	window.Gui = gui

	local main = Util.Create("Frame", {
		Name = "Main",
		Size = cfg.Size or UDim2.fromOffset(560, 400),
		Position = cfg.Position or UDim2.new(0.5, -280, 0.5, -200),
		BackgroundColor3 = theme.Background,
		BorderSizePixel = 0,
		Parent = gui,
	})
	window.Frame = main
	table.insert(window._themed, { Obj = main, Prop = "BackgroundColor3", Key = "Background" })
	Util.Corner(main, theme.Corner or 8)
	Util.Stroke(main, theme.Border, 1)
	Util.Drag(main)

	-- TitleBar (Windows chrome)
	local bar = Util.Create("Frame", {
		Name = "TitleBar",
		Size = UDim2.new(1, 0, 0, 38),
		BackgroundColor3 = theme.Sidebar,
		BorderSizePixel = 0,
		Parent = main,
	})
	table.insert(window._themed, { Obj = bar, Prop = "BackgroundColor3", Key = "Sidebar" })
	Util.Corner(bar, theme.Corner or 8)
	-- Square off bottom of titlebar so it merges with body.
	local barFix = Util.Create("Frame", {
		Size = UDim2.new(1, 0, 0, 10),
		Position = UDim2.new(0, 0, 1, -10),
		BackgroundColor3 = theme.Sidebar,
		BorderSizePixel = 0,
		Parent = bar,
	})
	table.insert(window._themed, { Obj = barFix, Prop = "BackgroundColor3", Key = "Sidebar" })
	Util.Drag(main, bar)

	local title = Util.Create("TextLabel", {
		BackgroundTransparency = 1,
		Text = window.Title .. (window.Subtitle ~= "" and "  •  " .. window.Subtitle or ""),
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = theme.Text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -90, 1, 0),
		Position = UDim2.new(0, 12, 0, 0),
		Parent = bar,
	})
	table.insert(window._themed, { Obj = title, Prop = "TextColor3", Key = "Text" })

	local btnRow = Util.Create("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 72, 1, 0),
		Position = UDim2.new(1, -78, 0, 0),
		Parent = bar,
	})
	local function chromeButton(text, order)
		local b = Util.Create("TextButton", {
			Text = text,
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			TextColor3 = theme.SubText,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 32, 0, 28),
			Position = UDim2.new(0, order * 34, 0.5, -14),
			Parent = btnRow,
		})
		table.insert(window._themed, { Obj = b, Prop = "TextColor3", Key = "SubText" })
		return b
	end
	local minBtn = chromeButton("–", 0)
	local closeBtn = chromeButton("✕", 1)

	local body = Util.Create("Frame", {
		Name = "Body",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, -38),
		Position = UDim2.new(0, 0, 0, 38),
		Parent = main,
	})

	local sidebar = Util.Create("Frame", {
		Name = "Sidebar",
		Size = UDim2.new(0, 150, 1, -12),
		Position = UDim2.new(0, 6, 0, 6),
		BackgroundColor3 = theme.Sidebar,
		BorderSizePixel = 0,
		Parent = body,
	})
	table.insert(window._themed, { Obj = sidebar, Prop = "BackgroundColor3", Key = "Sidebar" })
	Util.Corner(sidebar, 6)
	Util.Padding(sidebar, 6, 6, 6, 6)
	local sideList = Util.Create("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 6),
		Parent = sidebar,
	})

	local content = Util.Create("Frame", {
		Name = "Content",
		Size = UDim2.new(1, -168, 1, -12),
		Position = UDim2.new(0, 162, 0, 6),
		BackgroundColor3 = theme.Panel,
		BorderSizePixel = 0,
		Parent = body,
	})
	table.insert(window._themed, { Obj = content, Prop = "BackgroundColor3", Key = "Panel" })
	Util.Corner(content, 6)
	Util.Padding(content, 8, 8, 8, 8)

	local notifRoot = Util.Create("Frame", {
		Name = "Notifications",
		AnchorPoint = Vector2.new(1, 1),
		Size = UDim2.new(0, 280, 1, -20),
		Position = UDim2.new(1, -10, 1, -10),
		BackgroundTransparency = 1,
		Parent = gui,
	})
	local notifList = Util.Create("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		Padding = UDim.new(0, 8),
		Parent = notifRoot,
	})

	function window:Notify(ncfg)
		ncfg = ncfg or {}
		local box = Util.Create("Frame", {
			Size = UDim2.new(1, 0, 0, 64),
			BackgroundColor3 = window.Theme.Panel,
			BorderSizePixel = 0,
			Parent = notifRoot,
		})
		Util.Corner(box, 8)
		Util.Stroke(box, window.Theme.Border, 1)
		Util.Padding(box, 10, 8, 10, 8)
		Util.Create("TextLabel", {
			BackgroundTransparency = 1,
			Text = ncfg.Title or "Notice",
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			TextColor3 = window.Theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 18),
			Parent = box,
		})
		Util.Create("TextLabel", {
			BackgroundTransparency = 1,
			Text = Util.Truncate(ncfg.Content or ncfg.Text or "", 90),
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextColor3 = window.Theme.SubText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextWrapped = true,
			Size = UDim2.new(1, 0, 1, -20),
			Position = UDim2.new(0, 0, 0, 20),
			Parent = box,
		})
		box.BackgroundTransparency = 1
		Util.Tween(box, TweenInfo.new(0.2), { BackgroundTransparency = 0 })
		task.delay(ncfg.Duration or 3, function()
			if box.Parent then
				Util.Tween(box, TweenInfo.new(0.25), { BackgroundTransparency = 1 }, function()
					if box.Parent then
						box:Destroy()
					end
				end)
			end
		end)
	end

	function window:SetTheme(nameOrTable)
		if type(nameOrTable) == "string" then
			local t = Theme.Get(nameOrTable)
			if t then
				window.Theme = t
				window.ThemeName = nameOrTable
			end
		elseif type(nameOrTable) == "table" then
			window.Theme = Theme.WithOverride(window.ThemeName, nameOrTable)
		end
		refreshTheme(window)
		-- Update pages that cache colors directly (rows created before).
		for _, tab in ipairs(window.Tabs) do
			if tab.Page then
				for _, d in ipairs(tab.Page:GetDescendants()) do
					if d:IsA("GuiObject") and d:GetAttribute("ThemeKey") then
						pcall(function()
							local prop = d:GetAttribute("ThemeProp") or "BackgroundColor3"
							d[prop] = window.Theme[d:GetAttribute("ThemeKey")]
						end)
					end
				end
			end
		end
	end

	function window:Toggle(force)
		window._visible = if force ~= nil then force else not window._visible
		main.Visible = window._visible
	end
	function window:Show()
		window:Toggle(true)
	end
	function window:Hide()
		window:Toggle(false)
	end
	function window:Destroy()
		if gui.Parent then
			gui:Destroy()
		end
	end
	function window:SaveConfig(name)
		return window.Config:Save(name or "default")
	end
	function window:LoadConfig(name)
		return window.Config:Load(name or "default")
	end

	minBtn.MouseButton1Click:Connect(function()
		window._minimized = not window._minimized
		body.Visible = not window._minimized
		main.Size = if window._minimized then UDim2.fromOffset(main.Size.X.Offset, 38) else (cfg.Size or UDim2.fromOffset(560, 400))
	end)
	closeBtn.MouseButton1Click:Connect(function()
		window:Hide()
	end)

	if cfg.ToggleKey then
		UserInputService.InputBegan:Connect(function(input, gpe)
			if gpe then
				return
			end
			local ok = pcall(function()
				if input.KeyCode == cfg.ToggleKey then
					window:Toggle()
				end
			end)
			if not ok and type(cfg.ToggleKey) == "string" then
				if input.KeyCode == Enum.KeyCode[cfg.ToggleKey] then
					window:Toggle()
				end
			end
		end)
	end

	-- Global theme sync (so WindowsLib:SetTheme updates all windows made with default theme).
	WindowsLib._themeChanged.Event:Connect(function(name)
		if cfg.Theme == nil then
			window:SetTheme(name)
		end
	end)

	function window:Tab(tcfg)
		tcfg = tcfg or {}
		local tab = { Title = tcfg.Title or ("Tab" .. (#window.Tabs + 1)) }

		local btn = Util.Create("TextButton", {
			Text = "  " .. tab.Title,
			Font = Enum.Font.GothamMedium,
			TextSize = 13,
			TextColor3 = window.Theme.SubText,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = window.Theme.Element,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 34),
			LayoutOrder = #window.Tabs,
			Parent = sidebar,
		})
		Util.Corner(btn, 6)

		local page = Util.Create("ScrollingFrame", {
			Visible = #window.Tabs == 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 4,
			ScrollBarImageColor3 = window.Theme.Border,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			Parent = content,
		})
		local list = Util.Create("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
			Parent = page,
		})
		tab.Page = page
		tab.Button = btn

		local function select()
			for _, t in ipairs(window.Tabs) do
				t.Page.Visible = (t == tab)
				t.Button.BackgroundColor3 = if t == tab then window.Theme.Accent else window.Theme.Element
				t.Button.TextColor3 = if t == tab then window.Theme.AccentText else window.Theme.SubText
			end
		end
		btn.MouseButton1Click:Connect(select)
		if #window.Tabs == 0 then
			select()
		end
		-- Keep selection colors live on theme change.
		WindowsLib._themeChanged.Event:Connect(function()
			-- Re-run select to refresh active/inactive colors.
			pcall(select)
		end)

		function tab:Section(scfg)
			scfg = scfg or {}
			local sec = {}
			local holder = Util.Create("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 28),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = page,
			})
			local head = Util.Create("TextLabel", {
				BackgroundTransparency = 1,
				Text = string.upper(scfg.Title or "SECTION"),
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				TextColor3 = window.Theme.SubText,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, 20),
				Parent = holder,
			})
			local list2 = Util.Create("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 6),
				Parent = holder,
			})
			-- Push header down: set layout order trick by padding.
			head.LayoutOrder = -1

			local function registerFlag(flag, get, set)
				if flag then
					window.Config:Register(flag, get, set)
				end
			end

			function sec:Label(text)
				local r = makeRow(holder, window.Theme, 30)
				makeLabel(r, text, 12, window.Theme.Text, Enum.Font.Gotham)
				return r
			end

			function sec:Paragraph(pcfg)
				pcfg = pcfg or {}
				local r = makeRow(holder, window.Theme, 54)
				Util.Create("TextLabel", {
					BackgroundTransparency = 1,
					Text = pcfg.Text or "",
					Font = Enum.Font.Gotham,
					TextSize = 12,
					TextColor3 = window.Theme.SubText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 1, 0),
					Parent = r,
				})
				return r
			end

			function sec:Divider()
				return Util.Create("Frame", {
					BackgroundColor3 = window.Theme.Border,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					Parent = holder,
				})
			end

			function sec:Button(bcfg)
				bcfg = bcfg or {}
				local b = Util.Create("TextButton", {
					Text = bcfg.Title or bcfg.Text or "Button",
					Font = Enum.Font.GothamMedium,
					TextSize = 13,
					TextColor3 = window.Theme.Text,
					BackgroundColor3 = window.Theme.Element,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 36),
					AutoButtonColor = false,
					Parent = holder,
				})
				Util.Corner(b, 6)
				Util.Hover(b, window.Theme)
				b.MouseButton1Click:Connect(function()
					Util.Tween(b, TweenInfo.new(0.08), { BackgroundColor3 = window.Theme.Accent })
					task.delay(0.1, function()
						if b.Parent then
							Util.Tween(b, TweenInfo.new(0.15), { BackgroundColor3 = window.Theme.Element })
						end
					end)
					if type(bcfg.Callback) == "function" then
						task.spawn(bcfg.Callback)
					end
				end)
				return b
			end

			function sec:Toggle(tcfg2)
				tcfg2 = tcfg2 or {}
				local state = tcfg2.Default or tcfg2.Value or false
				local row = makeRow(holder, window.Theme, 44)
				makeLabel(row, tcfg2.Title or "Toggle", 13, window.Theme.Text)
				local pill = Util.Create("TextButton", {
					Text = "",
					AnchorPoint = Vector2.new(1, 0.5),
					Size = UDim2.new(0, 44, 0, 24),
					Position = UDim2.new(1, 0, 0.5, 0),
					BackgroundColor3 = if state then window.Theme.Accent else window.Theme.Hover,
					BorderSizePixel = 0,
					AutoButtonColor = false,
					Parent = row,
				})
				Util.Corner(pill, 12)
				local knob = Util.Create("Frame", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = if state then UDim2.new(1, -21, 0.5, -9) else UDim2.new(0, 3, 0.5, -9),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BorderSizePixel = 0,
					Parent = pill,
				})
				Util.Corner(knob, 9)
				local handle = {}
				function handle:Set(v)
					state = not not v
					Util.Tween(pill, TweenInfo.new(0.18), { BackgroundColor3 = if state then window.Theme.Accent else window.Theme.Hover })
					Util.Tween(knob, TweenInfo.new(0.18), { Position = if state then UDim2.new(1, -21, 0.5, -9) else UDim2.new(0, 3, 0.5, -9) })
					if type(tcfg2.Callback) == "function" then
						task.spawn(tcfg2.Callback, state)
					end
				end
				function handle:Get()
					return state
				end
				function handle:SetCallback(fn)
					tcfg2.Callback = fn
				end
				pill.MouseButton1Click:Connect(function()
					handle:Set(not state)
				end)
				registerFlag(tcfg2.Flag, handle.Get, handle.Set)
				if tcfg2.Flag and tcfg2.Value ~= nil then
					-- Initial callback sync (no save yet).
				end
				return handle
			end

			function sec:Slider(scfg2)
				scfg2 = scfg2 or {}
				local min = scfg2.Min or 0
				local max = scfg2.Max or 100
				local step = scfg2.Step or 1
				local val = scfg2.Default or scfg2.Value or min
				local row = makeRow(holder, window.Theme, 56)
				local top = Util.Create("TextLabel", {
					BackgroundTransparency = 1,
					Text = (scfg2.Title or "Slider"),
					Font = Enum.Font.GothamMedium,
					TextSize = 13,
					TextColor3 = window.Theme.Text,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, -60, 0, 20),
					Parent = row,
				})
				local valBox = Util.Create("TextBox", {
					Text = tostring(val),
					Font = Enum.Font.Gotham,
					TextSize = 12,
					TextColor3 = window.Theme.Text,
					BackgroundColor3 = window.Theme.Element,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 52, 0, 20),
					Position = UDim2.new(1, -52, 0, 0),
					ClearTextOnFocus = false,
					Parent = row,
				})
				Util.Corner(valBox, 4)
				local track = Util.Create("TextButton", {
					Text = "",
					Size = UDim2.new(1, 0, 0, 6),
					Position = UDim2.new(0, 0, 0, 32),
					BackgroundColor3 = window.Theme.Hover,
					BorderSizePixel = 0,
					AutoButtonColor = false,
					Parent = row,
				})
				Util.Corner(track, 3)
				local fill = Util.Create("Frame", {
					Size = UDim2.new(0, 0, 1, 0),
					BackgroundColor3 = window.Theme.Accent,
					BorderSizePixel = 0,
					Parent = track,
				})
				Util.Corner(fill, 3)
				local handle = {}
				local function quantize(v)
					if step and step ~= 0 then
						v = math.round(v / step) * step
					end
					return math.clamp(v, min, max)
				end
				function handle:Set(v, silent)
					val = quantize(tonumber(v) or min)
					local pct = if max == min then 0 else (val - min) / (max - min)
					fill.Size = UDim2.new(pct, 0, 1, 0)
					valBox.Text = tostring(val)
					if not silent and type(scfg2.Callback) == "function" then
						task.spawn(scfg2.Callback, val)
					end
				end
				function handle:Get()
					return val
				end
				function handle:SetCallback(fn)
					scfg2.Callback = fn
				end
				local sliding = false
				local function applyInput(x)
					local absPos = track.AbsolutePosition.X
					local absSize = math.max(1, track.AbsoluteSize.X)
					local pct = math.clamp((x - absPos) / absSize, 0, 1)
					handle:Set(min + (max - min) * pct)
				end
				track.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						sliding = true
						applyInput(input.Position.X)
					end
				end)
				UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						sliding = false
					end
				end)
				UserInputService.InputChanged:Connect(function(input)
					if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
						applyInput(input.Position.X)
					end
				end)
				valBox.FocusLost:Connect(function(enter)
					if enter then
						handle:Set(tonumber(valBox.Text) or val)
					else
						valBox.Text = tostring(val)
					end
				end)
				handle:Set(val, true)
				registerFlag(scfg2.Flag, handle.Get, function(v)
					handle:Set(v, false)
				end)
				return handle
			end

			function sec:Dropdown(dcfg)
				dcfg = dcfg or {}
				local options = dcfg.Options or dcfg.Values or {}
				local selected = dcfg.Default or dcfg.Value or options[1]
				local row = makeRow(holder, window.Theme, 44)
				makeLabel(row, dcfg.Title or "Dropdown", 13, window.Theme.Text)
				local btn = Util.Create("TextButton", {
					Text = Util.Truncate(selected or "Select", 18) .. "  ▾",
					Font = Enum.Font.Gotham,
					TextSize = 12,
					TextColor3 = window.Theme.Text,
					BackgroundColor3 = window.Theme.Element,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(1, 0.5),
					Size = UDim2.new(0, 150, 0, 28),
					Position = UDim2.new(1, 0, 0.5, 0),
					AutoButtonColor = false,
					Parent = row,
				})
				Util.Corner(btn, 6)
				local open = false
				local listFrame
				local handle = {}
				function handle:Set(v, silent)
					selected = v
					btn.Text = Util.Truncate(selected or "Select", 18) .. "  ▾"
					if not silent and type(dcfg.Callback) == "function" then
						task.spawn(dcfg.Callback, selected)
					end
				end
				function handle:Get()
					return selected
				end
				function handle:SetOptions(opts)
					options = opts or {}
				end
				btn.MouseButton1Click:Connect(function()
					if open and listFrame then
						listFrame:Destroy()
						open = false
						return
					end
					open = true
					listFrame = Util.Create("Frame", {
						Size = UDim2.new(0, 150, 0, math.min(28 * #options, 140)),
						BackgroundColor3 = window.Theme.Element,
						BorderSizePixel = 0,
						Parent = gui,
					})
					Util.Corner(listFrame, 6)
					Util.Stroke(listFrame, window.Theme.Border, 1)
					local abs = btn.AbsolutePosition
					listFrame.Position = UDim2.fromOffset(abs.X + (btn.AbsoluteSize.X - 150), abs.Y + 30)
					local l = Util.Create("UIListLayout", { Padding = UDim.new(0, 2), Parent = listFrame })
					Util.Padding(listFrame, 4, 4, 4, 4)
					for _, opt in ipairs(options) do
						local ob = Util.Create("TextButton", {
							Text = tostring(opt),
							Font = Enum.Font.Gotham,
							TextSize = 12,
							TextColor3 = window.Theme.Text,
							BackgroundColor3 = window.Theme.Element,
							Size = UDim2.new(1, 0, 0, 26),
							AutoButtonColor = false,
							Parent = listFrame,
						})
						Util.Corner(ob, 4)
						ob.MouseButton1Click:Connect(function()
							handle:Set(opt)
							if listFrame then
								listFrame:Destroy()
							end
							open = false
						end)
					end
					task.delay(6, function()
						if open and listFrame and listFrame.Parent then
							listFrame:Destroy()
							open = false
						end
					end)
				end)
				registerFlag(dcfg.Flag, handle.Get, function(v)
					handle:Set(v, false)
				end)
				return handle
			end

			function sec:Input(icfg)
				icfg = icfg or {}
				local row = makeRow(holder, window.Theme, 44)
				makeLabel(row, icfg.Title or "Input", 13, window.Theme.Text)
				local box = Util.Create("TextBox", {
					Text = icfg.Default or icfg.Value or "",
					PlaceholderText = icfg.Placeholder or "Type here...",
					PlaceholderColor3 = window.Theme.SubText,
					Font = Enum.Font.Gotham,
					TextSize = 12,
					TextColor3 = window.Theme.Text,
					BackgroundColor3 = window.Theme.Element,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(1, 0.5),
					Size = UDim2.new(0, 150, 0, 28),
					Position = UDim2.new(1, 0, 0.5, 0),
					ClearTextOnFocus = false,
					Parent = row,
				})
				Util.Corner(box, 6)
				local handle = {}
				function handle:Set(v)
					box.Text = tostring(v or "")
				end
				function handle:Get()
					return box.Text
				end
				box.FocusLost:Connect(function(enter)
					if type(icfg.Callback) == "function" then
						task.spawn(icfg.Callback, box.Text, enter)
					end
				end)
				registerFlag(icfg.Flag, handle.Get, handle.Set)
				return handle
			end

			function sec:Keybind(kcfg)
				kcfg = kcfg or {}
				local bound = kcfg.Default or Enum.KeyCode.F
				if type(bound) == "string" and Enum.KeyCode[bound] then
					bound = Enum.KeyCode[bound]
				end
				local row = makeRow(holder, window.Theme, 44)
				makeLabel(row, kcfg.Title or "Keybind", 13, window.Theme.Text)
				local btn = Util.Create("TextButton", {
					Text = if typeof(bound) == "EnumItem" then bound.Name else tostring(bound),
					Font = Enum.Font.Gotham,
					TextSize = 12,
					TextColor3 = window.Theme.Text,
					BackgroundColor3 = window.Theme.Element,
					Size = UDim2.new(0, 110, 0, 28),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, 0, 0.5, 0),
					AutoButtonColor = false,
					Parent = row,
				})
				Util.Corner(btn, 6)
				local capturing = false
				btn.MouseButton1Click:Connect(function()
					capturing = true
					btn.Text = "..."
				end)
				UserInputService.InputBegan:Connect(function(input, gpe)
					if capturing and input.UserInputType == Enum.UserInputType.Keyboard then
						capturing = false
						bound = input.KeyCode
						btn.Text = bound.Name
						if type(kcfg.Callback) == "function" then
							task.spawn(kcfg.Callback, bound)
						end
					elseif not capturing and not gpe and input.KeyCode == bound then
						if type(kcfg.OnPress) == "function" then
							task.spawn(kcfg.OnPress)
						end
						if type(kcfg.Callback) == "function" and kcfg.FireOnPress then
							task.spawn(kcfg.Callback, bound)
						end
					end
				end)
				local handle = {}
				function handle:Get()
					return bound
				end
				function handle:Set(v)
					if typeof(v) == "EnumItem" then
						bound = v
						btn.Text = bound.Name
					elseif type(v) == "string" and Enum.KeyCode[v] then
						bound = Enum.KeyCode[v]
						btn.Text = bound.Name
					end
				end
				return handle
			end

			function sec:ColorPicker(ccfg)
				ccfg = ccfg or {}
				local color = ccfg.Default or ccfg.Value or Color3.fromRGB(0, 120, 215)
				local row = makeRow(holder, window.Theme, 44)
				makeLabel(row, ccfg.Title or "Color", 13, window.Theme.Text)
				local swatch = Util.Create("TextButton", {
					Text = "",
					Size = UDim2.new(0, 60, 0, 28),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, 0, 0.5, 0),
					BackgroundColor3 = color,
					BorderSizePixel = 0,
					AutoButtonColor = false,
					Parent = row,
				})
				Util.Corner(swatch, 6)
				Util.Stroke(swatch, window.Theme.Border, 1)
				local handle = {}
				function handle:Set(c, silent)
					if typeof(c) == "Color3" then
						color = c
						swatch.BackgroundColor3 = c
						if not silent and type(ccfg.Callback) == "function" then
							task.spawn(ccfg.Callback, c)
						end
					end
				end
				function handle:Get()
					return color
				end
				swatch.MouseButton1Click:Connect(function()
					-- Cycle a small preset palette on click (v1 simple picker).
					-- Full HSV picker is roadmap; presets keep v1 dependency-free.
					local presets = {
						Color3.fromRGB(0, 120, 215),
						Color3.fromRGB(80, 200, 120),
						Color3.fromRGB(255, 110, 150),
						Color3.fromRGB(150, 110, 255),
						Color3.fromRGB(80, 200, 255),
						Color3.fromRGB(255, 180, 60),
						Color3.fromRGB(255, 255, 255),
					}
					local idx = 1
					for i, p in ipairs(presets) do
						if math.abs(p.R - color.R) < 0.02 and math.abs(p.G - color.G) < 0.02 and math.abs(p.B - color.B) < 0.02 then
							idx = i % #presets + 1
							break
						end
					end
					handle:Set(presets[idx])
				end)
				registerFlag(ccfg.Flag, handle.Get, function(v)
					handle:Set(v, false)
				end)
				return handle
			end

			return sec
		end

		table.insert(window.Tabs, tab)
		return tab
	end

	return window
end

return WindowsLib

