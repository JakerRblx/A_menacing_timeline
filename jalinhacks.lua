local enabled = false

local function notifyRareItemSpawn()
    -- Здесь ваш код для оповещения о спавне редкого предмета
    print("Уведомление о спавне редкого предмета")
end

local function toggleNotification()
    enabled = not enabled
    if enabled then
        print("Уведомления включены")
    else
        print("Уведомления выключены")
    end
end

local function createMenu()
    local menu = Instance.new("ScreenGui")
    menu.Name = "Menu"
    menu.Parent = game.Players.LocalPlayer.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 100)
    frame.Position = UDim2.new(0.5, -100, 0.5, -50)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BorderSizePixel = 2
    frame.Parent = menu

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 180, 0, 40)
    toggleButton.Position = UDim2.new(0.5, -90, 0.5, -30)
    toggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    toggleButton.BorderSizePixel = 0
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.Text = "Уведомления: Выключены"
    toggleButton.Parent = frame
    toggleButton.MouseButton1Click:Connect(toggleNotification)
end

createMenu()

-- Подключение функции уведомления к хукам игры
game:GetService("RunService").Stepped:Connect(function()
    if enabled then
        -- Проверка условий спавна редкого предмета и вызов уведомления
        notifyRareItemSpawn()
    end
end)
