local TextLabel = require("Gui2d.libraries.Prefab"):extend()

function TextLabel:new(propertyTable)
    self.Text = "TextLabel"
    self.Font = Gui2d.Styling.Text.Font
    self.FontSize = Gui2d.Styling.Text.FontSize
    self.TextXAlign = Gui2d.Styling.Text.TextXAlign
    self.TextYAlign = Gui2d.Styling.Text.TextYAlign
    self.TextColor = Gui2d.Styling.Text.TextColor1

    TextLabel.super.new(self,propertyTable)

    self.Type = "TextLabel"
end

function TextLabel:Draw()
    love.graphics.setColor(self.BackgroundColor)

    local RoundX = Common.clamp(self.CornerRounding.Scale.X*self.DrawingParameters.Size.X+self.CornerRounding.Offset.X,0,self.DrawingParameters.Size.X/2)
    local RoundY = Common.clamp(self.CornerRounding.Scale.Y*self.DrawingParameters.Size.Y+self.CornerRounding.Offset.Y,0,self.DrawingParameters.Size.Y/2)

    love.graphics.rectangle("fill",self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,RoundX,RoundY)

    if self.StrokeWidth and self.StrokeWidth>0 then
        love.graphics.setColor(self.StrokeColor)
        love.graphics.setLineWidth(self.StrokeWidth)

        love.graphics.rectangle("line",self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,RoundX,RoundY)
    end

    Gui2d:SetFont(self.Font,self.FontSize)
    love.graphics.setColor(self.TextColor)

    Common.advancedPrintf(self.Text,self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,self.TextXAlign,self.TextYAlign)
    --love.graphics.printf(self.Text,self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.TextXAlign)
end

function TextLabel:__tostring()
    return "TextLabel"
end

return TextLabel