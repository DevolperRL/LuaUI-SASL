--[[
    (c) Raoul Origa 2024
    LuaUI Slider
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

local sliderPos = -5

local sliderMinPos = -5
local sliderMaxPos = 194

local minValue = get(minnum)
local maxValue = get(maxnum)

local value = get(valueNum)
sliderPos = ((value - minValue) / (maxValue - minValue)) * (sliderMaxPos - sliderMinPos) + sliderMinPos

roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

function draw()
    drawRectangle(-10, 0, size[1]+33, size[2], {0,0,1,1})
    drawRectangle(sliderPos, 2.5, 25, 25, {0,1,1,1})
    drawText(roboto, 105, 7, "Value: " .. value, 20, false, false, TEXT_ALIGN_CENTER, {1,1,1,1})
end

function onMouseDown()
    return true
end

function onMouseHold(component, x, y, button, parentX, parentY)
    if button == MB_LEFT then
        sliderPos = x-5

        if string.lower(get(numtype)) == "int" then
            value = math.floor(((sliderPos - sliderMinPos) / (sliderMaxPos - sliderMinPos)) * (maxValue - minValue) + minValue)
        elseif string.lower(get(numtype)) == "float" then
            value = (math.floor((((sliderPos - sliderMinPos) / (sliderMaxPos - sliderMinPos)) * (maxValue - minValue) + minValue) * 10)) / 10
        elseif string.lower(get(numtype)) == "exp" then
            local linearFraction = (sliderPos - sliderMinPos) / (sliderMaxPos - sliderMinPos)
            if minValue > 0 and maxValue > 0 then
                value = (math.floor(minValue * ((maxValue / minValue) ^ linearFraction) * 10)) / 10
            else
                print("minValue and maxValue must be greater than 0 for exponential slider")
            end
        end
        get(drag(value))
    end
    return true
end
