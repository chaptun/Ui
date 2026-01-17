-- Dragon Farm Status UI สำหรับ Roblox (Enhanced Version)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ลบ UI เก่าถ้ามี
if PlayerGui:FindFirstChild("DragonFarmUI") then
    PlayerGui:FindFirstChild("DragonFarmUI"):Destroy()
end

-- สร้าง ScreenGui หลัก
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DragonFarmUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999999
ScreenGui.Parent = PlayerGui

-- Main Container (ตรงกลางจอ - ขนาดใหญ่ขึ้น)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 750, 0, 700)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 999999999
MainFrame.Parent = ScreenGui

-- เพิ่ม UICorner
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 25)
mainCorner.Parent = MainFrame

-- เพิ่ม UIScale สำหรับรองรับหน้าจอทุกขนาด
local uiScale = Instance.new("UIScale")
uiScale.Parent = MainFrame

local function updateScale()
    local screenSize = ScreenGui.AbsoluteSize
    local scaleX = screenSize.X / 1920
    local scaleY = screenSize.Y / 1080
    uiScale.Scale = math.max(math.min(scaleX, scaleY, 1.5), 0.8)
end

updateScale()
ScreenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScale)

-- เพิ่ม Border Gradient
local borderFrame = Instance.new("Frame")
borderFrame.Name = "Border"
borderFrame.Size = UDim2.new(1, 6, 1, 6)
borderFrame.Position = UDim2.new(0, -3, 0, -3)
borderFrame.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
borderFrame.BackgroundTransparency = 0.6
borderFrame.ZIndex = 999999998
borderFrame.Parent = MainFrame

local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 28)
borderCorner.Parent = borderFrame

local borderGradient = Instance.new("UIGradient")
borderGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 200, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 200))
}
borderGradient.Rotation = 45
borderGradient.Parent = borderFrame

-- Animate Border Gradient
spawn(function()
    while MainFrame.Parent do
        for i = 0, 360, 2 do
            if not MainFrame.Parent then break end
            borderGradient.Rotation = i
            wait(0.03)
        end
    end
end)

-- Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 100)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
Header.BackgroundTransparency = 0.3
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 25)
headerCorner.Parent = Header

local headerGradient = Instance.new("UIGradient")
headerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 15, 35))
}
headerGradient.Rotation = 90
headerGradient.Parent = Header

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -40, 0, 45)
Title.Position = UDim2.new(0, 20, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "🐉 DRAGON FARM PRO"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 34
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Player Name Display
local PlayerNameLabel = Instance.new("TextLabel")
PlayerNameLabel.Name = "PlayerName"
PlayerNameLabel.Size = UDim2.new(1, -40, 0, 30)
PlayerNameLabel.Position = UDim2.new(0, 20, 0, 60)
PlayerNameLabel.BackgroundTransparency = 1
PlayerNameLabel.Text = "👤 " .. LocalPlayer.Name
PlayerNameLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
PlayerNameLabel.TextSize = 20
PlayerNameLabel.Font = Enum.Font.GothamBold
PlayerNameLabel.TextXAlignment = Enum.TextXAlignment.Left
PlayerNameLabel.Parent = Header

-- Status Indicator (มุมขวาบน)
local StatusDot = Instance.new("Frame")
StatusDot.Name = "StatusDot"
StatusDot.Size = UDim2.new(0, 16, 0, 16)
StatusDot.Position = UDim2.new(1, -70, 0, 20)
StatusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
StatusDot.BorderSizePixel = 0
StatusDot.Parent = Header

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = StatusDot

-- Animate Status Dot
spawn(function()
    while StatusDot.Parent do
        TweenService:Create(StatusDot, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            BackgroundTransparency = 0.3
        }):Play()
        wait(0.8)
    end
end)

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(0, 50, 0, 20)
StatusText.Position = UDim2.new(1, -50, 0, 18)
StatusText.BackgroundTransparency = 1
StatusText.Text = "LIVE"
StatusText.TextColor3 = Color3.fromRGB(0, 255, 150)
StatusText.TextSize = 16
StatusText.Font = Enum.Font.GothamBold
StatusText.Parent = Header

