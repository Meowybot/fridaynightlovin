local a = astate["splash"]

local anykey = {
  img = love.graphics.newImage("assets/images/" .. a.anykey.img),
  x = a.anykey.x,
  y = a.anykey.y,
  frameW = a.anykey.frameW,
  frameH = a.anykey.frameH,
  fps = a.anykey.fps,
  scale = a.anykey.scale,
  animations = a.anykey.anims
}

anykey.grid = anim8.newGrid(anykey.frameW, anykey.frameH, anykey.img:getWidth(), anykey.img:getHeight())

anykey.anims = {}
for i, anim in pairs(anykey.animations) do
  anykey.anims[i] = anim8.newAnimation(anykey.grid(anim.frames[1], anim.frames[2]), 1/anykey.fps)
end

anykey.grid = 0
anykey.anims = 0
anykey.current = "idle"

function love.draw()
  love.graphics.draw(anykey.img, 0, 0)
end