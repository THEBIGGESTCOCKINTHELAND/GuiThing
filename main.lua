--LIBRARIES
Gui2d = require "Gui2d/Gui2d"
PPrint = require "Gui2d/libraries/PPrint"

--CONSTANTS
UI_PREFABS = {
    Button = require "Gui2d/prefabs/Button",
    Frame = require "Gui2d/prefabs/Frame",
    TextLabel = require ("Gui2d/prefabs/TextLabel")
}

FPS_SMOOTHING = 0.999

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
local Score = 0

--MAIN
function love.load()
    --HealthUI = Gui2d:AddGui(require("TestingFiles/healthui"))
    --ConfirmUI = Gui2d:AddGui(require("TestingFiles/confirmui"))
    --ModalTestUI = Gui2d:AddGui(require("TestingFiles/modaltestui"))
    ClickerUI = Gui2d:AddGui(require("TestingFiles/clickerui"))
    ClickerUI.Button.MouseButton1Clicked:Connect(function()
        Score = Score + math.ceil(math.random()*100)
    end)
end

function love.update(dt)
    fps = 1 / dt                      -- instantaneous fps
    fpsDisplay = fpsDisplay * FPS_SMOOTHING + fps * (1 - FPS_SMOOTHING)

    Gui2d:Tick(dt)
end

function love.draw()
    ClickerUI.Score.Text = "Score: "..Score

    Gui2d:Draw()

    love.graphics.setColor(1,1,1)
    love.graphics.print("FPS: "..math.ceil(fpsDisplay))
end