-- NightHook(PAID) Full Script with Mobile-Optimized ESP
-- Mobile-friendly version with reduced lag and optimized performance

-- Key System Implementation with Purple, Black, and Pink Theme
local keySystemGui = Instance.new("ScreenGui")
keySystemGui.Name = "KeySystem"
keySystemGui.ResetOnSpawn = false
keySystemGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Custom dragging function
local function makeDraggable(handle, frame)
    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Main frame with premium design - Mobile optimized
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 350, 0, 180)
keyFrame.Position = UDim2.new(0.5, -175, 0.5, -90)
keyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
keyFrame.BorderSizePixel = 0
keyFrame.Active = true
keyFrame.Draggable = false -- Disabled for custom dragging
keyFrame.Parent = keySystemGui

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 15)
keyCorner.Parent = keyFrame

-- Gradient overlay
local gradientOverlay = Instance.new("Frame")
gradientOverlay.Size = UDim2.new(1, 0, 1, 0)
gradientOverlay.Position = UDim2.new(0, 0, 0, 0)
gradientOverlay.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
gradientOverlay.BorderSizePixel = 0
gradientOverlay.BackgroundTransparency = 0.8
gradientOverlay.ZIndex = 1
gradientOverlay.Parent = keyFrame

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 2
titleBar.Parent = keyFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleBar

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 1, 0)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "NIGHTHOOK AUTHENTICATION"
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 16
keyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTitle.ZIndex = 3
keyTitle.Parent = titleBar

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 0, 128)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
titleGradient.Rotation = 90
titleGradient.Parent = keyTitle

-- Make keyFrame draggable by titleBar
makeDraggable(titleBar, keyFrame)

-- Logo container
local logoContainer = Instance.new("Frame")
logoContainer.Size = UDim2.new(0, 100, 0, 80)
logoContainer.Position = UDim2.new(0, 15, 0, 50)
logoContainer.BackgroundColor3 = Color3.fromRGB(25, 0, 45)
logoContainer.BorderSizePixel = 0
logoContainer.ZIndex = 2
logoContainer.Parent = keyFrame

local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(0, 10)
logoCorner.Parent = logoContainer

-- NightHook Logo
local logoFrame = Instance.new("Frame")
logoFrame.Size = UDim2.new(0, 80, 0, 40)
logoFrame.Position = UDim2.new(0.5, -40, 0, 10)
logoFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
logoFrame.BorderSizePixel = 0
logoFrame.ZIndex = 3
logoFrame.Parent = logoContainer

local logoFrameCorner = Instance.new("UICorner")
logoFrameCorner.CornerRadius = UDim.new(0, 8)
logoFrameCorner.Parent = logoFrame

local nightHookText = Instance.new("TextLabel")
nightHookText.Size = UDim2.new(0, 80, 0, 18)
nightHookText.Position = UDim2.new(0, 0, 0, 5)
nightHookText.BackgroundTransparency = 1
nightHookText.Text = "NightHook"
nightHookText.Font = Enum.Font.GothamBold
nightHookText.TextSize = 12
nightHookText.TextColor3 = Color3.fromRGB(128, 0, 128)
nightHookText.TextXAlignment = Enum.TextXAlignment.Center
nightHookText.ZIndex = 4
nightHookText.Parent = logoFrame

local paidText = Instance.new("TextLabel")
paidText.Size = UDim2.new(0, 80, 0, 14)
paidText.Position = UDim2.new(0, 0, 0, 20)
paidText.BackgroundTransparency = 1
paidText.Text = "(PAID)"
paidText.Font = Enum.Font.GothamBold
paidText.TextSize = 10
paidText.TextColor3 = Color3.fromRGB(255, 255, 255)
paidText.TextXAlignment = Enum.TextXAlignment.Center
paidText.ZIndex = 4
paidText.Parent = logoFrame

-- Input container
local inputContainer = Instance.new("Frame")
inputContainer.Size = UDim2.new(0, 200, 0, 100)
inputContainer.Position = UDim2.new(1, -215, 0, 50)
inputContainer.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
inputContainer.BorderSizePixel = 0
inputContainer.ZIndex = 2
inputContainer.Parent = keyFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = inputContainer

-- Input field
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(0, 180, 0, 30)
inputFrame.Position = UDim2.new(0.5, -90, 0, 15)
inputFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
inputFrame.BorderSizePixel = 0
inputFrame.ZIndex = 3
inputFrame.Parent = inputContainer

local inputCorner2 = Instance.new("UICorner")
inputCorner2.CornerRadius = UDim.new(0, 8)
inputCorner2.Parent = inputFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -20, 1, 0)
keyInput.Position = UDim2.new(0, 10, 0, 0)
keyInput.BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0)
keyInput.Text = ""
keyInput.TextColor3 = Color3.fromRGB(255, 0, 255)
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 12
keyInput.PlaceholderText = "Enter license key..."
keyInput.PlaceholderColor3 = Color3.fromRGB(128, 0, 128)
keyInput.TextXAlignment = Enum.TextXAlignment.Left
keyInput.ZIndex = 4
keyInput.Parent = inputFrame

-- Submit button
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 90, 0, 25)
submitButton.Position = UDim2.new(0.5, -45, 0, 55)
submitButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
submitButton.Text = "ACTIVATE"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Font = Enum.Font.GothamBold
submitButton.TextSize = 12
submitButton.ZIndex = 3
submitButton.Parent = inputContainer

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 8)
submitCorner.Parent = submitButton

local submitGradient = Instance.new("UIGradient")
submitGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 128))
}
submitGradient.Rotation = 90
submitGradient.Parent = submitButton

-- Status text
local keyStatus = Instance.new("TextLabel")
keyStatus.Size = UDim2.new(1, 0, 0, 16)
keyStatus.Position = UDim2.new(0, 0, 1, -18)
keyStatus.BackgroundTransparency = 1
keyStatus.Text = ""
keyStatus.TextColor3 = Color3.fromRGB(255, 0, 255)
keyStatus.Font = Enum.Font.Gotham
keyStatus.TextSize = 10
keyStatus.ZIndex = 3
keyStatus.Parent = inputContainer

-- Info text
local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, 0, 0, 12)
infoText.Position = UDim2.new(0, 0, 1, -5)
infoText.BackgroundTransparency = 1
infoText.Text = "Press RightShift to toggle this window"
infoText.TextColor3 = Color3.fromRGB(128, 0, 128)
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 8
infoText.ZIndex = 3
infoText.Parent = inputContainer

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -27, 0, 7)
closeButton.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.ZIndex = 3
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeButton

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
end)

closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
end)

-- Key validation
local correctKey = "KEY_regher3453rgo24"
local keyValid = false
local keyGuiVisible = true

local function validateKey()
    if keyInput.Text == correctKey then
        keyValid = true
        keySystemGui:Destroy()
    else
        keyStatus.Text = "Invalid key! Please try again."
        keyInput.Text = ""
    end
end

submitButton.MouseButton1Click:Connect(validateKey)
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        validateKey()
    end
end)

closeButton.MouseButton1Click:Connect(function()
    keyGuiVisible = false
    keySystemGui.Enabled = false
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightShift and not keyValid then
        keyGuiVisible = not keyGuiVisible
        keySystemGui.Enabled = keyGuiVisible
    end
end)

-- Wait for key validation
while not keyValid do
    wait(0.1)
end

-- Main Script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Lighting = game:GetService("Lighting")

-- UI Setup - Mobile optimized
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NightHook(PAID)"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
screenGui.Enabled = true

-- Main Frame
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 350, 0, 400)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = false -- Disabled for custom dragging

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

local gradientOverlay2 = Instance.new("Frame")
gradientOverlay2.Size = UDim2.new(1, 0, 1, 0)
gradientOverlay2.Position = UDim2.new(0, 0, 0, 0)
gradientOverlay2.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
gradientOverlay2.BorderSizePixel = 0
gradientOverlay2.BackgroundTransparency = 0.8
gradientOverlay2.ZIndex = 1
gradientOverlay2.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
title.BorderSizePixel = 0
title.Text = "NIGHTHOOK (PAID)"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.ZIndex = 2
title.TextScaled = true
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center

local titleCorner2 = Instance.new("UICorner")
titleCorner2.CornerRadius = UDim.new(0, 12)
titleCorner2.Parent = title

local titleGradient2 = Instance.new("UIGradient")
titleGradient2.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 0, 128)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
titleGradient2.Rotation = 90
titleGradient2.Parent = title

-- Make mainFrame draggable by title
makeDraggable(title, mainFrame)

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleGUI"
toggleButton.Size = UDim2.new(0, 25, 0, 25)
toggleButton.Position = UDim2.new(1, -27, 0, 5)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
toggleButton.Text = "X"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 14
toggleButton.ZIndex = 10
toggleButton.Parent = mainFrame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 5)
toggleCorner.Parent = toggleButton

-- Floating Button
local floatingButton = Instance.new("TextButton")
floatingButton.Name = "FloatingButton"
floatingButton.Size = UDim2.new(0, 45, 0, 45)
floatingButton.Position = UDim2.new(0, 15, 0.5, -22.5)
floatingButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
floatingButton.Text = "NIGHT"
floatingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
floatingButton.Font = Enum.Font.GothamBold
floatingButton.TextSize = 10
floatingButton.TextScaled = true
floatingButton.ZIndex = 100
floatingButton.Visible = false
floatingButton.Parent = screenGui

