-- MM2 Trade Premium Script
-- UI Library Creation

local MM2TradePremium = {}

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2TradePremium"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- Detect if we're running in an executor
pcall(function()
    if syn then
        syn.protect_gui(ScreenGui)
    end
end)

-- Create Main Frame
local function createMainUI()
    -- Background Frame
    local Background = Instance.new("Frame")
    Background.Name = "Background"
    Background.Size = UDim2.new(0, 320, 0, 370)
    Background.Position = UDim2.new(0.5, -160, 0.5, -185)
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BackgroundTransparency = 0.3
    Background.BorderSizePixel = 0
    Background.Parent = ScreenGui
    
    -- Gradient Background
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 0, 51)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 51))
    })
    UIGradient.Rotation = 135
    UIGradient.Parent = Background
    
    -- Border Glow
    local BorderGlow = Instance.new("UIStroke")
    BorderGlow.Color = Color3.fromRGB(128, 0, 255)
    BorderGlow.Transparency = 0.3
    BorderGlow.Thickness = 2
    BorderGlow.Parent = Background
    
    -- Corner Rounding
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = Background
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 25, 0, 25)
    CloseButton.Position = UDim2.new(1, -30, 0, 10)
    CloseButton.BackgroundTransparency = 1
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(170, 170, 170)
    CloseButton.TextSize = 20
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.Parent = Background
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Header Container
    local HeaderContainer = Instance.new("Frame")
    HeaderContainer.Name = "HeaderContainer"
    HeaderContainer.Size = UDim2.new(1, -30, 0, 50)
    HeaderContainer.Position = UDim2.new(0, 15, 0, 15)
    HeaderContainer.BackgroundTransparency = 1
    HeaderContainer.Parent = Background
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0.7, 0, 0, 30)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "MM2 Trade"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 22
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = HeaderContainer
    
    -- Title Gradient
    local TitleGradient = Instance.new("UIGradient")
    TitleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 77, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 51, 204))
    })
    TitleGradient.Parent = Title
    
    -- Subtitle
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Size = UDim2.new(0.7, 0, 0, 20)
    Subtitle.Position = UDim2.new(0, 0, 0, 30)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "v3.2 PREMIUM"
    Subtitle.TextColor3 = Color3.fromRGB(170, 170, 170)
    Subtitle.TextSize = 10
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Subtitle.Parent = HeaderContainer
    
    -- Premium Badge
    local PremiumBadge = Instance.new("Frame")
    PremiumBadge.Name = "PremiumBadge"
    PremiumBadge.Size = UDim2.new(0, 70, 0, 24)
    PremiumBadge.Position = UDim2.new(1, -70, 0, 13)
    PremiumBadge.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    PremiumBadge.Parent = HeaderContainer
    
    -- Premium Badge Corner
    local BadgeCorner = Instance.new("UICorner")
    BadgeCorner.CornerRadius = UDim.new(0, 10)
    BadgeCorner.Parent = PremiumBadge
    
    -- Premium Badge Gradient
    local BadgeGradient = Instance.new("UIGradient")
    BadgeGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))
    })
    BadgeGradient.Rotation = 45
    BadgeGradient.Parent = PremiumBadge
    
    -- Premium Badge Text
    local PremiumText = Instance.new("TextLabel")
    PremiumText.Name = "PremiumText"
    PremiumText.Size = UDim2.new(1, 0, 1, 0)
    PremiumText.BackgroundTransparency = 1
    PremiumText.Text = "PREMIUM"
    PremiumText.TextColor3 = Color3.fromRGB(0, 0, 0)
    PremiumText.TextSize = 10
    PremiumText.Font = Enum.Font.GothamBold
    PremiumText.Parent = PremiumBadge
    
    -- Divider Line
    local Divider = Instance.new("Frame")
    Divider.Name = "Divider"
    Divider.Size = UDim2.new(1, -30, 0, 1)
    Divider.Position = UDim2.new(0, 15, 0, 75)
    Divider.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
    Divider.BackgroundTransparency = 0.5
    Divider.BorderSizePixel = 0
    Divider.Parent = Background
    
    -- Divider Gradient
    local DividerGradient = Instance.new("UIGradient")
    DividerGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 255, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 255, 0))
    })
    DividerGradient.Parent = Divider
    
    -- Controls Container
    local ControlsContainer = Instance.new("Frame")
    ControlsContainer.Name = "ControlsContainer"
    ControlsContainer.Size = UDim2.new(1, -30, 0, 150)
    ControlsContainer.Position = UDim2.new(0, 15, 0, 85)
    ControlsContainer.BackgroundTransparency = 1
    ControlsContainer.Parent = Background
    
    -- Create toggle switches
    local toggleOptions = {
        {name = "AUTO ADD ITEMS", enabled = true},
        {name = "FORCE ACCEPT", enabled = false},
        {name = "FREEZE VICTIM'S GAME", enabled = false}
    }
    
    for i, option in ipairs(toggleOptions) do
        local ToggleRow = Instance.new("Frame")
        ToggleRow.Name = option.name .. "Row"
        ToggleRow.Size = UDim2.new(1, 0, 0, 40)
        ToggleRow.Position = UDim2.new(0, 0, 0, (i-1) * 45)
        ToggleRow.BackgroundColor3 = Color3.fromRGB(40, 10, 60)
        ToggleRow.BackgroundTransparency = 0.4
        ToggleRow.Parent = ControlsContainer
        
        -- Toggle Row Border
        local ToggleBorder = Instance.new("UIStroke")
        ToggleBorder.Color = Color3.fromRGB(128, 0, 255)
        ToggleBorder.Transparency = 0.7
        ToggleBorder.Thickness = 1
        ToggleBorder.Parent = ToggleRow
        
        -- Toggle Row Corner
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 12)
        ToggleCorner.Parent = ToggleRow
        
        -- Toggle Label
        local ToggleLabel = Instance.new("TextLabel")
        ToggleLabel.Name = "Label"
        ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
        ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
        ToggleLabel.BackgroundTransparency = 1
        ToggleLabel.Text = option.name
        ToggleLabel.TextColor3 = Color3.fromRGB(245, 245, 245)
        ToggleLabel.TextSize = 16
        ToggleLabel.Font = Enum.Font.GothamBold
        ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        ToggleLabel.Parent = ToggleRow
        
        -- Toggle Switch Container
        local ToggleContainer = Instance.new("Frame")
        ToggleContainer.Name = "ToggleContainer"
        ToggleContainer.Size = UDim2.new(0, 50, 0, 26)
        ToggleContainer.Position = UDim2.new(1, -60, 0.5, -13)
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        ToggleContainer.BackgroundTransparency = 0.5
        ToggleContainer.BorderSizePixel = 0
        ToggleContainer.Parent = ToggleRow
        
        -- Toggle Container Border
        local ToggleContainerBorder = Instance.new("UIStroke")
        ToggleContainerBorder.Color = Color3.fromRGB(128, 0, 255)
        ToggleContainerBorder.Transparency = 0.5
        ToggleContainerBorder.Thickness = 1
        ToggleContainerBorder.Parent = ToggleContainer
        
        -- Toggle Container Corner
        local ToggleContainerCorner = Instance.new("UICorner")
        ToggleContainerCorner.CornerRadius = UDim.new(0, 34)
        ToggleContainerCorner.Parent = ToggleContainer
        
        -- Toggle Knob
        local ToggleKnob = Instance.new("Frame")
        ToggleKnob.Name = "Knob"
        ToggleKnob.Size = UDim2.new(0, 18, 0, 18)
        ToggleKnob.Position = option.enabled 
            and UDim2.new(0, 28, 0.5, -9) 
            or UDim2.new(0, 4, 0.5, -9)
        ToggleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleKnob.Parent = ToggleContainer
        
        -- Toggle Knob Corner
        local KnobCorner = Instance.new("UICorner")
        KnobCorner.CornerRadius = UDim.new(0, 50)
        KnobCorner.Parent = ToggleKnob
        
        -- Toggle Background (when enabled)
        if option.enabled then
            local ToggleBackground = Instance.new("Frame")
            ToggleBackground.Name = "Background"
            ToggleBackground.Size = UDim2.new(1, 0, 1, 0)
            ToggleBackground.BackgroundColor3 = Color3.fromRGB(166, 77, 255)
            ToggleBackground.ZIndex = -1
            ToggleBackground.Parent = ToggleContainer
            
            -- Toggle Background Corner
            local BackgroundCorner = Instance.new("UICorner")
            BackgroundCorner.CornerRadius = UDim.new(0, 34)
            BackgroundCorner.Parent = ToggleBackground
            
            -- Toggle Background Gradient
            local BackgroundGradient = Instance.new("UIGradient")
            BackgroundGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 77, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
            })
            BackgroundGradient.Parent = ToggleBackground
        end
        
        -- Make clickable
        ToggleRow.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local isEnabled = ToggleKnob.Position.X.Offset > 10
                
                if isEnabled then
                    -- Disable
                    ToggleKnob:TweenPosition(UDim2.new(0, 4, 0.5, -9), "Out", "Quad", 0.15, true)
                    if ToggleContainer:FindFirstChild("Background") then
                        ToggleContainer.Background:Destroy()
                    end
                else
                    -- Enable
                    ToggleKnob:TweenPosition(UDim2.new(0, 28, 0.5, -9), "Out", "Quad", 0.15, true)
                    
                    local ToggleBackground = Instance.new("Frame")
                    ToggleBackground.Name = "Background"
                    ToggleBackground.Size = UDim2.new(1, 0, 1, 0)
                    ToggleBackground.BackgroundColor3 = Color3.fromRGB(166, 77, 255)
                    ToggleBackground.ZIndex = -1
                    ToggleBackground.Parent = ToggleContainer
                    
                    local BackgroundCorner = Instance.new("UICorner")
                    BackgroundCorner.CornerRadius = UDim.new(0, 34)
                    BackgroundCorner.Parent = ToggleBackground
                    
                    local BackgroundGradient = Instance.new("UIGradient")
                    BackgroundGradient.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 77, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
                    })
                    BackgroundGradient.Parent = ToggleBackground
                end
            end
        end)
    end
    
    -- Second Divider
    local Divider2 = Instance.new("Frame")
    Divider2.Name = "Divider2"
    Divider2.Size = UDim2.new(1, -30, 0, 1)
    Divider2.Position = UDim2.new(0, 15, 0, 240)
    Divider2.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
    Divider2.BackgroundTransparency = 0.5
    Divider2.BorderSizePixel = 0
    Divider2.Parent = Background
    
    -- Divider2 Gradient
    local Divider2Gradient = Instance.new("UIGradient")
    Divider2Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 255, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 255, 0))
    })
    Divider2Gradient.Parent = Divider2
    
    -- Premium Features Container
    local FeaturesContainer = Instance.new("Frame")
    FeaturesContainer.Name = "FeaturesContainer"
    FeaturesContainer.Size = UDim2.new(1, -30, 0, 80)
    FeaturesContainer.Position = UDim2.new(0, 15, 0, 250)
    FeaturesContainer.BackgroundTransparency = 1
    FeaturesContainer.Parent = Background
    
    -- Premium Features
    local premiumFeatures = {
        "Auto Dupe Godlys",
        "Instant Trade Success",
        "Item Value Spoofer"
    }
    
    for i, feature in ipairs(premiumFeatures) do
        local FeatureRow = Instance.new("Frame")
        FeatureRow.Name = "Feature" .. i
        FeatureRow.Size = UDim2.new(1, 0, 0, 20)
        FeatureRow.Position = UDim2.new(0, 0, 0, (i-1) * 25)
        FeatureRow.BackgroundTransparency = 1
        FeatureRow.Parent = FeaturesContainer
        
        -- Feature Icon
        local FeatureIcon = Instance.new("Frame")
        FeatureIcon.Name = "Icon"
        FeatureIcon.Size = UDim2.new(0, 16, 0, 16)
        FeatureIcon.Position = UDim2.new(0, 0, 0.5, -8)
        FeatureIcon.BackgroundColor3 = Color3.fromRGB(166, 77, 255)
        FeatureIcon.Parent = FeatureRow
        
        -- Feature Icon Corner
        local IconCorner = Instance.new("UICorner")
        IconCorner.CornerRadius = UDim.new(0, 50)
        IconCorner.Parent = FeatureIcon
        
        -- Feature Icon Text
        local IconText = Instance.new("TextLabel")
        IconText.Name = "IconText"
        IconText.Size = UDim2.new(1, 0, 1, 0)
        IconText.BackgroundTransparency = 1
        IconText.Text = "★"
        IconText.TextColor3 = Color3.fromRGB(255, 255, 255)
        IconText.TextSize = 10
        IconText.Font = Enum.Font.GothamBold
        IconText.Parent = FeatureIcon
        
        -- Feature Text
        local FeatureText = Instance.new("TextLabel")
        FeatureText.Name = "Text"
        FeatureText.Size = UDim2.new(0.9, 0, 1, 0)
        FeatureText.Position = UDim2.new(0, 24, 0, 0)
        FeatureText.BackgroundTransparency = 1
        FeatureText.Text = feature
        FeatureText.TextColor3 = Color3.fromRGB(221, 221, 221)
        FeatureText.TextSize = 14
        FeatureText.Font = Enum.Font.Gotham
        FeatureText.TextXAlignment = Enum.TextXAlignment.Left
        FeatureText.Parent = FeatureRow
    end
    
    -- Start Button
    local StartButton = Instance.new("TextButton")
    StartButton.Name = "StartButton"
    StartButton.Size = UDim2.new(1, -30, 0, 30)
    StartButton.Position = UDim2.new(0, 15, 0, 325)
    StartButton.BackgroundColor3 = Color3.fromRGB(166, 77, 255)
    StartButton.Text = "START PREMIUM SCRIPT"
    StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    StartButton.TextSize = 14
    StartButton.Font = Enum.Font.GothamBold
    StartButton.Parent = Background
    
    -- Start Button Corner
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = StartButton
    
    -- Start Button Gradient
    local ButtonGradient = Instance.new("UIGradient")
    ButtonGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 77, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
    })
    ButtonGradient.Parent = StartButton
    
    -- Start Button Glow
    local ButtonGlow = Instance.new("UIStroke")
    ButtonGlow.Color = Color3.fromRGB(128, 0, 255)
    ButtonGlow.Transparency = 0.5
    ButtonGlow.Thickness = 2
    ButtonGlow.Parent = StartButton
    
    -- Make the UI draggable
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        Background.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    HeaderContainer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Background.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    HeaderContainer.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            updateInput(input)
        end
    end)
    
    -- Button hover effects
    StartButton.MouseEnter:Connect(function()
        ButtonGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 102, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 51, 204))
        })
        ButtonGlow.Transparency = 0.2
    end)
    
    StartButton.MouseLeave:Connect(function()
        ButtonGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 77, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
        })
        ButtonGlow.Transparency = 0.5
    end)
    
    StartButton.MouseButton1Click:Connect(function()
        StartButton.Text = "RUNNING..."
        wait(1)
        StartButton.Text = "PREMIUM ACTIVATED"
    end)
    
    -- Add footer (version and user status)
    local Footer = Instance.new("Frame")
    Footer.Name = "Footer"
    Footer.Size = UDim2.new(1, -30, 0, 15)
    Footer.Position = UDim2.new(0, 15, 1, -20)
    Footer.BackgroundTransparency = 1
    Footer.Parent = Background
    
    -- Footer Left Text
    local FooterLeft = Instance.new("TextLabel")
    FooterLeft.Name = "UserStatus"
    FooterLeft.Size = UDim2.new(0.5, 0, 1, 0)
    FooterLeft.Position = UDim2.new(0, 0, 0, 0)
    FooterLeft.BackgroundTransparency = 1
    FooterLeft.Text = "PREMIUM USER"
    FooterLeft.TextColor3 = Color3.fromRGB(136, 136, 136)
    FooterLeft.TextSize = 12
    FooterLeft.Font = Enum.Font.Gotham
    FooterLeft.TextXAlignment = Enum.TextXAlignment.Left
    FooterLeft.Parent = Footer
    
    -- Footer Right Text
    local FooterRight = Instance.new("TextLabel")
    FooterRight.Name = "Version"
    FooterRight.Size = UDim2.new(0.5, 0, 1, 0)
    FooterRight.Position = UDim2.new(0.5, 0, 0, 0)
    FooterRight.BackgroundTransparency = 1
    FooterRight.Text = "v3.2"
    FooterRight.TextColor3 = Color3.fromRGB(136, 136, 136)
    FooterRight.TextSize = 12
    FooterRight.Font = Enum.Font.Gotham
    FooterRight.TextXAlignment = Enum.TextXAlignment.Right
    FooterRight.Parent = Footer
    
    return Background
end

-- Create Loading UI
local function createLoadingUI()
    -- Loading Container
    local LoadingFrame = Instance.new("Frame")
    LoadingFrame.Name = "LoadingFrame"
    LoadingFrame
