-- [[ DUMB0 HUB - NEON SCANNER ]] --
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "Dumb0Scanner"

-- Main Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Size = UDim2.new(0, 480, 0, 270)
Frame.Position = UDim2.new(0.5, -240, 0.5, -135)
Frame.BorderSizePixel = 0

local Corner = Instance.new("UICorner", Frame)
local Stroke = Instance.new("UIStroke", Frame)
Stroke.Thickness = 3
Stroke.Color = Color3.fromRGB(255, 0, 100) -- Neon Pink/Red Border

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Text = "Dumb0 Hub Backdoor"
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 85, 255)
Title.TextSize = 40
Title.Font = Enum.Font.GothamBold

-- Status Button (The Animated Part)
local StatusBox = Instance.new("Frame", Frame)
StatusBox.Size = UDim2.new(0, 400, 0, 120)
StatusBox.Position = UDim2.new(0.5, -200, 0.5, -20)
StatusBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", StatusBox)
local StatusStroke = Instance.new("UIStroke", StatusBox)
StatusStroke.Color = Color3.fromRGB(255, 255, 0) -- Neon Yellow

local StatusText = Instance.new("TextLabel", StatusBox)
StatusText.Size = UDim2.new(1, 0, 1, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Click to Scan"
StatusText.TextColor3 = Color3.fromRGB(255, 255, 150)
StatusText.TextSize = 35
StatusText.Font = Enum.Font.GothamBold

local Button = Instance.new("TextButton", StatusBox)
Button.Size = UDim2.new(1, 0, 1, 0)
Button.BackgroundTransparency = 1
Button.Text = ""

-- Logic for the Animation
Button.MouseButton1Click:Connect(function()
    StatusText.Text = "Scanning..."
    StatusText.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    task.wait(2) -- Simulates the scan time in your video
    
    -- Real Scan Logic
    local found = false
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") and (v.Name:lower():find("backdoor") or v.Parent.Name == "JointsService") then
            found = true
            break
        end
    end
    
    if found then
        StatusText.Text = "Backdoor Found!"
        StatusText.TextColor3 = Color3.fromRGB(0, 255, 0)
        StatusStroke.Color = Color3.fromRGB(0, 255, 0)
    else
        StatusText.Text = "No backdoor :("
        StatusText.TextColor3 = Color3.fromRGB(255, 255, 150)
        StatusStroke.Color = Color3.fromRGB(255, 255, 0)
    end
end)
