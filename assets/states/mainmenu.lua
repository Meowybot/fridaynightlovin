--main menu info, like buttons
--astate is info about states in assets, while fstate is the actual state that is loaded in game.love
--last comment is not true anymore

local mainmenu = {}

mainmenu.storybut = {
  img = "anykey.png",
  fps = 24,
  rows = 1,
  cols = 9,
  anims = {
    idle = {frames = "1-7"},
    pressed = {frames = "8-9"} --notfinal
  },
  x = 0,
  y = 0,
  GoToState = "splash" --for now
}

return mainmenu