local floatingCorner = Instance.new("UICorner")
floatingCorner.CornerRadius = UDim.new(0, 22.5)
floatingCorner.Parent = floatingButton

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleButton.Text = mainFrame.Visible and "X" or "+"
    floatingButton.Visible = not mainFrame.Visible
end)

floatingButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    toggleButton.Text = "X"
    floatingButton.Visible = false
end)

-- Left Menu
local leftMenu = Instance.new("Frame")
leftMenu.Size = UDim2.new(0, 100, 1, -40)
leftMenu.Position = UDim2.new(0, 5, 0, 35)
leftMenu.BackgroundColor3 = Color3.fromRGB(25, 0, 45)
leftMenu.BorderSizePixel = 0
leftMenu.ZIndex = 2
leftMenu.Parent = mainFrame

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, 8)
leftCorner.Parent = leftMenu

-- Logo in menu
local mainLogoFrame = Instance.new("Frame")
mainLogoFrame.Size = UDim2.new(0, 80, 0, 30)
mainLogoFrame.Position = UDim2.new(0.5, -40, 0, 10)
mainLogoFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
mainLogoFrame.BorderSizePixel = 0
mainLogoFrame.ZIndex = 3
mainLogoFrame.Parent = leftMenu

local mainLogoCorner = Instance.new("UICorner")
mainLogoCorner.CornerRadius = UDim.new(0, 8)
mainLogoCorner.Parent = mainLogoFrame

local mainNightHookText = Instance.new("TextLabel")
mainNightHookText.Size = UDim2.new(0, 80, 0, 14)
mainNightHookText.Position = UDim2.new(0, 0, 0, 4)
mainNightHookText.BackgroundTransparency = 1
mainNightHookText.Text = "NIGHTHOOK"
mainNightHookText.Font = Enum.Font.GothamBold
mainNightHookText.TextSize = 8
mainNightHookText.TextColor3 = Color3.fromRGB(128, 0, 128)
mainNightHookText.TextXAlignment = Enum.TextXAlignment.Center
mainNightHookText.TextYAlignment = Enum.TextYAlignment.Center
mainNightHookText.TextScaled = true
mainNightHookText.ZIndex = 4
mainNightHookText.Parent = mainLogoFrame

local mainPaidText = Instance.new("TextLabel")
mainPaidText.Size = UDim2.new(0, 80, 0, 10)
mainPaidText.Position = UDim2.new(0, 0, 0, 16)
mainPaidText.BackgroundTransparency = 1
mainPaidText.Text = "(PAID)"
mainPaidText.Font = Enum.Font.GothamBold
mainPaidText.TextSize = 7
mainPaidText.TextColor3 = Color3.fromRGB(255, 255, 255)
mainPaidText.TextXAlignment = Enum.TextXAlignment.Center
mainPaidText.TextYAlignment = Enum.TextYAlignment.Center
mainPaidText.TextScaled = true
mainPaidText.ZIndex = 4
mainPaidText.Parent = mainLogoFrame

-- User info
local userInfo = Instance.new("Frame")
userInfo.Size = UDim2.new(1, -10, 0, 30)
userInfo.Position = UDim2.new(0, 5, 0, 45)
userInfo.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
userInfo.BorderSizePixel = 0
userInfo.ZIndex = 3
userInfo.Parent = leftMenu

local userCorner = Instance.new("UICorner")
userCorner.CornerRadius = UDim.new(0, 6)
userCorner.Parent = userInfo

local userName = Instance.new("TextLabel")
userName.Size = UDim2.new(1, 0, 0, 14)
userName.Position = UDim2.new(0, 0, 0, 4)
userName.BackgroundTransparency = 1
userName.Text = LocalPlayer.Name
userName.TextColor3 = Color3.fromRGB(255, 255, 255)
userName.Font = Enum.Font.GothamBold
userName.TextSize = 8
userName.TextScaled = true
userName.TextXAlignment = Enum.TextXAlignment.Center
userName.TextYAlignment = Enum.TextYAlignment.Center
userName.ZIndex = 4
userName.Parent = userInfo

local userStatus = Instance.new("TextLabel")
userStatus.Size = UDim2.new(1, 0, 0, 10)
userStatus.Position = UDim2.new(0, 0, 0, 17)
userStatus.BackgroundTransparency = 1
userStatus.Text = "LICENSE: ACTIVE"
userStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
userStatus.Font = Enum.Font.Gotham
userStatus.TextSize = 7
userStatus.TextScaled = true
userStatus.TextXAlignment = Enum.TextXAlignment.Center
userStatus.TextYAlignment = Enum.TextYAlignment.Center
userStatus.ZIndex = 4
userStatus.Parent = userInfo

-- Tab Buttons
local tabButtonsContainer = Instance.new("Frame")
tabButtonsContainer.Size = UDim2.new(1, -10, 0, 75)
tabButtonsContainer.Position = UDim2.new(0, 5, 0, 80)
tabButtonsContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0)
tabButtonsContainer.BorderSizePixel = 0
tabButtonsContainer.ZIndex = 3
tabButtonsContainer.Parent = leftMenu

-- Right Content
local rightContent = Instance.new("Frame")
rightContent.Size = UDim2.new(0, 240, 1, -40)
rightContent.Position = UDim2.new(1, -245, 0, 35)
rightContent.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
rightContent.BorderSizePixel = 0
rightContent.ZIndex = 2
rightContent.Parent = mainFrame

local rightCorner = Instance.new("UICorner")
rightCorner.CornerRadius = UDim.new(0, 8)
rightCorner.Parent = rightContent

-- Tab Creation
local tabs = {}
local pages = {}

local function createTab(name, icon)
    local button = Instance.new("TextButton", tabButtonsContainer)
    button.Size = UDim2.new(1, 0, 0, 22)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    button.TextColor3 = Color3.fromRGB(255, 0, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 9
    button.BorderSizePixel = 0
    button.ZIndex = 4
    button.TextXAlignment = Enum.TextXAlignment.Center
    button.TextYAlignment = Enum.TextYAlignment.Center
    button.TextScaled = true

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button

    local page = Instance.new("ScrollingFrame", rightContent)
    page.Size = UDim2.new(1, -10, 1, -10)
    page.Position = UDim2.new(0, 5, 0, 5)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ScrollBarThickness = 5
    page.ScrollBarImageColor3 = Color3.fromRGB(128, 0, 128)
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollingDirection = Enum.ScrollingDirection.Y
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.BorderSizePixel = 0
    page.ZIndex = 3

    local list = Instance.new("UIListLayout", page)
    list.Padding = UDim.new(0, 6)
    list.FillDirection = Enum.FillDirection.Vertical
    list.HorizontalAlignment = Enum.HorizontalAlignment.Center
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 6)
    end)

    pages[name] = page
    table.insert(tabs, {button, page})

    button.MouseButton1Click:Connect(function()
        for i, v in ipairs(tabs) do
            v[2].Visible = false
            v[1].BackgroundColor3 = Color3.fromRGB(30, 0, 50)
            v[1].TextColor3 = Color3.fromRGB(255, 0, 255)
        end
        page.Visible = true
        button.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    if #tabs == 1 then
        button.Position = UDim2.new(0, 0, 0, 0)
    elseif #tabs == 2 then
        button.Position = UDim2.new(0, 0, 0, 25)
    else
        button.Position = UDim2.new(0, 0, 0, 50)
    end
end

-- Create tabs
createTab("COMBAT")
createTab("VISUALS")
createTab("MISC")

-- Activate first tab
if #tabs > 0 then
    tabs[1][2].Visible = true
    tabs[1][1].BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    tabs[1][1].TextColor3 = Color3.fromRGB(255, 255, 255)
end

-- Combat Tab
local combatPage = pages["COMBAT"]
local combatContainer = Instance.new("Frame")
combatContainer.Size = UDim2.new(0, 220, 0, 400)
combatContainer.Position = UDim2.new(0.5, -110, 0, 10)
combatContainer.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
combatContainer.BorderSizePixel = 0
combatContainer.ZIndex = 4
combatContainer.Parent = combatPage

local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, 8)
containerCorner.Parent = combatContainer

local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(255, 0, 255)
border.Thickness = 1
border.Transparency = 0.3
border.Parent = combatContainer

-- Aimbot Settings
local AimbotSettings = {
    Enabled = false;
    WallCheck = false;
    ShowFov = false;
    Fov = 350;
    Smoothing = 1;
    AimPart = "Head";
    Thickness = 2;
    FovFillColor = Color3.fromRGB(255, 0, 255);
    FovColor = Color3.fromRGB(128, 0, 128);
    FovFillTransparency = 0.8;
    FovTransparency = 0.2;
    Keybind = "MouseButton2";
    IsAimKeyDown = false;
    AutoPrediction = true;
    LockDistance = 1000;
    AutoLock = false;
}

-- FOV Display
local FovGui = Instance.new("ScreenGui")
FovGui.Name = "Fov"
FovGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
FovGui.ResetOnSpawn = false

local FOVFrame = Instance.new("Frame")
FOVFrame.Parent = FovGui
FOVFrame.Name = "FOVFrame"
FOVFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
FOVFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
FOVFrame.BorderSizePixel = 0
FOVFrame.BackgroundTransparency = 1
FOVFrame.AnchorPoint = Vector2.new(0.5, 0.5)
FOVFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVFrame.Size = UDim2.new(0, AimbotSettings.Fov, 0, AimbotSettings.Fov)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = FOVFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(128, 0, 128)
UIStroke.Parent = FOVFrame
UIStroke.Thickness = 2
UIStroke.ApplyStrokeMode = "Border"

