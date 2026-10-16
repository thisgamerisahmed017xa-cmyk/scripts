-- Name: tucmed505 - Magnetic & Physics Edition
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- 1. تخصيص المظهر (إزالة الملابس وتحويل الشخصية لأحمر نيون)
pcall(function()
    for _, v in ipairs(character:GetChildren()) do
        if v:IsA("Accessory") or v:IsA("Clothing") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
            v:Destroy()
        end
    end
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.new("Bright red")
            part.Material = Enum.Material.Neon
        end
    end
end)

-- 2. كتابة النص على الجسم ليكون واضحاً
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
        textLabel.Text = "Join the team tucmed505!"
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.FredokaOne
        textLabel.Parent = surfaceGui
    end
end)

-- 3. تفعيل نظام الجذب المغناطيسي للأجزاء وتطيرها حولك (يتطلب قطع غير مثبتة في الماب)
task.spawn(function()
    while character and character:Parent() do
        task.wait(0.15)
        pcall(function()
            for _, part in ipairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and not part.Anchored and part.Parent ~= character then
                    local distance = (part.Position - humanoidRootPart.Position).Magnitude
                    -- إذا كانت القطعة قريبة في نطاق 30 خطوة
                    if distance < 30 then
                        -- محاولة طلب ملكية الشبكة لكي يراها الجميع وتتحرك بسلاسة
                        pcall(function() part:SetNetworkOwner(player) end)
                        
                        -- سحب القطعة مغناطيسياً نحو اللاعب وإحداث قوة دفع
                        local pullDirection = (humanoidRootPart.Position - part.Position).Unit
                        part.Velocity = (pullDirection * -65) + Vector3.new(0, 35, 0)
                    end
                end
            end
        end)
    end
end)

-- 4. إظهار رسالة واجهة المستخدم (GUI)
pcall(function()
    local gui = Instance.new("ScreenGui")
    gui.Name = "tucmed505_Gui"
    gui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 70)
    label.Position = UDim2.new(0, 0, 0.02, 0)
    label.Text = "⚡ TUCMED505 MAGNETIC PHYSICS ACTIVE ⚡"
    label.TextColor3 = Color3.fromRGB(255, 0, 0)
    label.TextScaled = true
    label.BackgroundTransparency = 0.4
    label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    label.Font = Enum.Font.FredokaOne
    label.Parent = gui
end)

print("tucmed505 Magnetic Script Loaded!")
