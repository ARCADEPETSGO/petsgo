task.wait(5)

local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")

-- Enter the arcade instance
Network:WaitForChild("Instancing_PlayerEnterInstance"):InvokeServer("ArcadeInstance")

-- Fast loop using Heartbeat (no rebirth)
game:GetService("RunService").Heartbeat:Connect(function()
    Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("ArcadeInstance", "Arcade_OnClick")
end)
