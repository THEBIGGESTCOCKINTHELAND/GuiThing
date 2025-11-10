local Frame = require("Gui2d.libraries.Prefab"):extend()

function Frame:new(propertyTable)
    Frame.super.new(self,propertyTable)

    self.Type = "Frame"
end

function Frame:Draw()
    love.graphics.setColor(self.BackgroundColor)

    local RoundX = Common.clamp(self.CornerRounding.Scale.X*self.DrawingParameters.Size.X+self.CornerRounding.Offset.X,0,self.DrawingParameters.Size.X/2)
    local RoundY = Common.clamp(self.CornerRounding.Scale.Y*self.DrawingParameters.Size.Y+self.CornerRounding.Offset.Y,0,self.DrawingParameters.Size.Y/2)

    love.graphics.rectangle("fill",self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,RoundX,RoundY)

    if self.StrokeWidth and self.StrokeWidth>0 then
        love.graphics.setColor(self.StrokeColor)
        love.graphics.setLineWidth(self.StrokeWidth)

        love.graphics.rectangle("line",self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,RoundX,RoundY)
    end
end

function Frame:__tostring()
    return "Frame"
end

return Frame