--[[
    (c) Raoul Origa 2024
    LuaUI Select Box
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

local active = false

local textShow = ""

function draw()
    drawRectangle(0, 0, size[1], size[2], {0,0,1,1})
    drawText(roboto, 15, 6, textShow, 22, false, false, TEXT_ALIGN_CENTER, {1,1,1,1})
end

function onMouseDown()
    active = not active
    if not active then 
        textShow = "" 
    else
        textShow = "X"
    end
    get(status(active))

    return true
end
