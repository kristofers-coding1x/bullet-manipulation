-- NightHook(PAID) Full Script with Error Handling, Dropped Items ESP Toggle, Zoom Feature, Rainbow ViewModel, and Automatic Prediction
-- MOBILE EDITION - Added touch support, smaller GUI, and toggle button
-- Key System Implementation with Purple, Black, and Pink Theme (Redesigned)
local keySystemGui = Instance.new("ScreenGui")
keySystemGui.Name = "KeySystem"
keySystemGui.ResetOnSpawn = false
keySystemGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Main frame with premium design - Made smaller for mobile
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 400, 0, 200) -- Reduced from 500x250 to 400x200
keyFrame.Position = UDim2.new(0.5, -200, 0.5, -100) -- Adjusted position for centering
keyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20) -- Dark background
keyFrame.BorderSizePixel = 0
keyFrame.Active = true
keyFrame.Draggable = true
keyFrame.Parent = keySystemGui

-- Add rounded corners
local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 20)
keyCorner.Parent = keyFrame

-- Add premium gradient overlay
local gradientOverlay = Instance.new("Frame")
gradientOverlay.Size = UDim2.new(1, 0, 1, 0)
gradientOverlay.Position = UDim2.new(0, 0, 0, 0)
gradientOverlay.BackgroundColor3 = Color3.fromRGB(30, 0, 50) -- Dark purple
gradientOverlay.BorderSizePixel = 0
gradientOverlay.BackgroundTransparency = 0.8
gradientOverlay.ZIndex = 1
gradientOverlay.Parent = keyFrame

-- Add shadow
local keyShadow = Instance.new("Frame")
keyShadow.Size = UDim2.new(1, 15, 1, 15)
keyShadow.Position = UDim2.new(0, 8, 0, 8)
keyShadow.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
keyShadow.BorderSizePixel = 0
keyShadow.BackgroundTransparency = 0.4
keyShadow.ZIndex = 0
keyShadow.Parent = keyFrame

local keyShadowCorner = Instance.new("UICorner")
keyShadowCorner.CornerRadius = UDim.new(0, 20)
keyShadowCorner.Parent = keyShadow

-- Title bar with gradient
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 0, 40) -- Dark purple
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 2
titleBar.Parent = keyFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 20)
titleCorner.Parent = titleBar

-- Title text with custom font
local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 1, 0)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "NIGHTHOOK AUTHENTICATION"
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 18 -- Reduced from 22
keyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTitle.ZIndex = 3
keyTitle.Parent = titleBar

-- Add gradient to title
local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)), -- Pink
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 0, 128)), -- Purple
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) -- Black
}
titleGradient.Rotation = 90
titleGradient.Parent = keyTitle

-- Decorative elements
local decorCircle1 = Instance.new("Frame")
decorCircle1.Size = UDim2.new(0, 30, 0, 30) -- Reduced from 40x40
decorCircle1.Position = UDim2.new(0, 15, 0, 55) -- Adjusted position
decorCircle1.BackgroundColor3 = Color3.fromRGB(255, 0, 255) -- Pink
decorCircle1.BorderSizePixel = 0
decorCircle1.ZIndex = 3
decorCircle1.Parent = keyFrame

local decorCircle1Corner = Instance.new("UICorner")
decorCircle1Corner.CornerRadius = UDim.new(0, 15) -- Adjusted
decorCircle1Corner.Parent = decorCircle1

local decorCircle2 = Instance.new("Frame")
decorCircle2.Size = UDim2.new(0, 25, 0, 25) -- Reduced from 30x30
decorCircle2.Position = UDim2.new(1, -40, 0, 60) -- Adjusted position
decorCircle2.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
decorCircle2.BorderSizePixel = 0
decorCircle2.ZIndex = 3
decorCircle2.Parent = keyFrame

local decorCircle2Corner = Instance.new("UICorner")
decorCircle2Corner.CornerRadius = UDim.new(0, 12) -- Adjusted
decorCircle2Corner.Parent = decorCircle2

-- Close button with custom design
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30) -- Reduced from 35x35
closeButton.Position = UDim2.new(1, -32, 0, 10) -- Adjusted position
closeButton.BackgroundColor3 = Color3.fromRGB(30, 0, 50) -- Dark purple
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 255) -- Pink
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18 -- Reduced from 20
closeButton.ZIndex = 3
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
end)

closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
end)

-- Left side container for logo - Made smaller
local leftContainer = Instance.new("Frame")
leftContainer.Size = UDim2.new(0, 120, 0, 140) -- Reduced from 150x180
leftContainer.Position = UDim2.new(0, 15, 0, 50) -- Adjusted position
leftContainer.BackgroundColor3 = Color3.fromRGB(25, 0, 45) -- Dark purple
leftContainer.BorderSizePixel = 0
leftContainer.ZIndex = 2
leftContainer.Parent = keyFrame

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, 15)
leftCorner.Parent = leftContainer

-- Custom NightHook Logo (replacing image) - Pink block with text - Made smaller
local logoFrame = Instance.new("Frame")
logoFrame.Size = UDim2.new(0, 100, 0, 50) -- Reduced from 130x70
logoFrame.Position = UDim2.new(0.5, -50, 0, 15) -- Adjusted position
logoFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255) -- Pink background
logoFrame.BorderSizePixel = 0
logoFrame.ZIndex = 3
logoFrame.Parent = leftContainer

local logoFrameCorner = Instance.new("UICorner")
logoFrameCorner.CornerRadius = UDim.new(0, 10)
logoFrameCorner.Parent = logoFrame

-- NightHook text (purple) with handwritten style
local nightHookText = Instance.new("TextLabel")
nightHookText.Size = UDim2.new(0, 100, 0, 20) -- Adjusted
nightHookText.Position = UDim2.new(0, 0, 0, 8) -- Adjusted
nightHookText.BackgroundTransparency = 1
nightHookText.Text = "NightHook"
nightHookText.Font = Enum.Font.GothamBold -- Using GothamBold as closest to handwritten
nightHookText.TextSize = 16 -- Reduced from 20
nightHookText.TextColor3 = Color3.fromRGB(128, 0, 128) -- Purple
nightHookText.TextXAlignment = Enum.TextXAlignment.Center
nightHookText.ZIndex = 4
nightHookText.Parent = logoFrame

-- (PAID) text (pink) in bold - NOW BELOW NightHook
local paidText = Instance.new("TextLabel")
paidText.Size = UDim2.new(0, 100, 0, 18) -- Adjusted
paidText.Position = UDim2.new(0, 0, 0, 25) -- Adjusted
paidText.BackgroundTransparency = 1
paidText.Text = "  (PAID)" -- Added spaces for indentation
paidText.Font = Enum.Font.GothamBold
paidText.TextSize = 12 -- Reduced from 16
paidText.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text for contrast on pink
paidText.TextXAlignment = Enum.TextXAlignment.Center
paidText.ZIndex = 4
paidText.Parent = logoFrame

-- Logo text
local logoText = Instance.new("TextLabel")
logoText.Size = UDim2.new(1, 0, 0, 18) -- Adjusted
logoText.Position = UDim2.new(0, 0, 0, 85) -- Adjusted
logoText.BackgroundTransparency = 1
logoText.Text = "NIGHTHOOK"
logoText.TextColor3 = Color3.fromRGB(255, 255, 255)
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = 12 -- Reduced from 16
logoText.ZIndex = 3
logoText.Parent = leftContainer

-- Right side container for input - Made smaller
local rightContainer = Instance.new("Frame")
rightContainer.Size = UDim2.new(0, 240, 0, 140) -- Reduced from 290x180
rightContainer.Position = UDim2.new(1, -255, 0, 50) -- Adjusted position
rightContainer.BackgroundColor3 = Color3.fromRGB(20, 0, 40) -- Dark purple
rightContainer.BorderSizePixel = 0
rightContainer.ZIndex = 2
rightContainer.Parent = keyFrame

local rightCorner = Instance.new("UICorner")
rightCorner.CornerRadius = UDim.new(0, 15)
rightCorner.Parent = rightContainer

-- Input field with custom design - Made smaller
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(0, 200, 0, 35) -- Reduced from 250x45
inputFrame.Position = UDim2.new(0.5, -100, 0, 30) -- Adjusted position
inputFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50) -- Dark purple
inputFrame.BorderSizePixel = 0
inputFrame.ZIndex = 3
inputFrame.Parent = rightContainer

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 12)
inputCorner.Parent = inputFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -20, 1, 0)
keyInput.Position = UDim2.new(0, 10, 0, 0)
keyInput.BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0)
keyInput.Text = ""
keyInput.TextColor3 = Color3.fromRGB(255, 0, 255) -- Pink
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 14 -- Reduced from 16
keyInput.PlaceholderText = "Enter license key..."
keyInput.PlaceholderColor3 = Color3.fromRGB(128, 0, 128) -- Purple
keyInput.TextXAlignment = Enum.TextXAlignment.Left
keyInput.ZIndex = 4
keyInput.Parent = inputFrame

-- Submit button with custom design - Made smaller
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 100, 0, 30) -- Reduced from 120x40
submitButton.Position = UDim2.new(0.5, -50, 0, 75) -- Adjusted position
submitButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
submitButton.Text = "ACTIVATE"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Font = Enum.Font.GothamBold
submitButton.TextSize = 14 -- Reduced from 16
submitButton.ZIndex = 3
submitButton.Parent = rightContainer

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 10)
submitCorner.Parent = submitButton

local submitGradient = Instance.new("UIGradient")
submitGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)), -- Pink
    ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 128)) -- Purple
}
submitGradient.Rotation = 90
submitGradient.Parent = submitButton

submitButton.MouseEnter:Connect(function()
    submitButton.BackgroundColor3 = Color3.fromRGB(180, 0, 180)
end)

submitButton.MouseLeave:Connect(function()
    submitButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
end)

-- Status text with custom font
local keyStatus = Instance.new("TextLabel")
keyStatus.Size = UDim2.new(1, 0, 0, 18) -- Adjusted
keyStatus.Position = UDim2.new(0, 0, 1, -20) -- Adjusted
keyStatus.BackgroundTransparency = 1
keyStatus.Text = ""
keyStatus.TextColor3 = Color3.fromRGB(255, 0, 255) -- Pink
keyStatus.Font = Enum.Font.Gotham
keyStatus.TextSize = 12 -- Reduced from 14
keyStatus.ZIndex = 3
keyStatus.Parent = rightContainer

-- Info text with custom font
local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, 0, 0, 12) -- Adjusted
infoText.Position = UDim2.new(0, 0, 1, -5) -- Adjusted
infoText.BackgroundTransparency = 1
infoText.Text = "Press RightShift to toggle this window"
infoText.TextColor3 = Color3.fromRGB(128, 0, 128) -- Purple
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 9 -- Reduced from 10
infoText.ZIndex = 3
infoText.Parent = rightContainer

local correctKey = "KEY_regher3453rgo24"
local keyValid = false
local keyGuiVisible = true

-- Function to validate key
local function validateKey()
    if keyInput.Text == correctKey then
        keyValid = true
        keySystemGui:Destroy()
    else
        keyStatus.Text = "Invalid key! Please try again."
        keyInput.Text = ""
    end
end

-- Connect submit button
submitButton.MouseButton1Click:Connect(validateKey)

-- Allow Enter key to submit
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        validateKey()
    end
end)

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    keyGuiVisible = false
    keySystemGui.Enabled = false
end)

-- Toggle key UI with RightShift
game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightShift and not keyValid then
        keyGuiVisible = not keyGuiVisible
        keySystemGui.Enabled = keyGuiVisible
    end
end)

-- Wait for key validation before continuing
while not keyValid do
    wait(0.1)
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- Check if device is mobile
local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled

-- Check if Drawing API is available
local DrawingAvailable = pcall(function()
    return Drawing.new("Text")
end)

if not DrawingAvailable then
    warn("Drawing API not available. ESP features will be disabled.")
end

-- UI Setup - COMPACT SIZE
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NightHook(PAID)"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
screenGui.Enabled = true

-- Create toggle button for mobile (Smaller)
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleGUI"
toggleButton.Size = UDim2.new(0, 30, 0, 30)  -- Reduced from 40x40
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
toggleButton.Text = "NH"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 14  -- Reduced from 18
toggleButton.BorderSizePixel = 0
toggleButton.Parent = screenGui
toggleButton.ZIndex = 10

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 15)  -- Reduced from 20
toggleCorner.Parent = toggleButton

-- Main Frame with premium design - COMPACT SIZE
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, isMobile and 200 or 500, 0, isMobile and 300 or 400)  -- Reduced from 280x400 / 900x600
mainFrame.Position = UDim2.new(0.5, isMobile and -100 or -250, 0.5, isMobile and -150 or -200)  -- Adjusted position
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = true
mainFrame.Parent = screenGui

-- Add rounded corners
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, isMobile and 5 or 10)  -- Reduced from 8/20
mainCorner.Parent = mainFrame

-- Add premium gradient overlay
local gradientOverlay = Instance.new("Frame")
gradientOverlay.Size = UDim2.new(1, 0, 1, 0)
gradientOverlay.Position = UDim2.new(0, 0, 0, 0)
gradientOverlay.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
gradientOverlay.BorderSizePixel = 0
gradientOverlay.BackgroundTransparency = 0.8
gradientOverlay.ZIndex = 1
gradientOverlay.Parent = mainFrame

-- Add shadow
local mainShadow = Instance.new("Frame")
mainShadow.Size = UDim2.new(1, 10, 1, 10)  -- Reduced from 20
mainShadow.Position = UDim2.new(0, 5, 0, 5)  -- Reduced from 10
mainShadow.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
mainShadow.BorderSizePixel = 0
mainShadow.BackgroundTransparency = 0.4
mainShadow.ZIndex = 0
mainShadow.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, isMobile and 5 or 10)  -- Reduced from 8/20
shadowCorner.Parent = mainShadow

