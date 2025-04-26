task.wait(5)

local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")

-- Enter the arcade instance
Network:WaitForChild("Instancing_PlayerEnterInstance"):InvokeServer("ArcadeInstance")

-- Fast loop using Heartbeat (all actions in order)
game:GetService("RunService").Heartbeat:Connect(function()
    -- Click first
    Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("ArcadeInstance", "Arcade_OnClick")

    -- Hatch second
    Network:WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("ArcadeInstance", "Arcade_Hatch")

    -- Rebirth last
    Network:WaitForChild("Arcade_RequestRebirth"):InvokeServer(50)
end)