-- Combat Options
local combatOptions = {
    {name = "ENABLE AIMBOT", id = "enableAimbot"},
    {name = "WALL CHECK", id = "wallCheck"},
    {name = "SHOW FOV", id = "showFov"},
    {name = "AUTO PREDICTION", id = "autoPrediction"},
    {name = "AUTO LOCK", id = "autoLock"}
}

local combatSettings = {}

-- Toggle Function
local function createToggle(optionName, optionId, yPos, parent)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, -10, 0, 22)
    toggleFrame.Position = UDim2.new(0, 5, 0, yPos)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.ZIndex = 5
    toggleFrame.Parent = parent

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 6)
    toggleCorner.Parent = toggleFrame

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 20, 0, 10)
    toggleButton.Position = UDim2.new(0, 6, 0.5, -5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    toggleButton.Text = ""
    toggleButton.ZIndex = 6
    toggleButton.Parent = toggleFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = toggleButton

    local toggleIndicator = Instance.new("Frame")
    toggleIndicator.Size = UDim2.new(0, 8, 0, 8)
    toggleIndicator.Position = UDim2.new(0, 1, 0, 1)
    toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
    toggleIndicator.BorderSizePixel = 0
    toggleIndicator.ZIndex = 7
    toggleIndicator.Parent = toggleButton

    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(0, 4)
    indicatorCorner.Parent = toggleIndicator

    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(1, -35, 1, 0)
    toggleLabel.Position = UDim2.new(0, 30, 0, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = optionName
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.Font = Enum.Font.GothamBold
    toggleLabel.TextSize = 8
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.TextYAlignment = Enum.TextYAlignment.Center
    toggleLabel.TextScaled = true
    toggleLabel.ZIndex = 6
    toggleLabel.Parent = toggleFrame

    combatSettings[optionId] = false

    toggleButton.MouseButton1Click:Connect(function()
        combatSettings[optionId] = not combatSettings[optionId]

        if combatSettings[optionId] then
            toggleButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleIndicator.Position = UDim2.new(0, 11, 0, 1)
        else
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
            toggleIndicator.Position = UDim2.new(0, 1, 0, 1)
        end

        if optionId == "enableAimbot" then
            AimbotSettings.Enabled = combatSettings[optionId]
        elseif optionId == "wallCheck" then
            AimbotSettings.WallCheck = combatSettings[optionId]
        elseif optionId == "showFov" then
            AimbotSettings.ShowFov = combatSettings[optionId]
        elseif optionId == "autoPrediction" then
            AimbotSettings.AutoPrediction = combatSettings[optionId]
        elseif optionId == "autoLock" then
            AimbotSettings.AutoLock = combatSettings[optionId]
        end
    end)

    return toggleFrame
end

-- Create Combat toggles
for i, option in ipairs(combatOptions) do
    createToggle(option.name, option.id, (i-1) * 25, combatContainer)
end

-- Improved Slider Function
local function createSlider(labelText, minVal, maxVal, defaultVal, yPos, parent, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, -10, 0, 35)
    sliderFrame.Position = UDim2.new(0, 5, 0, yPos)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.ZIndex = 5
    sliderFrame.Parent = parent

    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 6)
    sliderCorner.Parent = sliderFrame

    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Size = UDim2.new(1, 0, 0, 14)
    sliderLabel.Position = UDim2.new(0, 0, 0, 3)
    sliderLabel.BackgroundTransparency = 1
    sliderLabel.Text = labelText .. ": " .. string.format("%.1f", defaultVal)
    sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderLabel.Font = Enum.Font.GothamBold
    sliderLabel.TextSize = 8
    sliderLabel.TextScaled = true
    sliderLabel.TextXAlignment = Enum.TextXAlignment.Center
    sliderLabel.TextYAlignment = Enum.TextYAlignment.Center
    sliderLabel.ZIndex = 6
    sliderLabel.Parent = sliderFrame

    local sliderTrack = Instance.new("Frame")
    sliderTrack.Size = UDim2.new(0, 190, 0, 8)
    sliderTrack.Position = UDim2.new(0.5, -95, 0, 20)
    sliderTrack.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    sliderTrack.BorderSizePixel = 0
    sliderTrack.ZIndex = 6
    sliderTrack.Parent = sliderFrame

    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, 4)
    trackCorner.Parent = sliderTrack

    local sliderFill = Instance.new("Frame")
    local initialPercent = (defaultVal - minVal) / (maxVal - minVal)
    sliderFill.Size = UDim2.new(initialPercent, 0, 1, 0)
    sliderFill.Position = UDim2.new(0, 0, 0, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.ZIndex = 7
    sliderFill.Parent = sliderTrack

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 4)
    fillCorner.Parent = sliderFill

    local sliderKnob = Instance.new("TextButton")
    sliderKnob.Size = UDim2.new(0, 20, 0, 20)
    sliderKnob.Position = UDim2.new(initialPercent, -10, 0.5, -10)
    sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderKnob.Text = ""
    sliderKnob.BorderSizePixel = 0
    sliderKnob.ZIndex = 10
    sliderKnob.Parent = sliderTrack

    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(0, 10)
    knobCorner.Parent = sliderKnob

    local knobGlow = Instance.new("Frame")
    knobGlow.Size = UDim2.new(1, 8, 1, 8)
    knobGlow.Position = UDim2.new(0, -4, 0, -4)
    knobGlow.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
    knobGlow.BorderSizePixel = 0
    knobGlow.ZIndex = 9
    knobGlow.Parent = sliderKnob

    local glowCorner = Instance.new("UICorner")
    glowCorner.CornerRadius = UDim.new(0, 14)
    glowCorner.Parent = knobGlow

    local dragging = false
    local dragInput = nil

    local function updateSlider(inputPosition)
        local trackPos = sliderTrack.AbsolutePosition
        local trackSize = sliderTrack.AbsoluteSize
        local percent = math.clamp((inputPosition.X - trackPos.X) / trackSize.X, 0, 1)
        
        sliderFill.Size = UDim2.new(percent, 0, 1, 0)
        sliderKnob.Position = UDim2.new(percent, -10, 0.5, -10)
        
        local value = minVal + percent * (maxVal - minVal)
        sliderLabel.Text = labelText .. ": " .. string.format("%.1f", value)
        callback(value)
    end

    sliderKnob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragInput = input
            updateSlider(input.Position)
        end
    end)

    sliderKnob.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateSlider(input.Position)
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input == dragInput and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragging = false
            dragInput = nil
        end
    end)

    -- Allow clicking on the track to move the slider
    local trackButton = Instance.new("TextButton")
    trackButton.Size = UDim2.new(1, 0, 1, 0)
    trackButton.Position = UDim2.new(0, 0, 0, 0)
    trackButton.BackgroundTransparency = 1
    trackButton.Text = ""
    trackButton.ZIndex = 8
    trackButton.Parent = sliderTrack

    trackButton.MouseButton1Click:Connect(function(input)
        updateSlider(input.Position)
    end)

    trackButton.TouchTap:Connect(function(touch)
        updateSlider(touch.Position)
    end)

    return sliderFrame
end

-- Create Sliders
createSlider("FOV", 50, 700, 350, 140, combatContainer, function(value)
    AimbotSettings.Fov = value
end)

createSlider("SMOOTHING", 0.1, 3, 1, 180, combatContainer, function(value)
    AimbotSettings.Smoothing = value
end)

createSlider("LOCK DISTANCE", 100, 2000, 1000, 220, combatContainer, function(value)
    AimbotSettings.LockDistance = value
end)

-- Aim Part Selection
local aimPartLabel = Instance.new("TextLabel")
aimPartLabel.Size = UDim2.new(1, -10, 0, 14)
aimPartLabel.Position = UDim2.new(0, 5, 0, 260)
aimPartLabel.BackgroundTransparency = 1
aimPartLabel.Text = "AIM PART"
aimPartLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
aimPartLabel.Font = Enum.Font.GothamBold
aimPartLabel.TextSize = 8
aimPartLabel.TextScaled = true
aimPartLabel.ZIndex = 5
aimPartLabel.Parent = combatContainer

local aimPartContainer = Instance.new("Frame")
aimPartContainer.Size = UDim2.new(1, -10, 0, 22)
aimPartContainer.Position = UDim2.new(0, 5, 0, 278)
aimPartContainer.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
aimPartContainer.BorderSizePixel = 0
aimPartContainer.ZIndex = 5
aimPartContainer.Parent = combatContainer

local aimContainerCorner = Instance.new("UICorner")
aimContainerCorner.CornerRadius = UDim.new(0, 6)
aimContainerCorner.Parent = aimPartContainer

local aimParts = {"HEAD", "TORSO", "ROOT"}
local aimPartButtons = {}

for i, partName in ipairs(aimParts) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 65, 0, 18)
    button.Position = UDim2.new(0, 5 + (i-1) * 72, 0, 2)
    button.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    button.Text = partName
    button.TextColor3 = Color3.fromRGB(255, 0, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 7
    button.TextScaled = true
    button.ZIndex = 6
    button.Parent = aimPartContainer

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button

    if partName == "HEAD" then
        button.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
    end

    button.MouseButton1Click:Connect(function()
        for _, btn in ipairs(aimPartButtons) do
            btn.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
            btn.TextColor3 = Color3.fromRGB(255, 0, 255)
        end

        button.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)

        if partName == "HEAD" then
            AimbotSettings.AimPart = "Head"
        elseif partName == "TORSO" then
            AimbotSettings.AimPart = "UpperTorso"
        elseif partName == "ROOT" then
            AimbotSettings.AimPart = "HumanoidRootPart"
        end
    end)

    table.insert(aimPartButtons, button)