-- Left Side Menu - COMPACT SIZE
local leftMenu = Instance.new("Frame")
leftMenu.Size = UDim2.new(0, isMobile and 60 or 120, 1, isMobile and -20 or -40)  -- Reduced from 80x-40 / 220x-80
leftMenu.Position = UDim2.new(0, isMobile and 5 or 10, 0, isMobile and 15 or 30)  -- Adjusted position
leftMenu.BackgroundColor3 = Color3.fromRGB(25, 0, 45)
leftMenu.BorderSizePixel = 0
leftMenu.ZIndex = 2
leftMenu.Parent = mainFrame

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, isMobile and 4 or 8)  -- Reduced from 6/15
leftCorner.Parent = leftMenu

-- Custom NightHook Logo in Left Menu - COMPACT SIZE
local mainLogoFrame = Instance.new("Frame")
mainLogoFrame.Size = UDim2.new(0, isMobile and 40 or 80, 0, isMobile and 20 or 40)  -- Reduced from 60x30 / 180x90
mainLogoFrame.Position = UDim2.new(0.5, isMobile and -20 or -40, 0, isMobile and 5 or 10)  -- Adjusted position
mainLogoFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
mainLogoFrame.BorderSizePixel = 0
mainLogoFrame.ZIndex = 3
mainLogoFrame.Parent = leftMenu

local mainLogoCorner = Instance.new("UICorner")
mainLogoCorner.CornerRadius = UDim.new(0, isMobile and 4 or 8)  -- Reduced from 6/15
mainLogoCorner.Parent = mainLogoFrame

-- NightHook text in main GUI - COMPACT SIZE
local mainNightHookText = Instance.new("TextLabel")
mainNightHookText.Size = UDim2.new(0, isMobile and 40 or 80, 0, isMobile and 10 or 20)  -- Reduced from 60x15 / 180x40
mainNightHookText.Position = UDim2.new(0, 0, 0, isMobile and 1 or 5)  -- Adjusted position
mainNightHookText.BackgroundTransparency = 1
mainNightHookText.Text = isMobile and "NH" or "NightHook"
mainNightHookText.Font = Enum.Font.GothamBold
mainNightHookText.TextSize = isMobile and 8 or 14  -- Reduced from 12/28
mainNightHookText.TextColor3 = Color3.fromRGB(128, 0, 128)
mainNightHookText.TextXAlignment = Enum.TextXAlignment.Center
mainNightHookText.ZIndex = 4
mainNightHookText.Parent = mainLogoFrame

-- (PAID) text in main GUI - COMPACT SIZE
local mainPaidText = Instance.new("TextLabel")
mainPaidText.Size = UDim2.new(0, isMobile and 40 or 80, 0, isMobile and 8 or 15)  -- Reduced from 60x10 / 180x30
mainPaidText.Position = UDim2.new(0, 0, 0, isMobile and 10 or 20)  -- Adjusted position
mainPaidText.BackgroundTransparency = 1
mainPaidText.Text = isMobile and "$" or "(PAID)"
mainPaidText.Font = Enum.Font.GothamBold
mainPaidText.TextSize = isMobile and 6 or 10  -- Reduced from 8/20
mainPaidText.TextColor3 = Color3.fromRGB(255, 255, 255)
mainPaidText.TextXAlignment = Enum.TextXAlignment.Center
mainPaidText.ZIndex = 4
mainPaidText.Parent = mainLogoFrame

-- Logo text - HIDDEN ON MOBILE
local logoText = Instance.new("TextLabel")
logoText.Size = UDim2.new(1, 0, 0, 20)  -- Reduced from 30
logoText.Position = UDim2.new(0, 0, 0, isMobile and 30 or 60)  -- Adjusted position
logoText.BackgroundTransparency = 1
logoText.Text = isMobile and "" or "NIGHTHOOK"
logoText.TextColor3 = Color3.fromRGB(255, 255, 255)
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = isMobile and 0 or 12  -- Reduced from 18
logoText.ZIndex = 3
logoText.Parent = leftMenu

-- Status text - HIDDEN ON MOBILE
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 0, 15)  -- Reduced from 20
statusText.Position = UDim2.new(0, 0, 0, isMobile and 45 or 85)  -- Adjusted position
statusText.BackgroundTransparency = 1
statusText.Text = isMobile and "" or "PAID VERSION"
statusText.TextColor3 = Color3.fromRGB(255, 0, 255)
statusText.Font = Enum.Font.Gotham
statusText.TextSize = isMobile and 0 or 10  -- Reduced from 14
statusText.ZIndex = 3
statusText.Parent = leftMenu

-- User info - HIDDEN ON MOBILE
local userInfo = Instance.new("Frame")
userInfo.Size = UDim2.new(1, isMobile and -5 or -10, 0, isMobile and 0 or 40)  -- Reduced from 60
userInfo.Position = UDim2.new(0, isMobile and 2.5 or 5, 0, isMobile and 60 or 105)  -- Adjusted position
userInfo.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
userInfo.BorderSizePixel = 0
userInfo.ZIndex = 3
userInfo.Parent = leftMenu

local userCorner = Instance.new("UICorner")
userCorner.CornerRadius = UDim.new(0, isMobile and 3 or 6)  -- Reduced from 5/10
userCorner.Parent = userInfo

local userName = Instance.new("TextLabel")
userName.Size = UDim2.new(1, 0, 0, isMobile and 0 or 15)  -- Reduced from 25
userName.Position = UDim2.new(0, 0, 0, isMobile and 0 or 2)  -- Adjusted position
userName.BackgroundTransparency = 1
userName.Text = isMobile and "" or LocalPlayer.Name
userName.TextColor3 = Color3.fromRGB(255, 255, 255)
userName.Font = Enum.Font.GothamBold
userName.TextSize = isMobile and 0 or 10  -- Reduced from 16
userName.ZIndex = 4
userName.Parent = userInfo

local userStatus = Instance.new("TextLabel")
userStatus.Size = UDim2.new(1, 0, 0, isMobile and 0 or 12)  -- Reduced from 20
userStatus.Position = UDim2.new(0, 0, 0, isMobile and 0 or 18)  -- Adjusted position
userStatus.BackgroundTransparency = 1
userStatus.Text = isMobile and "" or "LICENSE: ACTIVE"
userStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
userStatus.Font = Enum.Font.Gotham
userStatus.TextSize = isMobile and 0 or 8  -- Reduced from 12
userStatus.ZIndex = 4
userStatus.Parent = userInfo

-- Tab Buttons Container - COMPACT SIZE
local tabButtonsContainer = Instance.new("Frame")
tabButtonsContainer.Size = UDim2.new(1, isMobile and -5 or -10, 0, isMobile and 120 or 160)  -- Reduced from 180/240
tabButtonsContainer.Position = UDim2.new(0, isMobile and 2.5 or 5, 0, isMobile and 65 or 150)  -- Adjusted position
tabButtonsContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0)
tabButtonsContainer.BorderSizePixel = 0
tabButtonsContainer.ZIndex = 3
tabButtonsContainer.Parent = leftMenu

-- Right Side Content Area - COMPACT SIZE
local rightContent = Instance.new("Frame")
rightContent.Size = UDim2.new(0, isMobile and 130 or 360, 1, isMobile and -20 or -40)  -- Reduced from 190x-40 / 640x-80
rightContent.Position = UDim2.new(1, isMobile and -135 or -370, 0, isMobile and 15 or 30)  -- Adjusted position
rightContent.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
rightContent.BorderSizePixel = 0
rightContent.ZIndex = 2
rightContent.Parent = mainFrame

local rightCorner = Instance.new("UICorner")
rightCorner.CornerRadius = UDim.new(0, isMobile and 4 or 8)  -- Reduced from 6/15
rightCorner.Parent = rightContent

-- Title with gradient and custom font - COMPACT SIZE
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, isMobile and 20 or 30)  -- Reduced from 30/60
title.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
title.BorderSizePixel = 0
title.Text = isMobile and "NH(PAID)" or "NIGHTHOOK(PAID)"
title.Font = Enum.Font.GothamBold
title.TextSize = isMobile and 10 or 16  -- Reduced from 14/28
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.ZIndex = 2

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, isMobile and 4 or 10)  -- Reduced from 6/20
titleCorner.Parent = title

-- Add gradient to title
local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 0, 128)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
titleGradient.Rotation = 90
titleGradient.Parent = title

-- Decorative elements - COMPACT SIZE
local decorCircle1 = Instance.new("Frame")
decorCircle1.Size = UDim2.new(0, isMobile and 10 or 20, 0, isMobile and 10 or 20)  -- Reduced from 15/40
decorCircle1.Position = UDim2.new(0, isMobile and 4 or 10, 0, isMobile and 4 or 5)  -- Adjusted position
decorCircle1.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
decorCircle1.BorderSizePixel = 0
decorCircle1.ZIndex = 3
decorCircle1.Parent = mainFrame

local decorCircle1Corner = Instance.new("UICorner")
decorCircle1Corner.CornerRadius = UDim.new(0, isMobile and 5 or 10)  -- Reduced from 7.5/20
decorCircle1Corner.Parent = decorCircle1

local decorCircle2 = Instance.new("Frame")
decorCircle2.Size = UDim2.new(0, isMobile and 8 or 15, 0, isMobile and 8 or 15)  -- Reduced from 10/30
decorCircle2.Position = UDim2.new(1, isMobile and -15 or -25, 0, isMobile and 5 or 7)  -- Adjusted position
decorCircle2.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
decorCircle2.BorderSizePixel = 0
decorCircle2.ZIndex = 3
decorCircle2.Parent = mainFrame

local decorCircle2Corner = Instance.new("UICorner")
decorCircle2Corner.CornerRadius = UDim.new(0, isMobile and 4 or 7.5)  -- Reduced from 5/15
decorCircle2Corner.Parent = decorCircle2

-- Tab Creation Function with modern design - COMPACT SIZE
local tabs = {}
local pages = {}

local function createTab(name, icon)
    -- Create tab button
    local button = Instance.new("TextButton", tabButtonsContainer)
    button.Size = UDim2.new(1, 0, 0, isMobile and 25 or 35)  -- Reduced from 35/50
    button.Text = isMobile and string.sub(name, 1, 1) or " " .. name
    button.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    button.TextColor3 = Color3.fromRGB(255, 0, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = isMobile and 8 or 12  -- Reduced from 12/16
    button.BorderSizePixel = 0
    button.ZIndex = 4
    button.TextXAlignment = Enum.TextXAlignment.Center

    -- Add corner to tab button
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, isMobile and 3 or 6)  -- Reduced from 5/10
    buttonCorner.Parent = button

    -- Create page content
    local page = Instance.new("ScrollingFrame", rightContent)
    page.Size = UDim2.new(1, isMobile and -5 or -10, 1, isMobile and -5 or -10)  -- Reduced from 10/20
    page.Position = UDim2.new(0, isMobile and 2.5 or 5, 0, isMobile and 2.5 or 5)  -- Adjusted position
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ScrollBarThickness = isMobile and 3 or 6  -- Reduced from 4/8
    page.ScrollBarImageColor3 = Color3.fromRGB(128, 0, 128)
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollingDirection = Enum.ScrollingDirection.Y
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.BorderSizePixel = 0
    page.ZIndex = 3

    -- Configure layout
    local list = Instance.new("UIListLayout", page)
    list.Padding = UDim.new(0, isMobile and 5 or 10)  -- Reduced from 8/20
    list.FillDirection = Enum.FillDirection.Vertical
    list.HorizontalAlignment = Enum.HorizontalAlignment.Center
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + (isMobile and 5 or 10))  -- Reduced from 8/20
    end)

    -- Store references
    pages[name] = page
    table.insert(tabs, {button, page})

    -- Tab click handler
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

    -- Position tabs
    if #tabs == 1 then
        button.Position = UDim2.new(0, 0, 0, 0)
    elseif #tabs == 2 then
        button.Position = UDim2.new(0, 0, 0, isMobile and 28 or 40)  -- Reduced from 40/60
    elseif #tabs == 3 then
        button.Position = UDim2.new(0, 0, 0, isMobile and 56 or 80)  -- Reduced from 80/120
    else
        button.Position = UDim2.new(0, 0, 0, isMobile and 84 or 120)  -- Reduced from 120/180
    end
end

-- Create tabs in order: Silent Aim, Aimbot, Visuals, then Misc
createTab("SILENT AIM")
createTab("AIMBOT")
createTab("VISUALS")
createTab("MISC")

-- Activate first tab by default
if #tabs > 0 then
    tabs[1][2].Visible = true
    tabs[1][1].BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    tabs[1][1].TextColor3 = Color3.fromRGB(255, 255, 255)
end

-- Toggle GUI functionality
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleButton.BackgroundColor3 = mainFrame.Visible and Color3.fromRGB(0, 128, 0) or Color3.fromRGB(128, 0, 128)
end)

-- Touch support for mobile
if isMobile then
    -- Make the main frame draggable with touch
    local dragToggle = nil
    local dragStart = nil
    local startPos = nil
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    mainFrame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1) then
            dragToggle = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragToggle then
                updateInput(input)
            end
        end
    end)
end

-- Silent Aim Tab Content
local silentAimPage = pages["SILENT AIM"]

-- Silent Aim Options Container with modern design - COMPACT SIZE
local silentAimContainer = Instance.new("Frame")
silentAimContainer.Size = UDim2.new(0, isMobile and 120 or 300, 0, isMobile and 400 or 350)  -- Reduced from 170x700 / 600x590
silentAimContainer.Position = UDim2.new(0.5, isMobile and -60 or -150, 0, 10)  -- Adjusted position
silentAimContainer.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
silentAimContainer.BorderSizePixel = 0
silentAimContainer.ZIndex = 4
silentAimContainer.Parent = silentAimPage

local silentAimContainerCorner = Instance.new("UICorner")
silentAimContainerCorner.CornerRadius = UDim.new(0, isMobile and 4 or 8)  -- Reduced from 6/15
silentAimContainerCorner.Parent = silentAimContainer

