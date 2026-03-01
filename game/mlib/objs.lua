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

function objs.newAnim(image, frames, fps)
  local anim = {}
  anim.fps = fps
  anim.f = {}
  for i, v in ipairs(frames) do
    anim.f[i] = love.graphics.newQuad(v.x, v.y, v.w, v.h, image)
  end
  return anim
end

-- OBJ

-- CHAR

-- PROP

return objs