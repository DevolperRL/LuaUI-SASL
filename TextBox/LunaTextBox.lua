--[[
    (c) Raoul Origa 2024
    LuaUI Text Box
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

include("InputHandler.lua")

local roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

function estimateTextWidth(text, fontSize)
    local charWidth = fontSize
    return #text * charWidth / 2
end

function estimateTextHeight(fontSize)
    local lineHeight = fontSize * 1.2 
    return lineHeight
end

local preview = get(previewText)
local showingText = preview

local last_char = ""

local textWidth = estimateTextWidth(showingText, get(fontSize))
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
    drawRectangle(rectX, rectY, rectWidth, rectHeight, {0, 0, 1, 1})
    drawText(roboto, textX, textY-20, showingText, get(fontSize), false, false, TEXT_ALIGN_CENTER, {1, 1, 1, 1})
    drawAll(components)
end

function UpdateSize()
    textWidth = estimateTextWidth(showingText, get(fontSize))
    textHeight = estimateTextHeight(get(fontSize))
    textX = get(buttonX)
    textY = get(buttonY)
    paddingX = 10 
    paddingY = 15 
    rectX = textX - textWidth / 2 - paddingX
    rectY = textY - textHeight / 2 - paddingY
    rectWidth = textWidth + 2 * paddingX
    rectHeight = textHeight + .5 * paddingY    
end

function KeyHandler(char, vkey, shift, ctrl, alt, event)
	if event == KB_DOWN_EVENT then
		if char == SASL_KEY_ESCAPE then
			showingText = preview
            UpdateSize()
            return true
        end

        if char == SASL_KEY_RETURN  then
            get(textDone(showingText))
            return true
        end

        if vkey == SASL_VK_BACK then
            if #showingText > 0 then
                showingText = string.sub(showingText, 1, -2)
            end
        else
            last_char = string.char(char)
            showingText = showingText .. last_char
        end        
    end

    UpdateSize()
    return false
end

components = {
    LunaInvisibleBox {
        position = {rectX, rectY, rectWidth, rectHeight},
        cl = function()
            last_char = ""
            showingText = last_char
            register_handler(KeyHandler)
        end
    }
}
