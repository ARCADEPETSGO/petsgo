task.wait(5)

local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")

local Instancing_PlayerEnterInstance = Network:WaitForChild("Instancing_PlayerEnterInstance")
local Instancing_FireCustomFromClient = Network:WaitForChild("Instancing_FireCustomFromClient")
local Instancing_InvokeCustomFromClient = Network:WaitForChild("Instancing_InvokeCustomFromClient")
local Arcade_RequestRebirth = Network:WaitForChild("Arcade_RequestRebirth")

-- Enter the arcade
Instancing_PlayerEnterInstance:InvokeServer("ArcadeInstance")

-- Ultra fast loop
task.spawn(function()
    while true do
        -- Only FireServer instantly (doesn't wait)
        Instancing_FireCustomFromClient:FireServer("ArcadeInstance", "Arcade_OnClick")
        Arcade_RequestRebirth:InvokeServer(50)

        -- InvokeServer separately because it waits
        task.spawn(function()
            pcall(function()
                Instancing_InvokeCustomFromClient:InvokeServer("ArcadeInstance", "Arcade_Hatch")
            end)
        end)

        task.wait() -- Tiny wait (1 frame = ~1/60 second)
    end
end)
