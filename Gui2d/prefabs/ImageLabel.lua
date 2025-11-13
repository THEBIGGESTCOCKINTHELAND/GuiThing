local ImageLabel = require("Gui2d/prefabs/Frame"):extend()

function ImageLabel:new(propertyTable)
    self.ImageSource = "Gui2d/assets/images/NoImage.jpg"
    self.ImageName = "NoImage"
    self.Mode = Gui2d.Styling.Image.Mode --stretch, fit, pattern,
    self.ImageXAlignment = Gui2d.Styling.Image.ImageXAlignment
    self.ImageYAlignment = Gui2d.Styling.Image.ImageYAlignment
    self.FilterMode = "nearest"
    self.BackgroundColor = {0,0,0,0}
    self.StrokeWidth = 0
    self.ImageColor = {1,1,1,1}
    --self.KeepAspectRatio = true
    --self.Scale = 1

    ImageLabel.super.new(self,propertyTable)

    self.Type = "ImageLabel"
    self.Image = Gui2d:GetImage(self.ImageName,self.ImageSource)
end

function ImageLabel:Draw()
    ImageLabel.super.Draw(self)

    local ImageWidth,ImageHeight = self.Image:getWidth(),self.Image:getHeight()
    love.graphics.setDefaultFilter(self.FilterMode)
    love.graphics.setColor(self.ImageColor)

    local scaleX,scaleY = self.DrawingParameters.Size.X/ImageWidth,self.DrawingParameters.Size.Y/ImageHeight

    local DrawX,DrawY = self.DrawingParameters.Position.X,self.DrawingParameters.Position.Y
    local SizeX,SizeY = self.DrawingParameters.Size.X,self.DrawingParameters.Size.Y

    if self.Mode == "fit" then
        if scaleX<scaleY then --if the x axis is the limiting axis
            scaleY = scaleX

            if self.ImageYAlignment == "middle" or self.ImageYAlignment == "center" then
                DrawY = DrawY+(SizeY-ImageHeight*scaleY)/2
            elseif self.ImageYAlignment == "bottom" then
                DrawY = DrawY+(SizeY-ImageHeight*scaleY)
            end
        else --if the y axis is the limiting axis
            scaleX = scaleY

            if self.ImageXAlignment == "center" then
                DrawX = DrawX+(SizeX-ImageWidth*scaleX)/2
            elseif self.ImageXAlignment == "right" then
                DrawX = DrawX+(SizeX-ImageWidth*scaleX)
            end
        end

        love.graphics.draw(self.Image,DrawX,DrawY,0,scaleX,scaleY)
    elseif self.Mode == "stretch" then
        love.graphics.draw(self.Image,DrawX,DrawY,0,scaleX,scaleY)
    elseif self.Mode == "pattern" then

    else 
        print("Choose a drawing mode for image ("..self.Name..")")
    end
end

function ImageLabel:__tostring()
    return "ImageLabel"
end

return ImageLabel