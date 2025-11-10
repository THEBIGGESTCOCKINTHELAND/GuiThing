local UDim2 = {}
UDim2.__index = UDim2

function UDim2.new(scalex,offsetx,scaley,offsety)
    local self = setmetatable({},UDim2)

    self.Scale = {
        X = scalex,
        Y = scaley
    }
    self.Offset = {
        X = offsetx,
        Y = offsety,
    }

    return self
end

UDim2.__tostring = function(self)
    return "("..self.Scale.X..","..self.Offset.X..","..self.Scale.Y..","..self.Offset.Y..")"
end

return UDim2