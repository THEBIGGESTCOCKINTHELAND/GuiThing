local ActiveBoxes = Object:extend()

function ActiveBoxes:new(x,y,w,h,order)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.order = order
    self.hovered = false
    self.mouse1down = false

    --Signals
    self.MouseButton1Down = nil
    self.MouseButton1Up = nil
    self.MouseEnter = nil
    self.MouseLeave = nil

    self.Type = "ActiveBox"
end

function ActiveBoxes:IsMouseInside(mx,my)
    return mx >= self.x and mx <= self.x + self.w and my >= self.y and my <= self.y + self.h
end

function ActiveBoxes:Update(dt,mx,my)
    if ActiveBoxes:isMouseInside(mx,my) then

    else

    end
end

function ActiveBoxes:ConnectSignals(signalTable)
    for signalName,signal in pairs(signalTable) do
        self[signalName] = signal
    end
end

return ActiveBoxes