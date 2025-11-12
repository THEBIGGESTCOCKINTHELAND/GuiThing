--LIBRARIES
Gui2d = require "Gui2d/Gui2d"
PPrint = require "Gui2d/libraries/PPrint"

--CONSTANTS
UI_PREFABS = {
    Button = require "Gui2d/prefabs/Button",
    Frame = require "Gui2d/prefabs/Frame",
    TextLabel = require ("Gui2d/prefabs/TextLabel")
}

FPS_SMOOTHING = 0.99

--FUNCTIONS
local function hsvToRgb(h, s, v)
    local i = math.floor(h * 6)
    local f = h * 6 - i
    local p = v * (1 - s)
    local q = v * (1 - f * s)
    local t = v * (1 - (1 - f) * s)
    local mod = i % 6
    if mod == 0 then return v, t, p
    elseif mod == 1 then return q, v, p
    elseif mod == 2 then return p, v, t
    elseif mod == 3 then return p, q, v
    elseif mod == 4 then return t, p, v
    else return v, p, q end
end

-- 🎨 t ∈ [0, 1] → RGB color through the rainbow
function rainbowColor(t)
    local r, g, b = hsvToRgb(t % 1, 1, 1)
    return r, g, b
end

--DYNAMIC
local fps = 0
local fpsDisplay = 0

local HealthUi

--MAIN
function love.load()
    HealthUI = Gui2d:AddGui(require("TestingFiles/healthui"))
    ConfirmUI = Gui2d:AddGui(require("TestingFiles/confirmui"))
end

function love.update(dt)
    fps = 1 / dt                      -- instantaneous fps
    fpsDisplay = fpsDisplay * FPS_SMOOTHING + fps * (1 - FPS_SMOOTHING)
end

function love.draw()
    love.graphics.setColor(1,1,1) --make background white for testing
    --love.graphics.rectangle("fill",0,0,3000,3000)

    local t = math.sin(math.pi*((love.timer.getTime() * 0.1) % 1))  -- animate over time
    --local r, g, b = rainbowColor(t)

    --HealthUi.Background.StrokeColor = {b,r,g}
    --HealthUi.Background["2ndBackground"].BackgroundColor = {r,g,b}
    HealthUI.Background.Bar.Size = UDim2.new(t,0,1,0)
    HealthUI.Background.HealthAmount.Text = (tostring(math.ceil(t*1000)/10).."%")
    Gui2d:Draw()

    love.graphics.setColor(1,1,1)
    love.graphics.print("FPS: "..math.ceil(fpsDisplay))
end