local TextButton = require("Gui2d/prefabs/Button"):extend()

function TextButton:new(propertyTable)
    self.Text = "TextButton"
    self.Font = Gui2d.Styling.Text.Font
    self.FontSize = Gui2d.Styling.Text.FontSize
    self.TextXAlign = Gui2d.Styling.Text.TextXAlign
    self.TextYAlign = Gui2d.Styling.Text.TextYAlign
    self.TextColor = Gui2d.Styling.Text.TextColor1

    TextButton.super.new(self,propertyTable)

    self.Type = "TextButton"
end

function TextButton:Draw()
    TextButton.super.Draw(self)

    Gui2d:SetFont(self.Font,self.FontSize)
    love.graphics.setColor(self.TextColor)

    Common.advancedPrintf(self.Text,self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y,self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y,self.TextXAlign,self.TextYAlign)
end

function TextButton:__tostring()
    return "TextButton"
end

return TextButton