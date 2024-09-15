--[[
    (c) Raoul Origa 2024
    LuaUI Image
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

local roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

local currentImage = nil

if get(image) == "" then
    currentImage = nil
else
    if not findResourceFile(get(image)) then
        logError("Couldn't not find the image, make sure you wrote the right path or name!!!")
        return
    end

    currentImage = loadImage(get(image))
end

function draw()
    if not currentImage then
        drawRectangle(0, 0, size[1], size[2], {1,1,1,1})
        drawText(roboto, size[1]/2, size[2]/2-10, "No Image", 20, false, false, TEXT_ALIGN_CENTER, {0,0,0,1})
    else
        drawTexture(currentImage, 0, 0, size[1], size[2])
    end
end
