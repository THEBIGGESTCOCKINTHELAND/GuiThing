local Container = require("Gui2d.libraries.Classic"):extend()

function Container:new(name)
    self.Enabled = true
    self.Name = name or "Untitled"
    self.Children = {}
end

function Container:__tostring()
    return "Container"
end

function Container:AppendChild(childName,child)
    print("this is layout order for child")
    print(child.LayoutOrder)

    if not self.LayoutOrder then
        self.LayoutOrder = 0
        child.LayoutOrder = 1
    elseif not child.LayoutOrder then
        child.LayoutOrder = self.LayoutOrder+1
    end

    child.Name = childName
    self[childName] = child
    table.insert(self.Children,childName)
end

function Container:GetChildren()
    return self.Children
end

return Container