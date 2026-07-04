function love.load()
  local success = "Assets already embedded, no mounting required."
  --local success = love.filesystem.mount(love.filesystem.getSourceBaseDirectory(), "", true)
  print(success)
  state = require("lib.state")
  print("loading libraries")
  print("libraries loaded")
  state.switch("splash")
end