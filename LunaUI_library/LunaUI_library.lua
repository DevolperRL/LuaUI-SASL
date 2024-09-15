--[[
    (c) Raoul Origa 2024
    LuaUI ContextWindow Draw
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

local windows = {}

function DrawContextWindow(name_, position_, noBackground_, visible_, myComponent)
    if myComponent == nil then
        myComponent = {}
    end
    local windowProps = {
        name = name_,
        position = position_,
        noBackground = noBackground_,
        visible = visible_,
        components = myComponent
    }

    local myWindow = contextWindow(windowProps)
    table.insert(windows, myWindow)
    return myWindow
end
