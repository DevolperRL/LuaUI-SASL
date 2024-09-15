--[[
    (c) Raoul Origa 2024
    LuaUI Text
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

currentFont = ""

if string.lower(get(font)) == "default" then
    currentFont = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")
else
    if not findResourceFile(get(font)) then
        logError("Couldn't not find the font, make sure you wrote the right path or name!!!")
        return
    end

    currentFont = loadFont(get(font))
end

function draw()
    drawText(currentFont, 0, 0, get(text), get(fontSize), false, false, TEXT_ALIGN_CENTER, get(color))
end
