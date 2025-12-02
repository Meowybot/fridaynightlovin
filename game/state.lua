local state = {}
local fstate = {}
local astate = {}

state.apath = "assets.states."
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
    state.emptylove()
    fstate[state.current] = nil
    astate[state.current] = nil
    package.loaded[state.path .. state.current] = false
    package.loaded[state.apath .. state.current] = false
    
    state.astate[towhat] = {}
    require(state.apath .. towhat)
    state.fstate[towhat] = {}
    require(state.path .. towhat)
    state.current = towhat
end

--[[
    COMING SOON
--]]

return state, fstate, astate