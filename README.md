# LuaUI-SASL
LuaUI for SASL
This library makes easier to draw buttons and so on.

## Make sure you put the scripts inside the folders in ***"..\Custom Module\"***

How to use:
LunaButton:
```
LunaButton {
        --LunaInvisibleBox.lua IS REQUIRED!

        --              Size of your window
        --                  ↓        ↓
        position = {0, 0, size[1], size[2]},
        nameText = "Luna Button", --Change for text inside box
        fontSize = 20, --Change for font Size
        buttonX = 200, --CHANGE THIS FOR CHANGE POS X
        buttonY = 140, --CHANGE THIS FOR CHANGE POS Y
        click = function()
            print("Clicked") --Print when you click
        end
    }
```

LunaSlider:
```
LunaSlider {
        --            X      Y   Lenght
        --CHANGE ONLY ↓      ↓     ↓
        position = { 100,   300,  200, 30},
        minnum = 0, --The point it should start
        maxnum = 100, -- The point it should end
        valueNum = 0, --Set this has you want, this is where you set the slider value (this will be set only 1 time that means when the gui loaded)
        numtype = "int", --put int or float or exp (what ever you need)
        drag = function(value)
            print(value) --Print the current value where the slider is
        end
    }
```

LunaTextBox:
```
LunaTextBox {
        --LunaInvisibleBox.lua and InputHandler.lua IS REQUIRED!

        --               Size of your window
        --                    ↓        ↓
        position = {0,  0 , size[1], size[2]},
        previewText = "Luna Text Field!", --Change for text inside box
        fontSize = 20, --Change for font Size
        buttonX = 200, --CHANGE THIS FOR CHANGE POS X
        buttonY = 100, --CHANGE THIS FOR CHANGE POS Y
        textDone = function(text)
            print(text)
        end
    }
```

LunaSelectBox:
```
LunaSelectBox {
        --            X      Y
        --CHANGE ONLY ↓      ↓
        position = { 100,   200, 30, 30},
        status = function(active)
            print(active)
        end
    }
```

LunaRadioButton:
```
LunaRadioButton {
        --LunaInvisibleBox.lua IS REQUIRED!

        --            X      Y    Size of your window
        --CHANGE ONLY ↓      ↓      ↓        ↓
        position = { 30,   350, size[1], size[2]},
        countButtons = 4, --How many buttons to draw
        texts = {
            "Button 1",
            "Button 2",
            "Button 3",
            "Button 4",
        },
        selected = function(selectBtn)
            print(selectBtn)
        end
    }
```

LunaDropdown:
```
LunaDropdown {
        --LunaInvisibleBox.lua IS REQUIRED!

        --              Size of your window
        --                  ↓        ↓
        position = {0, 0, size[1], size[2]},
        buttonX = 450, --CHANGE THIS FOR CHANGE POS X
        buttonY = 300, --CHANGE THIS FOR CHANGE POS Y
        selectTxt = 1, --The showing text when you load the dropdown
        allTexts = { --The text in the boxes
            "Select 1",
            "Select 2",
            "Select 3",
            "Select 4",
        },
        selected = function(selectBox)
            print(selectBox)
        end
    }
```

LunaText:
```
LunaText {
        --           X    Y Change this for the position!
        --           ↓    ↓
        position = {400, 200, 1, 1},
        fontSize = 20,
        text = "Luna Text",
        color = {1,1,1,1}, --Sasl should use RGBA colors
        font = "default" --Put here the path to your font, if you dont have fonts just let it default
    }
```

LunaImage:
```
LunaImage {
        position = {300, 400, 100, 100},
        image = "" --Path to image
    }
```

LuneToolTip:
```
LunaTooltip {
        --LunaInvisibleBox.lua and LunaButton.lua IS REQUIRED!
        position = {0, 0, size[1], size[2]},
        fontSize = 20,
        boxPos = { -- Put the X and Y cordination where the tooltip should show
            [1] = {
                nameText = "This is \nLuna tooltip",
                boxY = "top", --Put top or bottom
                boxX = "left", --Put left, center, right
                toolTipPos = {450, 100}, -- The tooltip position
                buttonPos = {0, 0}, -- The confirm button position
                buttonText = "Ok!"
            },
        },
        visible = true --Put visible to show or not the textbox
    }
```

LunaDropdownMenu:
```
LunaDropdownMenu {
        position = {0, 0, size[1], size[2]},
        sizeBox = {size[1], 25}, --Put on the first always the X of your window
        menus = {
            [1] = {
                name = "2824t8",
                fontSize = 20,
                sizeY = 20,
                men = false,
                dropdown = {
                    [1] = {
                        nameBox = "Hi",
                        click = function()
                            print("Clicked")
                        end
                    },
                    [2] = {
                        nameBox = "Hello",
                        click = function()
                            print("Clicked")
                        end
                    }
                }
            },
            [2] = {
                name = "Save",
                fontSize = 20,
                sizeY = 20,
                men = false,
                dropdown = {
                    [1] = {
                        nameBox = "Save As",
                        click = function()
                            print("Clicked")
                        end
                    }
                }
            },
        }
    }
```

(c) Raoul Origa 2024
