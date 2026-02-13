local a = astate["splash"]

local anykey = {
  img = love.graphics.newImage("assets/images/" .. a.anykey.img),
  x = a.anykey.x,
  y = a.anykey.y,
  frameW = a.anykey.frameW,
  frameH = a.anykey.frameH,
  fps = a.anykey.fps,
  scale = a.anykey.scale,
}

anykey.grid = 0
anykey.anims = 0
anykey.current = "idle"

function love.draw()
  love.graphics.draw(anykey.img, 0, 0)
end