end

local keybindInfo = Instance.new("TextLabel")
keybindInfo.Size = UDim2.new(1, -10, 0, 14)
keybindInfo.Position = UDim2.new(0, 5, 0, 305)
keybindInfo.BackgroundTransparency = 1
keybindInfo.Text = "AIM KEY: RIGHT MOUSE BUTTON"
keybindInfo.TextColor3 = Color3.fromRGB(255, 0, 255)
keybindInfo.Font = Enum.Font.GothamBold
keybindInfo.TextSize = 7
keybindInfo.TextScaled = true
keybindInfo.ZIndex = 5
keybindInfo.Parent = combatContainer

-- Aimbot Functions
local PLAYER = game.Players.LocalPlayer
local CurrentCam = game.Workspace.CurrentCamera
local WorldToViewportPoint = CurrentCam.WorldToViewportPoint

function isVisible(position, ...)
    if not AimbotSettings.WallCheck then
        return true
    end
    return #CurrentCam:GetPartsObscuringTarget({ position }, { CurrentCam, PLAYER.Character, ... }) == 0
end

function getClosestToMouse(fov)
    local aimFov = fov
    local target = nil
    local centerPoint = Vector2.new(CurrentCam.ViewportSize.X * 0.5, CurrentCam.ViewportSize.Y * 0.5 - 50)

    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= PLAYER then
            if player.Character and player.Character:FindFirstChild(AimbotSettings.AimPart) and
                player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then

                local screenPos, onScreen = WorldToViewportPoint(CurrentCam, player.Character[AimbotSettings.AimPart].Position)
                local screenPos2D = Vector2.new(screenPos.X, screenPos.Y)
                local magnitude = (screenPos2D - centerPoint).Magnitude
                
                local distance = (player.Character[AimbotSettings.AimPart].Position - CurrentCam.CFrame.Position).Magnitude

                if onScreen and magnitude < aimFov and distance <= (AimbotSettings.LockDistance or 1000) and isVisible(player.Character[AimbotSettings.AimPart].Position, player.Character) then
                    aimFov = magnitude
                    target = player
                end
            end
        end
    end

    return target
end

function aimAt(target, smooth)
    local aimPart = target.Character:FindFirstChild(AimbotSettings.AimPart)
    if aimPart then
        local targetPosition = aimPart.Position
        
        if AimbotSettings.AutoPrediction and target.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = target.Character.HumanoidRootPart
            local velocity = rootPart.Velocity
            
            local distance = (CurrentCam.CFrame.Position - targetPosition).Magnitude
            local speed = velocity.Magnitude
            local distanceFactor = math.min(distance / 100, 2)
            local speedFactor = math.min(speed / 20, 2)
            
            local predictionAmount = 0.1 + (distanceFactor * 0.1) + (speedFactor * 0.05)
            predictionAmount = math.clamp(predictionAmount, 0.05, 0.4)
            
            targetPosition = targetPosition + velocity * predictionAmount
        end
        
        local desiredCFrame = CFrame.new(CurrentCam.CFrame.Position, targetPosition)
        local smoothFactor = 0.9 - ((smooth - 0.1) / 2.9) * 0.8
        smoothFactor = math.clamp(smoothFactor, 0.01, 0.99)
        
        CurrentCam.CFrame = CurrentCam.CFrame:Lerp(desiredCFrame, smoothFactor)
    end
end

UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 and AimbotSettings.Enabled then
        AimbotSettings.IsAimKeyDown = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        AimbotSettings.IsAimKeyDown = false
    end
end)

game:GetService('RunService').RenderStepped:Connect(function()
    local centerPoint = Vector2.new(CurrentCam.ViewportSize.X * 0.5, CurrentCam.ViewportSize.Y * 0.5)
    FOVFrame.Position = UDim2.new(0, centerPoint.X, 0, centerPoint.Y - 50)
    FOVFrame.Size = UDim2.new(0, AimbotSettings.Fov, 0, AimbotSettings.Fov)
    FOVFrame.Visible = AimbotSettings.ShowFov
    FOVFrame.BackgroundColor3 = AimbotSettings.FovFillColor
    FOVFrame.BackgroundTransparency = 1
    
    UIStroke.Color = AimbotSettings.FovColor
    UIStroke.Transparency = AimbotSettings.FovTransparency
    UIStroke.Thickness = AimbotSettings.Thickness

    if AimbotSettings.Enabled then
        local shouldAim = AimbotSettings.AutoLock or AimbotSettings.IsAimKeyDown
        
        if shouldAim then
            local target = getClosestToMouse(AimbotSettings.Fov / 2)
            if target then
                aimAt(target, AimbotSettings.Smoothing)
            end
        end
    end
end)

-- Visuals Tab
local visualsPage = pages["VISUALS"]
local visualsContainer = Instance.new("Frame")
visualsContainer.Size = UDim2.new(0, 220, 0, 350)
visualsContainer.Position = UDim2.new(0.5, -110, 0, 10)
visualsContainer.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
visualsContainer.BorderSizePixel = 0
visualsContainer.ZIndex = 4
visualsContainer.Parent = visualsPage

local visualsContainerCorner = Instance.new("UICorner")
visualsContainerCorner.CornerRadius = UDim.new(0, 8)
visualsContainerCorner.Parent = visualsContainer

local visualsBorder = Instance.new("UIStroke")
visualsBorder.Color = Color3.fromRGB(255, 0, 255)
visualsBorder.Thickness = 1
visualsBorder.Transparency = 0.3
visualsBorder.Parent = visualsContainer

-- Visuals Options (Removed ESP BOX)
local visualsOptions = {
    {name = "ENABLE ESP", id = "enableESP"},
    {name = "PLAYER NAME", id = "playerName"},
    {name = "PLAYER DISTANCE", id = "playerDistance"},
    {name = "HEALTH BAR", id = "healthBar"},
    {name = "VISIBLE CHECK", id = "visibleCheck"},
    {name = "CHAMS", id = "chams"},
    {name = "SKELETON ESP", id = "skeletonEsp"},
    {name = "EXIT ESP", id = "exitEsp"}
}

local visualsSettings = {}

-- ESP Settings
local ESPMaxDistance = 500
local ESP_UPDATE_INTERVAL = 0.2
local lastESPUpdate = 0

-- Chams Settings
local chamsSettings = {
    Enabled = false,
    Color = Color3.fromRGB(255, 0, 255),
    Transparency = 0.9,
    GlowColor = Color3.fromRGB(128, 0, 128),
    GlowTransparency = 0.3
}

-- Skeleton ESP Settings
local skeletonEspSettings = {
    Enabled = false,
    Color = Color3.new(1, 0, 0.5),
    Thickness = 2,
    Transparency = 1
}

-- Exit ESP Settings
local exitEspSettings = {
    Enabled = false,
    MaxDistance = 5000,
    Color = Color3.new(0, 1, 0),
    CloseColor = Color3.new(0, 1, 0),
    MediumColor = Color3.new(1, 1, 0),
    FarColor = Color3.new(1, 0.5, 0),
    CloseDistance = 100,
    MediumDistance = 500,
    TextSize = 20,
    Offset = 5
}

