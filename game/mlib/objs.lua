local objs = {}

local mt_anim = {}
mt_anim.__index = mt_anim
local mt_obj = {}
mt_obj.__index = mt_obj
local mt_char = setmetatable({}, mt_obj)
mt_char.__index = mt_char
local mt_prop = setmetatable({}, mt_obj)
mt_prop.__index = mt_prop

-- ANIM

-- OBJ

-- CHAR

-- PROP

return objs