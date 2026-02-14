local splashmenu = {}

splashmenu.gf = {
  char = "gfSplash",
  x = 640,
  y = 0,
  scale = 1
}

splashmenu.anykey = {
  img = "anykey.png",
  fps = 24,
  frameW = 1280,
  frameH = 80,
  scale = 1,
  anims = {
    idle = {frames = {1, "1-7"}},
    pressed = {frames = {1, "8-9"}}
  },
  x = 0,
  y = 630
}

return splashmenu