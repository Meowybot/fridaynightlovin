function love.load()
  local success = "Assets already embedded, no mounting required."
  --local success = love.filesystem.mount(love.filesystem.getSourceBaseDirectory(), "", true)
  print(success)
  state = require("lib.state") -- Doesn't work yet
  print("loading libraries")
  Object = require("lib.classic") -- Class library
  lovebpm = require("lib.lovebpm") -- BPM library
  print("libraries loaded")
  state.switch("splash")
end