-- Visuals Toggle Function
local function createVisualsToggle(optionName, optionId, yPos)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, -10, 0, 22)
    toggleFrame.Position = UDim2.new(0, 5, 0, yPos)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.ZIndex = 5
    toggleFrame.Parent = visualsContainer

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 6)
    toggleCorner.Parent = toggleFrame

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 20, 0, 10)
    toggleButton.Position = UDim2.new(0, 6, 0.5, -5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    toggleButton.Text = ""
    toggleButton.ZIndex = 6
    toggleButton.Parent = toggleFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = toggleButton

    local toggleIndicator = Instance.new("Frame")
    toggleIndicator.Size = UDim2.new(0, 8, 0, 8)
    toggleIndicator.Position = UDim2.new(0, 1, 0, 1)
    toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
    toggleIndicator.BorderSizePixel = 0
    toggleIndicator.ZIndex = 7
    toggleIndicator.Parent = toggleButton

    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(0, 4)
    indicatorCorner.Parent = toggleIndicator

    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(1, -35, 1, 0)
    toggleLabel.Position = UDim2.new(0, 30, 0, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = optionName
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.Font = Enum.Font.GothamBold
    toggleLabel.TextSize = 8
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.TextYAlignment = Enum.TextYAlignment.Center
    toggleLabel.TextScaled = true
    toggleLabel.ZIndex = 6
    toggleLabel.Parent = toggleFrame

    visualsSettings[optionId] = false

    toggleButton.MouseButton1Click:Connect(function()
        visualsSettings[optionId] = not visualsSettings[optionId]

        if visualsSettings[optionId] then
            toggleButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleIndicator.Position = UDim2.new(0, 11, 0, 1)
        else
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
            toggleIndicator.Position = UDim2.new(0, 1, 0, 1)
        end

        if optionId == "chams" then
            chamsSettings.Enabled = visualsSettings[optionId]
        elseif optionId == "skeletonEsp" then
            skeletonEspSettings.Enabled = visualsSettings[optionId]
        elseif optionId == "exitEsp" then
            exitEspSettings.Enabled = visualsSettings[optionId]
        end
    end)

    return toggleFrame
end

-- Create Visuals toggles
for i, option in ipairs(visualsOptions) do
    createVisualsToggle(option.name, option.id, (i-1) * 25)
end

-- ESP Distance Slider
createSlider("ESP DISTANCE", 100, 2000, 500, 220, visualsContainer, function(value)
    ESPMaxDistance = value
end)

-- Optimized ESP Implementation
local ESPBillboardGuis = {}

local function createOptimizedESP(player)
    if player == LocalPlayer then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "OptimizedESP"
    billboard.Adornee = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    billboard.Size = UDim2.new(0, 100, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = false
    billboard.MaxDistance = ESPMaxDistance
    billboard.Parent = screenGui
    
    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.Parent = billboard
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "Info"
    infoLabel.Size = UDim2.new(1, 0, 0, 18)
    infoLabel.Position = UDim2.new(0, 0, 0, 0)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = ""
    infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    infoLabel.TextScaled = true
    infoLabel.Font = Enum.Font.SourceSansBold
    infoLabel.TextStrokeTransparency = 0.5
    infoLabel.Parent = container
    
    local healthBG = Instance.new("Frame")
    healthBG.Name = "HealthBG"
    healthBG.Size = UDim2.new(1, 0, 0, 5)
    healthBG.Position = UDim2.new(0, 0, 0, 20)
    healthBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    healthBG.Parent = container
    
    local healthBar = Instance.new("Frame")
    healthBar.Name = "HealthBar"
    healthBar.Size = UDim2.new(1, 0, 1, 0)
    healthBar.Position = UDim2.new(0, 0, 0, 0)
    healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    healthBar.Parent = healthBG
    
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Name = "Distance"
    distanceLabel.Size = UDim2.new(1, 0, 0, 14)
    distanceLabel.Position = UDim2.new(0, 0, 0, 27)
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.Text = ""
    distanceLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    distanceLabel.TextScaled = true
    distanceLabel.Font = Enum.Font.SourceSans
    distanceLabel.Parent = container
    
    ESPBillboardGuis[player] = billboard
end

local function updateOptimizedESP(player)
    local billboard = ESPBillboardGuis[player]
    if not billboard then return end
    
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") or not character:FindFirstChild("Humanoid") then
        billboard.Enabled = false
        return
    end
    
    local humanoidRootPart = character.HumanoidRootPart
    local humanoid = character.Humanoid
    
    billboard.Adornee = humanoidRootPart
    
    local distance = (humanoidRootPart.Position - Camera.CFrame.Position).Magnitude
    if distance > ESPMaxDistance then
        billboard.Enabled = false
        return
    end
    
    local health = humanoid.Health
    local maxHealth = humanoid.MaxHealth
    local healthPercent = math.clamp(health / maxHealth, 0, 1)
    
    -- Fixed HealthBar access
    local healthBar = billboard.Container:FindFirstChild("HealthBG")
    if healthBar then
        healthBar = healthBar:FindFirstChild("HealthBar")
        if healthBar then
            healthBar.Size = UDim2.new(healthPercent, 0, 1, 0)
            healthBar.BackgroundColor3 = Color3.new(1 - healthPercent, healthPercent, 0)
        end
    end
    
    local infoText = ""
    if visualsSettings.playerName then
        infoText = player.Name
    end
    if visualsSettings.healthBar then
        if infoText ~= "" then
            infoText = infoText .. " [" .. math.floor(health) .. "]"
        else
            infoText = "[" .. math.floor(health) .. "]"
        end
    end
    billboard.Container.Info.Text = infoText
    
    if visualsSettings.playerDistance then
        billboard.Container.Distance.Text = math.floor(distance) .. "m"
    else
        billboard.Container.Distance.Text = ""
    end
    
    local isVisible = true
    if visualsSettings.visibleCheck and distance < 300 then
        isVisible = #Camera:GetPartsObscuringTarget({humanoidRootPart.Position}, {Camera, LocalPlayer.Character, character}) == 0
    end
    
    local color = isVisible and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    billboard.Container.Info.TextColor3 = color
    billboard.Container.Distance.TextColor3 = color
    
    billboard.Enabled = true
end

-- ESP Update Loop - Optimized for performance
spawn(function()
    while true do
        if visualsSettings.enableESP then
            local currentTime = tick()
            
            if currentTime - lastESPUpdate >= ESP_UPDATE_INTERVAL then
                lastESPUpdate = currentTime
                for player, billboard in pairs(ESPBillboardGuis) do
                    updateOptimizedESP(player)
                end
            end
        else
            for player, billboard in pairs(ESPBillboardGuis) do
                billboard.Enabled = false
            end
        end
        wait(0.05)
    end
end)

-- Create ESP for existing players
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createOptimizedESP(player)
    end
end

-- Handle new players
Players.PlayerAdded:Connect(function(player)
    createOptimizedESP(player)
end)

-- Handle leaving players
Players.PlayerRemoving:Connect(function(player)
    if ESPBillboardGuis[player] then
        ESPBillboardGuis[player]:Destroy()
        ESPBillboardGuis[player] = nil
    end
end)

-- Chams Implementation
local function DestroyChams(character)
    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") and part.Transparency ~= 1 then
            local glow = part:FindFirstChild("Glow")
            local chams = part:FindFirstChild("Chams")

            if glow then glow:Destroy() end
            if chams then chams:Destroy() end
        end
    end
end

local function UpdateChams()
    if not chamsSettings.Enabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                DestroyChams(player.Character)
            end
        end
        return
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local character = player.Character

                for _, part in ipairs(character:GetChildren()) do
                    if part:IsA("BasePart") and part.Transparency ~= 1 then
                        local glow = part:FindFirstChild("Glow")
                        local chams = part:FindFirstChild("Chams")

                        if not chams and not glow then
                            local chamsBox = Instance.new("BoxHandleAdornment", part)
                            chamsBox.Name = "Chams"
                            chamsBox.AlwaysOnTop = true
                            chamsBox.ZIndex = 4
                            chamsBox.Adornee = part
                            chamsBox.Color3 = chamsSettings.Color
                            chamsBox.Transparency = chamsSettings.Transparency
                            chamsBox.Size = part.Size + Vector3.new(0.02, 0.02, 0.02)

                            local glowBox = Instance.new("BoxHandleAdornment", part)
                            glowBox.Name = "Glow"
                            glowBox.AlwaysOnTop = false
                            glowBox.ZIndex = 3
                            glowBox.Adornee = part
                            glowBox.Color3 = chamsSettings.GlowColor
                            glowBox.Size = chamsBox.Size + Vector3.new(0.13, 0.13, 0.13)
                            glowBox.Transparency = chamsSettings.GlowTransparency
                        end
                    end
                end
            else
                DestroyChams(player.Character)
            end
        end
    end
end

-- Skeleton ESP Implementation
local skeletons = {}

local function createLine()
    local success, line = pcall(function()
        return Drawing.new("Line")
    end)

    if success and line then
        return line
    else
        return nil
    end
end

local function removeSkeleton(skeleton)
    if skeleton then
        for _, line in pairs(skeleton) do
            pcall(function() line:Remove() end)
        end
    end
end

local function updateSkeleton(plr)
    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or not plr.Character:FindFirstChild("Humanoid") then
        if skeletons[plr] then
            removeSkeleton(skeletons[plr])
            skeletons[plr] = nil
        end
        return
    end

    local character = plr.Character
    local humanoid = character:FindFirstChild("Humanoid")
    local skeleton = skeletons[plr] or {}
    skeletons[plr] = skeleton

    local joints = {}
    local connections = {}

    if humanoid and humanoid.RigType == Enum.HumanoidRigType.R15 then
        joints = {
            ["Head"] = character:FindFirstChild("Head"),
            ["UpperTorso"] = character:FindFirstChild("UpperTorso"),
            ["LowerTorso"] = character:FindFirstChild("LowerTorso"),
            ["LeftUpperArm"] = character:FindFirstChild("LeftUpperArm"),
            ["LeftLowerArm"] = character:FindFirstChild("LeftLowerArm"),
            ["LeftHand"] = character:FindFirstChild("LeftHand"),
            ["RightUpperArm"] = character:FindFirstChild("RightUpperArm"),
            ["RightLowerArm"] = character:FindFirstChild("RightLowerArm"),
            ["RightHand"] = character:FindFirstChild("RightHand"),
            ["LeftUpperLeg"] = character:FindFirstChild("LeftUpperLeg"),
            ["LeftLowerLeg"] = character:FindFirstChild("LeftLowerLeg"),
            ["RightUpperLeg"] = character:FindFirstChild("RightUpperLeg"),
            ["RightLowerLeg"] = character:FindFirstChild("RightLowerLeg"),
        }

        connections = {
            { "Head", "UpperTorso" },
            { "UpperTorso", "LowerTorso" },
            { "LowerTorso", "LeftUpperLeg" },
            { "LeftUpperLeg", "LeftLowerLeg" },
            { "LowerTorso", "RightUpperLeg" },
            { "RightUpperLeg", "RightLowerLeg" },
            { "UpperTorso", "LeftUpperArm" },
            { "LeftUpperArm", "LeftLowerArm" },
            { "LeftLowerArm", "LeftHand" },
            { "UpperTorso", "RightUpperArm" },
            { "RightUpperArm", "RightLowerArm" },
            { "RightLowerArm", "RightHand" },
        }
    elseif humanoid and humanoid.RigType == Enum.HumanoidRigType.R6 then
        joints = {
            ["Head"] = character:FindFirstChild("Head"),
            ["Torso"] = character:FindFirstChild("Torso"),
            ["LeftLeg"] = character:FindFirstChild("Left Leg"),
            ["RightLeg"] = character:FindFirstChild("Right Leg"),
            ["LeftArm"] = character:FindFirstChild("Left Arm"),
            ["RightArm"] = character:FindFirstChild("Right Arm"),
        }

        connections = {
            { "Head", "Torso" },
            { "Torso", "LeftArm" },
            { "Torso", "RightArm" },
            { "Torso", "LeftLeg" },
            { "Torso", "RightLeg" },
        }
    end

    for index, connection in ipairs(connections) do
        local jointA = joints[connection[1]]
        local jointB = joints[connection[2]]

        if jointA and jointB then
            local posA, onScreenA = Camera:WorldToViewportPoint(jointA.Position)
            local posB, onScreenB = Camera:WorldToViewportPoint(jointB.Position)

            local line = skeleton[index]
            if not line then
                line = createLine()
                if line then
                    skeleton[index] = line
                end
            end

            if line then
                line.Color = skeletonEspSettings.Color
                line.Thickness = skeletonEspSettings.Thickness
                line.Transparency = skeletonEspSettings.Transparency

                if onScreenA and onScreenB then
                    if connection[2] == "LeftArm" or connection[2] == "RightArm" then
                        local offsetY = 0.5
                        posB = Camera:WorldToViewportPoint(jointB.Position + Vector3.new(0, offsetY, 0))
                    end

                    line.From = Vector2.new(posA.X, posA.Y)
                    line.To = Vector2.new(posB.X, posB.Y)
                    line.Visible = true
                else
                    line.Visible = false
                end
            else
                local line = skeleton[index]
                if line then
                    line.Visible = false
                end
            end
        else
            local line = skeleton[index]
            if line then
                line.Visible = false
            end
        end
    end
end

local function UpdateSkeletonESP()
    if not skeletonEspSettings.Enabled or not visualsSettings.enableESP then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and skeletons[player] then
                removeSkeleton(skeletons[player])
                skeletons[player] = nil
            end
        end
        return
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            pcall(function() updateSkeleton(player) end)
        end
    end
end

-- Exit ESP Implementation
local exitEspObjects = {}

local function createExitESP(part)
    if exitEspObjects[part] then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ExitESP"
    billboard.Adornee = part
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, part.Size.Y/2 + exitEspSettings.Offset, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = true
    billboard.MaxDistance = exitEspSettings.MaxDistance

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboard
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "EXIT"
    textLabel.TextColor3 = exitEspSettings.Color
    textLabel.TextScaled = false
    textLabel.TextSize = exitEspSettings.TextSize
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextStrokeTransparency = 0.2
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center

    pcall(function() billboard.Parent = part end)

    exitEspObjects[part] = {
        billboard = billboard,
        connection = nil
    }

    pcall(function()
        exitEspObjects[part].connection = part.AncestryChanged:Connect(function(_, newParent)
            if not newParent then
                removeExitESP(part)
            end
        end)
    end)
end

local function removeExitESP(part)
    if exitEspObjects[part] then
        if exitEspObjects[part].connection then
            pcall(function() exitEspObjects[part].connection:Disconnect() end)
            exitEspObjects[part].connection = nil
        end

        if exitEspObjects[part].billboard then
            pcall(function() exitEspObjects[part].billboard:Destroy() end)
            exitEspObjects[part].billboard = nil
        end

        exitEspObjects[part] = nil
    end
end

local function findExistingExits()
    local descendants = {}
    pcall(function() descendants = Workspace:GetDescendants() end)

    for _, part in ipairs(descendants) do
        if part.ClassName == "Part" and part.Name == "Exit" then
            createExitESP(part)
        end
    end
end

local function onDescendantAdded(descendant)
    if descendant.ClassName == "Part" and descendant.Name == "Exit" then
        createExitESP(descendant)
    end
end

findExistingExits()

local descendantAddedConnection
pcall(function()
    descendantAddedConnection = Workspace.DescendantAdded:Connect(onDescendantAdded)
end)

RunService.RenderStepped:Connect(function()
    if not exitEspSettings.Enabled then
        for part, espData in pairs(exitEspObjects) do
            if espData.billboard then
                espData.billboard.Enabled = false
            end
        end
        return
    end

    local player = Players.LocalPlayer
    local character = player and player.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

    for part, espData in pairs(exitEspObjects) do
        if part and part.Parent then
            local billboard = espData.billboard

            if billboard then
                billboard.Enabled = true
                billboard.StudsOffset = Vector3.new(0, part.Size.Y/2 + exitEspSettings.Offset, 0)

                if humanoidRootPart then
                    local distance = (humanoidRootPart.Position - part.Position).Magnitude
                    local roundedDistance = math.floor(distance + 0.5)
                    billboard.TextLabel.Text = "EXIT [" .. roundedDistance .. "m]"

                    if distance < exitEspSettings.CloseDistance then
                        billboard.TextLabel.TextColor3 = exitEspSettings.CloseColor
                    elseif distance < exitEspSettings.MediumDistance then
                        billboard.TextLabel.TextColor3 = exitEspSettings.MediumColor
                    else
                        billboard.TextLabel.TextColor3 = exitEspSettings.FarColor
                    end
                else
                    billboard.TextLabel.Text = "EXIT"
                    billboard.TextLabel.TextColor3 = exitEspSettings.Color
                end
            end
        else
            removeExitESP(part)
        end
    end
end)

-- Misc Tab
local miscPage = pages["MISC"]
local miscContainer = Instance.new("Frame")
miscContainer.Size = UDim2.new(0, 220, 0, 350)
miscContainer.Position = UDim2.new(0.5, -110, 0, 10)
miscContainer.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
miscContainer.BorderSizePixel = 0
miscContainer.ZIndex = 4
miscContainer.Parent = miscPage

local miscContainerCorner = Instance.new("UICorner")
miscContainerCorner.CornerRadius = UDim.new(0, 8)
miscContainerCorner.Parent = miscContainer

local miscBorder = Instance.new("UIStroke")
miscBorder.Color = Color3.fromRGB(255, 0, 255)
miscBorder.Thickness = 1
miscBorder.Transparency = 0.3
miscBorder.Parent = miscContainer

-- Store original settings
local originalLightingSettings = {
    TimeOfDay = Lighting.TimeOfDay,
    Brightness = Lighting.Brightness,
    Ambient = Lighting.Ambient,
    ClockTime = Lighting.ClockTime
}

local originalGraphicsSettings = {
    Technology = Lighting.Technology,
    QualityLevel = settings().Rendering.QualityLevel,
    GlobalShadows = Lighting.GlobalShadows,
    FogEnd = Lighting.FogEnd
}

-- Full Bright
local fullBrightEnabled = false

local fullBrightToggle = Instance.new("TextButton")
fullBrightToggle.Size = UDim2.new(0, 200, 0, 22)
fullBrightToggle.Position = UDim2.new(0.5, -100, 0, 10)
fullBrightToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
fullBrightToggle.Text = "FULL BRIGHT: OFF"
fullBrightToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
fullBrightToggle.Font = Enum.Font.GothamBold
fullBrightToggle.TextSize = 8
fullBrightToggle.TextScaled = true
fullBrightToggle.ZIndex = 5
fullBrightToggle.Parent = miscContainer

local fullBrightCorner = Instance.new("UICorner")
fullBrightCorner.CornerRadius = UDim.new(0, 6)
fullBrightCorner.Parent = fullBrightToggle

fullBrightToggle.MouseButton1Click:Connect(function()
    fullBrightEnabled = not fullBrightEnabled

    if fullBrightEnabled then
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.new(1, 1, 1)
        fullBrightToggle.Text = "FULL BRIGHT: ON"
        fullBrightToggle.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    else
        Lighting.Brightness = originalLightingSettings.Brightness
        Lighting.Ambient = originalLightingSettings.Ambient
        Lighting.TimeOfDay = originalLightingSettings.TimeOfDay
        fullBrightToggle.Text = "FULL BRIGHT: OFF"
        fullBrightToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    end
end)

-- Low Graphics
local lowGraphicsEnabled = false

local function applyLowGraphics()
    pcall(function()
        sethiddenproperty(game.Lighting, "Technology", 2)
    end)
    
    pcall(function()
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            sethiddenproperty(terrain, "Decoration", false)
        end
    end)
    
    settings().Rendering.QualityLevel = 1
    setsimulationradius(0,0)
    game.Lighting.GlobalShadows = false
    game.Lighting.FogEnd = 9e9
    
    pcall(function()
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.Elasticity = 0
        end
    end)
    
    for _, obj in pairs(game:GetDescendants()) do
        spawn(function()
            pcall(function()
                if obj:IsA("DataModelMesh") then
                    sethiddenproperty(obj, "LODX", Enum.LevelOfDetailSetting.Low)
                    sethiddenproperty(obj, "LODY", Enum.LevelOfDetailSetting.Low)
                    obj.CollisionFidelity = "Hull"
                elseif obj:IsA("UnionOperation") then
                    obj.CollisionFidelity = "Hull"
                elseif obj:IsA("Model") then
                    sethiddenproperty(obj, "LevelOfDetail", 1)
                elseif obj:IsA("BasePart") then
                    obj.Reflectance = 0
                    obj.CastShadow = false
                end
            end)
        end)
    end
    
    for _, effect in pairs(game.Lighting:GetChildren()) do
        if effect:IsA("PostEffect") then
            effect.Enabled = false
        end
    end
end

local function restoreGraphics()
    pcall(function()
        sethiddenproperty(game.Lighting, "Technology", originalGraphicsSettings.Technology)
    end)
    
    pcall(function()
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            sethiddenproperty(terrain, "Decoration", true)
        end
    end)
    
    settings().Rendering.QualityLevel = originalGraphicsSettings.QualityLevel
    game.Lighting.GlobalShadows = originalGraphicsSettings.GlobalShadows
    game.Lighting.FogEnd = originalGraphicsSettings.FogEnd
    
    pcall(function()
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.Elasticity = 0.5
        end
    end)
    
    for _, obj in pairs(game:GetDescendants()) do
        spawn(function()
            pcall(function()
                if obj:IsA("DataModelMesh") then
                    sethiddenproperty(obj, "LODX", Enum.LevelOfDetailSetting.Medium)
                    sethiddenproperty(obj, "LODY", Enum.LevelOfDetailSetting.Medium)
                    obj.CollisionFidelity = "PreciseConvexDecomposition"
                elseif obj:IsA("UnionOperation") then
                    obj.CollisionFidelity = "PreciseConvexDecomposition"
                elseif obj:IsA("Model") then
                    sethiddenproperty(obj, "LevelOfDetail", 0)
                elseif obj:IsA("BasePart") then
                    obj.Reflectance = 0.2
                    obj.CastShadow = true
                end
            end)
        end)
    end
    
    for _, effect in pairs(game.Lighting:GetChildren()) do
        if effect:IsA("PostEffect") then
            effect.Enabled = true
        end
    end
end

local lowGraphicsToggle = Instance.new("TextButton")
lowGraphicsToggle.Size = UDim2.new(0, 200, 0, 22)
lowGraphicsToggle.Position = UDim2.new(0.5, -100, 0, 35)
lowGraphicsToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
lowGraphicsToggle.Text = "LOW GRAPHICS: OFF"
lowGraphicsToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
lowGraphicsToggle.Font = Enum.Font.GothamBold
lowGraphicsToggle.TextSize = 8
lowGraphicsToggle.TextScaled = true
lowGraphicsToggle.ZIndex = 5
lowGraphicsToggle.Parent = miscContainer

local lowGraphicsCorner = Instance.new("UICorner")
lowGraphicsCorner.CornerRadius = UDim.new(0, 6)
lowGraphicsCorner.Parent = lowGraphicsToggle

lowGraphicsToggle.MouseButton1Click:Connect(function()
    lowGraphicsEnabled = not lowGraphicsEnabled

    if lowGraphicsEnabled then
        applyLowGraphics()
        lowGraphicsToggle.Text = "LOW GRAPHICS: ON"
        lowGraphicsToggle.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    else
        restoreGraphics()
        lowGraphicsToggle.Text = "LOW GRAPHICS: OFF"
        lowGraphicsToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    end
end)

-- Crosshair
local crosshairEnabled = false
local crosshairSize = 6
local crosshairThickness = 1
local crosshairColor = Color3.fromRGB(255, 0, 255)
local crosshairTransparency = 0
local crosshairOffsetY = 16

local crosshairGui = Instance.new("ScreenGui")
crosshairGui.Name = "Crosshair"
crosshairGui.ResetOnSpawn = false
crosshairGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
crosshairGui.Enabled = false
crosshairGui.IgnoreGuiInset = true

local horizontalLine = Instance.new("Frame")
horizontalLine.Name = "Horizontal"
horizontalLine.Size = UDim2.new(0, crosshairSize * 2, 0, crosshairThickness)
horizontalLine.Position = UDim2.new(0.5, -crosshairSize, 0.5, -crosshairThickness/2 - crosshairOffsetY)
horizontalLine.BackgroundColor3 = crosshairColor
horizontalLine.BorderSizePixel = 0
horizontalLine.Parent = crosshairGui

local verticalLine = Instance.new("Frame")
verticalLine.Name = "Vertical"
verticalLine.Size = UDim2.new(0, crosshairThickness, 0, crosshairSize * 2)
verticalLine.Position = UDim2.new(0.5, -crosshairThickness/2, 0.5, -crosshairSize - crosshairOffsetY)
verticalLine.BackgroundColor3 = crosshairColor
verticalLine.BorderSizePixel = 0
verticalLine.Parent = crosshairGui

local centerDot = Instance.new("Frame")
centerDot.Name = "CenterDot"
centerDot.Size = UDim2.new(0, crosshairThickness * 2, 0, crosshairThickness * 2)
centerDot.Position = UDim2.new(0.5, -crosshairThickness, 0.5, -crosshairThickness - crosshairOffsetY)
centerDot.BackgroundColor3 = crosshairColor
centerDot.BorderSizePixel = 0
centerDot.Parent = crosshairGui

local function updateCrosshair()
    horizontalLine.Size = UDim2.new(0, crosshairSize * 2, 0, crosshairThickness)
    verticalLine.Size = UDim2.new(0, crosshairThickness, 0, crosshairSize * 2)
    centerDot.Size = UDim2.new(0, crosshairThickness * 2, 0, crosshairThickness * 2)

    horizontalLine.Position = UDim2.new(0.5, -crosshairSize, 0.5, -crosshairThickness/2 - crosshairOffsetY)
    verticalLine.Position = UDim2.new(0.5, -crosshairThickness/2, 0.5, -crosshairSize - crosshairOffsetY)
    centerDot.Position = UDim2.new(0.5, -crosshairThickness, 0.5, -crosshairThickness - crosshairOffsetY)

    horizontalLine.BackgroundColor3 = crosshairColor
    verticalLine.BackgroundColor3 = crosshairColor
    centerDot.BackgroundColor3 = crosshairColor

    crosshairGui.Enabled = crosshairEnabled
end

local crosshairToggle = Instance.new("TextButton")
crosshairToggle.Size = UDim2.new(0, 200, 0, 22)
crosshairToggle.Position = UDim2.new(0.5, -100, 0, 60)
crosshairToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
crosshairToggle.Text = "CROSSHAIR: OFF"
crosshairToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
crosshairToggle.Font = Enum.Font.GothamBold
crosshairToggle.TextSize = 8
crosshairToggle.TextScaled = true
crosshairToggle.ZIndex = 5
crosshairToggle.Parent = miscContainer

local crosshairCorner = Instance.new("UICorner")
crosshairCorner.CornerRadius = UDim.new(0, 6)
crosshairCorner.Parent = crosshairToggle

crosshairToggle.MouseButton1Click:Connect(function()
    crosshairEnabled = not crosshairEnabled
    crosshairToggle.Text = "CROSSHAIR: " .. (crosshairEnabled and "ON" or "OFF")
    crosshairToggle.BackgroundColor3 = crosshairEnabled and Color3.fromRGB(128, 0, 128) or Color3.fromRGB(50, 0, 80)
    updateCrosshair()
end)

createSlider("CROSSHAIR SIZE", 3, 15, 6, 85, miscContainer, function(value)
    crosshairSize = value
    updateCrosshair()
end)

-- Time Changer
local timeChangerEnabled = false
local currentTime = 12
local timeChangerConn

local function setTimeChangerEnabled(enabled)
    timeChangerEnabled = enabled

    if timeChangerConn then
        timeChangerConn:Disconnect()
        timeChangerConn = nil
    end

    if enabled then
        timeChangerConn = RunService.Heartbeat:Connect(function()
            Lighting.ClockTime = currentTime
        end)
    else
        Lighting.ClockTime = originalLightingSettings.ClockTime
    end
end

local timeChangerToggle = Instance.new("TextButton")
timeChangerToggle.Size = UDim2.new(0, 200, 0, 22)
timeChangerToggle.Position = UDim2.new(0.5, -100, 0, 125)
timeChangerToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
timeChangerToggle.Text = "TIME CHANGER: OFF"
timeChangerToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
timeChangerToggle.Font = Enum.Font.GothamBold
timeChangerToggle.TextSize = 8
timeChangerToggle.TextScaled = true
timeChangerToggle.ZIndex = 5
timeChangerToggle.Parent = miscContainer

local timeChangerCorner = Instance.new("UICorner")
timeChangerCorner.CornerRadius = UDim.new(0, 6)
timeChangerCorner.Parent = timeChangerToggle

timeChangerToggle.MouseButton1Click:Connect(function()
    timeChangerEnabled = not timeChangerEnabled
    setTimeChangerEnabled(timeChangerEnabled)
    timeChangerToggle.Text = "TIME CHANGER: " .. (timeChangerEnabled and "ON" or "OFF")
    timeChangerToggle.BackgroundColor3 = timeChangerEnabled and Color3.fromRGB(128, 0, 128) or Color3.fromRGB(50, 0, 80)
end)

createSlider("TIME", 0, 24, 12, 150, miscContainer, function(value)
    currentTime = value
    if timeChangerEnabled then
        Lighting.ClockTime = currentTime
    end
end)

-- FOV Changer
local originalFOV = Camera.FieldOfView
local desiredFOV = originalFOV
local fovEnabled = false
local fovLocked = false

local povLabel = Instance.new("TextLabel")
povLabel.Size = UDim2.new(1, -10, 0, 14)
povLabel.Position = UDim2.new(0, 5, 0, 190)
povLabel.BackgroundTransparency = 1
povLabel.Text = "FIELD OF VIEW"
povLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
povLabel.Font = Enum.Font.GothamBold
povLabel.TextSize = 8
povLabel.TextScaled = true
povLabel.ZIndex = 5
povLabel.Parent = miscContainer

createSlider("FOV", 50, 120, 70, 210, miscContainer, function(value)
    desiredFOV = value
    fovEnabled = true
    fovLocked = true
    Camera.FieldOfView = desiredFOV
end)

local resetFovButton = Instance.new("TextButton")
resetFovButton.Size = UDim2.new(0, 200, 0, 22)
resetFovButton.Position = UDim2.new(0.5, -100, 0, 250)
resetFovButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
resetFovButton.Text = "RESET FOV"
resetFovButton.TextColor3 = Color3.fromRGB(255, 255, 255)
resetFovButton.Font = Enum.Font.GothamBold
resetFovButton.TextSize = 8
resetFovButton.TextScaled = true
resetFovButton.ZIndex = 5
resetFovButton.Parent = miscContainer

local resetFovCorner = Instance.new("UICorner")
resetFovCorner.CornerRadius = UDim.new(0, 6)
resetFovCorner.Parent = resetFovButton

resetFovButton.MouseButton1Click:Connect(function()
    desiredFOV = originalFOV
    fovEnabled = false
    fovLocked = false
    Camera.FieldOfView = originalFOV
end)

-- Zoom
local zoomEnabled = false
local isZooming = false
local previousFOV = Camera.FieldOfView
local zoomKey = Enum.KeyCode.F

local zoomToggle = Instance.new("TextButton")
zoomToggle.Size = UDim2.new(0, 200, 0, 22)
zoomToggle.Position = UDim2.new(0.5, -100, 0, 280)
zoomToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
zoomToggle.Text = "ZOOM: OFF (F)"
zoomToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
zoomToggle.Font = Enum.Font.GothamBold
zoomToggle.TextSize = 8
zoomToggle.TextScaled = true
zoomToggle.ZIndex = 5
zoomToggle.Parent = miscContainer

local zoomCorner = Instance.new("UICorner")
zoomCorner.CornerRadius = UDim.new(0, 6)
zoomCorner.Parent = zoomToggle

zoomToggle.MouseButton1Click:Connect(function()
    zoomEnabled = not zoomEnabled
    zoomToggle.Text = "ZOOM: " .. (zoomEnabled and "ON (F)" or "OFF (F)")
    zoomToggle.BackgroundColor3 = zoomEnabled and Color3.fromRGB(128, 0, 128) or Color3.fromRGB(50, 0, 80)
    
    if isZooming and not zoomEnabled then
        Camera.FieldOfView = previousFOV
        isZooming = false
    end
end)

UIS.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == zoomKey and zoomEnabled then
        isZooming = not isZooming
        
        if isZooming then
            previousFOV = Camera.FieldOfView
            Camera.FieldOfView = 30
        else
            Camera.FieldOfView = previousFOV
        end
    end
end)

-- Rainbow ViewModel
local rainbowEnabled = false
local rainbowConnection = nil
local hue = 0
local rainbowSpeed = 5
local rainbowViewModels = {}

local function hsvToRgb(h, s, v)
    local c = v * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))	
    local m = v - c
    
    local r, g, b
    if h >= 0 and h < 60 then
        r, g, b = c, x, 0
    elseif h >= 60 and h < 120 then
        r, g, b = x, c, 0
    elseif h >= 120 and h < 180 then
        r, g, b = 0, c, x
    elseif h >= 180 and h < 240 then
        r, g, b = 0, x, c
    elseif h >= 240 and h < 300 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end
    
    return Color3.new(r + m, g + m, b + m)
