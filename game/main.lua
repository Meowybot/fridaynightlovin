function love.load()
    local success = "Assets already embedded, no mounting required."
    --local success = love.filesystem.mount(love.filesystem.getSourceBaseDirectory(), "", true)
    print(success)
    print("loading libraries")
    purf = require("mlib.purf")
    objs = require("mlib.objs")
    state = require("mlib.state")
    print("libraries loaded")
    state.switch("splash")
end