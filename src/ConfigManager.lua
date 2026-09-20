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

return ConfigManager
