local ModalTestUI = Gui2d:NewContainer("ModalTestUI") --ScreenGui

local Button1 = UI_PREFABS.Button({
    Size = UDim2.new(0.4,0,0.3,0),
    Position = UDim2.new(0,100,0,200),
    LayoutOrder = 3,
    Modal = false,
})

local Button2 = UI_PREFABS.Button({
    Size = UDim2.new(0.3,0,0.3,0),
    Position = UDim2.new(0.1,100,0,100),
    LayoutOrder = 4,
})

ModalTestUI:AppendChild("Button1",Button1)
ModalTestUI:AppendChild("Button2",Button2)

return ModalTestUI