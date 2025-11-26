local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("DragonFarmUI") then
    PlayerGui:FindFirstChild("DragonFarmUI"):Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DragonFarmUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = PlayerGui

local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
background.BorderSizePixel = 0
background.Parent = screenGui
background.BackgroundTransparency = 1

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 15, 35)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 10, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 20, 40))
}
bgGradient.Rotation = 45
bgGradient.Parent = background

local mainContainer = Instance.new("Frame")
mainContainer.Name = "MainContainer"
mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
mainContainer.Size = UDim2.new(0, 1000, 0, 700)
mainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
mainContainer.BackgroundTransparency = 1
mainContainer.Parent = screenGui

local scale = Instance.new("UIScale")
scale.Parent = mainContainer

local function updateScale()
    local screenSize = background.AbsoluteSize
    local scaleX = screenSize.X / 1920
    local scaleY = screenSize.Y / 1080
    scale.Scale = math.min(scaleX, scaleY, 1.2)
end

updateScale()
screenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScale)

local headerFrame = Instance.new("Frame")
headerFrame.Name = "Header"
headerFrame.Size = UDim2.new(1, 0, 0, 100)
headerFrame.BackgroundColor3 = Color3.fromRGB(35, 25, 55)
headerFrame.BorderSizePixel = 0
headerFrame.Parent = mainContainer

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 20)
headerCorner.Parent = headerFrame

local headerStroke = Instance.new("UIStroke")
headerStroke.Color = Color3.fromRGB(120, 80, 200)
headerStroke.Thickness = 3
headerStroke.Transparency = 0.3
headerStroke.Parent = headerFrame

local headerGlow = Instance.new("UIGradient")
headerGlow.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 50, 150)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 70, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 50, 150))
}
headerGlow.Rotation = 90
headerGlow.Parent = headerFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.6, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 20, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 42
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Text = "🐉 DRAGON FARM PRO"
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = headerFrame

local timerLabel = Instance.new("TextLabel")
timerLabel.Name = "Timer"
timerLabel.Size = UDim2.new(0.35, 0, 1, 0)
timerLabel.Position = UDim2.new(0.65, -10, 0, 0)
timerLabel.BackgroundTransparency = 1
timerLabel.Font = Enum.Font.GothamBold
timerLabel.TextSize = 36
timerLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
timerLabel.Text = "⏱️ 00:00:00"
timerLabel.TextXAlignment = Enum.TextXAlignment.Right
timerLabel.Parent = headerFrame

local exitButton = Instance.new("TextButton")
exitButton.Name = "ExitButton"
exitButton.AnchorPoint = Vector2.new(1, 0)
exitButton.Size = UDim2.new(0, 80, 0, 80)
exitButton.Position = UDim2.new(1, -10, 0, -150)
exitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
exitButton.BorderSizePixel = 0
exitButton.Font = Enum.Font.GothamBold
exitButton.TextSize = 40
exitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
exitButton.Text = "X"
exitButton.AutoButtonColor = false
exitButton.Parent = headerFrame

local exitCorner = Instance.new("UICorner")
exitCorner.CornerRadius = UDim.new(0, 15)
exitCorner.Parent = exitButton

local exitStroke = Instance.new("UIStroke")
exitStroke.Color = Color3.fromRGB(255, 100, 100)
exitStroke.Thickness = 2
exitStroke.Parent = exitButton

exitButton.MouseButton1Click:Connect(function()
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local scaleDown = TweenService:Create(exitButton, tweenInfo, {Size = UDim2.new(0, 70, 0, 70)})
    scaleDown:Play()
    scaleDown.Completed:Wait()
    
    local scaleUp = TweenService:Create(exitButton, tweenInfo, {Size = UDim2.new(0, 80, 0, 80)})
    scaleUp:Play()
    
    exitButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    exitButton.Text = "⚠️"
    task.wait(0.3)
    
    game:Shutdown()
end)

exitButton.MouseEnter:Connect(function()
    local tween = TweenService:Create(exitButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(255, 70, 70),
        Size = UDim2.new(0, 85, 0, 85)
    })
    tween:Play()
end)

exitButton.MouseLeave:Connect(function()
    local tween = TweenService:Create(exitButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(200, 50, 50),
        Size = UDim2.new(0, 80, 0, 80)
    })
    tween:Play()
end)

local statsContainer = Instance.new("Frame")
statsContainer.Name = "StatsContainer"
statsContainer.Size = UDim2.new(1, 0, 0, 380)
statsContainer.Position = UDim2.new(0, 0, 0, 120)
statsContainer.BackgroundTransparency = 1
statsContainer.Parent = mainContainer

local statsLayout = Instance.new("UIListLayout")
statsLayout.Padding = UDim.new(0, 15)
statsLayout.SortOrder = Enum.SortOrder.LayoutOrder
statsLayout.Parent = statsContainer