-- Farm Mode Indicator (ใหม่)
local ModePanel = Instance.new("Frame")
ModePanel.Name = "ModePanel"
ModePanel.Size = UDim2.new(1, -40, 0, 60)
ModePanel.Position = UDim2.new(0, 20, 0, 120)
ModePanel.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
ModePanel.BackgroundTransparency = 0.3
ModePanel.BorderSizePixel = 0
ModePanel.Parent = MainFrame

local modeCorner = Instance.new("UICorner")
modeCorner.CornerRadius = UDim.new(0, 12)
modeCorner.Parent = ModePanel

local modeStroke = Instance.new("UIStroke")
modeStroke.Color = Color3.fromRGB(100, 200, 255)
modeStroke.Thickness = 2
modeStroke.Transparency = 0.7
modeStroke.Parent = ModePanel

local ModeIcon = Instance.new("TextLabel")
ModeIcon.Size = UDim2.new(0, 50, 0, 50)
ModeIcon.Position = UDim2.new(0, 10, 0.5, -25)
ModeIcon.BackgroundTransparency = 1
ModeIcon.Text = "⚙️"
ModeIcon.TextSize = 35
ModeIcon.Font = Enum.Font.GothamBold
ModeIcon.Parent = ModePanel

local ModeLabel = Instance.new("TextLabel")
ModeLabel.Name = "ModeLabel"
ModeLabel.Size = UDim2.new(0, 150, 0, 20)
ModeLabel.Position = UDim2.new(0, 70, 0, 10)
ModeLabel.BackgroundTransparency = 1
ModeLabel.Text = "FARM MODE"
ModeLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
ModeLabel.TextSize = 14
ModeLabel.Font = Enum.Font.GothamBold
ModeLabel.TextXAlignment = Enum.TextXAlignment.Left
ModeLabel.Parent = ModePanel

local ModeValue = Instance.new("TextLabel")
ModeValue.Name = "ModeValue"
ModeValue.Size = UDim2.new(1, -80, 0, 28)
ModeValue.Position = UDim2.new(0, 70, 0, 28)
ModeValue.BackgroundTransparency = 1
ModeValue.Text = "HYBRID"
ModeValue.TextColor3 = Color3.fromRGB(255, 200, 100)
ModeValue.TextSize = 24
ModeValue.Font = Enum.Font.GothamBold
ModeValue.TextXAlignment = Enum.TextXAlignment.Left
ModeValue.Parent = ModePanel

local AntiDetectStatus = Instance.new("TextLabel")
AntiDetectStatus.Name = "AntiDetect"
AntiDetectStatus.Size = UDim2.new(0, 180, 0, 25)
AntiDetectStatus.Position = UDim2.new(1, -190, 0.5, -12)
AntiDetectStatus.BackgroundTransparency = 1
AntiDetectStatus.Text = "🛡️ ANTI-DETECT: ON"
AntiDetectStatus.TextColor3 = Color3.fromRGB(0, 255, 150)
AntiDetectStatus.TextSize = 16
AntiDetectStatus.Font = Enum.Font.GothamBold
AntiDetectStatus.TextXAlignment = Enum.TextXAlignment.Right
AntiDetectStatus.Parent = ModePanel

-- Stats Container
local StatsContainer = Instance.new("Frame")
StatsContainer.Name = "StatsContainer"
StatsContainer.Size = UDim2.new(1, -40, 0, 350)
StatsContainer.Position = UDim2.new(0, 20, 0, 200)
StatsContainer.BackgroundTransparency = 1
StatsContainer.Parent = MainFrame

local statsLayout = Instance.new("UIListLayout")
statsLayout.Padding = UDim.new(0, 15)
statsLayout.SortOrder = Enum.SortOrder.LayoutOrder
statsLayout.Parent = StatsContainer

-- ฟังก์ชันฟอร์แมตตัวเลข
local function formatNumber(num)
    local formatted = tostring(math.floor(num))
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

