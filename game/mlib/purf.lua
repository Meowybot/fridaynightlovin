local purf = {}

purf.loaded = {}

local function deletestartspace(str)
  return (str:gsub("^%s+", ""))
end

local function splitVariable(input)
    local name, value = input:match("(.-) (.*)")
    return {(name or input), (value or "")}
end

function purf.openFile(filename)
    local t = {}
    local currstate = nil
    local currsec = nil
    local substate = nil
    local subsec = nil
    local currfunc = 0
    for line in love.filesystem.lines(filename) do
        local str = deletestartspace(line)
        if string.sub(str, 1, 2) ~= "//" then
            if not currstate then
                if string.sub(str, 1, 1) == "#" then
                    currstate = true
                    currsec = string.sub(str, 2, -3)
                    if not t[currsec] then
                        t[currsec] = {
                            v = {}
                            l = {}
                            fc = {}
                        }
                    end
                end
            else
                if string.sub(str, 1, 1) == "*" then
                    substate = "list"
                    subsec = string.sub(str, 2, -3)
                    if not t[currsec].l[subsec] then
                        t[currsec].l[subsec] = {}
                    end
                elseif string.sub(str, 1, 1) == ">" then
                    substate = "func"
                    subsec = string.sub(str, 2, -3)
                    currfunc = currfunc + 1
                    if not t[currsec].fc[currfunc] then
                        t[currsec].fc[currfunc] = {func = subsec}
                    end
                elseif (string.sub(str, 1, 1) == ")") or (string.sub(str, 1, 1) == "]") then
                    substate = nil
                    subsec = nil
                else
                    local split = splitVariable(str)
                    if substate == "func" then
                        table.insert(t[currsec].fc[currfunc], str)
                    elseif substate == "list" then
                        t[currsec].l[subsec][split[1]] = split[2]
                    else
                        t[currsec].v[split[1]] = split[2]
                    end
                end
            end
        end
    end
    return t
end

return purf