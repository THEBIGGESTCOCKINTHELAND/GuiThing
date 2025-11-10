local Gui2d = {
    Guis = {},
    Drawstack = {},
    Styling = require("Gui2d/libraries/DefaultStyling")
}

UDim2 = require "Gui2d/libraries/UDim2"
Container = require "Gui2d/libraries/Container"
Prefab = require("Gui2d/libraries/Prefab")

function Gui2d:ApplyStyling(styleSheet)
    Gui2d.Styling = styleSheet
end

function Gui2d:NewContainer(name)
    local NewContainer = Container(name)

    return NewContainer
end

function Gui2d:AddGui(gui)
    Gui2d.Guis[gui.Name] = gui
    return Gui2d.Guis[gui.Name]
end

function Gui2d:AddToDrawStack(prefab,order)
    Gui2d.Drawstack[order] = prefab
end

function Gui2d:DrawDrawstack()
    for order,prefab in pairs(Gui2d.Drawstack) do
        prefab:Draw()
    end
end

function Gui2d:Draw()
    local wx,wy = love.graphics.getDimensions()

    Gui2d.Drawstack = {}

    for guiName,guiData in pairs(Gui2d.Guis) do
        for _,prefabName in pairs(guiData:GetChildren()) do
            guiData[prefabName]:AddToStack(0,0,wx,wy)
        end
    end

    Gui2d:DrawDrawstack()
end

return Gui2d