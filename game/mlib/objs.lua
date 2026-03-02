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

function objs.newAnim(image, frames, fps, offsets)
  local anim = {}
  anim.fps = fps
  anim.timer = 0
  anim.change = 1/fps
  anim.current = 1
  anim.offsets = {
    x = offsets.x or 0,
    y = offsets.y or 0,
    r = offsets.r or 0,
    sx = offsets.sx or 0,
    sy = offsets.sy or 0
  }
  anim.f = {}
  for i, v in ipairs(frames) do
    anim.f[i] = love.graphics.newQuad(v.x, v.y, v.w, v.h, image)
  end
  return setmetatable(anim, mt_anim)
end

function mt_anim:update(dt)
  self.timer = self.timer + dt
  while self.timer >= self.change do
    self.timer = self.timer - self.change
    if self.current < #self.f then
      self.current = self.current + 1
    else
      self.current = 1
    end
  end
end

-- OBJ

function objs.newObj(image, anims, x, y, sx, sy)
  local newobj = {}
  newobj.img = image
  newobj.x = x
  newobj.y = y
  newobj.sx = sx
  newobj.sy = sy
  newobj.r = 0
  newobj.a = anims
  newobj.current = "idle"
  return setmetatable(newobj, mt_obj)
end

function mt_obj:update(dt)
  self.a[self.current]:update(dt)
end

function mt_obj:draw()
  local quad = self.a[self.current]
  love.graphics.draw(self.img, quad.f[quad.current], self.x+quad.offsets.x, self.y+quad.offsets.y, self.r+quad.offsets.r, self.sx+quad.offsets.sx, self.sy+quad.offsets.sy)
end

function mt_obj:changeAnimation(name)
  if self.a[name] then
    self.current = name
  end
end

-- CHAR

-- PROP

return objs