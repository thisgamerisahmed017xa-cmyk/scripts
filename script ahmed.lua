-- ===================================================
-- [AHMED CUSTOM AUDIO & FE TROLL ENGINE]
-- [File: script ahmed.lua]
-- ===================================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- واجهة التحكم الخاصة بالأغاني والترويل
if LocalPlayer.PlayerGui:FindFirstChild("AhmedAudioHub") then
    LocalPlayer.PlayerGui.AhmedAudioHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AhmedAudioHub"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
MainFrame.Position = UDim2.new(0.5, -180, 0.3, -200)
MainFrame.Size = UDim2.new(0, 360, 0, 420)
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)
local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Color = Color3.fromRGB(255, 0, 200)
Stroke.Thickness = 3

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(30, 15, 45)
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 100, 255)
Title.TextSize = 14
Title.Text = "🎵 [AHMED CUSTOM AUDIO & FE HUB] 🎵"
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 16)

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Position = UDim2.new(0, 0, 0, 60)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -65)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
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

-- 1. زر تشغيل الصوت المزعج في السيرفر FE
createButton("🎶 تشغيل الصوت للكل (FE Custom Audio)", Color3.fromRGB(180, 0, 120), function()
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

-- 2. الدوران المروحي FE (يبان للجميع)
createButton("🚁 الدوران المروحي للكل (FE Spin Bot)", Color3.fromRGB(120, 0, 180), function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local bav = Instance.new("BodyAngularVelocity", char.HumanoidRootPart)
        bav.MaxTorque = Vector3.new(0, math.huge, 0)
        bav.AngularVelocity = Vector3.new(0, 3000, 0)
    end
end)

-- 3. التحول لحجم نملة FE
createButton("🐜 التحول لحجم نملة صغيرة (Micro Size)", Color3.fromRGB(0, 140, 70), function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        local hum = char.Humanoid
        hum.BodyHeightScale.Value = 0.2
        hum.BodyWidthScale.Value = 0.2
        hum.HeadScale.Value = 0.2
    end
end)

-- زر الإغلاق
createButton("❌ إغلاق الواجهة", Color3.fromRGB(150, 20, 20), function()
    ScreenGui:Destroy()
end)

print("[SUCCESS]: script ahmed.lua Loaded!")
