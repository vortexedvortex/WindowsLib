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
	return Util.Create("UICorner", {
		CornerRadius = UDim.new(0, radius or 8),
		Parent = parent,
	})
end

function Util.Stroke(parent, color, thickness, transparency)
	return Util.Create("UIStroke", {
		Color = color or Color3.fromRGB(60, 60, 60),
		Thickness = thickness or 1,
		Transparency = transparency or 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Parent = parent,
	})
end

function Util.Padding(parent, l, t, r, b)
	return Util.Create("UIPadding", {
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

return Util
