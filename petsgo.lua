task.wait(2)

-- Setup
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")

-- Teleport to "Enter" part
local enterPart = workspace:WaitForChild("Enter")
if enterPart and rootPart then
    rootPart.CFrame = enterPart.CFrame
end

task.wait(2)

-- Enter the arcade instance
Network:WaitForChild("Instancing_PlayerEnterInstance"):InvokeServer("ArcadeInstance")

-- Teleport to "EnterTeleport" part
local enterTeleportPart = workspace:WaitForChild("EnterTeleport")
if enterTeleportPart and rootPart then
    rootPart.CFrame = enterTeleportPart.CFrame
end

task.wait(2)

-- Main loop (no wait between)
while true do
    -- Click
    Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("ArcadeInstance", "Arcade_OnClick")

    -- Hatch
    Network:WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("ArcadeInstance", "Arcade_Hatch")

    -- Rebirth
    Network:WaitForChild("Arcade_RequestRebirth"):InvokeServer(50)
end
