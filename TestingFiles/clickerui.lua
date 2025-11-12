local ClickerUI = Gui2d:NewContainer("ClickerUI")

local Title = UI_PREFABS.TextLabel({
    Size = UDim2.new(1,0,0.2,0),
    BackgroundColor = {0,0,0,0},
    StrokeWidth = 0,
    Text = "Generic Clicker Game",
    Font = "OpenSansBold",
    FontSize = 40,
    TextXAlign = "center",
    TextYAlign = "center",
    TextColor = {1,1,1}
})

local ScoreCounter = UI_PREFABS.TextLabel({
    Size = UDim2.new(1,0,0.1,0),
    Position = UDim2.new(0,0,0.2,0),
    BackgroundColor = {0,0,0,0},
    StrokeWidth = 0,
    Text = "Score: 0",
    Font = "OpenSans",
    FontSize = 24,
    TextXAlign = "center",
    TextYAlign = "center",
    TextColor = {1,1,1}
})

local Button = UI_PREFABS.Button({
    Size = UDim2.new(0,150,0,50),
    Position = UDim2.new(0.5,0,0.8,0),
    Anchor = UDim2.new(0.5,0,0.5,0),
    CornerRounding = UDim2.new(0,25,0,25),
    StrokeWidth = 5,
    StrokeColor = {1,1,0},
    BackgroundColor = {1,0.8,0}
})

Button.MouseEnter:Connect(function()
    Button.BackgroundColor = {0.8,0.64,0}
    Button.StrokeColor = {0.8,0.8,0}
end)
Button.MouseLeave:Connect(function()
    Button.BackgroundColor = {1,0.8,0}
    Button.StrokeColor = {1,1,0}
end)

ClickerUI:AppendChild("Title",Title)
ClickerUI:AppendChild("Score",ScoreCounter)
ClickerUI:AppendChild("Button",Button)

return ClickerUI