-- Add subtle border
local silentAimBorder = Instance.new("UIStroke")
silentAimBorder.Color = Color3.fromRGB(255, 0, 255)
silentAimBorder.Thickness = 1  -- Reduced from 2
silentAimBorder.Transparency = 0.3
silentAimBorder.Parent = silentAimContainer

-- Silent Aim Settings
local silentAimSettings = {
    Enabled = false,
    WallCheck = true,
    HitPart = "Head",
    Prediction = true,
    Fov = {
        Visible = false,
        Radius = 300
    },
    Snapline = {
        Visible = true,
        Color = Color3.fromRGB(255, 0, 0)
    }
}

-- Silent Aim Options Table
local silentAimOptions = {
    {name = "ENABLE SILENT AIM", id = "enableSilentAim"},
    {name = "WALL CHECK", id = "wallCheck"},
    {name = "PREDICTION", id = "prediction"},
    {name = "SHOW FOV", id = "showFov"},
    {name = "SNAPLINE", id = "snapline"}
}

-- Silent Aim Settings Table
local silentAimSettingsTable = {}

-- Create Toggle Function for Silent Aim - COMPACT SIZE
local function createSilentAimToggle(optionName, optionId, yPos)
    -- Toggle Frame
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 25 or 35)  -- Reduced from 40/60
    toggleFrame.Position = UDim2.new(0, isMobile and 5 or 10, 0, yPos)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.ZIndex = 5
    toggleFrame.Parent = silentAimContainer

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, isMobile and 3 or 6)  -- Reduced from 6/12
    toggleCorner.Parent = toggleFrame

    -- Toggle Button with modern design
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, isMobile and 20 or 30, 0, isMobile and 12 or 18)  -- Reduced from 30/50
    toggleButton.Position = UDim2.new(0, isMobile and 5 or 10, 0.5, isMobile and -6 or -9)  -- Adjusted position
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    toggleButton.Text = ""
    toggleButton.ZIndex = 6
    toggleButton.Parent = toggleFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, isMobile and 6 or 9)  -- Reduced from 9/13
    buttonCorner.Parent = toggleButton

    -- Toggle indicator
    local toggleIndicator = Instance.new("Frame")
    toggleIndicator.Size = UDim2.new(0, isMobile and 8 or 12, 0, isMobile and 8 or 12)  -- Reduced from 14/22
    toggleIndicator.Position = UDim2.new(0, isMobile and 1 or 1, 0, isMobile and 2 or 3)  -- Adjusted position
    toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
    toggleIndicator.BorderSizePixel = 0
    toggleIndicator.ZIndex = 7
    toggleIndicator.Parent = toggleButton

    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 7/11
    indicatorCorner.Parent = toggleIndicator

    -- Toggle Label
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(1, isMobile and -35 or -50, 1, 0)  -- Reduced from 50/90
    toggleLabel.Position = UDim2.new(0, isMobile and 25 or 40, 0, 0)  -- Reduced from 40/90
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = isMobile and string.sub(optionName, 1, 4) or optionName  -- Reduced from 6/8
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.Font = Enum.Font.GothamBold
    toggleLabel.TextSize = isMobile and 7 or 10  -- Reduced from 10/16
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.ZIndex = 6
    toggleLabel.Parent = toggleFrame

    -- Initialize setting
    silentAimSettingsTable[optionId] = false

    -- Toggle functionality
    toggleButton.MouseButton1Click:Connect(function()
        silentAimSettingsTable[optionId] = not silentAimSettingsTable[optionId]

        if silentAimSettingsTable[optionId] then
            toggleButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleIndicator.Position = UDim2.new(0, isMobile and 10 or 15, 0, isMobile and 2 or 3)  -- Adjusted position
        else
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
            toggleIndicator.Position = UDim2.new(0, isMobile and 1 or 1, 0, isMobile and 2 or 3)
        end

        -- Update Silent Aim settings
        if optionId == "enableSilentAim" then
            silentAimSettings.Enabled = silentAimSettingsTable[optionId]
        elseif optionId == "wallCheck" then
            silentAimSettings.WallCheck = silentAimSettingsTable[optionId]
        elseif optionId == "prediction" then
            silentAimSettings.Prediction = silentAimSettingsTable[optionId]
        elseif optionId == "showFov" then
            silentAimSettings.Fov.Visible = silentAimSettingsTable[optionId]
        elseif optionId == "snapline" then
            silentAimSettings.Snapline.Visible = silentAimSettingsTable[optionId]
        end
    end)

    return toggleFrame
end

-- Create all Silent Aim toggles
for i, option in ipairs(silentAimOptions) do
    createSilentAimToggle(option.name, option.id, (i-1) * (isMobile and 30 or 45))  -- Reduced from 45/70
end

-- Create Modern Slider Function with premium theme - COMPACT SIZE
local function createSlider(labelText, minVal, maxVal, defaultVal, yPos, parent, callback)
    -- Slider Frame
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 35 or 50)  -- Reduced from 55/80
    sliderFrame.Position = UDim2.new(0, isMobile and 5 or 10, 0, yPos)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.ZIndex = 5
    sliderFrame.Parent = parent

    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, isMobile and 3 or 6)  -- Reduced from 6/12
    sliderCorner.Parent = sliderFrame

    -- Slider Label
    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Size = UDim2.new(1, 0, 0, isMobile and 12 or 18)  -- Reduced from 20/30
    sliderLabel.Position = UDim2.new(0, 0, 0, isMobile and 1 or 2)  -- Adjusted position
    sliderLabel.BackgroundTransparency = 1
    sliderLabel.Text = isMobile and string.sub(labelText, 1, 6) .. ": " .. string.format("%.0f", defaultVal) or labelText .. ": " .. string.format("%.0f", defaultVal)
    sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderLabel.Font = Enum.Font.GothamBold
    sliderLabel.TextSize = isMobile and 7 or 10  -- Reduced from 10/16
    sliderLabel.ZIndex = 6
    sliderLabel.Parent = sliderFrame

    -- Slider Track
    local sliderTrack = Instance.new("Frame")
    sliderTrack.Size = UDim2.new(0, isMobile and 90 or 300, 0, isMobile and 4 or 6)  -- Reduced from 130/520
    sliderTrack.Position = UDim2.new(0, isMobile and 5 or 10, 0, isMobile and 18 or 25)  -- Adjusted position
    sliderTrack.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    sliderTrack.BorderSizePixel = 0
    sliderTrack.ZIndex = 6
    sliderTrack.Parent = sliderFrame

    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, isMobile and 2 or 3)  -- Reduced from 3/5
    trackCorner.Parent = sliderTrack

    -- Slider Fill
    local sliderFill = Instance.new("Frame")
    local initialPercent = (defaultVal - minVal) / (maxVal - minVal)
    sliderFill.Size = UDim2.new(initialPercent, 0, 1, 0)
    sliderFill.Position = UDim2.new(0, 0, 0, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.ZIndex = 7
    sliderFill.Parent = sliderTrack

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, isMobile and 2 or 3)  -- Reduced from 3/5
    fillCorner.Parent = sliderFill

    -- Slider Button
    local sliderButton = Instance.new("TextButton")
    sliderButton.Size = UDim2.new(1, 0, 1, 0)
    sliderButton.BackgroundTransparency = 1
    sliderButton.Text = ""
    sliderButton.ZIndex = 8
    sliderButton.Parent = sliderTrack

    -- Slider dragging
    local dragging = false

    sliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)

    -- Touch support for mobile
    if isMobile then
        sliderButton.TouchTap:Connect(function()
            dragging = true
        end)
    end

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or (isMobile and input.UserInputType == Enum.UserInputType.Touch) then
            dragging = false
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or (isMobile and input.UserInputType == Enum.UserInputType.Touch)) then
            local mousePos
            if isMobile then
                mousePos = input.Position
            else
                mousePos = UIS:GetMouseLocation()
            end
            
            local trackPos = sliderTrack.AbsolutePosition
            local trackSize = sliderTrack.AbsoluteSize
            local percent = math.clamp((mousePos.X - trackPos.X) / trackSize.X, 0, 1)
            sliderFill.Size = UDim2.new(percent, 0, 1, 0)
            local value = minVal + percent * (maxVal - minVal)
            sliderLabel.Text = (isMobile and string.sub(labelText, 1, 6) or labelText) .. ": " .. string.format("%.0f", value)
            callback(value)
        end
    end)

    return sliderFrame
end

-- Create FOV Slider
createSlider("FOV RADIUS", 50, 500, 300, isMobile and 160 or 200, silentAimContainer, function(value)
    silentAimSettings.Fov.Radius = value
end)

-- Hit Part Selection - COMPACT SIZE
local aimPartLabel = Instance.new("TextLabel")
aimPartLabel.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 12 or 18)  -- Reduced from 20/30
aimPartLabel.Position = UDim2.new(0, isMobile and 5 or 10, 0, isMobile and 200 or 250)  -- Adjusted position
aimPartLabel.BackgroundTransparency = 1
aimPartLabel.Text = "AIM PART"
aimPartLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
aimPartLabel.Font = Enum.Font.GothamBold
aimPartLabel.TextSize = isMobile and 7 or 10  -- Reduced from 10/16
aimPartLabel.ZIndex = 5
aimPartLabel.Parent = silentAimContainer

-- Aim Part Buttons Container
local aimPartContainer = Instance.new("Frame")
aimPartContainer.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 20 or 25)  -- Reduced from 30/40
aimPartContainer.Position = UDim2.new(0, isMobile and 5 or 10, 0, isMobile and 215 or 275)  -- Adjusted position
aimPartContainer.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
aimPartContainer.BorderSizePixel = 0
aimPartContainer.ZIndex = 5
aimPartContainer.Parent = silentAimContainer

local aimContainerCorner = Instance.new("UICorner")
aimContainerCorner.CornerRadius = UDim.new(0, isMobile and 3 or 5)  -- Reduced from 5/10
aimContainerCorner.Parent = aimPartContainer

-- Aim Part Buttons
local aimParts = {"HEAD", "TORSO", "ROOT"}
local aimPartButtons = {}

for i, partName in ipairs(aimParts) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, isMobile and 30 or 90, 0, isMobile and 15 or 20)  -- Reduced from 45/180
    button.Position = UDim2.new(0, isMobile and 3 + (i-1) * 35 or 5 + (i-1) * 100, 0, isMobile and 2.5 or 2.5)  -- Adjusted position
    button.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    button.Text = partName
    button.TextColor3 = Color3.fromRGB(255, 0, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = isMobile and 6 or 8  -- Reduced from 8/14
    button.ZIndex = 6
    button.Parent = aimPartContainer

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, isMobile and 3 or 4)  -- Reduced from 4/8
    buttonCorner.Parent = button

    -- Highlight selected button
    if partName == "HEAD" then
        button.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
    end

    button.MouseButton1Click:Connect(function()
        -- Reset all buttons
        for _, btn in ipairs(aimPartButtons) do
            btn.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
            btn.TextColor3 = Color3.fromRGB(255, 0, 255)
        end

        -- Highlight selected button
        button.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)

        -- Update aim part
        if partName == "HEAD" then
            silentAimSettings.HitPart = "Head"
        elseif partName == "TORSO" then
            silentAimSettings.HitPart = "UpperTorso"
        elseif partName == "ROOT" then
            silentAimSettings.HitPart = "HumanoidRootPart"
        end
    end)

    table.insert(aimPartButtons, button)
end

-- Silent Aim Implementation
local function getAi()
    local ai = {}
    local aiZones = Workspace:FindFirstChild("AiZones")
    if aiZones then
        for _, zone in pairs(aiZones:GetChildren()) do
            for _, character in pairs(zone:GetChildren()) do
                if character:FindFirstChild("HumanoidRootPart") then
                    table.insert(ai, character)
                end
            end
        end
    end
    return ai
end

local function isAlive(player)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and 
       player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then 
        return true
    end
    return false
end

local function isVisible(origin, target, ...)
    local ignore = {Camera, ...}
    if isAlive(LocalPlayer) then 
        ignore[#ignore + 1] = LocalPlayer.Character
    end
    local ray = Ray.new(origin, target.Position - origin)
    local hit = Workspace:FindPartOnRayWithIgnoreList(ray, ignore, false, true)
    return hit and hit:IsDescendantOf(target.Parent)
end

local function getTarget(...)
    local closestTarget, closestDistance = nil, silentAimSettings.Fov.Radius
    local centerPos = Camera.ViewportSize / 2
    
    -- Check AI targets
    for _, character in pairs(getAi()) do 
        local hitPart = character:FindFirstChild(silentAimSettings.HitPart)
        if not hitPart then continue end
        
        if silentAimSettings.WallCheck and not isVisible(Camera.CFrame.Position, hitPart, ...) then 
            continue
        end
        
        local screenPosition, onScreen = Camera:WorldToViewportPoint(hitPart.Position)
        if not onScreen then continue end
        
        local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - centerPos).Magnitude
        if distance < closestDistance then
            closestDistance = distance
            closestTarget = hitPart
        end
    end

    -- Check player targets
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        if not isAlive(player) then continue end
        
        local hitPart = player.Character:FindFirstChild(silentAimSettings.HitPart)
        if not hitPart then continue end
        
        if silentAimSettings.WallCheck and not isVisible(Camera.CFrame.Position, hitPart, ...) then 
            continue
        end
        
        local screenPosition, onScreen = Camera:WorldToViewportPoint(hitPart.Position)
        if not onScreen then continue end
        
        local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - centerPos).Magnitude
        if distance < closestDistance then
            closestDistance = distance
            closestTarget = hitPart
        end
    end

    return closestTarget
end

local function solveQuadratic(A, B, C)
    local discriminant = B^2 - 4*A*C
    if discriminant < 0 then return nil, nil end
    local discRoot = math.sqrt(discriminant)
    return (-B - discRoot) / (2*A), (-B + discRoot) / (2*A)
end

