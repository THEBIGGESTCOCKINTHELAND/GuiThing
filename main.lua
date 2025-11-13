--LIBRARIES
Gui2d = require "Gui2d/Gui2d"
PPrint = require "Gui2d/libraries/PPrint"

--CONSTANTS
UI_PREFABS = {
    Button = require "Gui2d/prefabs/Button",
    Frame = require "Gui2d/prefabs/Frame",
    TextLabel = require "Gui2d/prefabs/TextLabel",
    TextButton = require "Gui2d/prefabs/TextButton",
    ImageLabel = require "Gui2d/prefabs/ImageLabel",
    ImageButton = require "Gui2d/prefabs/ImageButton"
}

FPS_SMOOTHING = 0.995

--FUNCTIONS

--DYNAMIC
local fps = 0
local fpsDisplay = 0
local Score = 0

--MAIN
function love.load()
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