local function createStatCard(name, icon, color1, color2, order)
    local card = Instance.new("Frame")
    card.Name = name .. "Card"
    card.Size = UDim2.new(1, 0, 0, 115)
    card.BackgroundColor3 = color1
    card.BorderSizePixel = 0
    card.LayoutOrder = order
    card.Parent = statsContainer
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 18)
    corner.Parent = card
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(1, color2)
    }
    gradient.Rotation = 135
    gradient.Parent = card
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.new(1, 1, 1)
    stroke.Thickness = 3
    stroke.Transparency = 0.7
    stroke.Parent = card
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 90, 0, 90)
    iconLabel.Position = UDim2.new(0, 15, 0.5, -45)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextSize = 65
    iconLabel.Text = icon
    iconLabel.Parent = card
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(0, 400, 0, 40)
    titleLabel.Position = UDim2.new(0, 120, 0, 15)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 28
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = name
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = card
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Size = UDim2.new(0, 850, 0, 60)
    valueLabel.Position = UDim2.new(0, 120, 0, 50)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextSize = 45
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 200)
    valueLabel.Text = "0"
    valueLabel.TextXAlignment = Enum.TextXAlignment.Left
    valueLabel.Parent = card
    
    spawn(function()
        while card.Parent do
            local pulse = TweenService:Create(stroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
                Transparency = 0.4
            })
            pulse:Play()
            task.wait(120)
        end
    end)
    
    return card
end

local baconCard = createStatCard("Bacon", "🥓", Color3.fromRGB(160, 90, 70), Color3.fromRGB(120, 60, 45), 1)
local meatCard = createStatCard("Meat", "🥩", Color3.fromRGB(190, 80, 100), Color3.fromRGB(140, 50, 70), 2)
local coinsCard = createStatCard("Coins", "💰", Color3.fromRGB(230, 180, 60), Color3.fromRGB(180, 140, 40), 3)

local logContainer = Instance.new("Frame")
logContainer.Name = "LogContainer"
logContainer.Size = UDim2.new(1, 0, 0, 160)
logContainer.Position = UDim2.new(0, 0, 0, 520)
logContainer.BackgroundColor3 = Color3.fromRGB(25, 20, 40)
logContainer.BorderSizePixel = 0
logContainer.Parent = mainContainer

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 18)
logCorner.Parent = logContainer

local logStroke = Instance.new("UIStroke")
logStroke.Color = Color3.fromRGB(100, 80, 180)
logStroke.Thickness = 2
logStroke.Transparency = 0.5
logStroke.Parent = logContainer

local logGradient = Instance.new("UIGradient")
logGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 15, 35))
}
logGradient.Rotation = 90
logGradient.Parent = logContainer

local logTitle = Instance.new("TextLabel")
logTitle.Size = UDim2.new(1, -30, 0, 35)
logTitle.Position = UDim2.new(0, 15, 0, 10)
logTitle.BackgroundTransparency = 1
logTitle.Font = Enum.Font.GothamBold
logTitle.TextSize = 22
logTitle.TextColor3 = Color3.fromRGB(150, 150, 200)
logTitle.Text = "📋 FARM STATUS"
logTitle.TextXAlignment = Enum.TextXAlignment.Left
logTitle.Parent = logContainer

local logText = Instance.new("TextLabel")
logText.Name = "LogText"
logText.Size = UDim2.new(1, -30, 1, -55)
logText.Position = UDim2.new(0, 15, 0, 45)
logText.BackgroundTransparency = 1
logText.Font = Enum.Font.GothamMedium
logText.TextSize = 20
logText.TextColor3 = Color3.fromRGB(200, 255, 200)
logText.Text = "🐉 Waiting for farm to start..."
logText.TextWrapped = true
logText.TextXAlignment = Enum.TextXAlignment.Left
logText.TextYAlignment = Enum.TextYAlignment.Top
logText.Parent = logContainer

local formatNumber = function(num)
    local formatted = tostring(num)
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

local startTime = tick()
local function updateStats()
    pcall(function()
        local elapsed = tick() - startTime
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = math.floor(elapsed % 60)
        timerLabel.Text = string.format("⏱️ %02d:%02d:%02d", hours, minutes, seconds)
        
        local bacon = LocalPlayer.Data.Resources.Bacon.Value
        baconCard.Value.Text = formatNumber(bacon)
        
        local meat = LocalPlayer.Data.Resources.Meat.Value
        meatCard.Value.Text = formatNumber(meat)
        
        local coins = LocalPlayer.Data.Currency.Coins.Value
        coinsCard.Value.Text = formatNumber(coins)
    end)
end

spawn(function()
    while screenGui.Parent do
        local glow = TweenService:Create(headerStroke, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            Color = Color3.fromRGB(180, 120, 255)
        })
        glow:Play()
        task.wait(180)
    end
end)

spawn(function()
    while screenGui.Parent do
        updateStats()
        task.wait(0.5)
    end
end)

getgenv().UpdateFarmLog = function(message)
    pcall(function()
        logText.Text = message
    end)
end

return {
    ScreenGui = screenGui,
    UpdateLog = getgenv().UpdateFarmLog,
    LogText = logText
}