-- ฟังก์ชันสร้าง Stat Card แบบใหม่ (แสดงข้อมูลเพิ่ม)
local function CreateStatCard(name, icon, color1, color2, layoutOrder)
    local card = Instance.new("Frame")
    card.Name = name .. "Card"
    card.Size = UDim2.new(1, 0, 0, 100)
    card.BackgroundColor3 = color1
    card.BackgroundTransparency = 0.3
    card.BorderSizePixel = 0
    card.LayoutOrder = layoutOrder
    card.Parent = StatsContainer
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 16)
    cardCorner.Parent = card
    
    local cardGradient = Instance.new("UIGradient")
    cardGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(1, color2)
    }
    cardGradient.Rotation = 135
    cardGradient.Parent = card
    
    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = Color3.fromRGB(255, 255, 255)
    cardStroke.Thickness = 3
    cardStroke.Transparency = 0.7
    cardStroke.Parent = card
    
    -- Icon
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "Icon"
    iconLabel.Size = UDim2.new(0, 70, 0, 70)
    iconLabel.Position = UDim2.new(0, 15, 0.5, -35)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextSize = 50
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = card
    
    -- Name Label
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(0, 200, 0, 25)
    nameLabel.Position = UDim2.new(0, 95, 0, 15)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    nameLabel.TextSize = 18
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = card
    
    -- Value Label
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Size = UDim2.new(1, -350, 0, 45)
    valueLabel.Position = UDim2.new(0, 95, 0, 40)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = "0"
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.TextSize = 36
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextXAlignment = Enum.TextXAlignment.Left
    valueLabel.Parent = card
    
    -- Rate Label (เพิ่ม/ชม)
    local rateLabel = Instance.new("TextLabel")
    rateLabel.Name = "RateLabel"
    rateLabel.Size = UDim2.new(0, 200, 0, 22)
    rateLabel.Position = UDim2.new(1, -210, 0, 20)
    rateLabel.BackgroundTransparency = 1
    rateLabel.Text = "📈 +0/hr"
    rateLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
    rateLabel.TextSize = 16
    rateLabel.Font = Enum.Font.GothamBold
    rateLabel.TextXAlignment = Enum.TextXAlignment.Right
    rateLabel.Parent = card
    
    -- Target Progress (สำหรับโหมด Hybrid)
    local progressLabel = Instance.new("TextLabel")
    progressLabel.Name = "ProgressLabel"
    progressLabel.Size = UDim2.new(0, 200, 0, 20)
    progressLabel.Position = UDim2.new(1, -210, 0, 50)
    progressLabel.BackgroundTransparency = 1
    progressLabel.Text = ""
    progressLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    progressLabel.TextSize = 14
    progressLabel.Font = Enum.Font.GothamBold
    progressLabel.TextXAlignment = Enum.TextXAlignment.Right
    progressLabel.Parent = card
    
    -- Hover Effect
    card.MouseEnter:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), {Transparency = 0.4}):Play()
    end)
    
    card.MouseLeave:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), {Transparency = 0.7}):Play()
    end)
    
    return card
end

-- สร้าง Stat Cards
local BaconCard = CreateStatCard("Bacon", "🥓", Color3.fromRGB(160, 90, 70), Color3.fromRGB(120, 60, 45), 1)
local MeatCard = CreateStatCard("Meat", "🥩", Color3.fromRGB(190, 80, 100), Color3.fromRGB(140, 50, 70), 2)
local CoinsCard = CreateStatCard("Coins", "💰", Color3.fromRGB(230, 180, 60), Color3.fromRGB(180, 140, 40), 3)

-- Session Timer Panel
local TimerPanel = Instance.new("Frame")
TimerPanel.Name = "TimerPanel"
TimerPanel.Size = UDim2.new(1, -40, 0, 85)
TimerPanel.Position = UDim2.new(0, 20, 1, -105)
TimerPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
TimerPanel.BackgroundTransparency = 0.3
TimerPanel.BorderSizePixel = 0
TimerPanel.Parent = MainFrame

local timerCorner = Instance.new("UICorner")
timerCorner.CornerRadius = UDim.new(0, 16)
timerCorner.Parent = TimerPanel

local timerGradient = Instance.new("UIGradient")
timerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 15, 35))
}
timerGradient.Rotation = 90
timerGradient.Parent = TimerPanel

local timerStroke = Instance.new("UIStroke")
timerStroke.Color = Color3.fromRGB(100, 200, 255)
timerStroke.Thickness = 3
timerStroke.Transparency = 0.6
timerStroke.Parent = TimerPanel