local function getBallisticFlightTime(direction, gravity, projectileSpeed)
    local root1, root2 = solveQuadratic(
        gravity:Dot(gravity) / 4,
        gravity:Dot(direction) - projectileSpeed^2,
        direction:Dot(direction)
    )
    if root1 and root2 then
        if root1 > 0 and root1 < root2 then return math.sqrt(root1)
        elseif root2 > 0 and root2 < root1 then return math.sqrt(root2) end
    end
    return 0
end

local function projectileDrop(origin, target, projectileSpeed, acceleration)
    local gravity = Vector3.new(0, acceleration * 2, 0)
    local time = getBallisticFlightTime(target - origin, gravity, projectileSpeed)
    return 0.5 * gravity * time^2
end

local function predict(target, origin, projectileSpeed, acceleration)
    local gravity = Vector3.new(0, acceleration * 2, 0)
    local time = getBallisticFlightTime(target.Position - origin, gravity, projectileSpeed)
    return target.Position + (target.Velocity * time)
end

-- Hook bullet creation
local oldBullet
local success, bullet = pcall(require, ReplicatedStorage.Modules.FPS.Bullet)

if success then
    oldBullet = hookfunction(bullet.CreateBullet, function(idk, model, model2, model3, aimPart, idk2, ammoType, tick, recoilPattern)
        if silentAimSettings.Enabled then
            local target = getTarget(model, model2, model3, aimPart)
            if target then
                local bulletData = ReplicatedStorage.AmmoTypes:FindFirstChild(ammoType)
                if not bulletData then return oldBullet(idk, model, model2, model3, aimPart, idk2, ammoType, tick, recoilPattern) end
                
                local acceleration = bulletData:GetAttribute("ProjectileDrop") or 0
                local projectileSpeed = bulletData:GetAttribute("MuzzleVelocity") or 1000
                bulletData:SetAttribute("Drag", 0)
                
                local targetPosition = silentAimSettings.Prediction and predict(target, aimPart.Position, projectileSpeed, acceleration) or target.Position
                local vertical = projectileDrop(aimPart.Position, targetPosition, projectileSpeed, acceleration)
                local newCFrame = CFrame.new(aimPart.Position, targetPosition + vertical)
                
                return oldBullet(idk, model, model2, model3, {CFrame = newCFrame}, idk2, ammoType, tick, recoilPattern)
            end
        end
        return oldBullet(idk, model, model2, model3, aimPart, idk2, ammoType, tick, recoilPattern)
    end)
end

-- Silent Aim Visuals
local silentAimDrawings = {}

-- Create FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Filled = false
fovCircle.NumSides = 100
fovCircle.Color = Color3.fromRGB(255, 0, 0)
fovCircle.Thickness = 2
fovCircle.Radius = silentAimSettings.Fov.Radius
fovCircle.Position = Camera.ViewportSize / 2
table.insert(silentAimDrawings, fovCircle)

-- Create Snapline
local snapline = Drawing.new("Line")
snapline.Visible = false
snapline.Color = silentAimSettings.Snapline.Color
snapline.Thickness = 2
snapline.Transparency = 1
table.insert(silentAimDrawings, snapline)

-- Update Silent Aim Visuals
local function updateSilentAimVisuals()
    -- Update FOV circle
    fovCircle.Visible = silentAimSettings.Enabled and silentAimSettings.Fov.Visible
    if fovCircle.Visible then
        fovCircle.Position = Camera.ViewportSize / 2
        fovCircle.Radius = silentAimSettings.Fov.Radius
    end
    
    -- Update snapline
    snapline.Visible = silentAimSettings.Enabled and silentAimSettings.Snapline.Visible
    if snapline.Visible then
        local target = getTarget()
        if target then
            local headPos = target.Position
            local screenPos, onScreen = Camera:WorldToViewportPoint(headPos)
            if onScreen then
                local center = Camera.ViewportSize / 2
                snapline.From = Vector2.new(center.X, center.Y)
                snapline.To = Vector2.new(screenPos.X, screenPos.Y)
                snapline.Color = silentAimSettings.Snapline.Color
            else
                snapline.Visible = false
            end
        else
            snapline.Visible = false
        end
    end
end

-- Connect to render loop
RunService.RenderStepped:Connect(updateSilentAimVisuals)

-- Aimbot Tab Content (renamed from Combat)
local aimbotPage = pages["AIMBOT"]

-- Aimbot Options Container with modern design - COMPACT SIZE
local aimbotContainer = Instance.new("Frame")
aimbotContainer.Size = UDim2.new(0, isMobile and 120 or 300, 0, isMobile and 400 or 350)  -- Reduced from 170x700 / 600x590
aimbotContainer.Position = UDim2.new(0.5, isMobile and -60 or -150, 0, 10)  -- Adjusted position
aimbotContainer.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
aimbotContainer.BorderSizePixel = 0
aimbotContainer.ZIndex = 4
aimbotContainer.Parent = aimbotPage

local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, isMobile and 4 or 8)  -- Reduced from 6/15
containerCorner.Parent = aimbotContainer

-- Add subtle border
local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(255, 0, 255)
border.Thickness = 1  -- Reduced from 2
border.Transparency = 0.3
border.Parent = aimbotContainer

-- Aimbot Configuration with premium theme
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
    AutoPrediction = true; -- Enable automatic prediction adjustment
    LockDistance = 1000; -- New lock distance setting
}

-- Create FOV Display with premium theme
local FovGui = Instance.new("ScreenGui")
FovGui.Name = "Fov"
FovGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
FovGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
FovGui.ResetOnSpawn = false

local FOVFrame = Instance.new("Frame")
FOVFrame.Parent = FovGui
FOVFrame.Name = "FOVFrame"
FOVFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
FOVFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
FOVFrame.BorderSizePixel = 0
FOVFrame.BackgroundTransparency = 1 -- Changed from 0.8 to 1 to make it not filled
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

-- Combat Options Table - Removed ENABLE PREDICTION
local aimbotOptions = {
    {name = "ENABLE AIMBOT", id = "enableAimbot"},
    {name = "WALL CHECK", id = "wallCheck"},
    {name = "SHOW FOV", id = "showFov"},
    {name = "AUTO PREDICTION", id = "autoPrediction"}
}

-- Combat Settings Table
local aimbotSettings = {}

-- Create Modern Toggle Function with premium theme - COMPACT SIZE
local function createAimbotToggle(optionName, optionId, yPos, parent)
    -- Toggle Frame
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 25 or 35)  -- Reduced from 40/60
    toggleFrame.Position = UDim2.new(0, isMobile and 5 or 10, 0, yPos)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.ZIndex = 5
    toggleFrame.Parent = parent

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, isMobile and 3 or 6)  -- Reduced from 6/12
    toggleCorner.Parent = toggleFrame

    -- Toggle Button with modern design
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, isMobile and 20 or 30, 0, isMobile and 12 or 18)  -- Reduced from 30/50
    toggleButton.Position = UDim2.new(0, isMobile and 5 or 10, 0.5, isMobile and -6 or -9)  -- Adjusted position
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    toggleButton.Text = ""
    toggleButton.ZIndex = 6
    toggleButton.Parent = toggleFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, isMobile and 6 or 9)  -- Reduced from 9/13
    buttonCorner.Parent = toggleButton

    -- Toggle indicator
    local toggleIndicator = Instance.new("Frame")
    toggleIndicator.Size = UDim2.new(0, isMobile and 8 or 12, 0, isMobile and 8 or 12)  -- Reduced from 14/22
    toggleIndicator.Position = UDim2.new(0, isMobile and 1 or 1, 0, isMobile and 2 or 3)  -- Adjusted position
    toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
    toggleIndicator.BorderSizePixel = 0
    toggleIndicator.ZIndex = 7
    toggleIndicator.Parent = toggleButton

    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 7/11
    indicatorCorner.Parent = toggleIndicator

    -- Toggle Label
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(1, isMobile and -35 or -50, 1, 0)  -- Reduced from 50/90
    toggleLabel.Position = UDim2.new(0, isMobile and 25 or 40, 0, 0)  -- Reduced from 40/90
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = isMobile and string.sub(optionName, 1, 4) or optionName  -- Reduced from 6/8
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.Font = Enum.Font.GothamBold
    toggleLabel.TextSize = isMobile and 7 or 10  -- Reduced from 10/16
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.ZIndex = 6
    toggleLabel.Parent = toggleFrame

    -- Initialize setting
    aimbotSettings[optionId] = false

    -- Toggle functionality
    toggleButton.MouseButton1Click:Connect(function()
        aimbotSettings[optionId] = not aimbotSettings[optionId]

        if aimbotSettings[optionId] then
            toggleButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleIndicator.Position = UDim2.new(0, isMobile and 10 or 15, 0, isMobile and 2 or 3)  -- Adjusted position
        else
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
            toggleIndicator.Position = UDim2.new(0, isMobile and 1 or 1, 0, isMobile and 2 or 3)
        end

        -- Update AimbotSettings
        if optionId == "enableAimbot" then
            AimbotSettings.Enabled = aimbotSettings[optionId]
        elseif optionId == "wallCheck" then
            AimbotSettings.WallCheck = aimbotSettings[optionId]
        elseif optionId == "showFov" then
            AimbotSettings.ShowFov = aimbotSettings[optionId]
        elseif optionId == "autoPrediction" then
            AimbotSettings.AutoPrediction = aimbotSettings[optionId]
        end
    end)

    return toggleFrame
end

-- Create all Aimbot toggles
for i, option in ipairs(aimbotOptions) do
    createAimbotToggle(option.name, option.id, (i-1) * (isMobile and 30 or 45), aimbotContainer)  -- Reduced from 45/70
end

-- Create FOV Slider
createSlider("FOV", 50, 700, 350, isMobile and 130 or 160, aimbotContainer, function(value)
    AimbotSettings.Fov = value
end)

-- Create Smoothing Slider
createSlider("SMOOTHING", 0, 3, 1, isMobile and 170 or 220, aimbotContainer, function(value)
    AimbotSettings.Smoothing = value
end)

-- Create Lock Distance Slider
createSlider("LOCK DISTANCE", 100, 5000, 1000, isMobile and 210 or 280, aimbotContainer, function(value)
    AimbotSettings.LockDistance = value
end)

-- Aim Part Selection with modern design - COMPACT SIZE
local aimPartLabel = Instance.new("TextLabel")
aimPartLabel.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 12 or 18)  -- Reduced from 20/30
aimPartLabel.Position = UDim2.new(0, isMobile and 5 or 10, 0, isMobile and 250 or 320)  -- Adjusted position
aimPartLabel.BackgroundTransparency = 1
aimPartLabel.Text = "AIM PART"
aimPartLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
aimPartLabel.Font = Enum.Font.GothamBold
aimPartLabel.TextSize = isMobile and 7 or 10  -- Reduced from 10/16
aimPartLabel.ZIndex = 5
aimPartLabel.Parent = aimbotContainer

-- Aim Part Buttons Container
local aimPartContainer = Instance.new("Frame")
aimPartContainer.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 20 or 25)  -- Reduced from 30/40
aimPartContainer.Position = UDim2.new(0, isMobile and 5 or 10, 0, isMobile and 265 or 345)  -- Adjusted position
aimPartContainer.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
aimPartContainer.BorderSizePixel = 0
aimPartContainer.ZIndex = 5
aimPartContainer.Parent = aimbotContainer

local aimContainerCorner = Instance.new("UICorner")
aimContainerCorner.CornerRadius = UDim.new(0, isMobile and 3 or 5)  -- Reduced from 5/10
aimContainerCorner.Parent = aimPartContainer

-- Aim Part Buttons
local aimParts = {"HEAD", "TORSO", "ROOT"}
local aimPartButtons = {}

for i, partName in ipairs(aimParts) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, isMobile and 30 or 90, 0, isMobile and 15 or 20)  -- Reduced from 45/180
    button.Position = UDim2.new(0, isMobile and 3 + (i-1) * 35 or 5 + (i-1) * 100, 0, isMobile and 2.5 or 2.5)  -- Adjusted position
    button.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    button.Text = partName
    button.TextColor3 = Color3.fromRGB(255, 0, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = isMobile and 6 or 8  -- Reduced from 8/14
    button.ZIndex = 6
    button.Parent = aimPartContainer

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, isMobile and 3 or 4)  -- Reduced from 4/8
    buttonCorner.Parent = button

    -- Highlight selected button
    if partName == "HEAD" then
        button.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
    end

    button.MouseButton1Click:Connect(function()
        -- Reset all buttons
        for _, btn in ipairs(aimPartButtons) do
            btn.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
            btn.TextColor3 = Color3.fromRGB(255, 0, 255)
        end

        -- Highlight selected button
        button.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)

        -- Update aim part
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

