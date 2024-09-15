--[[
    (c) Raoul Origa 2024
    LuaUI Radio Button
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

local roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

local pos = {}

local totalButtons = get(countButtons)

local space = 35

components = {}

local currentClickedButton = totalButtons

for i = 1, totalButtons do
    table.insert(pos, i * space)

    local buttonIndex = i
    table.insert(components,     
    LunaInvisibleBox {
        position = {0, i * space-13, 25, 25},
        cl = function()
            currentClickedButton = buttonIndex
            get(selected(totalButtons - buttonIndex + 1))
        end
    })
end

function draw()
    for i = 1, totalButtons do
        drawCircle(0+10, pos[i], 13, true, {0, 0, 1,1})
        drawText(roboto, 70, pos[totalButtons-i+1]-7, tostring(get(texts)[i]), 20, false, false, TEXT_ALIGN_CENTER, {1, 1, 1, 1})
    end

    drawCircle(0+10, pos[currentClickedButton], 5, true, {1, 1, 1,1})
    if #components > 0 then
        drawAll(components)
    end
end
