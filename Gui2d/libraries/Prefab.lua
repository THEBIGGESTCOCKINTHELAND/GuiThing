local Prefab = require("Gui2d.libraries.Container"):extend()

function Prefab:new(propertyTable)
    Prefab.super.new(self)

    self.Size = self.Size or UDim2.new(0,100,0,100)
    self.Position = self.Position or UDim2.new(0,0,0,0)
    self.Anchor = self.Anchor or UDim2.new(0,0,0,0)
    self.BackgroundColor = self.BackgroundColor or Gui2d.Styling.MainColors.Color1
    self.StrokeColor = self.StrokeColor or Gui2d.Styling.MainColors.AccentColor
    self.StrokeWidth = self.StrokeWidth or Gui2d.Styling.Strokes.Outline
    self.CornerRounding = self.CornerRounding or Gui2d.Styling.Rounding.CornerRounding
    self.ClipsDescendants = self.ClipsDescendants or Gui2d.Styling.ClipsDescendants

    propertyTable = propertyTable or {}

    for att,val in pairs(propertyTable) do
        self[att] = val
    end
end

function Prefab:__tostring()
    return "Prefab"
end

function Prefab:AddToStack(viewportX,viewportY,viewportWidth,viewportHeight) --viewportX and viewportY are the actual drawing area
    local DrawPosX = (viewportWidth*self.Position.Scale.X) - (viewportWidth*self.Size.Scale.X*self.Anchor.Scale.X) - (self.Size.Offset.X*self.Anchor.Scale.X) + self.Position.Offset.X + viewportX
    local DrawPosY = (viewportHeight*self.Position.Scale.Y) - (viewportHeight*self.Size.Scale.Y*self.Anchor.Scale.Y) - (self.Size.Offset.Y*self.Anchor.Scale.Y) + self.Position.Offset.Y + viewportY

    local DrawSizeX = (viewportWidth*self.Size.Scale.X) + self.Size.Offset.X
    local DrawSizeY = (viewportHeight*self.Size.Scale.Y) + self.Size.Offset.Y

    for _,childName in pairs(self:GetChildren()) do
        self[childName]:AddToStack(DrawPosX,DrawPosY,DrawSizeX,DrawSizeY)
    end
    
    self["DrawingParameters"] = {
        Position = {
            X = DrawPosX,
            Y = DrawPosY
        },
        Size = {
            X = DrawSizeX,
            Y = DrawSizeY
        }
    }

    Gui2d:AddToDrawStack(self,self.LayoutOrder)
end

function Prefab:Draw()
    print("Prefab ("..self.Type..") has no associated draw method!")
    return nil
end


return Prefab