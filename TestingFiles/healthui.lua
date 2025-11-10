local healthUi = Gui2d:NewContainer("HealthUi") --ScreenGui

local BackgroundFrame = UI_PREFABS.Frame({
    Size = UDim2.new(0.5,0,0.5,0),
    Position = UDim2.new(0.5,0,0.5,0),
    Anchor = UDim2.new(0.5,0,0.5,0),
})

healthUi:AppendChild("Background",BackgroundFrame)

BackgroundFrame:AppendChild("2ndBackground",UI_PREFABS.Frame({
    Size = UDim2.new(0.9,0,0.9,0),
    Position = UDim2.new(0.5,0,0.5,0),
    Anchor = UDim2.new(0.5,0,0.5,0), 
}))

return healthUi