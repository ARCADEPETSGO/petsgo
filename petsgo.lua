task.wait(2)

-- Teleport to "Enter" part
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local enterPart = workspace:WaitForChild("Enter")

rootPart.CFrame = enterPart.CFrame

-- Wait 2 seconds after teleport
task.wait(2)

-- Enter the arcade instance
local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Network")
Network:WaitForChild("Instancing_PlayerEnterInstance"):InvokeServer("ArcadeInstance")

-- Teleport to "EnterTeleport" part
local enterTeleportPart = workspace:WaitForChild("EnterTeleport")
rootPart.CFrame = enterTeleportPart.CFrame

-- Wait 2 seconds after teleporting again
task.wait(2)

-- Main loop: every 2 seconds
while true do
    -- Click first
    Network:WaitForChild("Instancing_FireCustomFromClient"):FireServer("ArcadeInstance", "Arcade_OnClick")

    -- Hatch second
    Network:WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("ArcadeInstance", "Arcade_Hatch")

    -- Rebirth last
    Network:WaitForChild("Arcade_RequestRebirth"):InvokeServer(50)

    -- Wait 2 seconds between each full action
    task.wait(2)
end
