task.wait(5)

local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")
Network:WaitForChild("Instancing_PlayerEnterInstance"):InvokeServer("ArcadeInstance")

game:GetService("RunService").Heartbeat:Connect(function()
    Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("ArcadeInstance", "Arcade_OnClick")
    Network:WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("ArcadeInstance", "Arcade_Hatch")
    Network:WaitForChild("Arcade_RequestRebirth"):InvokeServer(50)
end
