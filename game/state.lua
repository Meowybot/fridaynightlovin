local state = {}
astate = {} --assets state

state.apath = "assets.states."
state.path = "states."
state.current = "SplashScreen"
state.vars = {}

function state.emptylove()
    print("emptying love2d callbacks") --printing to debug
    love.draw = function() end
    love.quit = function() end
    love.update = function() end
    love.keypressed = function() end
    love.keyreleased = function() end
    love.mousepressed = function() end
    love.mousereleased = function() end
    print("callbacks emptied successfully")
end

function state.switch(towhat, ...)
    print("switching to " .. towhat)
    state.vars = {...}
    state.emptylove()
    astate[state.current] = nil
    package.loaded[state.path .. state.current] = false
    package.loaded[state.apath .. state.current] = false
    
    astate[towhat] = require(state.apath .. towhat)
    require(state.path .. towhat)
    state.current = towhat

    print("successfully switched to" .. towhat)
end

function state.clear(clall, index)
    print("clearing state variables")
    if clall then
        state.vars = {}
    else
        state.vars[index] = nil
    end
    print("state variables cleared")
end

print("state file loaded")

return state