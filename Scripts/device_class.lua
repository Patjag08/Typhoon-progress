dofile(LockOn_Options.script_path.."utils.lua")
Integer = {value = 0}
function Integer:Set(input)
    self.value = input
end
function Integer:Get()
    return self.value
end
function Integer:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

Boolean = Integer:new()
function Boolean:Invert()
    self.value = getOtherValue(self.value)
end

Device = {}
function Device:AddBool(name)
    self[name] = Boolean:new()
end
function Device:AddInt(name)
    self[name] = Integer:new()
end
function Device:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end