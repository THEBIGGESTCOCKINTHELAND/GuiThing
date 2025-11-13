local Container = require("Gui2d.libraries.Classic"):extend()

function Container:new(name)
    self.Enabled = true
    self.Name = name or "Untitled"
    self.Children = {}
    self.ChildAppended = Signal()
    self.ChildRemoved = Signal()
    self.LineageChanged = Signal()
end

function Container:__tostring()
    return "Container"
end

function Container:AppendChild(childName,child)
    if not self.LayoutOrder then
        self.LayoutOrder = 0
        child.LayoutOrder = 1
    elseif not child.LayoutOrder then
        child.LayoutOrder = self.LayoutOrder+1
    end

    child.Name = childName
    self[childName] = child
    table.insert(self.Children,childName)

    self.ChildAppended:Fire()
    self.LineageChanged:Fire()
end

function Container:RemoveChild(childName)
    if self[childName] then
        self[childName] = nil
        table.remove(self.Children,Common.tableSearch(self.Children,childName))
        self.ChildRemoved:Fire()
        self.LineageChanged:Fire()
    else
        if Config.DEBUG.DEBUG_MESSAGES and Config.DEBUG.ALLOWED_MESSAGES.ChildMessages then
            print("There is no child ("..childName..") for parent ("..self.Name..")")
        end
    end
end

function Container:GetChildren()
    return self.Children
end

return Container