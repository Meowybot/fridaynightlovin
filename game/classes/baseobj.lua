local baseobj = Object:extend()

function baseobj:new(x,y,w,h)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
end

return baseobj