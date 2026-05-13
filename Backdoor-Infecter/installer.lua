-- [[ DUMB0 HUB - INFECTER UNIT ]] --
local Notification = instance.new("Hint", game.Workspace)
Notification.Text = "Dumb0 Infecter: Scanning for vulnerable scripts..."

local scriptsFound = 0
local infectedCount = 0

-- This function looks for scripts to "Infect"
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("Script") or v:IsA("LocalScript") then
        scriptsFound = scriptsFound + 1
        
        -- In a real Infecter, you would use: 
        -- v.Source = v.Source .. "\n--[[ Protected ]]\nrequire(ID)"
        -- For now, we just highlight them for you to see!
        
        print("Found vulnerable script: " .. v:GetFullName())
    end
end

Notification.Text = "Dumb0 Infecter: Found " .. scriptsFound .. " scripts. Ready for injection."
task.wait(3)
Notification:Destroy()
