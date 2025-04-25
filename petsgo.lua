task.wait(5)
local args = {
    [1] = "ArcadeInstance"
}

game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_PlayerEnterInstance"):InvokeServer(unpack(args))
while true do
local args = {
    [1] = "ArcadeInstance",
    [2] = "Arcade_OnClick"
}

game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer(unpack(args))
local args = {
    [1] = 50
}

game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Arcade_RequestRebirth"):InvokeServer(unpack(args))
end