local TimerIcon = Instance.new("TextLabel")
TimerIcon.Size = UDim2.new(0, 55, 0, 55)
TimerIcon.Position = UDim2.new(0, 15, 0.5, -27)
TimerIcon.BackgroundTransparency = 1
TimerIcon.Text = "⏱️"
TimerIcon.TextSize = 40
TimerIcon.Font = Enum.Font.GothamBold
TimerIcon.Parent = TimerPanel

local TimerLabel = Instance.new("TextLabel")
TimerLabel.Name = "TimerLabel"
TimerLabel.Size = UDim2.new(0, 200, 0, 25)
TimerLabel.Position = UDim2.new(0, 75, 0, 12)
TimerLabel.BackgroundTransparency = 1
TimerLabel.Text = "SESSION TIME"
TimerLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
TimerLabel.TextSize = 16
TimerLabel.Font = Enum.Font.GothamBold
TimerLabel.TextXAlignment = Enum.TextXAlignment.Left
TimerLabel.Parent = TimerPanel

local TimerValue = Instance.new("TextLabel")
TimerValue.Name = "TimerValue"
TimerValue.Size = UDim2.new(0, 300, 0, 38)
TimerValue.Position = UDim2.new(0, 75, 0, 38)
TimerValue.BackgroundTransparency = 1
TimerValue.Text = "00:00:00"
TimerValue.TextColor3 = Color3.fromRGB(0, 255, 150)
TimerValue.TextSize = 30
TimerValue.Font = Enum.Font.GothamBold
TimerValue.TextXAlignment = Enum.TextXAlignment.Left
TimerValue.Parent = TimerPanel

-- Kill Counter (ใหม่)
local KillCounter = Instance.new("TextLabel")
KillCounter.Name = "KillCounter"
KillCounter.Size = UDim2.new(0, 200, 0, 25)
KillCounter.Position = UDim2.new(1, -210, 0, 15)
KillCounter.BackgroundTransparency = 1
KillCounter.Text = "💀 Kills: 0"
KillCounter.TextColor3 = Color3.fromRGB(255, 100, 100)
KillCounter.TextSize = 18
KillCounter.Font = Enum.Font.GothamBold
KillCounter.TextXAlignment = Enum.TextXAlignment.Right
KillCounter.Parent = TimerPanel

local FoodCounter = Instance.new("TextLabel")
FoodCounter.Name = "FoodCounter"
FoodCounter.Size = UDim2.new(0, 200, 0, 25)
FoodCounter.Position = UDim2.new(1, -210, 0, 45)
FoodCounter.BackgroundTransparency = 1
FoodCounter.Text = "🍎 Food: 0"
FoodCounter.TextColor3 = Color3.fromRGB(100, 255, 100)
FoodCounter.TextSize = 18
FoodCounter.Font = Enum.Font.GothamBold
FoodCounter.TextXAlignment = Enum.TextXAlignment.Right
FoodCounter.Parent = TimerPanel

-- ตัวแปรติดตามสถิติ
local startTime = tick()
local lastBacon = 0
local lastMeat = 0
local lastCoins = 0
local rateUpdateInterval = 5 -- อัพเดทเรท ทุก 5 วินาที

-- Session Timer Animation
local sessionStartTime = tick()
spawn(function()
    while TimerValue.Parent do
        local elapsed = tick() - sessionStartTime
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = math.floor(elapsed % 60)
        TimerValue.Text = string.format("%02d:%02d:%02d", hours, minutes, seconds)
        wait(1)
    end
end)

