-- [[ DUMB0 SCANNER MODULE ]] --
local Scanner = {}

function Scanner.Scan()
    print("Dumb0: Starting Deep Scan...")
    local found = {}
    
    -- Scans everything for RemoteEvents
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            local name = v.Name:lower()
            -- Professional detection logic
            if name:find("backdoor") or name:find("handler") or v.Parent.Name == "JointsService" then
                table.insert(found, v)
                print("Dumb0 Found Vulnerability: " .. v:GetFullName())
            end
        end
    end
    
    if #found == 0 then
        print("Dumb0: Server is clean.")
    else
        print("Dumb0: " .. #found .. " Remotes Detected.")
    end
end

return Scanner
