-- ==========================================
-- [ULTIMATE KEYBOARD HUB - FIXED AUTO STAGE]
-- [Creator: Ahmed's Elite Hub]
-- ==========================================

if not game:IsLoaded() then game.Loaded:Wait() end

-- 🛡️ نظام الحماية المتقدم لتجنب الحظر
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

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- إزالة الواجهة القديمة لمنع التكرار
if LocalPlayer.PlayerGui:FindFirstChild("UltimateKeyboardHub") then
    LocalPlayer.PlayerGui.UltimateKeyboardHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UltimateKeyboardHub"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- النافذة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.Position = UDim2.new(0.5, -175, 0.35, -200)
MainFrame.Size = UDim2.new(0, 350, 0, 460)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(0, 255, 120)
MainStroke.Thickness = 2

-- شريط العنوان
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.TextSize = 15
Title.Text = "🔥 [FIXED KEYBOARD HUB] 🔥"

local TitleCorner = Instance.new("UICorner", Title)
TitleCorner.CornerRadius = UDim.new(0, 12)

-- حاوية الأزرار
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Position = UDim2.new(0, 0, 0, 55)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -60)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 580)
ScrollingFrame.ScrollBarThickness = 6

local UIList = Instance.new("UIListLayout", ScrollingFrame)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 10)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = ScrollingFrame
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.BackgroundColor3 = color
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Text = text
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 8)
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ==================== المميزات المُحدثة ====================

-- 1. الفوز وتخطي المراحل المحدث (يتجنب بوابات العوالم ويركز على اللعب)
local autoStage = false
createButton("🏆 ختم المراحل الحالية تلقائياً (Fixed Auto Stage)", Color3.fromRGB(200, 0, 100), function()
    autoStage = not autoStage
    task.spawn(function()
        while autoStage do
            pcall(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    -- استبعاد بوابات العوالم والتركيز على أهداف المراحل الداخلية
                    local name = string.lower(obj.Name)
                    if obj:IsA("BasePart") and (name:find("goal") or name:find("target") or name:find("endlevel") or name:find("checkpoint")) then
                        local char = LocalPlayer.Character
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = obj.CFrame + Vector3.new(0, 3, 0)
                        end
                    end
                end
            end)
            task.wait(1.5)
        end
    end)
end)

-- 2. جمع الفلوس والعملات تلقائياً (Auto Money)
local autoMoney = false
createButton("💰 سحب وجمع الفلوس والعملات تلقائياً (Auto Money)", Color3.fromRGB(0, 180, 50), function()
    autoMoney = not autoMoney
    task.spawn(function()
        while autoMoney do
            pcall(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, obj in pairs(workspace:GetDescendants()) do
                        if obj:IsA("BasePart") and (string.lower(obj.Name):find("coin") or string.lower(obj.Name):find("cash") or string.lower(obj.Name):find("money") or string.lower(obj.Name):find("dollar") or string.lower(obj.Name):find("gem")) then
                            obj.CFrame = char.HumanoidRootPart.CFrame
                        end
                    end
                end
            end)
            task.wait(0.2)
        end
    end)
end)

-- 3. الضغط التلقائي
local autoClicking = false
createButton("⚡ الضغط التلقائي الخارق (Auto Clicker)", Color3.fromRGB(0, 120, 255), function()
    autoClicking = not autoClicking
    task.spawn(function()
        while autoClicking do
            pcall(function()
                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
            end)
            task.wait(0.01)
        end
    end)
end)

-- 4. السرعة الخارقة
createButton("🚀 زيادة سرعة الحركة (WalkSpeed 100)", Color3.fromRGB(150, 0, 200), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end
end)

-- 5. اختراق الجدران (Noclip)
local noclip = false
createButton("👻 اختراق الجدران (Noclip)", Color3.fromRGB(90, 90, 90), function()
    noclip = not noclip
    RunService.Stepped:Connect(function()
        if noclip and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

-- 6. إغلاق الواجهة
createButton("❌ إغلاق الواجهة", Color3.fromRGB(180, 40, 40), function()
    ScreenGui:Destroy()
end)

print("[SUCCESS]: Fixed Keyboard Hub Loaded!")
