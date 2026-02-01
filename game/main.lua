function love.load() -- only called once in the whole game
    --after this line, load external assets folder
    love.filesystem.mount(love.filesystem.getSourceBaseDirectory() .. "/assets", "assets", true) --thank you love forums
    --before this line, load external assets folder
    anim8 = require("anim8") -- load anim8 library
    state = require("state") -- load state switcher
    state.switch("splash")
end

--[[
    This is what loads the actual game, it wil load the external assets/ folder outside of game.love.
    This is an fnf port for love2d, made specifically for modding.
    game version: 0.0.1 (unfinished)
    love2d version: 11.5
    license: Unlicense
    for more info about making mods, check the root and assets files.
--]]

function love.update(dt) -- called every frame, won't use on this file...
end

function love.draw() -- called every frame, won't use on this file...
end