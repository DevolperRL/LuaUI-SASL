--[[
    (c) Raoul Origa 2024
    LuaUI Button
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

local roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

function estimateTextWidth(text, fontSize)
    local charWidth = fontSize
    return #text * charWidth / 2
end

function estimateTextHeight(fontSize)
    local lineHeight = fontSize * 1.2 
    return lineHeight
end

local textWidth = estimateTextWidth(get(nameText), get(fontSize))
local textHeight = estimateTextHeight(get(fontSize))

local textX = get(buttonX)
local textY = get(buttonY)
local paddingX = 10 
local paddingY = 15 
local rectX = textX - textWidth / 2 - paddingX
local rectY = textY - textHeight / 2 - paddingY
local rectWidth = textWidth + 2 * paddingX
local rectHeight = textHeight + .5 * paddingY

function draw()
    drawRectangle(rectX, rectY, rectWidth, rectHeight, {0,0,1,1})
    drawText(roboto, textX, textY-20, get(nameText), get(fontSize), false, false, TEXT_ALIGN_CENTER, {1,1,1,1})
    drawAll(components)
end

components = {
    LunaInvisibleBox {
        position = {rectX, rectY, rectWidth, rectHeight},
        cl = function()
            get(click)
        end
    }
}