end

local function applyViewModelEffects(model)
    if model.ClassName == "Model" and model.Name == "ViewModel" then
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                pcall(function()
                    part.LocalTransparencyModifier = 0.9
                end)
            end
        end
        
        pcall(function()
            local existingHighlight = model:FindFirstChild("ViewModelHighlight")
            if existingHighlight then
                existingHighlight:Destroy()
            end
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "ViewModelHighlight"
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.Parent = model
        end)
    end
end

local function removeViewModelEffects(model)
    if model.ClassName == "Model" and model.Name == "ViewModel" then
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                pcall(function()
                    part.LocalTransparencyModifier = 0
                end)
            end
        end
        
        pcall(function()
            local highlight = model:FindFirstChild("ViewModelHighlight")
            if highlight then
                highlight:Destroy()
            end
        end)
    end
end

local function updateRainbowColorsForModel(model, color)
    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") then
            pcall(function()
                part.Color = color
            end)
        end
    end
    
    local highlight = model:FindFirstChild("ViewModelHighlight")
    if highlight then
        pcall(function()
            highlight.FillColor = color
            highlight.OutlineColor = Color3.new(color.R * 0.5, color.G * 0.5, color.B * 0.5)
        end)
    end
end

local function scanForViewModels()
    pcall(function()
        for _, model in ipairs(Workspace:GetDescendants()) do
            if model.ClassName == "Model" and model.Name == "ViewModel" and not rainbowViewModels[model] then
                rainbowViewModels[model] = true
                applyViewModelEffects(model)
            end
        end
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                local viewModel = player.Character:FindFirstChild("ViewModel")
                if viewModel and not rainbowViewModels[viewModel] then
                    rainbowViewModels[viewModel] = true
                    applyViewModelEffects(viewModel)
                end
            end
        end
    end)
