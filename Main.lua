-- [[ DUMB0 HUB - MAIN LOADER ]] --
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "Dumb0Hub"
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 250)
Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
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

-- Subtitle
local Sub = Instance.new("TextLabel", Frame)
Sub.Size = UDim2.new(1, 0, 0, 20)
Sub.Position = UDim2.new(0, 0, 0, 45)
Sub.BackgroundTransparency = 1
Sub.Text = "its-Dumb0xd Edition"
Sub.TextColor3 = Color3.fromRGB(180, 180, 180)
Sub.TextSize = 14
Sub.Font = Enum.Font.GothamMedium

-- Scanner Button
local ScannerBtn = Instance.new("TextButton", Frame)
ScannerBtn.Size = UDim2.new(0, 320, 0, 55)
ScannerBtn.Position = UDim2.new(0.5, -160, 0.45, 0)
ScannerBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ScannerBtn.Text = "Backdoor Scanner"
ScannerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ScannerBtn.Font = Enum.Font.GothamBold
ScannerBtn.TextSize = 18
Instance.new("UICorner", ScannerBtn)
Instance.new("UIStroke", ScannerBtn).Color = Color3.fromRGB(50, 50, 50)

-- Infecter Button (Placeholder)
local InfecterBtn = Instance.new("TextButton", Frame)
InfecterBtn.Size = UDim2.new(0, 320, 0, 55)
InfecterBtn.Position = UDim2.new(0.5, -160, 0.72, 0)
InfecterBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
InfecterBtn.Text = "Infecter [COMING SOON]"
InfecterBtn.TextColor3 = Color3.fromRGB(80, 80, 80)
InfecterBtn.Font = Enum.Font.GothamBold
InfecterBtn.TextSize = 18
Instance.new("UICorner", InfecterBtn)

-- Close Function
local Close = Instance.new("TextButton", Frame)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 5)
Close.BackgroundTransparency = 1
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 80, 80)
Close.TextSize = 22
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- BUTTON LOGIC
ScannerBtn.MouseButton1Click:Connect(function()
    ScannerBtn.Text = "Fetching Script..."
    -- This pulls from your specific Backdoor repo
    local url = "https://raw.githubusercontent.com/its-Dumb0xd/Backdoor/main/Backdoor-Scanner/script.lua"
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    
    if success then
        ScannerBtn.Text = "Loaded Successfully!"
        task.wait(1.5)
        ScannerBtn.Text = "Backdoor Scanner"
    else
        ScannerBtn.Text = "Error! Check Console (F9)"
        warn("Dumb0 Hub Error: " .. tostring(err))
        task.wait(3)
        ScannerBtn.Text = "Backdoor Scanner"
    end
end)

-- Queue On Teleport (Keeps Hub active between games)
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
if queueteleport then
    queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/its-Dumb0xd/Backdoor/main/Main.lua'))()")
end

print("Dumb0 Hub successfully initialized.")
