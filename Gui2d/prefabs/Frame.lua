local Frame = require("Gui2d.libraries.Prefab"):extend()

function Frame:new(propertyTable)
    Frame.super.new(self)

    self.Type = "Frame"
    self.BackgroundColor = Gui2d.Styling.MainColors.Color1
    self.StrokeColor = Gui2d.Styling.MainColors.AccentColor
    self.StrokeWidth = Gui2d.Styling.Strokes.Outline

    propertyTable = propertyTable or {}

    for att,val in pairs(propertyTable) do
        self[att] = val
    end
end

function Frame:Draw()
    love.graphics.setColor(self.BackgroundColor)

    love.graphics.rectangle("fill",self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y)

    if self.StrokeWidth and self.StrokeWidth>0 then
        love.graphics.setColor(self.StrokeColor)
        love.graphics.setLineWidth(self.StrokeWidth)

        love.graphics.rectangle("line",self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y)
    end
end

function Frame:__tostring()
    return "Frame"
end

return Frame