-- Add Keybind Info - COMPACT SIZE
local keybindInfo = Instance.new("TextLabel")
keybindInfo.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 12 or 15)  -- Reduced from 20/25
keybindInfo.Position = UDim2.new(0, isMobile and 5 or 10, 0, isMobile and 290 or 375)  -- Adjusted position
keybindInfo.BackgroundTransparency = 1
keybindInfo.Text = isMobile and "TAP TO AIM" or "AIM KEY: RIGHT MOUSE BUTTON"
keybindInfo.TextColor3 = Color3.fromRGB(255, 0, 255)
keybindInfo.Font = Enum.Font.GothamBold
keybindInfo.TextSize = isMobile and 7 or 8  -- Reduced from 10/14
keybindInfo.ZIndex = 5
keybindInfo.Parent = aimbotContainer

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

    -- Get center of screen (crosshair position) - HIGHER POSITION
    local centerPoint = Vector2.new(CurrentCam.ViewportSize.X * 0.5, CurrentCam.ViewportSize.Y * 0.5 - 50) -- MOVED UP BY 50 PIXELS

    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= PLAYER then
            if player.Character and player.Character:FindFirstChild(AimbotSettings.AimPart) and
                player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then

                local screenPos, onScreen = WorldToViewportPoint(CurrentCam, player.Character[AimbotSettings.AimPart].Position)
                local screenPos2D = Vector2.new(screenPos.X, screenPos.Y)
                local magnitude = (screenPos2D - centerPoint).Magnitude
                
                -- Calculate distance to target
                local distance = (player.Character[AimbotSettings.AimPart].Position - CurrentCam.CFrame.Position).Magnitude

                if onScreen and magnitude < aimFov and distance <= AimbotSettings.LockDistance and isVisible(player.Character[AimbotSettings.AimPart].Position, player.Character) then
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
        -- Calculate predicted position if auto prediction is enabled
        local targetPosition = aimPart.Position
        
        if AimbotSettings.AutoPrediction and target.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = target.Character.HumanoidRootPart
            local velocity = rootPart.Velocity
            
            -- Calculate distance to target
            local distance = (CurrentCam.CFrame.Position - targetPosition).Magnitude
            
            -- Automatic prediction based on distance and velocity
            local speed = velocity.Magnitude
            local distanceFactor = math.min(distance / 100, 2) -- Scale factor based on distance
            local speedFactor = math.min(speed / 20, 2) -- Scale factor based on speed
            
            -- Combine factors with base prediction
            local predictionAmount = 0.1 + (distanceFactor * 0.1) + (speedFactor * 0.05)
            predictionAmount = math.clamp(predictionAmount, 0.05, 0.4) -- Clamp between reasonable values
            
            -- Calculate predicted position based on velocity and prediction amount
            targetPosition = targetPosition + velocity * predictionAmount
        end
        
        -- Calculate desired CFrame looking at the target (or predicted position)
        local desiredCFrame = CFrame.new(CurrentCam.CFrame.Position, targetPosition)

        -- Calculate smoothing factor (higher smoothing = slower movement)
        local smoothFactor = 0.1 + (1 - smooth/3) * 0.4 -- Maps 0-3 to 0.5-0.1

        -- Apply smoothing using Lerp
        CurrentCam.CFrame = CurrentCam.CFrame:Lerp(desiredCFrame, smoothFactor)
    end
end

-- Keybind handling
UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 and AimbotSettings.Enabled then
        AimbotSettings.IsAimKeyDown = true
    end
    
    -- Mobile touch support for aimbot
    if isMobile and input.UserInputType == Enum.UserInputType.Touch and AimbotSettings.Enabled then
        AimbotSettings.IsAimKeyDown = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        AimbotSettings.IsAimKeyDown = false
    end
    
    -- Mobile touch support for aimbot
    if isMobile and input.UserInputType == Enum.UserInputType.Touch then
        AimbotSettings.IsAimKeyDown = false
    end
end)

-- Main loop for Aimbot
game:GetService('RunService').RenderStepped:Connect(function()
    -- Update FOV display (positioned at crosshair position) - HIGHER POSITION
    local centerPoint = Vector2.new(CurrentCam.ViewportSize.X * 0.5, CurrentCam.ViewportSize.Y * 0.5)
    FOVFrame.Position = UDim2.new(0, centerPoint.X, 0, centerPoint.Y - 50) -- MOVED UP BY 50 PIXELS
    FOVFrame.Size = UDim2.new(0, AimbotSettings.Fov, 0, AimbotSettings.Fov)
    FOVFrame.Visible = AimbotSettings.ShowFov
    FOVFrame.BackgroundColor3 = AimbotSettings.FovFillColor
    FOVFrame.BackgroundTransparency = 1 -- Always keep it not filled
    
    UIStroke.Color = AimbotSettings.FovColor
    UIStroke.Transparency = AimbotSettings.FovTransparency
    UIStroke.Thickness = AimbotSettings.Thickness

    -- Aimbot logic
    if AimbotSettings.IsAimKeyDown and AimbotSettings.Enabled then
        local target = getClosestToMouse(AimbotSettings.Fov / 2) -- Use radius for targeting
        if target then
            aimAt(target, AimbotSettings.Smoothing)
        end
    end
end)

-- Visuals Tab Content
local visualsPage = pages["VISUALS"]

-- Visuals Options Container with modern design - COMPACT SIZE
local visualsContainer = Instance.new("Frame")
visualsContainer.Size = UDim2.new(0, isMobile and 120 or 300, 0, isMobile and 500 or 450)  -- Reduced from 170x900 / 600x850
visualsContainer.Position = UDim2.new(0.5, isMobile and -60 or -150, 0, 10)  -- Adjusted position
visualsContainer.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
visualsContainer.BorderSizePixel = 0
visualsContainer.ZIndex = 4
visualsContainer.Parent = visualsPage

local visualsContainerCorner = Instance.new("UICorner")
visualsContainerCorner.CornerRadius = UDim.new(0, isMobile and 4 or 8)  -- Reduced from 6/15
visualsContainerCorner.Parent = visualsContainer

-- Add subtle border
local visualsBorder = Instance.new("UIStroke")
visualsBorder.Color = Color3.fromRGB(255, 0, 255)
visualsBorder.Thickness = 1  -- Reduced from 2
visualsBorder.Transparency = 0.3
visualsBorder.Parent = visualsContainer

-- Visuals Options Table - Added AI ESP
local visualsOptions = {
    {name = "ENABLE ESP", id = "enableESP"},
    {name = "PLAYER NAME", id = "playerName"},
    {name = "PLAYER DISTANCE", id = "playerDistance"},
    {name = "PLAYER BOX", id = "playerBox"},
    {name = "HEALTH BAR", id = "healthBar"},
    {name = "VISIBLE CHECK", id = "visibleCheck"},
    {name = "CHAMS", id = "chams"},
    {name = "SKELETON ESP", id = "skeletonEsp"},
    {name = "EXIT ESP", id = "exitEsp"},
    {name = "DROPPED ITEMS ESP", id = "droppedItemsEsp"},
    {name = "AI ESP", id = "aiEsp"} -- Added AI ESP
}

-- Visuals Settings Table
local visualsSettings = {}

-- ESP Maximum Distance
local ESPMaxDistance = 1000

-- Dropped Items ESP Settings
local DroppedItemsESPEnabled = false
local DroppedItemsESPDistance = 200

-- AI ESP Settings
local AIESPSettings = {
    Enabled = false,
    ShowName = true,
    ShowDistance = true,
    Color = Color3.fromRGB(255, 165, 0) -- Orange for AI
}

-- Chams Settings with premium theme
local chamsSettings = {
    Enabled = false,
    Color = Color3.fromRGB(255, 0, 255),
    Transparency = 0.9,
    GlowColor = Color3.fromRGB(128, 0, 128),
    GlowTransparency = 0.3
}

-- Skeleton ESP Settings with premium theme
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
    Color = Color3.new(0, 1, 0), -- Green
    CloseColor = Color3.new(0, 1, 0), -- Green when close
    MediumColor = Color3.new(1, 1, 0), -- Yellow at medium distance
    FarColor = Color3.new(1, 0.5, 0), -- Orange when far
    CloseDistance = 100,
    MediumDistance = 500,
    TextSize = 36,
    Offset = 8
}

-- Function to destroy chams
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

-- Create Modern Toggle Function (for Visuals) with premium theme - COMPACT SIZE
local function createVisualsToggle(optionName, optionId, yPos)
    -- Toggle Frame
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 25 or 35)  -- Reduced from 40/60
    toggleFrame.Position = UDim2.new(0, isMobile and 5 or 10, 0, yPos)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.ZIndex = 5
    toggleFrame.Parent = visualsContainer

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, isMobile and 3 or 6)  -- Reduced from 6/12
    toggleCorner.Parent = toggleFrame

    -- Toggle Button with modern design
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, isMobile and 20 or 30, 0, isMobile and 12 or 18)  -- Reduced from 30/50
    toggleButton.Position = UDim2.new(0, isMobile and 5 or 10, 0.5, isMobile and -6 or -9)  -- Adjusted position
    toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    toggleButton.Text = ""
    toggleButton.ZIndex = 6
    toggleButton.Parent = toggleFrame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, isMobile and 6 or 9)  -- Reduced from 9/13
    buttonCorner.Parent = toggleButton

    -- Toggle indicator
    local toggleIndicator = Instance.new("Frame")
    toggleIndicator.Size = UDim2.new(0, isMobile and 8 or 12, 0, isMobile and 8 or 12)  -- Reduced from 14/22
    toggleIndicator.Position = UDim2.new(0, isMobile and 1 or 1, 0, isMobile and 2 or 3)  -- Adjusted position
    toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
    toggleIndicator.BorderSizePixel = 0
    toggleIndicator.ZIndex = 7
    toggleIndicator.Parent = toggleButton

    local indicatorCorner = Instance.new("UICorner")
    indicatorCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 7/11
    indicatorCorner.Parent = toggleIndicator

    -- Toggle Label
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(1, isMobile and -35 or -50, 1, 0)  -- Reduced from 50/90
    toggleLabel.Position = UDim2.new(0, isMobile and 25 or 40, 0, 0)  -- Reduced from 40/90
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = isMobile and string.sub(optionName, 1, 6) or optionName  -- Reduced from 8
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.Font = Enum.Font.GothamBold
    toggleLabel.TextSize = isMobile and 7 or 10  -- Reduced from 10/16
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.ZIndex = 6
    toggleLabel.Parent = toggleFrame

    -- Initialize setting
    visualsSettings[optionId] = false

    -- Toggle functionality
    toggleButton.MouseButton1Click:Connect(function()
        visualsSettings[optionId] = not visualsSettings[optionId]

        if visualsSettings[optionId] then
            toggleButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleIndicator.Position = UDim2.new(0, isMobile and 10 or 15, 0, isMobile and 2 or 3)  -- Adjusted position
        else
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
            toggleIndicator.Position = UDim2.new(0, isMobile and 1 or 1, 0, isMobile and 2 or 3)
        end

        -- Update settings
        if optionId == "chams" then
            chamsSettings.Enabled = visualsSettings[optionId]
        elseif optionId == "skeletonEsp" then
            skeletonEspSettings.Enabled = visualsSettings[optionId]
        elseif optionId == "exitEsp" then
            exitEspSettings.Enabled = visualsSettings[optionId]
        elseif optionId == "droppedItemsEsp" then
            DroppedItemsESPEnabled = visualsSettings[optionId]
        elseif optionId == "aiEsp" then
            AIESPSettings.Enabled = visualsSettings[optionId]
        end
    end)

    return toggleFrame
end

-- Create all Visuals toggles
for i, option in ipairs(visualsOptions) do
    createVisualsToggle(option.name, option.id, (i-1) * (isMobile and 30 or 40))  -- Reduced from 45/65
end

-- Add ESP Distance Slider
createSlider("ESP DISTANCE", 100, 2000, 1000, isMobile and 340 or 440, visualsContainer, function(value)
    ESPMaxDistance = value
end)

-- Add Dropped Items ESP Distance Slider
createSlider("DROPPED ITEMS DISTANCE", 50, 500, 200, isMobile and 380 or 490, visualsContainer, function(value)
    DroppedItemsESPDistance = value
end)

-- ESP Implementation with Box, Health Bar, and Premium Text
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")

-- Storage for ESP drawings
local ESPObjects = {}

-- Table to hold the Drawing texts for each player (Premium Text)
local playerText = {}

-- Function to create a Drawing text with error handling
local function createText()
    if not DrawingAvailable then
        return nil
    end

    local success, text = pcall(function()
        return Drawing.new("Text")
    end)

    if success and text then
        text.Size = 18
        text.Outline = true
        text.Center = true
        text.Visible = false
        return text
    else
        warn("Failed to create Drawing text")
        return nil
    end
end

-- Function to create ESP objects for a player
local function CreateESPForPlayer(player)
    if player == localPlayer then return end

    local espObject = {}

    -- Box outline for player
    if DrawingAvailable then
        local success, box = pcall(function()
            return Drawing.new("Square")
        end)
        if success and box then
            espObject.Box = box
            espObject.Box.Visible = false
            espObject.Box.Thickness = 2
            espObject.Box.Transparency = 0.5
            espObject.Box.Filled = false
        end

        local success, healthBG = pcall(function()
            return Drawing.new("Square")
        end)
        if success and healthBG then
            espObject.HealthBG = healthBG
            espObject.HealthBG.Visible = false
            espObject.HealthBG.Thickness = 2
            espObject.HealthBG.Filled = true
            espObject.HealthBG.Color = Color3.fromRGB(100, 100, 100)
            espObject.HealthBG.Transparency = 0.7
        end

        local success, healthBar = pcall(function()
            return Drawing.new("Square")
        end)
        if success and healthBar then
            espObject.HealthBar = healthBar
            espObject.HealthBar.Visible = false
            espObject.HealthBar.Thickness = 2
            espObject.HealthBar.Filled = true
            espObject.HealthBar.Transparency = 0.7
        end
    end

    ESPObjects[player] = espObject

    -- Create premium text for player
    local text = createText()
    if text then
        playerText[player] = text
    else
        playerText[player] = nil
    end

    -- Clear ESP when player leaves
    player.AncestryChanged:Connect(function()
        if not player:IsDescendantOf(game) then
            if ESPObjects[player] then
                for _, object in pairs(ESPObjects[player]) do
                    pcall(function() object:Remove() end)
                end
                ESPObjects[player] = nil
            end

            if playerText[player] then
                pcall(function() playerText[player]:Remove() end)
                playerText[player] = nil
            end

            -- Remove chams
            if player.Character then
                DestroyChams(player.Character)
            end

            -- Remove skeleton ESP
            if skeletons[player] then
                removeSkeleton(skeletons[player])
                skeletons[player] = nil
            end
        end
    end)
end

-- Create ESP for all existing players
for _, player in pairs(players:GetPlayers()) do
    if player ~= localPlayer then
        CreateESPForPlayer(player)
    end
end

-- Create ESP for new players who join
players.PlayerAdded:Connect(CreateESPForPlayer)

-- Clear ESP for players who leave
players.PlayerRemoving:Connect(function(player)
    if ESPObjects[player] then
        for _, object in pairs(ESPObjects[player]) do
            pcall(function() object:Remove() end)
        end
        ESPObjects[player] = nil
    end

    if playerText[player] then
        pcall(function() playerText[player]:Remove() end)
        playerText[player] = nil
    end

    -- Remove chams
    if player.Character then
        DestroyChams(player.Character)
    end

    -- Remove skeleton ESP
    if skeletons[player] then
        removeSkeleton(skeletons[player])
        skeletons[player] = nil
    end
end)

