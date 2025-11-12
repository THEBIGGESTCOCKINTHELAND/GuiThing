local ActiveBox = Object:extend() --Extend the object class for class inheritance

function ActiveBox:new(name,x,y,w,h,order,modal) --Setup the new active box
    self.X = x or 0
    self.Y = y or 0
    self.Width = w or 0
    self.Height = h or 0
    self.Order = order or 1
    self.Hovering = false
    self.Mouse1Down = false
    self.Enabled = true
    self.Name = name or "Unnamed"
    self.MouseNotLeftWhileM1Down = false
    self.Modal = modal --Defines whether the button should only be active when it is on top or just whenever the button is hovered over

    --Signals (the various outputs that can be interacted with)
    self.MouseButton1Down = nil
    self.MouseButton1Up = nil
    self.MouseEnter = nil
    self.MouseLeave = nil
    self.MouseButton1Clicked = nil

    self.Type = "ActiveBox"
end

function ActiveBox:IsMouseInside(mx,my) --Just checks whether the mouse is inside the active box or not
    return mx >= self.X and mx <= self.X + self.Width and my >= self.Y and my <= self.Y + self.Height
end

function ActiveBox:Update(dt,mx,my,m1down) --Updates the active box 
    if not self.Enabled then return end --Just don't even do all this if the button isn't Enabled

    local inside = self:IsMouseInside(mx,my) --Check if the mouse is inside of the activebox's zone or not

    if inside then
        if self.Modal and Gui2d.TopActiveBoxThisCycle>self.Order then --if the button is modal and the mouse is hovering inside its box but its just not the top one
            if self.Hovering==inside then --If the mouse was already hovering inside as the mouse moves over a button with higher priority it fires the event
                self.MouseLeave:Fire()
                if self.Mouse1Down then --If the mouse button was down when the mouse leaves then fire the button 1 up event
                    self.MouseButton1Up:Fire()
                    self.MouseNotLeftWhileM1Down = false
                end
            end
            self.Hovering = false
        else
            if self.Modal and Gui2d.TopActiveBoxThisCycle<self.Order then --if the button is modal and the mouse is hovering inside the top box
                Gui2d.TopActiveBoxThisCycle = self.Order --Set the top order to this active box
            end
            if self.Hovering~=inside then --If the mouse wasn't previously hovering inside it fires the event and sets hovering to true
                self.MouseEnter:Fire()
                if m1down then --If the mouse button is down when the mouse enters the button then it fires the mouse button 1 down event
                    self.MouseButton1Down:Fire()
                end
            end
            if self.Mouse1Down~=m1down and m1down then 
                self.MouseButton1Down:Fire()
                self.MouseNotLeftWhileM1Down = true
            elseif self.Mouse1Down~=m1down and not m1down then
                self.MouseButton1Up:Fire()
                if self.MouseNotLeftWhileM1Down then
                    self.MouseButton1Clicked:Fire()
                end
            end
            self.Hovering = true
        end        
    else
        if self.Hovering~=inside then --If the mouse isn't even inside of the button but it was previously fire this one
            self.MouseLeave:Fire()
            if self.Mouse1Down then --If the mouse button was down when the mouse leaves then fire the button 1 up event
                self.MouseButton1Up:Fire()
            end
        end
        self.MouseNotLeftWhileM1Down = false
        self.Hovering = false
    end
    self.Mouse1Down = m1down
end

function ActiveBox:ConnectSignals(signalTable) --Connects the signals of the prefab to the activebox
    for signalName,signal in pairs(signalTable) do
        self[signalName] = signal
    end
end

function ActiveBox:Draw() --Just draws the active box pretty simple
    if self.Hovering then
        love.graphics.setColor(0,1,0,0.5)
    else
        love.graphics.setColor(1,0,0,0.5)
    end
    

    love.graphics.rectangle("fill",self.X,self.Y,self.Width,self.Height)
end

return ActiveBox