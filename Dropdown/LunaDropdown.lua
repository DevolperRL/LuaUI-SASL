--[[
    (c) Raoul Origa 2024
    LuaUI Dropdown
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

local roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

local dropdownOpen = false

function estimateTextWidth(text, fontSize)
    local charWidth = fontSize
    return #text * charWidth / 2
end

function estimateTextHeight(fontSize)
    local lineHeight = fontSize * 1.2 
    return lineHeight
end

function CalculateWidth(passText)
    textWidth = estimateTextWidth(passText, 20)
    textHeight = estimateTextHeight(20)
    
    textX = get(buttonX)
    textY = get(buttonY)
    paddingX = 10 
    paddingY = 15 
    rectX = textX - textWidth / 2 - paddingX
    rectY = textY - textHeight / 2 - paddingY
    rectWidth = textWidth + 2 * paddingX
    rectHeight = textHeight + .5 * paddingY
end

local selectedText = get(allTexts)[get(selectTxt)]

CalculateWidth(selectedText)


components = {
    LunaInvisibleBox {
        position = {rectX+rectWidth+5, rectY, 34, 35},
        cl = function()
            dropdownOpen = not dropdownOpen
        end
    }
}

for i = 1, #get(allTexts) do
    local buttonIndex = i

    table.insert(components,
    LunaInvisibleBox {
        position = {rectX, rectY - (i * rectHeight * 1.3), rectWidth, 35},
        cl = function()
            selectedText = get(allTexts)[i]
            CalculateWidth(selectedText)
            dropdownOpen = false
            get(selected(i))
        end,
        visible = dropdownOpen
    })
end

function draw()
    drawRectangle(rectX, rectY, rectWidth, 35, {0, 0, 1, 1})
    drawRectangle(rectX + rectWidth+5, rectY, 35, 35, {0, 0, 1, 1})
    if dropdownOpen then
        for i = 2, #components do
            if components[i] then
                components[i].visible = true
            end
        end

        for i = 1, #get(allTexts) do
            CalculateWidth(get(allTexts)[i])
            drawRectangle(rectX, rectY - (i * rectHeight * 1.3), rectWidth, 35, {0, 0, 1, 1})
            drawText(roboto, textX, textY - (i * rectHeight * 1.3)-17, get(allTexts)[i], 20, false, false, TEXT_ALIGN_CENTER, {1,1,1,1})
        end
    else
        for i = 2, #components do
            if components[i] then
                components[i].visible = false
            end
        end
    end
    drawText(roboto, rectX + rectWidth+23, textY-18, "V", 20, false, false, TEXT_ALIGN_CENTER, {1,1,1,1})
    drawText(roboto, textX, textY-18, selectedText, 20, false, false, TEXT_ALIGN_CENTER, {1,1,1,1})
    drawAll(components)
end
