local roboto = loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

--slocal dropdownOpen = false

local textX = 0
local textY = 0
local paddingX = 0
local paddingY = 0
local rectX = 0
local rectY = 0
local rectWidth = 0
local rectHeight = 0

local boxWidth = get(sizeBox)[1]
local boxHeight = get(sizeBox)[2]
local xOffset = 3
local yOffset = boxHeight

function estimateTextWidth(text, fontSize)
    local charWidth = fontSize * 0.6
    return #text * charWidth
end

function estimateTextHeight(fontSize)
    local lineHeight = fontSize * 1.2
    return lineHeight
end

components = {

}

function CalculateWidth(passText, fontSize)
    local textWidth = estimateTextWidth(passText, fontSize)
    local textHeight = estimateTextHeight(fontSize)
    
    local rectWidth = textWidth + 2 * paddingX
    local rectHeight = textHeight + paddingY
    
    return rectWidth, rectHeight
end

for a, b in ipairs(get(menus)) do
    local rectWidth, rectHeight = CalculateWidth(b.name, b.fontSize)

    table.insert(components, LunaInvisibleBox {
        position = {xOffset, size[2] - rectHeight - paddingY, rectWidth, rectHeight - 3},
        cl = function()
            local num = a
            for i, d in pairs(get(menus)) do
                if i ~= a then
                    d.men = false
                end
            end
            b.men = not b.men

            for _, component in ipairs(components) do
                if get(component.tagN) == "Btn" then
                    if get(component.parentMenu) == b then
                        component.visible = b.men
                    else
                        component.visible = false
                    end
                end
            end
        end,
        visible = true,
        tagN = "Main",
        parentMenu = b
    })
    xOffset = xOffset + rectWidth + 10
end

xOffset = 3

for a, b in ipairs(get(menus)) do
    local rectWidth, rectHeight = CalculateWidth(b.name, b.fontSize)
    local dropdownXOffset = xOffset+10
    local dropdownYOffset = size[2] - rectHeight - paddingY - 29

    for _, d in ipairs(b.dropdown) do
        local dropdownRectWidth, dropdownRectHeight = CalculateWidth(d.nameBox, b.fontSize)
        
        table.insert(components, LunaInvisibleBox {
            position = {dropdownXOffset, dropdownYOffset, dropdownRectWidth, dropdownRectHeight},
            cl = function()
                get(d.click)
            end,
            visible = b.men,
            tagN = "Btn",
            parentMenu = b
        })

        dropdownYOffset = dropdownYOffset - dropdownRectHeight - 5
    end
    xOffset = xOffset + rectWidth + 10
end

function draw()
    boxWidth = get(sizeBox)[1]
    boxHeight = get(sizeBox)[2]
    xOffset = 3
    yOffset = 25

    drawRectangle(0, size[2] - 25, boxWidth, 25, {45, 45, 45, .1})

    for i, b in ipairs(get(menus)) do
        local rectWidth, rectHeight = CalculateWidth(b.name, b.fontSize)
        drawRectangle(xOffset, size[2] - rectHeight - paddingY, rectWidth, rectHeight - 3, {0, 0, 1, 1})
        drawText(roboto, xOffset + paddingX + 2, size[2] - rectHeight / 2 - paddingY / 2 - 10, b.name, b.fontSize, false, false, TEXT_ALIGN_LEFT, {1, 1, 1, 1})

        if b.men then
            local dropdownXOffset = xOffset + 10
            local dropdownYOffset = size[2] - rectHeight - paddingY - yOffset - 5

            for _, d in ipairs(b.dropdown) do
                local dropdownRectWidth, dropdownRectHeight = CalculateWidth(d.nameBox, b.fontSize)
                drawRectangle(dropdownXOffset, dropdownYOffset, dropdownRectWidth, dropdownRectHeight, {0, 0, 0.8, 1})
                drawText(roboto, dropdownXOffset + paddingX, dropdownYOffset + dropdownRectHeight / 2 - paddingY / 2 - 7, d.nameBox, b.fontSize, false, false, TEXT_ALIGN_LEFT, {1, 1, 1, 1})
                dropdownYOffset = dropdownYOffset - dropdownRectHeight - 5
            end
        end
        xOffset = xOffset + rectWidth + 10
    end
    drawAll(components)
end