-- ฟังก์ชันอัพเดทค่า Stats พร้อมคำนวณอัตรา
local function UpdateStats()
    pcall(function()
        local currentTime = tick()
        local elapsed = currentTime - startTime
        local hoursElapsed = elapsed / 3600
        
        -- อัพเดท Bacon
        local bacon = LocalPlayer.Data.Resources.Bacon.Value
        BaconCard.Value.Text = formatNumber(bacon)
        
        if hoursElapsed > 0 then
            local baconRate = (bacon - lastBacon) / hoursElapsed
            BaconCard.RateLabel.Text = "📈 +" .. formatNumber(math.floor(baconRate)) .. "/hr"
        end
        
        -- อัพเดท Meat
        local meat = LocalPlayer.Data.Resources.Meat.Value
        MeatCard.Value.Text = formatNumber(meat)
        
        if hoursElapsed > 0 then
            local meatRate = (meat - lastMeat) / hoursElapsed
            MeatCard.RateLabel.Text = "📈 +" .. formatNumber(math.floor(meatRate)) .. "/hr"
        end
        
        -- อัพเดท Coins
        local coins = LocalPlayer.Data.Currency.Coins.Value
        CoinsCard.Value.Text = formatNumber(coins)
        
        if hoursElapsed > 0 then
            local coinRate = (coins - lastCoins) / hoursElapsed
            CoinsCard.RateLabel.Text = "📈 +" .. formatNumber(math.floor(coinRate)) .. "/hr"
        end
        
        -- อัพเดท Progress สำหรับโหมด Hybrid (ถ้ามี Config)
        if getgenv().Config then
            local config = getgenv().Config
            
            if config.FarmMode == "Hybrid" and config.HybridSettings then
                local meatTarget = config.HybridSettings.MeatTarget
                local fruitTarget = config.HybridSettings.FruitTarget
                
                local meatProgress = math.floor((meat / meatTarget) * 100)
                local fruitProgress = math.floor((bacon / fruitTarget) * 100)
                
                MeatCard.ProgressLabel.Text = "🎯 " .. math.min(meatProgress, 100) .. "% of " .. formatNumber(meatTarget)
                BaconCard.ProgressLabel.Text = "🎯 " .. math.min(fruitProgress, 100) .. "% of " .. formatNumber(fruitTarget)
            end
            
            -- อัพเดท Farm Mode
            ModeValue.Text = config.FarmMode or "UNKNOWN"
            
            -- อัพเดท Anti-Detection Status
            if config.AntiDetection and config.AntiDetection.Enabled then
                AntiDetectStatus.Text = "🛡️ ANTI-DETECT: ON"
                AntiDetectStatus.TextColor3 = Color3.fromRGB(0, 255, 150)
            else
                AntiDetectStatus.Text = "🛡️ ANTI-DETECT: OFF"
                AntiDetectStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
            end
        end
        
        -- อัพเดท Kill/Food Counter (ถ้ามี FarmingStats)
        if getgenv().FarmingStats or _G.FarmingStats then
            local stats = getgenv().FarmingStats or _G.FarmingStats
            if stats then
                KillCounter.Text = "💀 Kills: " .. formatNumber(stats.MobsKilled or 0)
                FoodCounter.Text = "🍎 Food: " .. formatNumber(stats.FoodCollected or 0)
            end
        end
    end)
end

-- อัพเดท lastValues ทุก 5 วินาที
spawn(function()
    while ScreenGui.Parent do
        wait(rateUpdateInterval)
        pcall(function()
            lastBacon = LocalPlayer.Data.Resources.Bacon.Value
            lastMeat = LocalPlayer.Data.Resources.Meat.Value
            lastCoins = LocalPlayer.Data.Currency.Coins.Value
        end)
    end
end)

-- เรียกใช้ UpdateStats ทุกๆ 0.1 วินาที
spawn(function()
    while ScreenGui.Parent do
        UpdateStats()
        wait(0.1)
    end
end)

-- ทำให้ลากได้
local dragging = false
local dragInput, mousePos, framePos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - mousePos
        MainFrame.Position = UDim2.new(
            framePos.X.Scale,
            framePos.X.Offset + delta.X,
            framePos.Y.Scale,
            framePos.Y.Offset + delta.Y
        )
    end
end)

-- ปุ่มซ่อน/แสดง UI (กด H)
local isMinimized = false
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
        isMinimized = not isMinimized
        
        if isMinimized then
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 300, 0, 60),
                BackgroundTransparency = 0.5
            }):Play()
            
            for _, child in pairs(MainFrame:GetChildren()) do
                if child ~= Header and child ~= borderFrame and child:IsA("GuiObject") then
                    child.Visible = false
                end
            end
            
            Title.Text = "🐉 DRAGON FARM (Press H)"
        else
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 750, 0, 700),
                BackgroundTransparency = 0.2
            }):Play()
            
            for _, child in pairs(MainFrame:GetChildren()) do
                if child ~= Header and child ~= borderFrame and child:IsA("GuiObject") then
                    child.Visible = true
                end
            end
            
            Title.Text = "🐉 DRAGON FARM PRO"
        end
    end
