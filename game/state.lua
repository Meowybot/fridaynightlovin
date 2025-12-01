local state = {}
local fstate = {}
local astate = {}

state.apath = "assets."
state.path = "states."
state.current = "SplashScreen"

function state.emptylove()
    love.draw = function() end
    love.quit = function() end
    love.update = function() end
    love.keypressed = function() end
    love.keyreleased = function() end
    love.mousepressed = function() end
    love.mousereleased = function() end
end

function state.switch(towhat)
    --here
end

--[[
    COMING SOON
--]]

return state, fstate, astate