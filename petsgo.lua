task.wait(5)

local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")
local Workspace = game:GetService("Workspace")

local Instancing_PlayerEnterInstance = Network:WaitForChild("Instancing_PlayerEnterInstance")
local Instancing_FireCustomFromClient = Network:WaitForChild("Instancing_FireCustomFromClient")
local Instancing_InvokeCustomFromClient = Network:WaitForChild("Instancing_InvokeCustomFromClient")
local Arcade_RequestRebirth = Network:WaitForChild("Arcade_RequestRebirth")

-- Get the parts for teleportation
local enterPart = Workspace:WaitForChild("Enter")
local enterTeleportPart = Workspace:WaitForChild("EnterTeleport")

-- Function to teleport to a part
local function teleportToPart(part)
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(part.CFrame)
end

-- Enter the arcade
Instancing_PlayerEnterInstance:InvokeServer("ArcadeInstance")

-- Teleport once to "Enter" part
teleportToPart(enterPart)

-- Wait 2 seconds before teleporting to "EnterTeleport"
task.wait(2)

-- Teleport once to "EnterTeleport" part
teleportToPart(enterTeleportPart)

-- Fire and invoke remotes
Instancing_FireCustomFromClient:FireServer("ArcadeInstance", "Arcade_OnClick")
Arcade_RequestRebirth:InvokeServer(50)

-- InvokeServer separately to avoid freezing the loop
task.spawn(function()
    pcall(function()
        Instancing_InvokeCustomFromClient:InvokeServer("ArcadeInstance", "Arcade_Hatch")
    end)
end)

-- Optionally, add a tiny wait to make the script ultra-fast and responsive
task.wait()
