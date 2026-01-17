local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("DragonFarmUI") then
    PlayerGui:FindFirstChild("DragonFarmUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DragonFarmUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999999
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 750, 0, 780)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 999999999
MainFrame.Parent = ScreenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 25)
mainCorner.Parent = MainFrame

local uiScale = Instance.new("UIScale")
uiScale.Parent = MainFrame

local function updateScale()
    local screenSize = ScreenGui.AbsoluteSize
    local scaleX = screenSize.X / 1920
    local scaleY = screenSize.Y / 1080
    uiScale.Scale = math.max(math.min(scaleX, scaleY, 1.5), 0.7)
end

updateScale()
ScreenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScale)

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

spawn(function()
    while MainFrame.Parent do
        for i = 0, 360, 2 do
            if not MainFrame.Parent then break end
            borderGradient.Rotation = i
            wait(0.03)
        end
    end
end)

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

local StatsContainer = Instance.new("Frame")
StatsContainer.Name = "StatsContainer"
StatsContainer.Size = UDim2.new(1, -40, 0, 440)
StatsContainer.Position = UDim2.new(0, 20, 0, 200)
StatsContainer.BackgroundTransparency = 1
StatsContainer.Parent = MainFrame

local statsLayout = Instance.new("UIListLayout")
statsLayout.Padding = UDim.new(0, 10)
statsLayout.SortOrder = Enum.SortOrder.LayoutOrder
statsLayout.Parent = StatsContainer

local function formatNumber(num)
    local formatted = tostring(math.floor(num))
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

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
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "Icon"
    iconLabel.Size = UDim2.new(0, 70, 0, 70)
    iconLabel.Position = UDim2.new(0, 15, 0.5, -35)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextSize = 50
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = card
    
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
    
    local rateLabel = Instance.new("TextLabel")
    rateLabel.Name = "RateLabel"
    rateLabel.Size = UDim2.new(0, 200, 0, 22)
    rateLabel.Position = UDim2.new(1, -210, 0, 20)
    rateLabel.BackgroundTransparency = 1
    rateLabel.Text = "📈 Calculating..."
    rateLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
    rateLabel.TextSize = 16
    rateLabel.Font = Enum.Font.GothamBold
    rateLabel.TextXAlignment = Enum.TextXAlignment.Right
    rateLabel.Parent = card
    
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

local FruitCard = CreateStatCard("Fruit", "🍎", Color3.fromRGB(220, 80, 80), Color3.fromRGB(180, 50, 50), 1)
local BaconCard = CreateStatCard("Bacon", "🥓", Color3.fromRGB(160, 90, 70), Color3.fromRGB(120, 60, 45), 2)
local MeatCard = CreateStatCard("Meat", "🥩", Color3.fromRGB(190, 80, 100), Color3.fromRGB(140, 50, 70), 3)
local CoinsCard = CreateStatCard("Coins", "💰", Color3.fromRGB(230, 180, 60), Color3.fromRGB(180, 140, 40), 4)

local TimerPanel = Instance.new("Frame")
TimerPanel.Name = "TimerPanel"
TimerPanel.Size = UDim2.new(1, -40, 0, 85)
TimerPanel.Position = UDim2.new(0, 20, 0, 660)
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

local FruitList = {
    "Apple", "Banana", "Avacado", "Cherry", "Dragonfruit", "GoldenApple", 
    "GoldenDragonfruit", "GoldenPear", "Grapes", "KajiFruit", "Lemon", 
    "Lime", "Peach", "Pear", "Pineapple", "PricklyPear", "SunOrange", 
    "Watermelon", "Blueberry", "Strawberry", "Almond", "Coconut", 
    "CacaoBean", "JuniperBerry", "Aloe", "Lotus", "Edamame", "Broccoli",
    "Chili", "Corn", "Onion", "Potato", "Carrot", "Pumpkin", "MistSudachi"
}

local function GetTotalFruits()
    local total = 0
    pcall(function()
        if not LocalPlayer:FindFirstChild("Data") then return end
        local resources = LocalPlayer.Data:FindFirstChild("Resources")
        if not resources then return end
        
        for _, fruitName in pairs(FruitList) do
            local fruit = resources:FindFirstChild(fruitName)
            if fruit and (fruit:IsA("NumberValue") or fruit:IsA("IntValue")) then
                total = total + fruit.Value
            end
        end
    end)
    return total
end

local sessionStartTime = tick()
local startTime = tick()
local startFruit = 0
local startBacon = 0
local startMeat = 0
local startCoins = 0

local function WaitForData()
    local maxWait = 10
    local waited = 0
    while waited < maxWait do
        if LocalPlayer:FindFirstChild("Data") then
            local data = LocalPlayer.Data
            if data:FindFirstChild("Resources") and data:FindFirstChild("Currency") then
                return true
            end
        end
        wait(0.5)
        waited = waited + 0.5
    end
    return false
end

spawn(function()
    if not WaitForData() then
        warn("Cannot load Data")
        return
    end
    
    wait(2)
    
    pcall(function()
        startFruit = GetTotalFruits()
        startBacon = LocalPlayer.Data.Resources.Bacon.Value or 0
        startMeat = LocalPlayer.Data.Resources.Meat.Value or 0
        startCoins = LocalPlayer.Data.Currency.Coins.Value or 0
    end)
end)

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