end

local function updateRainbowColors()
    hue = (hue + rainbowSpeed) % 360
    local rainbowColor = hsvToRgb(hue, 1, 1)
    
    for model in pairs(rainbowViewModels) do
        if model and model.Parent then
            updateRainbowColorsForModel(model, rainbowColor)
        else
            rainbowViewModels[model] = nil
        end
    end
end

local function enableRainbowEffects()
    rainbowEnabled = true
    scanForViewModels()
    
    spawn(function()
        while rainbowEnabled do
            updateRainbowColors()
            wait(0.1)
        end
    end)
end

local function disableRainbowEffects()
    rainbowEnabled = false
    
    for model in pairs(rainbowViewModels) do
        removeViewModelEffects(model)
    end
    rainbowViewModels = {}
end

local rainbowToggle = Instance.new("TextButton")
rainbowToggle.Size = UDim2.new(0, 200, 0, 22)
rainbowToggle.Position = UDim2.new(0.5, -100, 0, 310)
rainbowToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
rainbowToggle.Text = "RAINBOW VIEWMODEL: OFF"
rainbowToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
rainbowToggle.Font = Enum.Font.GothamBold
rainbowToggle.TextSize = 8
rainbowToggle.TextScaled = true
rainbowToggle.ZIndex = 5
rainbowToggle.Parent = miscContainer

