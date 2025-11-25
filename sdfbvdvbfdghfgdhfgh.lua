-- Dragon Farm UI System
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ลบ UI เก่าถ้ามี
if PlayerGui:FindFirstChild("DragonFarmUI") then
    PlayerGui:FindFirstChild("DragonFarmUI"):Destroy()
end

-- สร้าง ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DragonFarmUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = PlayerGui

-- Background Gradient
local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
background.BorderSizePixel = 0
background.Parent = screenGui
background.BackgroundTransparency = 1

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
bgGradient.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0.8),
    NumberSequenceKeypoint.new(1, 1)
}
bgGradient.Parent = background


-- Timer Container
local timerContainer = Instance.new("Frame")
timerContainer.Name = "TimerContainer"
timerContainer.Size = UDim2.new(0, 600, 0, 120)
timerContainer.Position = UDim2.new(0.5, -300, 0, 40)
timerContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
timerContainer.BorderSizePixel = 0
timerContainer.Parent = screenGui

local timerCorner = Instance.new("UICorner")
timerCorner.CornerRadius = UDim.new(0, 20)
timerCorner.Parent = timerContainer

local timerStroke = Instance.new("UIStroke")
timerStroke.Color = Color3.fromRGB(100, 80, 255)
timerStroke.Thickness = 3
timerStroke.Parent = timerContainer

-- Timer Label
local timerLabel = Instance.new("TextLabel")
timerLabel.Name = "Timer"
timerLabel.Size = UDim2.new(1, 0, 1, 0)
timerLabel.BackgroundTransparency = 1
timerLabel.Font = Enum.Font.GothamBold
timerLabel.TextSize = 80
timerLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
timerLabel.Text = "00:00:00"
timerLabel.Parent = timerContainer

-- Stats Container
local statsContainer = Instance.new("Frame")
statsContainer.Name = "StatsContainer"
statsContainer.Size = UDim2.new(0, 900, 0, 400)
statsContainer.Position = UDim2.new(0.5, -450, 0.5, -150)
statsContainer.BackgroundTransparency = 1
statsContainer.Parent = screenGui

-- Bacon Card
local baconCard = Instance.new("Frame")
baconCard.Name = "BaconCard"
baconCard.Size = UDim2.new(0, 400, 0, 150)
baconCard.Position = UDim2.new(0, 0, 0, 0)
baconCard.BackgroundColor3 = Color3.fromRGB(150, 80, 60)
baconCard.BorderSizePixel = 0
baconCard.Parent = statsContainer

local baconCorner = Instance.new("UICorner")
baconCorner.CornerRadius = UDim.new(0, 25)
baconCorner.Parent = baconCard

local baconGradient = Instance.new("UIGradient")
baconGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 100, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 70, 50))
}
baconGradient.Rotation = 90
baconGradient.Parent = baconCard

local baconStroke = Instance.new("UIStroke")
baconStroke.Color = Color3.fromRGB(255, 150, 120)
baconStroke.Thickness = 4
baconStroke.Parent = baconCard

-- Bacon Icon
local baconIcon = Instance.new("TextLabel")
baconIcon.Size = UDim2.new(0, 80, 0, 80)
baconIcon.Position = UDim2.new(0, 20, 0.5, -40)
baconIcon.BackgroundTransparency = 1
baconIcon.Font = Enum.Font.GothamBold
baconIcon.TextSize = 60
baconIcon.Text = "🥓"
baconIcon.Parent = baconCard

-- Bacon Title
local baconTitle = Instance.new("TextLabel")
baconTitle.Size = UDim2.new(0, 280, 0, 50)
baconTitle.Position = UDim2.new(0, 110, 0, 20)
baconTitle.BackgroundTransparency = 1
baconTitle.Font = Enum.Font.GothamBold
baconTitle.TextSize = 32
baconTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
baconTitle.Text = "Bacon"
baconTitle.TextXAlignment = Enum.TextXAlignment.Left
baconTitle.Parent = baconCard