end)

-- ปุ่มควบคุมฟาร์ม (ใหม่)
local ControlPanel = Instance.new("Frame")
ControlPanel.Name = "ControlPanel"
ControlPanel.Size = UDim2.new(1, -40, 0, 140)
ControlPanel.Position = UDim2.new(0, 20, 0, 570)
ControlPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
ControlPanel.BackgroundTransparency = 0.3
ControlPanel.BorderSizePixel = 0
ControlPanel.Visible = false -- ซ่อนไว้ก่อน
ControlPanel.Parent = MainFrame

local controlCorner = Instance.new("UICorner")
controlCorner.CornerRadius = UDim.new(0, 12)
controlCorner.Parent = ControlPanel

local controlStroke = Instance.new("UIStroke")
controlStroke.Color = Color3.fromRGB(100, 200, 255)
controlStroke.Thickness = 2
controlStroke.Transparency = 0.7
controlStroke.Parent = ControlPanel

-- ฟังก์ชันสร้างปุ่ม
local function CreateButton(text, position, color, parent)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.BackgroundColor3 = color
    button.BackgroundTransparency = 0.3
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.Font = Enum.Font.GothamBold
    button.AutoButtonColor = false
    button.Parent = parent
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = button
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Color3.fromRGB(255, 255, 255)
    btnStroke.Thickness = 2
    btnStroke.Transparency = 0.8
    btnStroke.Parent = button
    
    -- Hover Effect
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.1
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {
            Transparency = 0.5
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.3
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.2), {
            Transparency = 0.8
        }):Play()
    end)
    
    -- Click Effect
    button.MouseButton1Click:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            Size = UDim2.new(0, 190, 0, 45)
        }):Play()
        wait(0.1)
        TweenService:Create(button, TweenInfo.new(0.1), {
            Size = UDim2.new(0, 200, 0, 50)
        }):Play()
    end)
    
    return button
end

-- สร้างปุ่มควบคุม
local StartFarmBtn = CreateButton("▶️ START FARM", UDim2.new(0, 20, 0, 20), Color3.fromRGB(50, 200, 100), ControlPanel)
local StopFarmBtn = CreateButton("⏸️ STOP FARM", UDim2.new(0, 240, 0, 20), Color3.fromRGB(200, 50, 50), ControlPanel)
local ShowStatsBtn = CreateButton("📊 SHOW STATS", UDim2.new(0, 460, 0, 20), Color3.fromRGB(100, 150, 255), ControlPanel)

local ModeToggleBtn = CreateButton("🔄 HYBRID MODE", UDim2.new(0, 20, 0, 80), Color3.fromRGB(200, 150, 50), ControlPanel)
local AntiDetectBtn = CreateButton("🛡️ ANTI-DETECT", UDim2.new(0, 240, 0, 80), Color3.fromRGB(150, 100, 200), ControlPanel)
local SellBtn = CreateButton("💰 SELL ALL", UDim2.new(0, 460, 0, 80), Color3.fromRGB(230, 180, 60), ControlPanel)

-- เชื่อมต่อปุ่มกับฟังก์ชัน
StartFarmBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if _G.StartFarm then
            _G.StartFarm()
            StartFarmBtn.Text = "✅ FARMING..."
            StartFarmBtn.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
            wait(2)
            StartFarmBtn.Text = "▶️ START FARM"
            StartFarmBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        end
    end)
end)

StopFarmBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if _G.StopFarm then
            _G.StopFarm()
            StopFarmBtn.Text = "✅ STOPPED"
            StopFarmBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
            wait(2)
            StopFarmBtn.Text = "⏸️ STOP FARM"
            StopFarmBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        end
    end)
end)

ShowStatsBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if _G.ShowFarmStats then
            _G.ShowFarmStats()
            ShowStatsBtn.Text = "✅ CHECK CONSOLE"
            wait(2)
            ShowStatsBtn.Text = "📊 SHOW STATS"
        end
    end)
end)

local currentModeIndex = 1
local modes = {"Hybrid", "MobOnly", "FoodOnly"}
local modeIcons = {
    Hybrid = "🔄",
    MobOnly = "💀",
    FoodOnly = "🍎"
}

