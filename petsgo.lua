task.wait(5)

local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")

local Instancing_PlayerEnterInstance = Network:WaitForChild("Instancing_PlayerEnterInstance")
local Instancing_FireCustomFromClient = Network:WaitForChild("Instancing_FireCustomFromClient")
local Instancing_InvokeCustomFromClient = Network:WaitForChild("Instancing_InvokeCustomFromClient")
local Arcade_RequestRebirth = Network:WaitForChild("Arcade_RequestRebirth")

-- Join the ArcadeInstance
Instancing_PlayerEnterInstance:InvokeServer("ArcadeInstance")

-- Make a loop that runs every 0.5 seconds instead of every frame
task.spawn(function()
    while true do
        -- Fire and Invoke normally
        Instancing_FireCustomFromClient:FireServer("ArcadeInstance", "Arcade_OnClick")
        Instancing_InvokeCustomFromClient:InvokeServer("ArcadeInstance", "Arcade_Hatch")
        Arcade_RequestRebirth:InvokeServer(50)

        task.wait(0.5) -- Wait half a second to prevent server overload
    end
end)
