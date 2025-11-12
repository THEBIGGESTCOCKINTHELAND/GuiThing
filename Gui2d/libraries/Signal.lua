local Signal = Object:extend()

function Signal:new()
    self.callback = nil
end

function Signal:Fire(...)
    if self.callback then
        self.callback(...)
    else
        if Config.DEBUG.ALLOWED_MESSAGES.SignalMessages then
            print("There is no callback set to this signal.")
        end
    end
end

function Signal:Connect(func)
    self.callback = func
end

return Signal