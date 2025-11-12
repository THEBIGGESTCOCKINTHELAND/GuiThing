local confirmui = Gui2d:NewContainer("ConfirmUI") --ScreenGui

local BackgroundFrame = UI_PREFABS.Frame({
    Size = UDim2.new(0.4,0,0.3,0),
    Position = UDim2.new(0.5,0,0.5,0),
    Anchor = UDim2.new(0.5,0,0.5,0),
    BackgroundColor = {1,1,1,0.7},
    StrokeWidth = 3,
    StrokeColor = {1,1,1}
})

local ConfirmTitle = UI_PREFABS.TextLabel({
    Text = "Confirm",
    Font = "OpenSansBold",
    FontSize = 16,
    Size = UDim2.new(0.5,0,0,30),
    Position = UDim2.new(0.5,0,0,0),
    Anchor = UDim2.new(0.5,0,1,0),
    BackgroundColor = {1,1,1,0.7},
    StrokeWidth = 3,
    StrokeColor = {1,1,1},
    TextColor = {1,1,1},
})

local ConfirmText = UI_PREFABS.TextLabel({
    Text = "Hello I would like for you to confirm this following settings change. Also I'm typing a lot to test out text wrapping K thx bye",
    Font = "OpenSans",
    FontSize = 16,
    TextXAlign = "center",
    TextYAlign = "top",
    BackgroundColor = {0,0,0,0},
    StrokeWidth = 0,
    Size = UDim2.new(0.95,0,0.7,0),
    Position = UDim2.new(0.025,0,0.025,0),
    TextColor = {1,1,1}
})

local AcceptButton = UI_PREFABS.Button({
    BackgroundColor = {0,0.8,0},
    Size = UDim2.new(0.4,0,0.25,0),
    Position = UDim2.new(0.05,0,0.7,0)
})

local RejectButton = UI_PREFABS.Button({
    BackgroundColor = {0.8,0,0},
    Size = UDim2.new(0.4,0,0.25,0),
    Position = UDim2.new(0.55,0,0.7,0)
})

confirmui:AppendChild("Background",BackgroundFrame)
BackgroundFrame:AppendChild("Title",ConfirmTitle)
BackgroundFrame:AppendChild("Body",ConfirmText)
BackgroundFrame:AppendChild("AcceptButton",AcceptButton)
BackgroundFrame:AppendChild("RejectButton",RejectButton)

return confirmui