-- Function to get player team color (premium theme)
local function GetPlayerTeamColor(player)
    return Color3.fromRGB(255, 0, 255) -- Always pink
end

-- Function to get health color based on percentage
local function GetHealthColor(health, maxHealth)
    local healthPercent = health / maxHealth

    -- Gradient from red to green based on health percentage
    local r = math.clamp(2 * (1 - healthPercent), 0, 1)
    local g = math.clamp(2 * healthPercent, 0, 1)

    return Color3.new(r, g, 0)
end

-- Function to update chams
local function UpdateChams()
    if not chamsSettings.Enabled then
        -- If chams are disabled, remove all existing chams
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer and player.Character then
                DestroyChams(player.Character)
            end
        end
        return
    end

    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local character = player.Character

                for _, part in ipairs(character:GetChildren()) do
                    if part:IsA("BasePart") and part.Transparency ~= 1 then
                        -- Check if chams already exist
                        local glow = part:FindFirstChild("Glow")
                        local chams = part:FindFirstChild("Chams")

                        if not chams and not glow then
                            -- Create chams
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
    if not DrawingAvailable then
        return nil
    end

    local success, line = pcall(function()
        return Drawing.new("Line")
    end)

    if success and line then
        return line
    else
        warn("Failed to create Drawing line")
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
            local posA, onScreenA = camera:WorldToViewportPoint(jointA.Position)
            local posB, onScreenB = camera:WorldToViewportPoint(jointB.Position)

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
                        posB = camera:WorldToViewportPoint(jointB.Position + Vector3.new(0, offsetY, 0))
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

-- Function to update skeleton ESP for all players
local function UpdateSkeletonESP()
    if not skeletonEspSettings.Enabled or not visualsSettings.enableESP then
        -- If skeleton ESP is disabled, remove all existing skeletons
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer and skeletons[player] then
                removeSkeleton(skeletons[player])
                skeletons[player] = nil
            end
        end
        return
    end

    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer then
            pcall(function() updateSkeleton(player) end)
        end
    end
end

-- Add visible check to ESP
local function isPositionVisible(position, ...)
    local ignore = { CurrentCam, PLAYER.Character }
    for i, v in ipairs({...}) do
        table.insert(ignore, v)
    end
    return #CurrentCam:GetPartsObscuringTarget({ position }, ignore) == 0
end

-- AI ESP Implementation
local aiESPObjects = {}

-- Function to update AI ESP
local function updateAIESP()
    if not AIESPSettings.Enabled then
        -- Hide all AI ESP elements if disabled
        for _, esp in pairs(aiESPObjects) do
            if esp.text then
                esp.text.Visible = false
            end
        end
        return
    end

    local aiCharacters = getAi()
    
    for _, character in pairs(aiCharacters) do
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local vector, onScreen = camera:WorldToViewportPoint(humanoidRootPart.Position)
            local distance = (humanoidRootPart.Position - camera.CFrame.Position).Magnitude
            
            if onScreen and distance <= ESPMaxDistance then
                -- Create ESP object if it doesn't exist
                if not aiESPObjects[character] then
                    aiESPObjects[character] = {
                        text = Drawing.new("Text")
                    }
                    aiESPObjects[character].text.Size = 16
                    aiESPObjects[character].text.Outline = true
                    aiESPObjects[character].text.Center = true
                end
                
                local esp = aiESPObjects[character]
                esp.text.Position = Vector2.new(vector.X, vector.Y - 20)
                esp.text.Visible = true
                
                -- Build text based on settings
                local displayText = ""
                if AIESPSettings.ShowName then
                    displayText = "AI"
                end
                if AIESPSettings.ShowDistance then
                    if displayText ~= "" then
                        displayText = displayText .. " [" .. math.floor(distance) .. "m]"
                    else
                        displayText = "[" .. math.floor(distance) .. "m]"
                    end
                end
                
                esp.text.Text = displayText
                esp.text.Color = AIESPSettings.Color
            else
                if aiESPObjects[character] then
                    aiESPObjects[character].text.Visible = false
                end
            end
        end
    end
    
    -- Clean up removed AI
    for character, esp in pairs(aiESPObjects) do
        if not character.Parent then
            esp.text:Remove()
            aiESPObjects[character] = nil
        end
    end
end

-- Update ESP on each frame
runService.RenderStepped:Connect(function()
    -- Update chams
    pcall(UpdateChams)

    -- Update skeleton ESP
    pcall(UpdateSkeletonESP)
    
    -- Update AI ESP
    updateAIESP()

    if not visualsSettings.enableESP then
        -- Hide all ESP elements if disabled
        for _, espObject in pairs(ESPObjects) do
            if espObject.Box then
                espObject.Box.Visible = false
            end
            if espObject.HealthBG then
                espObject.HealthBG.Visible = false
            end
            if espObject.HealthBar then
                espObject.HealthBar.Visible = false
            end
        end

        for _, text in pairs(playerText) do
            if text then
                text.Visible = false
            end
        end
        return
    end

    for player, espObject in pairs(ESPObjects) do
        -- Get character and make sure it's valid
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") or not character:FindFirstChild("Humanoid") then
            if espObject.Box then
                espObject.Box.Visible = false
            end
            if espObject.HealthBG then
                espObject.HealthBG.Visible = false
            end
            if espObject.HealthBar then
                espObject.HealthBar.Visible = false
            end

            if playerText[player] then
                playerText[player].Visible = false
            end
            continue
        end

        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")
        local head = character:FindFirstChild("Head")

        -- Get health information
        local health = humanoid.Health
        local maxHealth = humanoid.MaxHealth

        -- Check if character is on screen and within max distance
        local vector, onScreen = camera:WorldToViewportPoint(humanoidRootPart.Position)
        local distance = (humanoidRootPart.Position - camera.CFrame.Position).Magnitude

        -- Only show ESP if player is on screen and within max distance
        if onScreen and distance <= ESPMaxDistance then
            -- Check if player is visible (not behind walls)
            local playerVisible = isPositionVisible(humanoidRootPart.Position, character)
            
            -- Get player size for box ESP (using character bounds)
            local topPosition = humanoidRootPart.Position + Vector3.new(0, 3, 0)
            local bottomPosition = humanoidRootPart.Position - Vector3.new(3, 0, 0)

            local topVector = camera:WorldToViewportPoint(topPosition)
            local bottomVector = camera:WorldToViewportPoint(bottomPosition)

            local height = math.abs(topVector.Y - bottomVector.Y)
            local width = height * 0.6

            local boxPosition = Vector2.new(vector.X - width / 2, vector.Y - height / 2)
            local boxSize = Vector2.new(width, height)

            -- Update box if enabled
            if visualsSettings.playerBox and espObject.Box then
                espObject.Box.Position = boxPosition
                espObject.Box.Size = boxSize
                
                -- Set box color based on visibility
                if playerVisible then
                    espObject.Box.Color = Color3.fromRGB(0, 255, 0) -- Green for visible
                else
                    espObject.Box.Color = Color3.fromRGB(255, 0, 0) -- Red for obscured
                end
                
                espObject.Box.Visible = true
            else
                if espObject.Box then
                    espObject.Box.Visible = false
                end
            end

            -- Update health bar if enabled
            if visualsSettings.healthBar then
                if espObject.HealthBG then
                    espObject.HealthBG.Position = Vector2.new(vector.X - 25, boxPosition.Y - 10)
                    espObject.HealthBG.Size = Vector2.new(50, 5)
                    espObject.HealthBG.Visible = true
                end
                if espObject.HealthBar then
                    espObject.HealthBar.Position = Vector2.new(vector.X - 25, boxPosition.Y - 10)
                    espObject.HealthBar.Size = Vector2.new(50 * (health / maxHealth), 5)
                    espObject.HealthBar.Color = GetHealthColor(health, maxHealth)
                    espObject.HealthBar.Visible = true
                end
            else
                if espObject.HealthBG then
                    espObject.HealthBG.Visible = false
                end
                if espObject.HealthBar then
                    espObject.HealthBar.Visible = false
                end
            end

            -- Update premium text if name, distance, or health bar is enabled
            if visualsSettings.playerName or visualsSettings.playerDistance or visualsSettings.healthBar then
                local text = playerText[player]
                if not text then
                    text = createText()
                    playerText[player] = text
                end

                if text then
                    -- Build text based on enabled options
                    local displayText = ""
                    if visualsSettings.playerName then
                        displayText = player.Name
                    end
                    if visualsSettings.playerDistance then
                        if displayText ~= "" then
                            displayText = displayText .. " [" .. math.floor(distance) .. " studs]"
                        else
                            displayText = "[" .. math.floor(distance) .. " studs]"
                        end
                    end
                    -- Add health count if health bar is enabled
                    if visualsSettings.healthBar then
                        if displayText ~= "" then
                            displayText = displayText .. " HP: " .. math.floor(health) .. "/" .. math.floor(maxHealth)
                        else
                            displayText = "HP: " .. math.floor(health) .. "/" .. math.floor(maxHealth)
                        end
                    end

                    -- Position text below the box if box is enabled, otherwise at head position
                    if visualsSettings.playerBox then
                        text.Position = Vector2.new(vector.X, boxPosition.Y + boxSize.Y + 5)
                    else
                        local headPos = camera:WorldToViewportPoint(head.Position + Vector3.new(0, 2, 0))
                        text.Position = Vector2.new(headPos.X, headPos.Y)
                    end

                    text.Text = displayText
                    -- Set text color based on visibility
                    if playerVisible then
                        text.Color = Color3.fromRGB(0, 255, 0) -- Green for visible
                    else
                        text.Color = Color3.fromRGB(255, 0, 0) -- Red for obscured
                    end
                    
                    text.Visible = true
                end
            else
                if playerText[player] then
                    playerText[player].Visible = false
                end
            end
            
            -- Update Skeleton ESP color based on visibility
            if visualsSettings.skeletonEsp and skeletons[player] and visualsSettings.visibleCheck then
                for _, line in pairs(skeletons[player]) do
                    if line then
                        if playerVisible then
                            line.Color = Color3.fromRGB(0, 255, 0) -- Green for visible
                        else
                            line.Color = Color3.fromRGB(255, 0, 0) -- Red for obscured
                        end
                    end
                end
            end
            
            -- Update Chams color based on visibility
            if visualsSettings.chams and character and visualsSettings.visibleCheck then
                for _, part in ipairs(character:GetChildren()) do
                    if part:IsA("BasePart") and part.Transparency ~= 1 then
                        local chams = part:FindFirstChild("Chams")
                        local glow = part:FindFirstChild("Glow")
                        
                        if chams then
                            if playerVisible then
                                chams.Color3 = Color3.fromRGB(0, 255, 0) -- Green for visible
                            else
                                chams.Color3 = Color3.fromRGB(255, 0, 0) -- Red for obscured
                            end
                        end
                        
                        if glow then
                            if playerVisible then
                                glow.Color3 = Color3.fromRGB(0, 128, 0) -- Darker green for glow
                            else
                                glow.Color3 = Color3.fromRGB(128, 0, 0) -- Darker red for glow
                            end
                        end
                    end
                end
            end
        else
            -- Hide ESP elements if player is off screen or too far
            if espObject.Box then
                espObject.Box.Visible = false
            end
            if espObject.HealthBG then
                espObject.HealthBG.Visible = false
            end
            if espObject.HealthBar then
                espObject.HealthBar.Visible = false
            end

            if playerText[player] then
                playerText[player].Visible = false
            end
        end
    end
end)

-- Exit ESP Implementation
local exitEspObjects = {}

-- Function to safely create ESP for a part
local function createExitESP(part)
    -- Check if ESP already exists for this part
    if exitEspObjects[part] then return end

    -- Create BillboardGui for name display (bigger size)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ExitESP"
    billboard.Adornee = part
    billboard.Size = UDim2.new(0, 300, 0, 100) -- Bigger size
    billboard.StudsOffset = Vector3.new(0, part.Size.Y/2 + exitEspSettings.Offset, 0) -- Higher above the part
    billboard.AlwaysOnTop = true
    billboard.Enabled = true
    billboard.MaxDistance = exitEspSettings.MaxDistance

    -- Create TextLabel for part name (bigger text)
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboard
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "EXIT" -- Will be updated with distance
    textLabel.TextColor3 = exitEspSettings.Color
    textLabel.TextScaled = false
    textLabel.TextSize = exitEspSettings.TextSize -- Big text
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextStrokeTransparency = 0.2
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center

    -- Parent to the part
    pcall(function() billboard.Parent = part end)

    -- Store reference
    exitEspObjects[part] = {
        billboard = billboard,
        connection = nil
    }

    -- Create a connection to detect when the part is removed
    pcall(function()
        exitEspObjects[part].connection = part.AncestryChanged:Connect(function(_, newParent)
            if not newParent then
                removeExitESP(part)
            end
        end)
    end)
end

-- Function to safely remove ESP for a part
local function removeExitESP(part)
    if exitEspObjects[part] then
        -- Disconnect the connection if it exists
        if exitEspObjects[part].connection then
            pcall(function() exitEspObjects[part].connection:Disconnect() end)
            exitEspObjects[part].connection = nil
        end

        -- Destroy the billboard
        if exitEspObjects[part].billboard then
            pcall(function() exitEspObjects[part].billboard:Destroy() end)
            exitEspObjects[part].billboard = nil
        end

        exitEspObjects[part] = nil
    end
end

-- Function to find all existing Exit parts
local function findExistingExits()
    -- Find all parts that match our criteria
    local descendants = {}
    pcall(function() descendants = Workspace:GetDescendants() end)

    for _, part in ipairs(descendants) do
        if part.ClassName == "Part" and part.Name == "Exit" then
            createExitESP(part)
        end
    end
end

