-- [[ DUMB0 HUB: UNIVERSAL LOADER ]] --
local user = "its-Dumb0xd"
local repo = "Dumb0-Hub" 

local function GetFile(path)
    local url = "https://raw.githubusercontent.com/"..user.."/"..repo.."/main/"..path
    local success, content = pcall(function() return game:HttpGet(url) end)
    if success then return loadstring(content)() else warn("Dumb0 Error: "..path.." not found.") end
end

-- Load the Scanner logic
local Scanner = GetFile("Backdoor-Scanner/script.lua")

-- Run the Scan
if Scanner then
    Scanner.Scan()
else
    print("Dumb0 Hub: Failed to initialize.")
end
