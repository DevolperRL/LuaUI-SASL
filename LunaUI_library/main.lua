--THIS IS A EXAMPLE HOW TO DRAW A WINDOW WITH LUNAUI

--EXAMPLE 1:
include("LunaUI_library.lua")

local win = DrawContextWindow(
                "Test", --Name
                {50, 50, 600, 600}, --Position
                false, --No Background
                true, --Visible
                nil --Scripts
            )

------------------------------------------
--EXAMPLE 2:

include("LunaUI_library.lua")

local win = DrawContextWindow(
                "Test", --Name
                {50, 50, 600, 600}, --Position
                false, --No Background
                true, --Visible
                {
                  Script {
                          --          PosX  PosY  SizeX   SizeY
                          position = { 0   , 0  ,  600 ,   600}
                    }
                } --Scripts
            )