local function UpdateStats()
    pcall(function()
        if not LocalPlayer:FindFirstChild("Data") then return end
        if not LocalPlayer.Data:FindFirstChild("Resources") then return end
        if not LocalPlayer.Data:FindFirstChild("Currency") then return end
        
        local currentTime = tick()
        local elapsed = currentTime - startTime
        local hoursElapsed = elapsed / 3600
        
        local fruit = GetTotalFruits()
        FruitCard.Value.Text = formatNumber(fruit)
        
        if hoursElapsed > 0 and elapsed > 10 then
            local fruitGained = fruit - startFruit
            local fruitRate = fruitGained / hoursElapsed
            FruitCard.RateLabel.Text = "📈 +" .. formatNumber(math.floor(fruitRate)) .. "/hr"
        end
        
        local bacon = LocalPlayer.Data.Resources.Bacon.Value or 0
        BaconCard.Value.Text = formatNumber(bacon)
        
        if hoursElapsed > 0 and elapsed > 10 then
            local baconGained = bacon - startBacon
            local baconRate = baconGained / hoursElapsed
            BaconCard.RateLabel.Text = "📈 +" .. formatNumber(math.floor(baconRate)) .. "/hr"
        end
        
        local meat = LocalPlayer.Data.Resources.Meat.Value or 0
        MeatCard.Value.Text = formatNumber(meat)
        
        if hoursElapsed > 0 and elapsed > 10 then
            local meatGained = meat - startMeat
            local meatRate = meatGained / hoursElapsed
            MeatCard.RateLabel.Text = "📈 +" .. formatNumber(math.floor(meatRate)) .. "/hr"
        end
        
        local coins = LocalPlayer.Data.Currency.Coins.Value or 0
        CoinsCard.Value.Text = formatNumber(coins)
        
        if hoursElapsed > 0 and elapsed > 10 then
            local coinsGained = coins - startCoins
            local coinRate = coinsGained / hoursElapsed
            CoinsCard.RateLabel.Text = "📈 +" .. formatNumber(math.floor(coinRate)) .. "/hr"
        end
        
        if getgenv().Config then
            local config = getgenv().Config
            
            if config.FarmMode == "Hybrid" and config.HybridSettings then
                local meatTarget = config.HybridSettings.MeatTarget
                local fruitTarget = config.HybridSettings.FruitTarget
                
                local meatProgress = math.floor((meat / meatTarget) * 100)
                local fruitProgress = math.floor((fruit / fruitTarget) * 100)
                
                MeatCard.ProgressLabel.Text = "🎯 " .. math.min(meatProgress, 100) .. "% of " .. formatNumber(meatTarget)
                FruitCard.ProgressLabel.Text = "🎯 " .. math.min(fruitProgress, 100) .. "% of " .. formatNumber(fruitTarget)
            end
            
            ModeValue.Text = config.FarmMode or "UNKNOWN"
            
            if config.AntiDetection and config.AntiDetection.Enabled then
                AntiDetectStatus.Text = "🛡️ ANTI-DETECT: ON"
                AntiDetectStatus.TextColor3 = Color3.fromRGB(0, 255, 150)
            else
                AntiDetectStatus.Text = "🛡️ ANTI-DETECT: OFF"
                AntiDetectStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
            end
        end
        
        if getgenv().FarmingStats then
            local stats = getgenv().FarmingStats
            KillCounter.Text = "💀 Kills: " .. formatNumber(stats.MobsKilled or 0)
            FoodCounter.Text = "🍎 Food: " .. formatNumber(stats.FoodCollected or 0)
        end
    end)
end

spawn(function()
    wait(3)
    
    while ScreenGui.Parent do
        UpdateStats()
        wait(0.5)
    end
end)

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
                Size = UDim2.new(0, 750, 0, 780),
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
    
    TweenService:Create(notif, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Position = UDim2.new(1, -370, 0, 100)
    }):Play()
    
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

_G.ShowNotification = ShowNotification

spawn(function()
    wait(2)
    
    local HelpNotification = Instance.new("Frame")
    HelpNotification.Name = "HelpNotif"
    HelpNotification.Size = UDim2.new(0, 400, 0, 120)
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
    HelpTitle.Text = "⌨️ CONTROLS"
    HelpTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
    HelpTitle.TextSize = 20
    HelpTitle.Font = Enum.Font.GothamBold
    HelpTitle.TextXAlignment = Enum.TextXAlignment.Left
    HelpTitle.Parent = HelpNotification
    
    local HelpText = Instance.new("TextLabel")
    HelpText.Size = UDim2.new(1, -20, 0, 70)
    HelpText.Position = UDim2.new(0, 10, 0, 40)
    HelpText.BackgroundTransparency = 1
    HelpText.Text = "Press [H] to Hide/Show UI\n\n_G.StartFarm() - Start Farming\n_G.StopFarm() - Stop Farming\n_G.ShowFarmStats() - Show Stats"
    HelpText.TextColor3 = Color3.fromRGB(255, 255, 255)
    HelpText.TextSize = 14
    HelpText.Font = Enum.Font.Gotham
    HelpText.TextXAlignment = Enum.TextXAlignment.Left
    HelpText.TextYAlignment = Enum.TextYAlignment.Top
    HelpText.Parent = HelpNotification
    
    TweenService:Create(HelpNotification, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        Position = UDim2.new(0.5, -200, 1, -140)
    }):Play()
    
    wait(6)
    TweenService:Create(HelpNotification, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
        Position = UDim2.new(0.5, -200, 1, 50),
        BackgroundTransparency = 1
    }):Play()
    
    wait(0.5)
    HelpNotification:Destroy()
end)

ShowNotification("🐉 DRAGON FARM PRO", "UI Loaded Successfully!\nStats tracking active", 4, Color3.fromRGB(50, 150, 255))

return {
    ScreenGui = ScreenGui,
    ShowNotification = ShowNotification
}
