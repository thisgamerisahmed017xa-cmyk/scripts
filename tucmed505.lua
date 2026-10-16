-- Name: tucmed505 - Ultimate Chaos & Glitch Edition
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- 1. تحويل الشخصية لأحمر نيون وامع وإزالة الملابس
pcall(function()
    for _, v in ipairs(character:GetChildren()) do
        if v:IsA("Accessory") or v:IsA("Clothing") or v:IsA("Shirt") or v:IsA("Pants") then
            v:Destroy()
        end
    end
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.new("Really red")
            part.Material = Enum.Material.Neon
        end
    end
end)

-- 2. تخريب إضاءة اللعبة (ألوان سيكيدلكية مجنونة ومتغيرة بسرعة)
pcall(function()
    local cc = Instance.new("ColorCorrectionEffect")
    cc.Parent = Lighting
    cc.Saturation = 5
    cc.TintColor = Color3.fromRGB(255, 0, 0)

    local blur = Instance.new("BlurEffect")
    blur.Size = 5
    blur.Parent = Lighting

    -- حلقة لتغيير ألوان الإضاءة والغبش بجنون لكل جزء من الثانية
    task.spawn(function()
        while true do
            task.wait(0.08)
            pcall(function()
                cc.TintColor = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
                blur.Size = math.random(0, 18)
            end)
        end
    end)
end)

-- 3. كتابة النص المرعب على جسم الشخصية
pcall(function()
    local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    if torso then
        local surfaceGui = Instance.new("SurfaceGui")
        surfaceGui.Face = Enum.NormalId.Front
        surfaceGui.CanvasSize = Vector2.new(800, 800)
        surfaceGui.Parent = torso

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "TUCMED505 CHAOS!"
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.FredokaOne
        textLabel.Parent = surfaceGui
    end
end)

-- 4. دوران جنوني وهستيري للشخصية محلياً
task.spawn(function()
    while character and character:Parent() do
        task.wait(0.03)
        pcall(function()
            humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(60), 0)
        end)
    end
end)

-- 5. واجهة مستخدم (GUI) حمراء وامضة تسبب الصداع
pcall(function()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ChaosGui"
    gui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    frame.BackgroundTransparency = 0.7
    frame.Parent = gui

    task.spawn(function()
        while true do
            task.wait(0.1)
            pcall(function()
                frame.BackgroundTransparency = math.random(40, 95) / 100
            end)
        end
    end)
end)

print("tucmed505 Chaos & Glitch Loaded Successfully!")
