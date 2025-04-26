task.wait(5)

local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")

-- Enter the arcade instance
Network:WaitForChild("Instancing_PlayerEnterInstance"):InvokeServer("ArcadeInstance")

-- Fast loop using Heartbeat
game:GetService("RunService").Heartbeat:Connect(function()
    -- Click first
    Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("ArcadeInstance", "Arcade_OnClick")

    -- Then hatch
    Network:WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("ArcadeInstance", "Arcade_Hatch")

    -- Then rebirth
    Network:WaitForChild("Arcade_RequestRebirth"):InvokeServer(50)
end)
