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

anykey.current = "idle"

function love.update(dt)
  anykey.anims[anykey.current]:update(dt)
end

function love.draw()
  anykey.anims[anykey.current]:draw(anykey.img, anykey.x, anykey.y)
end