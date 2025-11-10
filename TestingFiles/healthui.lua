local healthUi = Gui2d:NewContainer("HealthUi") --ScreenGui

local BackgroundFrame = UI_PREFABS.Frame({
    Size = UDim2.new(0.7,0,0,30),
    Position = UDim2.new(0.15,0,0.8,0),
    Anchor = UDim2.new(0,0,0,0),
    BackgroundColor = {0.6,0.6,0.6},
    StrokeColor = {0.3,0.3,0.3},
    LayoutOrder = 1,
})

local Bar = UI_PREFABS.Frame({
    Size = UDim2.new(1,0,1,0),
    BackgroundColor = {0.8,0,0},
    LayoutOrder = 2,
    StrokeWidth = 0,
})

local BarHighlight = UI_PREFABS.Frame({
    Size = UDim2.new(1,-2,0,10),
    Position = UDim2.new(0,1,0,1),
    BackgroundColor = {0.9,0,0},
    LayoutOrder = 3,
    StrokeWidth = 0,
})

local HealthAmount = UI_PREFABS.TextLabel({
    Text = "Health",
    Font = "OpenSansBold",
    FontSize = 16,
    Size = UDim2.new(1,0,1,0),
    Position = UDim2.new(0,0,0,0),
    Anchor = UDim2.new(0,0,0,0),
    LayoutOrder = 4,
    TextXAlign = "center",
    TextYAlign = "middle",
    StrokeWidth = 0,
    BackgroundColor = {0,0,0,0},
    TextColor = {1,1,1,1}
})

local HealthTitle = UI_PREFABS.TextLabel({
    Text = "Health",
    Font = "OpenSans",
    FontSize = 24,
    Size = UDim2.new(0.3,0,0,30),
    Position = UDim2.new(0.5,0,0,-30),
    Anchor = UDim2.new(0.5,0,0,0),
    LayoutOrder = 5,
    TextXAlign = "center",
    TextYAlign = "middle",
    StrokeWidth = 1,
    BackgroundColor = {0,0,0,0},
    TextColor = {0,0,0}
})

healthUi:AppendChild("Background",BackgroundFrame)
BackgroundFrame:AppendChild("Bar",Bar)
Bar:AppendChild("Highlight",BarHighlight)
BackgroundFrame:AppendChild("HealthAmount",HealthAmount)
BackgroundFrame:AppendChild("HealthTitle",HealthTitle)

--[[
BackgroundFrame:AppendChild("2ndBackground",UI_PREFABS.Frame({
    Size = UDim2.new(0.9,0,0.9,0),
    Position = UDim2.new(0.5,0,0.5,0),
    Anchor = UDim2.new(0.5,0,0.5,0), 
    LayoutOrder = 2
}))

BackgroundFrame:AppendChild("3rdBackground",UI_PREFABS.Frame({
    Size = UDim2.new(0.8,0,0.8,0),
    Position = UDim2.new(0.5,0,0.5,0),
    Anchor = UDim2.new(0.5,0,0.5,0), 
    BackgroundColor = {1,0,1,0.5},
    LayoutOrder = 3,
}))

BackgroundFrame:AppendChild("4thBackground",UI_PREFABS.Frame({
    Size = UDim2.new(0.7,0,0.7,0),
    Position = UDim2.new(0.5,0,0.5,0),
    Anchor = UDim2.new(0.5,0,0.5,0), 
    BackgroundColor = {1,1,0,0.5},
    LayoutOrder = 4,
}))]]

return healthUi