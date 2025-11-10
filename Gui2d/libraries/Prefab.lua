local Object = require "Gui2d/libraries/Classic"
local Prefab = Object:extend()

local Prefab = {}
Prefab.__index = Prefab

function Prefab.new(prefabType)
    local self = setmetatable({},Prefab)

    self.size = {}
    self.type = prefabType

    return self
end

function Prefab.draw()
    warn("Prefab "..self.type.." has no associated draw method!")
    return nil
end

return Prefab