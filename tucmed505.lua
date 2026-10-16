-- Name: tucmed505
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- 1. تغيير أجزاء الشخصية إلى اللون الأحمر
pcall(function()
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.new("Bright red")
        end
    end
end)

-- 2. إظهار رسالة Join the team tucmed505! على الشاشة (GUI)
pcall(function()
    local gui = Instance.new("ScreenGui")
    gui.Name = "tucmed505_Gui"
    gui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 80)
    label.Position = UDim2.new(0, 0, 0.05, 0)
    label.Text = "Join the team tucmed505!"
    label.TextColor3 = Color3.fromRGB(255, 0, 0)
    label.TextScaled = true
    label.BackgroundTransparency = 0.5
    label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    label.Font = Enum.Font.FredokaOne
    label.Parent = gui
end)

-- 3. تشغيل صوت مزعج/تنبيه
pcall(function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9064731772"
    sound.Volume = 10
    sound.Looped = true
    sound.Parent = character:FindFirstChild("HumanoidRootPart") or character
    sound:Play()
end)

-- 4. تعديل فيزياء الماب (الجاذبية)
pcall(function()
    workspace.Gravity = 30
end)

print("tucmed505 script executed successfully!")
