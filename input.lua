-- Input Service

-- Table that contains function to be accessed from entities
local input = {}
-- Specific user inputs to game actions
local pressFunctions = {}
local releaseFunctions = {}

-- Moving the paddle
input.left = false
input.right = false
-- Pause the game
input.paused = false

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
		input.paused = true
	end
end

-- Functions itselfs
-- Press Functions
pressFunctions.left = function()
	input.left = true
end

pressFunctions.right = function()
	input.right = true
end

pressFunctions.escape = function()
	love.event.quit()
end

pressFunctions.space = function()
	input.paused = not input.paused
end

-- Release Functions
releaseFunctions.left = function()
	input.left = false
end

releaseFunctions.right = function()
	input.right = false
end

return input