ModeToggleBtn.MouseButton1Click:Connect(function()
    pcall(function()
        currentModeIndex = currentModeIndex + 1
        if currentModeIndex > #modes then
            currentModeIndex = 1
        end
        
        local newMode = modes[currentModeIndex]
        
        if _G.SwitchFarmMode then
            _G.SwitchFarmMode(newMode)
        end
        
        local icon = modeIcons[newMode] or "🔄"
        ModeToggleBtn.Text = icon .. " " .. newMode:upper()
        ModeValue.Text = newMode:upper()
        
        -- เปลี่ยนสี
        if newMode == "Hybrid" then
            ModeToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 50)
        elseif newMode == "MobOnly" then
            ModeToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        else
            ModeToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        end
    end)
end)

local antiDetectEnabled = true
AntiDetectBtn.MouseButton1Click:Connect(function()
    pcall(function()
        antiDetectEnabled = not antiDetectEnabled
        
        if _G.ToggleAntiDetection then
            _G.ToggleAntiDetection(antiDetectEnabled)
        end
        
        if antiDetectEnabled then
            AntiDetectBtn.Text = "🛡️ ANTI-DETECT"
            AntiDetectBtn.BackgroundColor3 = Color3.fromRGB(150, 100, 200)
            AntiDetectStatus.Text = "🛡️ ANTI-DETECT: ON"
            AntiDetectStatus.TextColor3 = Color3.fromRGB(0, 255, 150)
        else
            AntiDetectBtn.Text = "⚠️ DETECT OFF"
            AntiDetectBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            AntiDetectStatus.Text = "🛡️ ANTI-DETECT: OFF"
            AntiDetectStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)
end)

SellBtn.MouseButton1Click:Connect(function()
    pcall(function()
        SellBtn.Text = "💸 SELLING..."
        SellBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
        
        -- เรียกฟังก์ชันขาย (ถ้ามี)
        if getgenv().SellAllItems then
            getgenv().SellAllItems()
        end
        
        wait(3)
        SellBtn.Text = "✅ SOLD!"
        wait(2)
        SellBtn.Text = "💰 SELL ALL"
        SellBtn.BackgroundColor3 = Color3.fromRGB(230, 180, 60)
    end)
end)

-- ปุ่มแสดง/ซ่อน Control Panel (กด C)
local controlPanelVisible = false
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.C then
        controlPanelVisible = not controlPanelVisible
        ControlPanel.Visible = controlPanelVisible
        
        if controlPanelVisible then
            -- ขยาย MainFrame
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 750, 0, 870)
            }):Play()
        else
            -- ย่อ MainFrame
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 750, 0, 700)
            }):Play()
        end
    end
end)

-- แสดงข้อความช่วยเหลือเมื่อเริ่มต้น
spawn(function()
    wait(2)
    
    local HelpNotification = Instance.new("Frame")
    HelpNotification.Name = "HelpNotif"
    HelpNotification.Size = UDim2.new(0, 400, 0, 100)
    HelpNotification.Position = UDim2.new(0.5, -200, 1, 50)
    HelpNotification.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    HelpNotification.BackgroundTransparency = 0.2
    HelpNotification.BorderSizePixel = 0
    HelpNotification.ZIndex = 999999999
    HelpNotification.Parent = ScreenGui
    
    local helpCorner = Instance.new("UICorner")
    helpCorner.CornerRadius = UDim.new(0, 15)
    helpCorner.Parent = HelpNotification
    
    local helpStroke = Instance.new("UIStroke")
    helpStroke.Color = Color3.fromRGB(100, 200, 255)
    helpStroke.Thickness = 3
    helpStroke.Transparency = 0.5
    helpStroke.Parent = HelpNotification
    
    local HelpTitle = Instance.new("TextLabel")
    HelpTitle.Size = UDim2.new(1, -20, 0, 30)
    HelpTitle.Position = UDim2.new(0, 10, 0, 10)
    HelpTitle.BackgroundTransparency = 1
    HelpTitle.Text = "⌨️ HOTKEYS"
    HelpTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
    HelpTitle.TextSize = 20
    HelpTitle.Font = Enum.Font.GothamBold
    HelpTitle.TextXAlignment = Enum.TextXAlignment.Left
    HelpTitle.Parent = HelpNotification
    
    local HelpText = Instance.new("TextLabel")
    HelpText.Size = UDim2.new(1, -20, 0, 50)
    HelpText.Position = UDim2.new(0, 10, 0, 40)
    HelpText.BackgroundTransparency = 1
    HelpText.Text = "Press [H] to Hide/Show UI\nPress [C] to Show/Hide Controls"
    HelpText.TextColor3 = Color3.fromRGB(255, 255, 255)
    HelpText.TextSize = 16
    HelpText.Font = Enum.Font.Gotham
    HelpText.TextXAlignment = Enum.TextXAlignment.Left
    HelpText.TextYAlignment = Enum.TextYAlignment.Top
    HelpText.Parent = HelpNotification
    
    -- Slide in
    TweenService:Create(HelpNotification, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        Position = UDim2.new(0.5, -200, 1, -120)
    }):Play()
    
    -- Auto hide after 5 seconds
    wait(5)
    TweenService:Create(HelpNotification, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
        Position = UDim2.new(0.5, -200, 1, 50),
        BackgroundTransparency = 1
    }):Play()
    
    wait(0.5)
    HelpNotification:Destroy()
