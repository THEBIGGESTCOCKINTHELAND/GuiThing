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

local Button = UI_PREFABS.TextButton({
    Size = UDim2.new(0,150,0,50),
    Position = UDim2.new(0.5,0,0.8,0),
    Anchor = UDim2.new(0.5,0,0.5,0),
    CornerRounding = UDim2.new(0,25,0,25),
    StrokeWidth = 5,
    StrokeColor = {1,1,0},
    BackgroundColor = {1,0.8,0},
    Text = "Click Me!",
    TextColor = {1,1,1},
    Font = "OpenSansBold",
    FontSize = 20,
})

local Image = UI_PREFABS.ImageLabel({
    Size = UDim2.new(0.2,0,0.2,0),
    Position = UDim2.new(0.5,0,0.5,0),
    Anchor = UDim2.new(0.5,0,0.5,0),
    ImageYAlignment = "bottom",
})

local Button2 = UI_PREFABS.ImageButton({
    Position = UDim2.new(0.2,0,0.8,0),
    Anchor = UDim2.new(0.5,0,0.5,0)
})

Button.MouseEnter:Connect(function()
    Button.BackgroundColor = {0.8,0.64,0}
    Button.StrokeColor = {0.8,0.8,0}
end)
Button.MouseLeave:Connect(function()
    Button.BackgroundColor = {1,0.8,0}
    Button.StrokeColor = {1,1,0}
end)

Button2.MouseEnter:Connect(function()
    Button2.ImageColor = {0.9,0.9,0.9}
end)
Button2.MouseLeave:Connect(function()
    Button2.ImageColor = {1,1,1}
end)
Button2.MouseButton1Clicked:Connect(function()
    PPrint.pprint(Gui2d)
end)

ClickerUI.ChildAppended:Connect(function()
    print("I GOT A NEW CHILD")
end)

ClickerUI.ChildRemoved:Connect(function()
    print("MY BABY")
end)

ClickerUI:AppendChild("Title",Title)
ClickerUI:AppendChild("Score",ScoreCounter)
ClickerUI:AppendChild("Button",Button)
ClickerUI:AppendChild("Image",Image)
ClickerUI:AppendChild("Button2",Button2)

return ClickerUI