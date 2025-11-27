-- Dragon Farm Status UI สำหรับ Roblox (Centered Version)
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

-- Main Container (ตรงกลางจอ)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 500, 0, 420)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- เพิ่ม UICorner
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 20)
mainCorner.Parent = MainFrame

-- เพิ่ม UIScale สำหรับรองรับหน้าจอทุกขนาด
local uiScale = Instance.new("UIScale")
uiScale.Parent = MainFrame

local function updateScale()
    local screenSize = ScreenGui.AbsoluteSize
    local scaleX = screenSize.X / 1920
    local scaleY = screenSize.Y / 1080
    uiScale.Scale = math.min(scaleX, scaleY, 1.2)
end

updateScale()
ScreenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScale)

-- เพิ่ม Border Gradient
local borderFrame = Instance.new("Frame")
borderFrame.Name = "Border"
borderFrame.Size = UDim2.new(1, 4, 1, 4)
borderFrame.Position = UDim2.new(0, -2, 0, -2)
borderFrame.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
borderFrame.BackgroundTransparency = 0.6
borderFrame.ZIndex = 0
borderFrame.Parent = MainFrame

local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 22)
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
Header.Size = UDim2.new(1, 0, 0, 70)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
Header.BackgroundTransparency = 0.3
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 20)
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
Title.Size = UDim2.new(1, -30, 0, 30)
Title.Position = UDim2.new(0, 15, 0, 8)
Title.BackgroundTransparency = 1
Title.Text = "🐉 DRAGON FARM PRO"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Player Name Display
local PlayerNameLabel = Instance.new("TextLabel")
PlayerNameLabel.Name = "PlayerName"
PlayerNameLabel.Size = UDim2.new(1, -30, 0, 20)
PlayerNameLabel.Position = UDim2.new(0, 15, 0, 42)
PlayerNameLabel.BackgroundTransparency = 1
PlayerNameLabel.Text = "👤 " .. LocalPlayer.Name
PlayerNameLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
PlayerNameLabel.TextSize = 14
PlayerNameLabel.Font = Enum.Font.GothamBold
PlayerNameLabel.TextXAlignment = Enum.TextXAlignment.Left
PlayerNameLabel.Parent = Header

-- Status Indicator (มุมขวาบน)
local StatusDot = Instance.new("Frame")
StatusDot.Name = "StatusDot"
StatusDot.Size = UDim2.new(0, 12, 0, 12)
StatusDot.Position = UDim2.new(1, -50, 0, 15)
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
StatusText.Size = UDim2.new(0, 35, 0, 15)
StatusText.Position = UDim2.new(1, -35, 0, 12)
StatusText.BackgroundTransparency = 1
StatusText.Text = "LIVE"
StatusText.TextColor3 = Color3.fromRGB(0, 255, 150)
StatusText.TextSize = 12
StatusText.Font = Enum.Font.GothamBold
StatusText.Parent = Header

-- Stats Container
local StatsContainer = Instance.new("Frame")
StatsContainer.Name = "StatsContainer"
StatsContainer.Size = UDim2.new(1, -30, 0, 250)
StatsContainer.Position = UDim2.new(0, 15, 0, 85)
StatsContainer.BackgroundTransparency = 1
StatsContainer.Parent = MainFrame

local statsLayout = Instance.new("UIListLayout")
statsLayout.Padding = UDim.new(0, 12)
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