end)

-- Notification System
local function ShowNotification(title, message, duration, color)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 350, 0, 80)
    notif.Position = UDim2.new(1, 50, 0, 100)
    notif.BackgroundColor3 = color or Color3.fromRGB(30, 30, 50)
    notif.BackgroundTransparency = 0.2
    notif.BorderSizePixel = 0
    notif.ZIndex = 999999999
    notif.Parent = ScreenGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 12)
    notifCorner.Parent = notif
    
    local notifStroke = Instance.new("UIStroke")
    notifStroke.Color = Color3.fromRGB(255, 255, 255)
    notifStroke.Thickness = 2
    notifStroke.Transparency = 0.7
    notifStroke.Parent = notif
    
    local notifTitle = Instance.new("TextLabel")
    notifTitle.Size = UDim2.new(1, -20, 0, 25)
    notifTitle.Position = UDim2.new(0, 10, 0, 10)
    notifTitle.BackgroundTransparency = 1
    notifTitle.Text = title
    notifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    notifTitle.TextSize = 18
    notifTitle.Font = Enum.Font.GothamBold
    notifTitle.TextXAlignment = Enum.TextXAlignment.Left
    notifTitle.Parent = notif
    
    local notifMsg = Instance.new("TextLabel")
    notifMsg.Size = UDim2.new(1, -20, 0, 35)
    notifMsg.Position = UDim2.new(0, 10, 0, 35)
    notifMsg.BackgroundTransparency = 1
    notifMsg.Text = message
    notifMsg.TextColor3 = Color3.fromRGB(200, 200, 200)
    notifMsg.TextSize = 14
    notifMsg.Font = Enum.Font.Gotham
    notifMsg.TextXAlignment = Enum.TextXAlignment.Left
    notifMsg.TextYAlignment = Enum.TextYAlignment.Top
    notifMsg.TextWrapped = true
    notifMsg.Parent = notif
    
    -- Slide in
    TweenService:Create(notif, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Position = UDim2.new(1, -370, 0, 100)
    }):Play()
    
    -- Auto remove
    spawn(function()
        wait(duration or 3)
        TweenService:Create(notif, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
            Position = UDim2.new(1, 50, 0, 100),
            BackgroundTransparency = 1
        }):Play()
        wait(0.4)
        notif:Destroy()
    end)
end

-- Export notification function
_G.ShowNotification = ShowNotification

-- เมื่อเริ่มต้น
ShowNotification("🐉 DRAGON FARM PRO", "UI Loaded Successfully!\nPress H or C for controls", 4, Color3.fromRGB(50, 150, 255))

print("====================================")
print("🐉 DRAGON FARM PRO UI - LOADED")
print("====================================")
print("⌨️  Hotkeys:")
print("   [H] - Hide/Show UI")
print("   [C] - Show/Hide Control Panel")
print("====================================")
print("📊 Features:")
print("   • Real-time Stats Tracking")
print("   • Farm Rate Calculator")
print("   • Kill & Food Counter")
print("   • Hybrid Mode Progress")
print("   • Quick Control Buttons")
print("====================================")

return {
    ScreenGui = ScreenGui,
    ShowNotification = ShowNotification
}
