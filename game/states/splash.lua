local a = astate["splash"]

local anykey = {
  img = love.graphics.newImage("assets/img/" .. a.anykey.img)
}

function love.draw()
  love.graphics.draw(anykey.img, 0, 0)
end