-- Bacon Value
local baconValue = Instance.new("TextLabel")
baconValue.Name = "Value"
baconValue.Size = UDim2.new(0, 280, 0, 70)
baconValue.Position = UDim2.new(0, 110, 0, 65)
baconValue.BackgroundTransparency = 1
baconValue.Font = Enum.Font.GothamBold
baconValue.TextSize = 48
baconValue.TextColor3 = Color3.fromRGB(255, 255, 150)
baconValue.Text = "0"
baconValue.TextXAlignment = Enum.TextXAlignment.Left
baconValue.Parent = baconCard

-- Meat Card
local meatCard = Instance.new("Frame")
meatCard.Name = "MeatCard"
meatCard.Size = UDim2.new(0, 400, 0, 150)
meatCard.Position = UDim2.new(0, 500, 0, 0)
meatCard.BackgroundColor3 = Color3.fromRGB(180, 70, 90)
meatCard.BorderSizePixel = 0
meatCard.Parent = statsContainer

local meatCorner = Instance.new("UICorner")
meatCorner.CornerRadius = UDim.new(0, 25)
meatCorner.Parent = meatCard

local meatGradient = Instance.new("UIGradient")
meatGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 80, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 60, 80))
}
meatGradient.Rotation = 90
meatGradient.Parent = meatCard

local meatStroke = Instance.new("UIStroke")
meatStroke.Color = Color3.fromRGB(255, 120, 140)
meatStroke.Thickness = 4
meatStroke.Parent = meatCard

-- Meat Icon
local meatIcon = Instance.new("TextLabel")
meatIcon.Size = UDim2.new(0, 80, 0, 80)
meatIcon.Position = UDim2.new(0, 20, 0.5, -40)
meatIcon.BackgroundTransparency = 1
meatIcon.Font = Enum.Font.GothamBold
meatIcon.TextSize = 60
meatIcon.Text = "🥩"
meatIcon.Parent = meatCard

-- Meat Title
local meatTitle = Instance.new("TextLabel")
meatTitle.Size = UDim2.new(0, 280, 0, 50)
meatTitle.Position = UDim2.new(0, 110, 0, 20)
meatTitle.BackgroundTransparency = 1
meatTitle.Font = Enum.Font.GothamBold
meatTitle.TextSize = 32
meatTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
meatTitle.Text = "Meat"
meatTitle.TextXAlignment = Enum.TextXAlignment.Left
meatTitle.Parent = meatCard

-- Meat Value
local meatValue = Instance.new("TextLabel")
meatValue.Name = "Value"
meatValue.Size = UDim2.new(0, 280, 0, 70)
meatValue.Position = UDim2.new(0, 110, 0, 65)
meatValue.BackgroundTransparency = 1
meatValue.Font = Enum.Font.GothamBold
meatValue.TextSize = 48
meatValue.TextColor3 = Color3.fromRGB(255, 255, 150)
meatValue.Text = "0"
meatValue.TextXAlignment = Enum.TextXAlignment.Left
meatValue.Parent = meatCard

-- Coins Card
local coinsCard = Instance.new("Frame")
coinsCard.Name = "CoinsCard"
coinsCard.Size = UDim2.new(0, 900, 0, 200)
coinsCard.Position = UDim2.new(0, 0, 0, 200)
coinsCard.BackgroundColor3 = Color3.fromRGB(220, 180, 50)
coinsCard.BorderSizePixel = 0
coinsCard.Parent = statsContainer

local coinsCorner = Instance.new("UICorner")
coinsCorner.CornerRadius = UDim.new(0, 30)
coinsCorner.Parent = coinsCard

local coinsGradient = Instance.new("UIGradient")
coinsGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 220, 100)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(230, 190, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 160, 50))
}
coinsGradient.Rotation = 90
coinsGradient.Parent = coinsCard

local coinsStroke = Instance.new("UIStroke")
coinsStroke.Color = Color3.fromRGB(255, 240, 150)
coinsStroke.Thickness = 5
coinsStroke.Parent = coinsCard

-- Coins Icon
local coinsIcon = Instance.new("TextLabel")
coinsIcon.Size = UDim2.new(0, 120, 0, 120)
coinsIcon.Position = UDim2.new(0, 30, 0.5, -60)
coinsIcon.BackgroundTransparency = 1
coinsIcon.Font = Enum.Font.GothamBold
coinsIcon.TextSize = 90
coinsIcon.Text = "💰"
coinsIcon.Parent = coinsCard

