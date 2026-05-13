-- DUMB0 HUB MAIN LOADER
local user = "its-Dumb0"
local repo = "its-Dumb0"

local function githubGet(path)
    local url = "https://raw.githubusercontent.com/"..user.."/"..repo.."/main/"..path
    return game:HttpGet(url)
end

-- This runs the scanner module from your GitHub
local scannerCode = githubGet("Backdoor-Scanner/scanner.lua")
local Scanner = loadstring(scannerCode)()

print("Dumb0 Hub: Loaded Modules Successfully")
