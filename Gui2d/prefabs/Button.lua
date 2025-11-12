local Button = require("Gui2d.libraries.Prefab"):extend()

function Button:new(propertyTable)
    self.Modal = Gui2d.Styling.ButtonBehavior.Modal

    Button.super.new(self,propertyTable)

    self.Type = "Button"
    self.ActiveBox = nil
    self.Signals = {
        MouseButton1Down = Signal(),
        MouseButton1Up = Signal(),
        MouseEnter = Signal(),
        MouseLeave = Signal(),
        MouseButton1Clicked = Signal()
    }
    
    for signalName,signal in pairs(self.Signals) do
        self[signalName] = signal
    end
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
        self.ActiveBox = Gui2d:AddActiveBox(self.Name,self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,self.LayoutOrder,self.Modal)
        self.ActiveBox:ConnectSignals(self.Signals)
    elseif Gui2d.RegenerateActiveBoxesThisCycle then
        self.ActiveBox.X = self.DrawingParameters.Position.X
        self.ActiveBox.Y = self.DrawingParameters.Position.Y
        self.ActiveBox.Width = self.DrawingParameters.Size.X
        self.ActiveBox.Height = self.DrawingParameters.Size.Y
    end
end

function Button:__tostring()
    return "Button"
end

return Button