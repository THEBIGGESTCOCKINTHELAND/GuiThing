Object = require "Gui2d/libraries/Classic"
Config = require "Gui2d/libraries/Config"
UDim2 = require "Gui2d/libraries/UDim2"
Container = require "Gui2d/libraries/Container"
Prefab = require "Gui2d/libraries/Prefab"
Common = require "Gui2d/libraries/Common"
Signal = require "Gui2d/libraries/Signal"
ActiveBox = require "Gui2d/libraries/ActiveBox"

local Gui2d = {
    Guis = {},
    Drawstack = {},
    Styling = require("Gui2d/libraries/DefaultStyling"),
    CachedFonts = {},
    ActiveBoxes = {},
    RegenerateActiveBoxesThisCycle = false,
    TopActiveBoxThisCycle = -999999,
}

local ScreenX,ScreenY = love.graphics.getDimensions()

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

    if Config.DEBUG.DRAW_ACTIVE_BOXES then
        for order,boxes in pairs(Gui2d.ActiveBoxes) do
            for boxName,box in pairs(Gui2d.ActiveBoxes[order]) do
                box:Draw()
            end
        end
        
    end
end

function Gui2d:AddActiveBox(name,x,y,w,h,order,modal)
    local newActiveBox = ActiveBox(name,x,y,w,h,order,modal)
    
    if Gui2d.ActiveBoxes[order] then
        Gui2d.ActiveBoxes[order][name] = newActiveBox
    else
        Gui2d.ActiveBoxes[order] = {}
        Gui2d.ActiveBoxes[order][name] = newActiveBox
    end
    --Gui2d.ActiveBoxes[name] = newActiveBox

    return newActiveBox
end

function Gui2d:Tick(dt)
    Gui2d.TopActiveBoxThisCycle = -99999

    local mx,my = love.mouse.getPosition()
    local m1d = love.mouse.isDown(1)

    local keys = {}
    for k in pairs(Gui2d.ActiveBoxes) do
        table.insert(keys,k)
    end

    table.sort(keys)

    for i=#keys,1,-1 do
        local key = keys[i]
        for boxName,box in pairs(Gui2d.ActiveBoxes[key]) do
            box:Update(dt,mx,my,m1d)
            --print("UPDATING ACTIVE BOX OR PRIORITY: "..key)
        end
    end

    --check to see if the game window was resized and then tell all activeboxes to get resized
    local newScreenX,newScreenY = love.graphics.getDimensions()

    if ScreenX~=newScreenX or ScreenY~=newScreenY then
        ScreenX,ScreenY = love.graphics.getDimensions()
        --print("ok gang lets resize these activeboxes!")
        Gui2d.RegenerateActiveBoxesThisCycle = true
    elseif Gui2d.RegenerateActiveBoxesThisCycle then
        Gui2d.RegenerateActiveBoxesThisCycle = false
    end
end

return Gui2d