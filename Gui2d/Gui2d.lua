Object = require "Gui2d/libraries/Classic"
Config = require "Gui2d/libraries/Config"
UDim2 = require "Gui2d/libraries/UDim2"
Container = require "Gui2d/libraries/Container"
Prefab = require "Gui2d/libraries/Prefab"
Common = require "Gui2d/libraries/Common"
Signal = require "Gui2d/libraries/Signal"
ActiveBoxes = require "Gui2d/libraries/ActiveBoxes"

local Gui2d = {
    Guis = {},
    Drawstack = {},
    Styling = require("Gui2d/libraries/DefaultStyling"),
    CachedFonts = {},
    ActiveBoxes = {}
}

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

function Gui2d:SetFont(fontName,fontSize)
    if Gui2d.CachedFonts[fontName] then
        if Gui2d.CachedFonts[fontName][fontSize] then
            love.graphics.setFont(Gui2d.CachedFonts[fontName][fontSize])
        else
            if Config.DEBUG.ALLOWED_MESSAGES.FontMessages and Config.DEBUG.DEBUG_MESSAGES then
                print("Already indexed font. Indexing new font size: "..fontName.."-"..fontSize)
            end

            local newFont = love.graphics.newFont(Config.FONT_FOLDER.."/"..fontName..".ttf",fontSize)
            Gui2d.CachedFonts[fontName][fontSize] = newFont

            love.graphics.setFont(newFont)
        end
    else
        if Config.DEBUG.ALLOWED_MESSAGES.FontMessages and Config.DEBUG.DEBUG_MESSAGES then
            print("Indexing new font: "..fontName)
        end

        local newFont = love.graphics.newFont(Config.FONT_FOLDER.."/"..fontName..".ttf",fontSize)
        Gui2d.CachedFonts[fontName] = {}

        if Config.DEBUG.ALLOWED_MESSAGES.FontMessages and Config.DEBUG.DEBUG_MESSAGES then
            print("Indexing new font size: "..fontName.."-"..fontSize)
        end

        Gui2d.CachedFonts[fontName][fontSize] = newFont

        love.graphics.setFont(newFont)
    end
end

function Gui2d:AddToDrawStack(prefab,order)
    if Gui2d.Drawstack[order] then
        table.insert(Gui2d.Drawstack[order],prefab)
    else
        Gui2d.Drawstack[order] = {}
        table.insert(Gui2d.Drawstack[order],prefab)
    end
end

function Gui2d:DrawDrawstack()
    for order,prefabs in pairs(Gui2d.Drawstack) do
        for _,prefab in pairs(prefabs) do
            prefab:Draw()
        end
    end
end

function Gui2d:Draw()
    if not Config.DEBUG.DRAW_GUI then return end

    local wx,wy = love.graphics.getDimensions()

    Gui2d.Drawstack = {}

    for guiName,guiData in pairs(Gui2d.Guis) do
        for _,prefabName in pairs(guiData:GetChildren()) do
            guiData[prefabName]:AddToStack(0,0,wx,wy)
        end
    end

    Gui2d:DrawDrawstack()
end

function Gui2d:AddActiveBox(x,y,w,h,order)
    local newActiveBox = ActiveBoxes(x,y,w,h,order)
end

function Gui2d:Tick(dt)

end

return Gui2d