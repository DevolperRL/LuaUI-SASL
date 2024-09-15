local roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

local smallBoxPosX = 0
local smallBoxPosY = 0

function estimateTextWidth(text, fontSize)
    local maxLineWidth = 0
    local lines = {}
    
    -- Split text into lines based on newline characters
    for line in text:gmatch("[^\n]*") do
        table.insert(lines, line)
        local lineWidth = #line * fontSize / 2
        if lineWidth > maxLineWidth then
            maxLineWidth = lineWidth
        end
    end

    return maxLineWidth
end

--[[function estimateTextWidth(text, fontSize)
    local charWidth = fontSize
    return #text * charWidth / 2
end]]

function estimateTextHeight(text, fontSize)
    local _, lineCount = string.gsub(text, "\n", "\n")
    local lineHeight = fontSize * 1.2
    return lineHeight * (lineCount + 1)
end

local showingTip = 1

local textWidth = estimateTextWidth(get(boxPos)[showingTip].nameText, get(fontSize))
local textHeight = estimateTextHeight(get(boxPos)[showingTip].nameText, get(fontSize))

local boxPosX = get(boxPos)[showingTip].toolTipPos[1]
local boxPosY = get(boxPos)[showingTip].toolTipPos[2]
local paddingX = 10 
local paddingY = 15 
local rectWidth = textWidth - 2 / paddingX
local rectHeight = textHeight - 2 / paddingY

local rectX = boxPosX - rectWidth / 2
local rectY = boxPosY - rectHeight / 2

function draw()
    textWidth = estimateTextWidth(get(boxPos)[showingTip].nameText, get(fontSize))
    textHeight = estimateTextHeight(get(boxPos)[showingTip].nameText, get(fontSize))
    
    boxPosX = get(boxPos)[showingTip].toolTipPos[1]
    boxPosY = get(boxPos)[showingTip].toolTipPos[2]
    paddingX = 10 
    paddingY = 15 
    rectWidth = textWidth - 2 / paddingX
    rectHeight = textHeight - 2 / paddingY

    rectX = boxPosX - rectWidth / 2
    rectY = boxPosY - rectHeight / 2

    drawRectangle(rectX, rectY+35, rectWidth, -rectHeight, {0,0,1,1})

    if string.lower(get(boxPos)[showingTip].boxY) == "top" then
        smallBoxPosY = rectHeight+rectY-14
    elseif string.lower(get(boxPos)[showingTip].boxY) == "bottom" then
        smallBoxPosY = -rectHeight + rectY+20
    end
    
    if string.lower(get(boxPos)[showingTip].boxX) == "left" then
        smallBoxPosX = rectX
    elseif string.lower(get(boxPos)[showingTip].boxX) == "center" then
        smallBoxPosX = rectX + rectWidth / 2 -10
    elseif string.lower(get(boxPos)[showingTip].boxX) == "right" then
        smallBoxPosX = rectX + rectWidth - 10
    end

    drawRectangle(smallBoxPosX, smallBoxPosY, 10, 15, {0,0,1,1})
    drawText(roboto, boxPosX, boxPosY - textHeight / 2 + paddingY, get(boxPos)[showingTip].nameText, get(fontSize), false, false, TEXT_ALIGN_CENTER, {1,1,1,1})

    drawAll(components)
end

components = {
    LunaButton {
        position = {get(boxPos)[showingTip].buttonPos[1], get(boxPos)[showingTip].buttonPos[2], size[1], size[2]},
        nameText = get(boxPos)[showingTip].buttonText,
        fontSize = 20,
        buttonX = rectX + rectWidth / 2,
        buttonY = -rectHeight+rectY+30,
        click = function()
            if get(boxPos)[showingTip+1] then
                showingTip = showingTip + 1
            else
                visible = false
            end
        end
    },
}