-- Coins Title
local coinsTitle = Instance.new("TextLabel")
coinsTitle.Size = UDim2.new(0, 720, 0, 60)
coinsTitle.Position = UDim2.new(0, 160, 0, 30)
coinsTitle.BackgroundTransparency = 1
coinsTitle.Font = Enum.Font.GothamBold
coinsTitle.TextSize = 40
coinsTitle.TextColor3 = Color3.fromRGB(80, 50, 20)
coinsTitle.Text = "Coins"
coinsTitle.TextXAlignment = Enum.TextXAlignment.Left
coinsTitle.Parent = coinsCard

-- Coins Value
local coinsValue = Instance.new("TextLabel")
coinsValue.Name = "Value"
coinsValue.Size = UDim2.new(0, 720, 0, 100)
coinsValue.Position = UDim2.new(0, 160, 0, 85)
coinsValue.BackgroundTransparency = 1
coinsValue.Font = Enum.Font.GothamBold
coinsValue.TextSize = 70
coinsValue.TextColor3 = Color3.fromRGB(255, 255, 255)
coinsValue.Text = "0"
coinsValue.TextXAlignment = Enum.TextXAlignment.Left
coinsValue.Parent = coinsCard

-- Log Container (Bottom)
local logContainer = Instance.new("Frame")
logContainer.Name = "LogContainer"
logContainer.Size = UDim2.new(0, 900, 0, 150)
logContainer.Position = UDim2.new(0.5, -450, 1, -170)
logContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
logContainer.BorderSizePixel = 0
logContainer.BackgroundTransparency = 0.3
logContainer.Parent = screenGui

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 20)
logCorner.Parent = logContainer

local logStroke = Instance.new("UIStroke")
logStroke.Color = Color3.fromRGB(80, 80, 120)
logStroke.Thickness = 2
logStroke.Parent = logContainer

-- Log Text
local logText = Instance.new("TextLabel")
logText.Name = "LogText"
logText.Size = UDim2.new(1, -40, 1, -40)
logText.Position = UDim2.new(0, 20, 0, 20)
logText.BackgroundTransparency = 1
logText.Font = Enum.Font.GothamMedium
logText.TextSize = 22
logText.TextColor3 = Color3.fromRGB(200, 200, 255)
logText.Text = "🐉 Waiting for farm to start..."
logText.TextWrapped = true
logText.TextXAlignment = Enum.TextXAlignment.Left
logText.TextYAlignment = Enum.TextYAlignment.Top
logText.Parent = logContainer

-- Format number with commas
local function formatNumber(num)
    local formatted = tostring(num)
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

-- Update Stats
local startTime = tick()
local function updateStats()
    pcall(function()
        -- Timer
        local elapsed = tick() - startTime
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = math.floor(elapsed % 60)
        timerLabel.Text = string.format("%02d:%02d:%02d", hours, minutes, seconds)
        
        -- Bacon
        local bacon = LocalPlayer.Data.Resources.Bacon.Value
        baconValue.Text = formatNumber(bacon)
        
        -- Meat
        local meat = LocalPlayer.Data.Resources.Meat.Value
        meatValue.Text = formatNumber(meat)
        
        -- Coins
        local coins = LocalPlayer.Data.Currency.Coins.Value
        coinsValue.Text = formatNumber(coins)
    end)
end

-- Animation Loop for glow effect
spawn(function()
    while screenGui.Parent do
        -- Animate timer stroke
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
        local tween = TweenService:Create(timerStroke, tweenInfo, {
            Color = Color3.fromRGB(150, 100, 255)
        })
        tween:Play()
        
        task.wait(60)
    end
end)

-- Update Loop
spawn(function()
    while screenGui.Parent do
        updateStats()
        task.wait(0.5)
    end
end)

-- Log Function (สำหรับใช้จาก script อื่น)
getgenv().UpdateFarmLog = function(message)
    pcall(function()
        logText.Text = message
    end)
end

-- Export UI elements
return {
    ScreenGui = screenGui,
    UpdateLog = getgenv().UpdateFarmLog,
    LogText = logText
}