-- ฟังก์ชันสร้าง Stat Card
local function CreateStatCard(name, icon, color1, color2, layoutOrder)
    local card = Instance.new("Frame")
    card.Name = name .. "Card"
    card.Size = UDim2.new(1, 0, 0, 70)
    card.BackgroundColor3 = color1
    card.BackgroundTransparency = 0.3
    card.BorderSizePixel = 0
    card.LayoutOrder = layoutOrder
    card.Parent = StatsContainer
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 12)
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
    cardStroke.Thickness = 2
    cardStroke.Transparency = 0.7
    cardStroke.Parent = card
    
    -- Icon
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "Icon"
    iconLabel.Size = UDim2.new(0, 50, 0, 50)
    iconLabel.Position = UDim2.new(0, 12, 0.5, -25)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextSize = 35
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = card
    
    -- Name Label
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(0, 150, 0, 20)
    nameLabel.Position = UDim2.new(0, 70, 0, 12)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = card
    
    -- Value Label
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Size = UDim2.new(1, -80, 0, 35)
    valueLabel.Position = UDim2.new(0, 70, 0, 30)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = "0"
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.TextSize = 28
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextXAlignment = Enum.TextXAlignment.Left
    valueLabel.Parent = card
    
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

-- Session Timer Panel (ล่างสุด)
local TimerPanel = Instance.new("Frame")
TimerPanel.Name = "TimerPanel"
TimerPanel.Size = UDim2.new(1, -30, 0, 60)
TimerPanel.Position = UDim2.new(0, 15, 1, -75)
TimerPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
TimerPanel.BackgroundTransparency = 0.3
TimerPanel.BorderSizePixel = 0
TimerPanel.Parent = MainFrame

local timerCorner = Instance.new("UICorner")
timerCorner.CornerRadius = UDim.new(0, 12)
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
timerStroke.Thickness = 2
timerStroke.Transparency = 0.6
timerStroke.Parent = TimerPanel

-- Timer Icon
local TimerIcon = Instance.new("TextLabel")
TimerIcon.Size = UDim2.new(0, 40, 0, 40)
TimerIcon.Position = UDim2.new(0, 10, 0.5, -20)
TimerIcon.BackgroundTransparency = 1
TimerIcon.Text = "⏱️"
TimerIcon.TextSize = 28
TimerIcon.Font = Enum.Font.GothamBold
TimerIcon.Parent = TimerPanel

-- Timer Label
local TimerLabel = Instance.new("TextLabel")
TimerLabel.Name = "TimerLabel"
TimerLabel.Size = UDim2.new(1, -60, 0, 20)
TimerLabel.Position = UDim2.new(0, 55, 0, 8)
TimerLabel.BackgroundTransparency = 1
TimerLabel.Text = "SESSION TIME"
TimerLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
TimerLabel.TextSize = 12
TimerLabel.Font = Enum.Font.GothamBold
TimerLabel.TextXAlignment = Enum.TextXAlignment.Left
TimerLabel.Parent = TimerPanel

-- Timer Value
local TimerValue = Instance.new("TextLabel")
TimerValue.Name = "TimerValue"
TimerValue.Size = UDim2.new(1, -60, 0, 28)
TimerValue.Position = UDim2.new(0, 55, 0, 28)
TimerValue.BackgroundTransparency = 1
TimerValue.Text = "00:00:00"
TimerValue.TextColor3 = Color3.fromRGB(0, 255, 150)
TimerValue.TextSize = 22
TimerValue.Font = Enum.Font.GothamBold
TimerValue.TextXAlignment = Enum.TextXAlignment.Left
TimerValue.Parent = TimerPanel

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

-- ฟังก์ชันอัพเดทค่า Stats
local function UpdateStats()
    pcall(function()
        -- อัพเดท Bacon
        local bacon = LocalPlayer.Data.Resources.Bacon.Value
        BaconCard.Value.Text = formatNumber(bacon)
        
        -- อัพเดท Meat
        local meat = LocalPlayer.Data.Resources.Meat.Value
        MeatCard.Value.Text = formatNumber(meat)
        
        -- อัพเดท Coins
        local coins = LocalPlayer.Data.Currency.Coins.Value
        CoinsCard.Value.Text = formatNumber(coins)
    end)
end

-- เรียกใช้ UpdateStats ทุกๆ 0.5 วินาที
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



-- Return UI elements สำหรับการควบคุมจากภายนอก
return {
    ScreenGui = ScreenGui
}
