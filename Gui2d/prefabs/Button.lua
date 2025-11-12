local Button = require("Gui2d.libraries.Prefab"):extend()

function Button:new(propertyTable)
    self.MouseButton1Down = Signal()
    self.MouseButton1Up = Signal()
    self.MouseEnter = Signal()
    self.MouseLeave = Signal()

    Button.super.new(self,propertyTable)

    self.Type = "Button"
    self.ActiveBox = nil
end

function Button:Draw()
    love.graphics.setColor(self.BackgroundColor)

    local RoundX = Common.clamp(self.CornerRounding.Scale.X*self.DrawingParameters.Size.X+self.CornerRounding.Offset.X,0,self.DrawingParameters.Size.X/2)
    local RoundY = Common.clamp(self.CornerRounding.Scale.Y*self.DrawingParameters.Size.Y+self.CornerRounding.Offset.Y,0,self.DrawingParameters.Size.Y/2)

    love.graphics.rectangle("fill",self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,RoundX,RoundY)

    if self.StrokeWidth and self.StrokeWidth>0 then
        love.graphics.setColor(self.StrokeColor)
        love.graphics.setLineWidth(self.StrokeWidth)

        love.graphics.rectangle("line",self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,RoundX,RoundY)
    end

    if not self.ActiveBox then
        self.ActiveBox = Gui2d:AddActiveBox(self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,self.LayoutOrder)
        self.ActiveBox:ConnectSignals({
            ["MouseButton1Down"] = self.MouseButton1Down,
            ["MouseButton1Up"] = self.MouseButton1Up,
            ["MouseEnter"] = self.MouseEnter,
            ["MouseLeave"] = self.MouseLeave
        })
    end
end

function Button:__tostring()
    return "Button"
end

return Button