-- Function to handle new parts being added
local function onDescendantAdded(descendant)
    if descendant.ClassName == "Part" and descendant.Name == "Exit" then
        createExitESP(descendant)
    end
end

-- Initialize Exit ESP
findExistingExits()

-- Safely connect to descendant events to handle new parts
local descendantAddedConnection
pcall(function()
    descendantAddedConnection = Workspace.DescendantAdded:Connect(onDescendantAdded)
end)

-- Update Exit ESP positions and text every frame
RunService.RenderStepped:Connect(function()
    if not exitEspSettings.Enabled then
        -- Hide all Exit ESP elements if disabled
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

                -- Update position above the part
                billboard.StudsOffset = Vector3.new(0, part.Size.Y/2 + exitEspSettings.Offset, 0)

                -- Calculate distance if player character exists
                if humanoidRootPart then
                    local distance = (humanoidRootPart.Position - part.Position).Magnitude
                    local roundedDistance = math.floor(distance + 0.5) -- Round to nearest whole number

                    -- Update text with distance
                    billboard.TextLabel.Text = "EXIT [" .. roundedDistance .. " studs]"

                    -- Change color based on distance from local player
                    if distance < exitEspSettings.CloseDistance then
                        billboard.TextLabel.TextColor3 = exitEspSettings.CloseColor -- Green when close
                    elseif distance < exitEspSettings.MediumDistance then
                        billboard.TextLabel.TextColor3 = exitEspSettings.MediumColor -- Yellow at medium distance
                    else
                        billboard.TextLabel.TextColor3 = exitEspSettings.FarColor -- Orange when far
                    end
                else
                    -- If player character doesn't exist, just show "EXIT"
                    billboard.TextLabel.Text = "EXIT"
                    billboard.TextLabel.TextColor3 = exitEspSettings.Color
                end
            end
        else
            -- Remove ESP if part no longer exists
            removeExitESP(part)
        end
    end
end)

-- Misc Tab Content
local miscPage = pages["MISC"]

-- Misc Options Container with modern design - COMPACT SIZE
local miscContainer = Instance.new("Frame")
miscContainer.Size = UDim2.new(0, isMobile and 120 or 300, 0, isMobile and 450 or 400)  -- Reduced from 170x850 / 600x680
miscContainer.Position = UDim2.new(0.5, isMobile and -60 or -150, 0, 10)  -- Adjusted position
miscContainer.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
miscContainer.BorderSizePixel = 0
miscContainer.ZIndex = 4
miscContainer.Parent = miscPage

local miscContainerCorner = Instance.new("UICorner")
miscContainerCorner.CornerRadius = UDim.new(0, isMobile and 4 or 8)  -- Reduced from 6/15
miscContainerCorner.Parent = miscContainer

-- Add subtle border
local miscBorder = Instance.new("UIStroke")
miscBorder.Color = Color3.fromRGB(255, 0, 255)
miscBorder.Thickness = 1  -- Reduced from 2
miscBorder.Transparency = 0.3
miscBorder.Parent = miscContainer

-- Store original lighting settings
local originalLightingSettings = {
    TimeOfDay = Lighting.TimeOfDay,
    Brightness = Lighting.Brightness,
    Ambient = Lighting.Ambient,
    ClockTime = Lighting.ClockTime
}

-- Store original graphics settings
local originalGraphicsSettings = {
    Technology = Lighting.Technology,
    QualityLevel = settings().Rendering.QualityLevel,
    GlobalShadows = Lighting.GlobalShadows,
    FogEnd = Lighting.FogEnd
}

-- Variables to track current mode
local fullBrightEnabled = false
local lowGraphicsEnabled = false

-- Time Changer Variables
local timeChangerEnabled = false
local currentTime = 12
local timeChangerConn

-- Time Changer Function
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
        -- Reset to normal time when disabled
        Lighting.ClockTime = originalLightingSettings.ClockTime
    end
end

-- Low Graphics Functions
local function applyLowGraphics()
    local startTime = tick()
    
    -- Apply low graphics settings
    pcall(function()
        sethiddenproperty(game.Lighting, "Technology", 2)
    end)
    
    -- Safely handle Terrain Decoration
    pcall(function()
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            sethiddenproperty(terrain, "Decoration", false)
        end
    end)
    
    settings().Rendering.QualityLevel = 1
    setsimulationradius(0,0)
    game.Lighting.GlobalShadows = false
    game.Lighting.FogEnd = 9e9
    
    -- Safely handle Terrain Elasticity
    pcall(function()
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.Elasticity = 0
        end
    end)
    
    -- Optimize all parts
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
    
    -- Disable post-processing effects
    for _, effect in pairs(game.Lighting:GetChildren()) do
        if effect:IsA("PostEffect") then
            effect.Enabled = false
        end
    end
    
    local loadTime = math.floor(tick() - startTime * 1000) / 1000
    warn("Low graphics enabled! (" .. loadTime .. "s)")
end

local function restoreGraphics()
    -- Restore original graphics settings
    pcall(function()
        sethiddenproperty(game.Lighting, "Technology", originalGraphicsSettings.Technology)
    end)
    
    -- Safely handle Terrain Decoration
    pcall(function()
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            sethiddenproperty(terrain, "Decoration", true)
        end
    end)
    
    settings().Rendering.QualityLevel = originalGraphicsSettings.QualityLevel
    game.Lighting.GlobalShadows = originalGraphicsSettings.GlobalShadows
    game.Lighting.FogEnd = originalGraphicsSettings.FogEnd
    
    -- Safely handle Terrain Elasticity
    pcall(function()
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.Elasticity = 0.5
        end
    end)
    
    -- Restore all parts
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
    
    -- Enable post-processing effects
    for _, effect in pairs(game.Lighting:GetChildren()) do
        if effect:IsA("PostEffect") then
            effect.Enabled = true
        end
    end
    
    warn("Graphics restored to original settings!")
end

-- Add Full Bright Toggle with premium theme - COMPACT SIZE
local fullBrightToggle = Instance.new("TextButton")
fullBrightToggle.Size = UDim2.new(0, isMobile and 100 or 150, 0, isMobile and 25 or 35)  -- Reduced from 140/250
fullBrightToggle.Position = UDim2.new(0.5, isMobile and -50 or -75, 0, isMobile and 10 or 15)  -- Adjusted position
fullBrightToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
fullBrightToggle.Text = isMobile and "FB: OFF" or "FULL BRIGHT: OFF"
fullBrightToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
fullBrightToggle.Font = Enum.Font.GothamBold
fullBrightToggle.TextSize = isMobile and 8 or 10  -- Reduced from 12/16
fullBrightToggle.ZIndex = 5
fullBrightToggle.Parent = miscContainer

local fullBrightCorner = Instance.new("UICorner")
fullBrightCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 6/12
fullBrightCorner.Parent = fullBrightToggle

fullBrightToggle.MouseButton1Click:Connect(function()
    fullBrightEnabled = not fullBrightEnabled

    if fullBrightEnabled then
        -- Turn on full bright
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.new(1, 1, 1)
        fullBrightToggle.Text = isMobile and "FB: ON" or "FULL BRIGHT: ON"
        fullBrightToggle.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    else
        -- Turn off full bright
        Lighting.Brightness = originalLightingSettings.Brightness
        Lighting.Ambient = originalLightingSettings.Ambient
        Lighting.TimeOfDay = originalLightingSettings.TimeOfDay
        fullBrightToggle.Text = isMobile and "FB: OFF" or "FULL BRIGHT: OFF"
        fullBrightToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    end
end)

-- Add Low Graphics Toggle with premium theme - COMPACT SIZE
local lowGraphicsToggle = Instance.new("TextButton")
lowGraphicsToggle.Size = UDim2.new(0, isMobile and 100 or 150, 0, isMobile and 25 or 35)  -- Reduced from 140/250
lowGraphicsToggle.Position = UDim2.new(0.5, isMobile and -50 or -75, 0, isMobile and 40 or 55)  -- Adjusted position
lowGraphicsToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
lowGraphicsToggle.Text = isMobile and "LG: OFF" or "LOW GRAPHICS: OFF"
lowGraphicsToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
lowGraphicsToggle.Font = Enum.Font.GothamBold
lowGraphicsToggle.TextSize = isMobile and 8 or 10  -- Reduced from 12/16
lowGraphicsToggle.ZIndex = 5
lowGraphicsToggle.Parent = miscContainer

local lowGraphicsCorner = Instance.new("UICorner")
lowGraphicsCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 6/12
lowGraphicsCorner.Parent = lowGraphicsToggle

lowGraphicsToggle.MouseButton1Click:Connect(function()
    lowGraphicsEnabled = not lowGraphicsEnabled

    if lowGraphicsEnabled then
        -- Turn on low graphics
        applyLowGraphics()
        lowGraphicsToggle.Text = isMobile and "LG: ON" or "LOW GRAPHICS: ON"
        lowGraphicsToggle.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    else
        -- Turn off low graphics
        restoreGraphics()
        lowGraphicsToggle.Text = isMobile and "LG: OFF" or "LOW GRAPHICS: OFF"
        lowGraphicsToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    end
end)

-- Add Crosshair Toggle with premium theme - COMPACT SIZE
local crosshairToggle = Instance.new("TextButton")
crosshairToggle.Size = UDim2.new(0, isMobile and 100 or 150, 0, isMobile and 25 or 35)  -- Reduced from 140/250
crosshairToggle.Position = UDim2.new(0.5, isMobile and -50 or -75, 0, isMobile and 70 or 95)  -- Adjusted position
crosshairToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
crosshairToggle.Text = isMobile and "X: OFF" or "CROSSHAIR: OFF"
crosshairToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
crosshairToggle.Font = Enum.Font.GothamBold
crosshairToggle.TextSize = isMobile and 8 or 10  -- Reduced from 12/16
crosshairToggle.ZIndex = 5
crosshairToggle.Parent = miscContainer

local crosshairCorner = Instance.new("UICorner")
crosshairCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 6/12
crosshairCorner.Parent = crosshairToggle

-- Crosshair Settings with premium theme
local crosshairEnabled = false
local crosshairSize = isMobile and 6 or 10  -- Reduced from 8/15
local crosshairThickness = isMobile and 1 or 2
local crosshairColor = Color3.fromRGB(255, 0, 255)
local crosshairTransparency = 0
local crosshairOffsetY = isMobile and 8 or 12 -- Reduced from 10/16

-- Create crosshair GUI elements instead of Drawing objects
local crosshairGui = Instance.new("ScreenGui")
crosshairGui.Name = "Crosshair"
crosshairGui.ResetOnSpawn = false
crosshairGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
crosshairGui.Enabled = false
crosshairGui.IgnoreGuiInset = true
crosshairGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Create horizontal line
local horizontalLine = Instance.new("Frame")
horizontalLine.Name = "Horizontal"
horizontalLine.Size = UDim2.new(0, crosshairSize * 2, 0, crosshairThickness)
horizontalLine.Position = UDim2.new(0.5, -crosshairSize, 0.5, -crosshairThickness/2 - crosshairOffsetY)
horizontalLine.BackgroundColor3 = crosshairColor
horizontalLine.BorderSizePixel = 0
horizontalLine.Parent = crosshairGui

-- Create vertical line
local verticalLine = Instance.new("Frame")
verticalLine.Name = "Vertical"
verticalLine.Size = UDim2.new(0, crosshairThickness, 0, crosshairSize * 2)
verticalLine.Position = UDim2.new(0.5, -crosshairThickness/2, 0.5, -crosshairSize - crosshairOffsetY)
verticalLine.BackgroundColor3 = crosshairColor
verticalLine.BorderSizePixel = 0
verticalLine.Parent = crosshairGui

-- Create center dot
local centerDot = Instance.new("Frame")
centerDot.Name = "CenterDot"
centerDot.Size = UDim2.new(0, crosshairThickness * 2, 0, crosshairThickness * 2)
centerDot.Position = UDim2.new(0.5, -crosshairThickness, 0.5, -crosshairThickness - crosshairOffsetY)
centerDot.BackgroundColor3 = crosshairColor
centerDot.BorderSizePixel = 0
centerDot.Parent = crosshairGui

-- Update crosshair function
local function updateCrosshair()
    -- Update size
    horizontalLine.Size = UDim2.new(0, crosshairSize * 2, 0, crosshairThickness)
    verticalLine.Size = UDim2.new(0, crosshairThickness, 0, crosshairSize * 2)
    centerDot.Size = UDim2.new(0, crosshairThickness * 2, 0, crosshairThickness * 2)

    -- Update position (subtract offset to move higher)
    horizontalLine.Position = UDim2.new(0.5, -crosshairSize, 0.5, -crosshairThickness/2 - crosshairOffsetY)
    verticalLine.Position = UDim2.new(0.5, -crosshairThickness/2, 0.5, -crosshairSize - crosshairOffsetY)
    centerDot.Position = UDim2.new(0.5, -crosshairThickness, 0.5, -crosshairThickness - crosshairOffsetY)

    -- Update color
    horizontalLine.BackgroundColor3 = crosshairColor
    verticalLine.BackgroundColor3 = crosshairColor
    centerDot.BackgroundColor3 = crosshairColor

    -- Toggle visibility
    crosshairGui.Enabled = crosshairEnabled
end

-- Handle crosshair toggle
crosshairToggle.MouseButton1Click:Connect(function()
    crosshairEnabled = not crosshairEnabled
    crosshairToggle.Text = isMobile and ("X: " .. (crosshairEnabled and "ON" or "OFF")) or ("CROSSHAIR: " .. (crosshairEnabled and "ON" or "OFF"))
    crosshairToggle.BackgroundColor3 = crosshairEnabled and Color3.fromRGB(128, 0, 128) or Color3.fromRGB(50, 0, 80)
    updateCrosshair()
end)

-- Create Crosshair Size Slider
createSlider("CROSSHAIR SIZE", 5, 30, isMobile and 6 or 10, isMobile and 100 or 135, miscContainer, function(value)
    crosshairSize = value
    updateCrosshair()
end)