local rainbowCorner = Instance.new("UICorner")
rainbowCorner.CornerRadius = UDim.new(0, 6)
rainbowCorner.Parent = rainbowToggle

rainbowToggle.MouseButton1Click:Connect(function()
    rainbowEnabled = not rainbowEnabled
    rainbowToggle.Text = "RAINBOW VIEWMODEL: " .. (rainbowEnabled and "ON" or "OFF")
    rainbowToggle.BackgroundColor3 = rainbowEnabled and Color3.fromRGB(128, 0, 128) or Color3.fromRGB(50, 0, 80)
    
    if rainbowEnabled then
        enableRainbowEffects()
    else
        disableRainbowEffects()
    end
end)

pcall(function()
    Workspace.DescendantAdded:Connect(function(descendant)
        if descendant.ClassName == "Model" and descendant.Name == "ViewModel" and rainbowEnabled then
            if not rainbowViewModels[descendant] then
                rainbowViewModels[descendant] = true
                applyViewModelEffects(descendant)
            end
        end
    end)
end)

pcall(function()
    Workspace.DescendantRemoved:Connect(function(descendant)
        if descendant.ClassName == "Model" and descendant.Name == "ViewModel" then
            if rainbowViewModels[descendant] then
                rainbowViewModels[descendant] = nil
            end
        end
    end)
end)

pcall(function()
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            character.ChildAdded:Connect(function(child)
                if child.ClassName == "Model" and child.Name == "ViewModel" and rainbowEnabled then
                    if not rainbowViewModels[child] then
                        rainbowViewModels[child] = true
                        applyViewModelEffects(child)
                    end
                end
            end)
        end)
    end)
end)

pcall(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            local viewModel = player.Character:FindFirstChild("ViewModel")
            if viewModel and rainbowEnabled and not rainbowViewModels[viewModel] then
                rainbowViewModels[viewModel] = true
                applyViewModelEffects(viewModel)
            end
        end
    end
end)

-- Maintenance Loop
RunService.RenderStepped:Connect(function()
    if isZooming then
        Camera.FieldOfView = 30
    elseif fovLocked and Camera.FieldOfView ~= desiredFOV then
        Camera.FieldOfView = desiredFOV
    end
    
    if fullBrightEnabled then
        if Lighting.Brightness ~= 2 then
            Lighting.Brightness = 2
        end
        if Lighting.Ambient ~= Color3.new(1, 1, 1) then
            Lighting.Ambient = Color3.new(1, 1, 1)
        end
    end
end)

-- Initialize
updateCrosshair()

-- Toggle UI
UIS.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightShift then
        mainFrame.Visible = not mainFrame.Visible
        toggleButton.Text = mainFrame.Visible and "X" or "+"
        floatingButton.Visible = not mainFrame.Visible
    end
end)

-- Run maintenance loops for ESP features
spawn(function()
    while true do
        UpdateChams()
        UpdateSkeletonESP()
        wait(0.1)
    end
end)
