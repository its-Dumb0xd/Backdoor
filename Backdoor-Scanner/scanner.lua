-- DUMB0 SCANNER MODULE
local Scanner = {}

function Scanner.Run()
    local detected = {}
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") and v.Name:lower():find("remote") then
            table.insert(detected, v)
        end
    end
    return detected
end

return Scanner
