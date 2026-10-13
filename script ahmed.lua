-- ===================================================
-- [AHMED DELTA TRUE FE GOD & TROLL HUB]
-- [File: scrimt ahmed.Lua]
-- ===================================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

-- 🛡️ حماية دلتا الشاملة
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local oldNamecall = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "Ban" then
            return nil
        end
        return oldNamecall(self, ...)
    end)
    setreadonly(mt, true)
end)

-- 🎨 واجهة التحكم الفخمة
if LocalPlayer.PlayerGui:FindFirstChild("AhmedTrueFEHub") then
    LocalPlayer.PlayerGui.AhmedTrueFEHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AhmedTrueFEHub"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 5, 25)
MainFrame.Position = UDim2.new(0.5, -190, 0.25, -220)
MainFrame.Size = UDim2.new(0, 380, 0, 560)
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)
local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Color = Color3.fromRGB(255, 0, 150)
Stroke.Thickness = 3

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(35, 10, 45)
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 0, 150)
Title.TextSize = 13
Title.Text = "🔥 [AHMED TRUE FE MASTER HUB] 🔥"
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 16)

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Position = UDim2.new(0, 0, 0, 60)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -65)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 900)
ScrollingFrame.ScrollBarThickness = 5

local UIList = Instance.new("UIListLayout", ScrollingFrame)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 10)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = ScrollingFrame
    btn.Size = UDim2.new(0.92, 0, 0, 46)
    btn.BackgroundColor3 = color
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Text = text
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ===================================================
-- 💥 [مميزات الـ FE الحقيقية التي تظهر للجميع]
-- ===================================================

-- 1. طيران حقيقي يراه الجميع (FE Real Server-Synced Fly)
createButton("🛸 طيران حقيقي يراه الجميع (FE Real Fly)", Color3.fromRGB(200, 50, 0), function()
    _G.AhmedFEFly = not _G.AhmedFEFly
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    if _G.AhmedFEFly then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FE_FlyVel"
        bv.Parent = char.HumanoidRootPart
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        
        task.spawn(function()
            while _G.AhmedFEFly and char and char:FindFirstChild("HumanoidRootPart") do
                bv.Velocity = Workspace.CurrentCamera.CFrame.LookVector * 100 + Vector3.new(0, 2, 0)
                task.wait(0.01)
            end
            bv:Destroy()
        end)
    end
end)

-- 2. دوران مروحي مرعب يراه الجميع (FE Spin Bot)
createButton("🚁 الدوران المروحي المرعب للكل (FE Spin Bot)", Color3.fromRGB(150, 0, 150), function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        if char.HumanoidRootPart:FindFirstChild("FE_SpinTroll") then
            char.HumanoidRootPart.FE_SpinTroll:Destroy()
        else
            local bav = Instance.new("BodyAngularVelocity")
            bav.Name = "FE_SpinTroll"
            bav.Parent = char.HumanoidRootPart
            bav.MaxTorque = Vector3.new(0, math.huge, 0)
            bav.AngularVelocity = Vector3.new(0, 4000, 0)
        end
    end)
end)

-- 3. تضخيم الجسم أو جعله عملاقاً يراه الجميع (FE Giant Scale)
createButton("🦖 التحول لعملاق يراه الجميع (FE Giant Size)", Color3.fromRGB(0, 140, 70), function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            local hum = char.Humanoid
            hum.BodyHeightScale.Value = 3.0
            hum.BodyWidthScale.Value = 2.5
            hum.HeadScale.Value = 2.0
        end
    end)
end)

-- 4. شفط العملات والفلوس الحقيقي في الماب
createButton("💰 شفط الفلوس والعملات التلقائي (Auto Farm)", Color3.fromRGB(0, 150, 80), function()
    task.spawn(function()
        while true do
            pcall(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj:IsA("BasePart") and (string.lower(obj.Name):find("coin") or string.lower(obj.Name):find("cash") or string.lower(obj.Name):find("money") or string.lower(obj.Name):find("gem")) then
                            obj.CFrame = char.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end)

-- 5. تشغيل الصوت الخاص بك FE لكل السيرفر
createButton("🎶 تشغيل أغنيتك الخاصة للكل (FE Custom Audio)", Color3.fromRGB(180, 0, 120), function()
    pcall(function()
        local customAudioId = "rbxassetid://1848354536"
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("Sound") then
                v.SoundId = customAudioId
                v.Volume = 10
                v.Looped = true
                v:Play()
            end
        end
    end)
end)

-- زر الإغلاق
createButton("❌ إغلاق الواجهة", Color3.fromRGB(150, 20, 20), function()
    ScreenGui:Destroy()
end)

print("[SUCCESS]: Ahmed True FE Master Hub Loaded!")
