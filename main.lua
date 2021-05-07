local world = require('world')
local entities = require('entities')
local keyMap = require('keymap')
local paused = false

love.update = function(dt)
	if not paused then
		world:update(dt)
	end
end

love.draw = function()
	if paused then
		love.graphics.print('Paused', love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
	end

	for i, entity in ipairs(entities) do
		-- Shorthand for entity.draw(entity)
		if entity.draw then entity:draw() end
	end
end

love.focus = function(focus)
	-- Pause the game when window is not focused
	paused = not focus
end

love.keypressed = function(pressedKey)
	if keyMap[pressedKey] then
		local response = keyMap[pressedKey]()

		if response == 'pause' then
			paused = not paused
		end
	end
end