-- Add Time Changer Toggle with premium theme - COMPACT SIZE
local timeChangerToggle = Instance.new("TextButton")
timeChangerToggle.Size = UDim2.new(0, isMobile and 100 or 150, 0, isMobile and 25 or 35)  -- Reduced from 140/250
timeChangerToggle.Position = UDim2.new(0.5, isMobile and -50 or -75, 0, isMobile and 130 or 175)  -- Adjusted position
timeChangerToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
timeChangerToggle.Text = isMobile and "TIME: OFF" or "TIME CHANGER: OFF"
timeChangerToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
timeChangerToggle.Font = Enum.Font.GothamBold
timeChangerToggle.TextSize = isMobile and 8 or 10  -- Reduced from 12/16
timeChangerToggle.ZIndex = 5
timeChangerToggle.Parent = miscContainer

local timeChangerCorner = Instance.new("UICorner")
timeChangerCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 6/12
timeChangerCorner.Parent = timeChangerToggle

timeChangerToggle.MouseButton1Click:Connect(function()
    timeChangerEnabled = not timeChangerEnabled
    setTimeChangerEnabled(timeChangerEnabled)
    timeChangerToggle.Text = isMobile and ("TIME: " .. (timeChangerEnabled and "ON" or "OFF")) or ("TIME CHANGER: " .. (timeChangerEnabled and "ON" or "OFF"))
    timeChangerToggle.BackgroundColor3 = timeChangerEnabled and Color3.fromRGB(128, 0, 128) or Color3.fromRGB(50, 0, 80)
end)

-- Create Time Slider
createSlider("TIME", 0, 24, 12, isMobile and 160 or 215, miscContainer, function(value)
    currentTime = value
    if timeChangerEnabled then
        Lighting.ClockTime = currentTime
    end
end)

-- Add POV Changer with premium theme - COMPACT SIZE
local povLabel = Instance.new("TextLabel")
povLabel.Size = UDim2.new(1, isMobile and -10 or -20, 0, isMobile and 12 or 18)  -- Reduced from 20/30
povLabel.Position = UDim2.new(0, isMobile and 5 or 10, 0, isMobile and 190 or 255)  -- Adjusted position
povLabel.BackgroundTransparency = 1
povLabel.Text = "FIELD OF VIEW"
povLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
povLabel.Font = Enum.Font.GothamBold
povLabel.TextSize = isMobile and 7 or 10  -- Reduced from 10/16
povLabel.ZIndex = 5
povLabel.Parent = miscContainer

-- Store original FOV
local originalFOV = Camera.FieldOfView
local desiredFOV = originalFOV
local fovEnabled = false
local fovLocked = false -- New flag to lock FOV at desired value

-- Create FOV Slider
createSlider("FOV", 50, 120, 70, isMobile and 210 or 280, miscContainer, function(value)
    desiredFOV = value
    fovEnabled = true
    fovLocked = true
    Camera.FieldOfView = desiredFOV
end)

-- Add Reset FOV Button with premium theme - COMPACT SIZE
local resetFovButton = Instance.new("TextButton")
resetFovButton.Size = UDim2.new(0, isMobile and 100 or 150, 0, isMobile and 25 or 30)  -- Reduced from 140/250
resetFovButton.Position = UDim2.new(0.5, isMobile and -50 or -75, 0, isMobile and 250 or 320)  -- Adjusted position
resetFovButton.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
resetFovButton.Text = "RESET FOV"
resetFovButton.TextColor3 = Color3.fromRGB(255, 255, 255)
resetFovButton.Font = Enum.Font.GothamBold
resetFovButton.TextSize = isMobile and 8 or 10  -- Reduced from 12/16
resetFovButton.ZIndex = 5
resetFovButton.Parent = miscContainer

local resetFovCorner = Instance.new("UICorner")
resetFovCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 6/12
resetFovCorner.Parent = resetFovButton

resetFovButton.MouseButton1Click:Connect(function()
    desiredFOV = originalFOV
    fovEnabled = false
    fovLocked = false
    Camera.FieldOfView = originalFOV
end)

-- Add Zoom Variables
local zoomEnabled = false
local isZooming = false
local previousFOV = Camera.FieldOfView
local zoomKey = Enum.KeyCode.F -- Changed from Z to F

-- Add Zoom Toggle to Misc Tab - COMPACT SIZE
local zoomToggle = Instance.new("TextButton")
zoomToggle.Size = UDim2.new(0, isMobile and 100 or 150, 0, isMobile and 25 or 35)  -- Reduced from 140/250
zoomToggle.Position = UDim2.new(0.5, isMobile and -50 or -75, 0, isMobile and 285 or 360)  -- Adjusted position
zoomToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
zoomToggle.Text = isMobile and "ZOOM: OFF (F)" or "ZOOM: OFF (F)"
zoomToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
zoomToggle.Font = Enum.Font.GothamBold
zoomToggle.TextSize = isMobile and 8 or 10  -- Reduced from 12/16
zoomToggle.ZIndex = 5
zoomToggle.Parent = miscContainer

local zoomCorner = Instance.new("UICorner")
zoomCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 6/12
zoomCorner.Parent = zoomToggle

-- Zoom Toggle Functionality
zoomToggle.MouseButton1Click:Connect(function()
    zoomEnabled = not zoomEnabled
    zoomToggle.Text = isMobile and ("ZOOM: " .. (zoomEnabled and "ON (F)" or "OFF (F)")) or ("ZOOM: " .. (zoomEnabled and "ON (F)" or "OFF (F)"))
    zoomToggle.BackgroundColor3 = zoomEnabled and Color3.fromRGB(128, 0, 128) or Color3.fromRGB(50, 0, 80)
    
    -- If zoom was active when toggled off, reset FOV
    if isZooming and not zoomEnabled then
        Camera.FieldOfView = previousFOV
        isZooming = false
    end
end)

-- Zoom Keybind Handling - Toggle on/off with key press
UIS.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == zoomKey and zoomEnabled then
        isZooming = not isZooming
        
        if isZooming then
            -- Store current FOV before zooming
            previousFOV = Camera.FieldOfView
            Camera.FieldOfView = 30
        else
            -- Restore previous FOV when toggled off
            Camera.FieldOfView = previousFOV
        end
    end
end)

-- Rainbow ViewModel Variables
local rainbowEnabled = false
local rainbowConnection = nil
local hue = 0
local rainbowSpeed = 5 -- Speed of color change (higher = faster)
local rainbowViewModels = {} -- Track ViewModels with rainbow effect

-- Function to convert HSV to RGB
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

-- Function to apply rainbow effects to a ViewModel
local function applyViewModelEffects(model)
    -- Check if it's the target model
    if model.ClassName == "Model" and model.Name == "ViewModel" then
        -- Apply effects to all parts in the model
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                pcall(function()
                    -- Set transparency to 0.5
                    part.LocalTransparencyModifier = 0.9
                end)
            end
        end
        
        -- Add a highlight to make it more visible
        pcall(function()
            -- Remove any existing highlight first
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

-- Function to remove effects from a ViewModel
local function removeViewModelEffects(model)
    if model.ClassName == "Model" and model.Name == "ViewModel" then
        -- Remove effects from all parts
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                pcall(function()
                    -- Reset transparency
                    part.LocalTransparencyModifier = 0
                end)
            end
        end
        
        -- Remove highlight
        pcall(function()
            local highlight = model:FindFirstChild("ViewModelHighlight")
            if highlight then
                highlight:Destroy()
            end
        end)
    end
end

-- Function to update rainbow colors for a specific model
local function updateRainbowColorsForModel(model, color)
    -- Update all parts in the model
    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") then
            pcall(function()
                part.Color = color
            end)
        end
    end
    
    -- Update highlight if exists
    local highlight = model:FindFirstChild("ViewModelHighlight")
    if highlight then
        pcall(function()
            highlight.FillColor = color
            highlight.OutlineColor = Color3.new(color.R * 0.5, color.G * 0.5, color.B * 0.5)
        end)
    end
end

-- Function to scan for ViewModel models
local function scanForViewModels()
    pcall(function()
        -- Check all models in the workspace
        for _, model in ipairs(Workspace:GetDescendants()) do
            if model.ClassName == "Model" and model.Name == "ViewModel" and not rainbowViewModels[model] then
                rainbowViewModels[model] = true
                applyViewModelEffects(model)
            end
        end
        
        -- Also check in player characters
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

-- Function to update rainbow colors (optimized)
local function updateRainbowColors()
    -- Update hue
    hue = (hue + rainbowSpeed) % 360
    
    -- Convert HSV to RGB
    local rainbowColor = hsvToRgb(hue, 1, 1)
    
    -- Update all tracked ViewModels
    for model in pairs(rainbowViewModels) do
        if model and model.Parent then
            updateRainbowColorsForModel(model, rainbowColor)
        else
            -- Remove from table if no longer valid
            rainbowViewModels[model] = nil
        end
    end
end

-- Function to enable rainbow effects (optimized)
local function enableRainbowEffects()
    rainbowEnabled = true
    
    -- Apply effects to existing ViewModels
    scanForViewModels()
    
    -- Start rainbow color update loop (optimized to run every 0.1 seconds)
    spawn(function()
        while rainbowEnabled do
            updateRainbowColors()
            wait(0.1)  -- Update every 0.1 seconds instead of every frame
        end
    end)
end

-- Function to disable rainbow effects
local function disableRainbowEffects()
    rainbowEnabled = false
    
    -- Remove effects from all ViewModels
    for model in pairs(rainbowViewModels) do
        removeViewModelEffects(model)
    end
    rainbowViewModels = {}
end

-- Add Rainbow Toggle to Misc Tab - COMPACT SIZE
local rainbowToggle = Instance.new("TextButton")
rainbowToggle.Size = UDim2.new(0, isMobile and 100 or 150, 0, isMobile and 25 or 35)  -- Reduced from 140/250
rainbowToggle.Position = UDim2.new(0.5, isMobile and -50 or -75, 0, isMobile and 320 or 400)  -- Adjusted position
rainbowToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
rainbowToggle.Text = isMobile and "RAINBOW: OFF" or "RAINBOW VIEWMODEL: OFF"
rainbowToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
rainbowToggle.Font = Enum.Font.GothamBold
rainbowToggle.TextSize = isMobile and 8 or 10  -- Reduced from 12/16
rainbowToggle.ZIndex = 5
rainbowToggle.Parent = miscContainer

local rainbowCorner = Instance.new("UICorner")
rainbowCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)  -- Reduced from 6/12
rainbowCorner.Parent = rainbowToggle

-- Rainbow Toggle Functionality
rainbowToggle.MouseButton1Click:Connect(function()
    rainbowEnabled = not rainbowEnabled
    rainbowToggle.Text = isMobile and ("RAINBOW: " .. (rainbowEnabled and "ON" or "OFF")) or ("RAINBOW VIEWMODEL: " .. (rainbowEnabled and "ON" or "OFF"))
    rainbowToggle.BackgroundColor3 = rainbowEnabled and Color3.fromRGB(128, 0, 128) or Color3.fromRGB(50, 0, 80)
    
    if rainbowEnabled then
        enableRainbowEffects()
    else
        disableRainbowEffects()
    end
end)

-- Watch for new models
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

-- Watch for model removal
pcall(function()
    Workspace.DescendantRemoved:Connect(function(descendant)
        if descendant.ClassName == "Model" and descendant.Name == "ViewModel" then
            if rainbowViewModels[descendant] then
                rainbowViewModels[descendant] = nil
            end
        end
    end)
end)

-- Also check player characters
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

-- Check existing players
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

-- Mobile-specific optimizations
if isMobile then
    -- Make buttons larger for easier touch
    for _, button in pairs(screenGui:GetDescendants()) do
        if button:IsA("TextButton") and button.Name ~= "ToggleGUI" then
            button.Size = UDim2.new(button.Size.X.Scale, button.Size.X.Offset + 3, button.Size.Y.Scale, button.Size.Y.Offset + 3)
        end
    end
    
    -- Make sliders easier to interact with
    for _, slider in pairs(screenGui:GetDescendants()) do
        if slider.Name == "SliderTrack" then
            slider.Size = UDim2.new(slider.Size.X.Scale, slider.Size.X.Offset + 5, slider.Size.Y.Scale, slider.Size.Y.Offset + 2)
        end
    end
end

-- Auto-hide GUI when mobile user touches outside
if isMobile then
    UIS.TouchStarted:Connect(function(touch)
        local touchPos = touch.Position
        local guiPos = mainFrame.AbsolutePosition
        local guiSize = mainFrame.AbsoluteSize
        
        -- Check if touch is outside the GUI
        if touchPos.X < guiPos.X or touchPos.X > guiPos.X + guiSize.X or
           touchPos.Y < guiPos.Y or touchPos.Y > guiPos.Y + guiSize.Y then
            -- Don't hide if touching the toggle button
            local togglePos = toggleButton.AbsolutePosition
            local toggleSize = toggleButton.AbsoluteSize
            
            if not (touchPos.X >= togglePos.X and touchPos.X <= togglePos.X + toggleSize.X and
                    touchPos.Y >= togglePos.Y and touchPos.Y <= togglePos.Y + toggleSize.Y) then
                mainFrame.Visible = false
                toggleButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
            end
        end
    end)
end

-- Notification for mobile users
if isMobile then
    local notification = Instance.new("TextLabel")
    notification.Size = UDim2.new(0, 200, 0, 30)  -- Reduced from 250/40
    notification.Position = UDim2.new(0.5, -100, 0, 80)  -- Adjusted position
    notification.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    notification.Text = "Mobile Mode Enabled - Tap NH to toggle GUI"
    notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    notification.Font = Enum.Font.GothamBold
    notification.TextSize = 10  -- Reduced from 14
    notification.BorderSizePixel = 0
    notification.Parent = screenGui
    notification.ZIndex = 20
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 5)  -- Reduced from 8
    notifCorner.Parent = notification
    
    -- Fade out notification after 5 seconds
    game:GetService("Debris"):AddItem(notification, 5)
end
