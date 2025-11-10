--LIBRARIES
local Gui2d = require "Gui2d/Gui2d"


--CONSTANTS
UiPrefabs = {
    Button = "Gui2d/prefabs/Button",
    Frame = "Gui2d/prefabs/Frame"
}

--DYNAMIC

--MAIN
function love.load()
    Gui2d:AddGui(require("TestingFiles/healthui"))
end

function love.update(dt)

end

function love.draw()
    Gui2d:Draw()
end