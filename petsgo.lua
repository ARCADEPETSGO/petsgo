task.wait(5)

local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")

Network:WaitForChild("Instancing_PlayerEnterInstance"):InvokeServer("ArcadeInstance")

while true do
    Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("ArcadeInstance", "Arcade_OnClick")
    Network:WaitForChild("Arcade_RequestRebirth"):InvokeServer(50)
    game:GetService("RunService").Heartbeat:Wait() -- very minimal delay
end
