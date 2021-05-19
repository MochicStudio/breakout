-- Input Service

local state = require('state')

-- Input table
local input = {}
-- Specific user inputs to game actions
local pressFunctions = {}
local releaseFunctions = {}

-- Look and execute corresponding action to specific key presses
input.press = function(pressedKey)
	if pressFunctions[pressedKey] then
		pressFunctions[pressedKey]()
	end
end

-- Look and execute corresponding action to specific key releases
input.release = function(releasedKey)
	if releaseFunctions[releasedKey] then
		releaseFunctions[releasedKey]()
	end
end

-- Window focusing/unfocusing
input.toggleFocus = function(focused)
	if not focused then
		state.paused = true
	end
end

-- Functions itselfs
-- Press Functions
pressFunctions.left = function()
	state.buttonLeft = true
end

pressFunctions.right = function()
	state.buttonRight = true
end

pressFunctions.escape = function()
	love.event.quit()
end

pressFunctions.space = function()
	state.paused = not state.paused
end

-- Release Functions
releaseFunctions.left = function()
	state.buttonLeft = false
end

releaseFunctions.right = function()
	state.buttonRight = false
end

return input
