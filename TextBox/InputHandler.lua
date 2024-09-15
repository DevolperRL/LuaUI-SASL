--[[
    (c) Raoul Origa 2024
    LuaUI ContextWindow Draw
    If you’d like to support me and my projects, I would greatly appreciate a donation: https://www.paypal.com/paypalme/kikkus
]]

local handler

function register_handler(hdl)
	if handler then
		return false
	else
		handler = hdl
		return true
	end	
end

function KeyHandler(char, vkey, shift, ctrl, alt, event)
	if handler then
		local release = handler(char, vkey, shift, ctrl, alt, event)
		if release then
			handler = false
		end
		return true
	end
	return false
end

registerGlobalKeyHandler(KeyHandler)
