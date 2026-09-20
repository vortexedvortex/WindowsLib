-- WindowsLib example.lua
-- Load (executor, single-file):
--   local WindowsLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOU/WindowsLib/main/dist/WindowsLib.lua"))()
-- Load (Studio, modular):
--   local WindowsLib = require(game.ReplicatedStorage.WindowsLib.src.init)

local WindowsLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOU/WindowsLib/main/dist/WindowsLib.lua"))()

-- Optional: register your own theme before creating the window.
WindowsLib:AddTheme({
	Name = "MyBrand",
	Accent = Color3.fromRGB(0, 200, 255),
	Background = Color3.fromRGB(22, 24, 30),
})

local Window = WindowsLib.CreateWindow({
	Title = "My Hub",
	Subtitle = "v1.0",
	Theme = "Dark", -- or "Light","Midnight","Rose","Forest","Violet","Sky","Amber","MyBrand"
	ToggleKey = Enum.KeyCode.RightShift,
	ConfigFolder = "MyHub",
	Size = UDim2.fromOffset(560, 400),
})

local Main = Window:Tab({ Title = "Main" })
local Settings = Window:Tab({ Title = "Settings" })

local sec = Main:Section({ Title = "Controls" })

sec:Button({
	Title = "Say hello",
	Callback = function()
		Window:Notify({ Title = "Hello", Content = "WindowsLib works!", Duration = 3 })
	end,
})

local fly = sec:Toggle({
	Title = "Enable fly",
	Default = false,
	Flag = "fly_enabled",
	Callback = function(v)
		print("fly:", v)
	end,
})

sec:Slider({
	Title = "WalkSpeed",
	Min = 16,
	Max = 200,
	Default = 16,
	Step = 1,
	Flag = "walkspeed",
	Callback = function(v)
		local ch = game.Players.LocalPlayer.Character
		if ch then
			local h = ch:FindFirstChildOfClass("Humanoid")
			if h then
				h.WalkSpeed = v
			end
		end
	end,
})

sec:Dropdown({
	Title = "Theme",
	Options = WindowsLib:GetThemes(),
	Default = "Dark",
	Callback = function(name)
		Window:SetTheme(name)
	end,
})

local cfg = Settings:Section({ Title = "Config" })
cfg:Button({
	Title = "Save config",
	Callback = function()
		Window:SaveConfig("default")
		Window:Notify({ Title = "Config", Content = "Saved." })
	end,
})
cfg:Button({
	Title = "Load config",
	Callback = function()
		Window:LoadConfig("default")
		Window:Notify({ Title = "Config", Content = "Loaded." })
	end,
})
cfg:Input({
	Title = "Player name",
	Placeholder = "Type a name...",
	Callback = function(text, enter)
		print("input:", text, enter)
	end,
})
cfg:Keybind({
	Title = "Toggle UI",
	Default = Enum.KeyCode.RightShift,
	OnPress = function()
		Window:Toggle()
	end,
})
cfg:ColorPicker({
	Title = "Accent preview",
	Default = Color3.fromRGB(0, 120, 215),
	Flag = "accent_color",
	Callback = function(c)
		Window:SetTheme({ Accent = c })
	end,
})

Window:Notify({ Title = "WindowsLib", Content = "Press RightShift to toggle.", Duration = 4 })
