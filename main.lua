local world = require('world')
local input = require('input')
local entities = require('entities')

love.draw = function()
	local HALF = 2

	if input.paused then
		love.graphics.print('Paused', love.graphics.getWidth() / HALF, love.graphics.getHeight() / HALF)
	end

	for i, entity in ipairs(entities) do
		-- Shorthand for entity.draw(entity)
		if entity.draw then entity:draw() end
	end
end

love.focus = function(focused)
	-- Pause the game when window is not focused
	input.toggleFocus(focused)
end

love.keypressed = function(pressedKey)
	input.press(pressedKey)
end

love.keyreleased = function(releasedKey)
	input.release(releasedKey)
end

love.update = function(dt)
	if not input.paused then
		for i, entity in ipairs(entities) do
			if entity.update then entity:update(dt) end

			-- If the entity (brick) has no health
			-- remove it from the table and destroy
			-- its fixture
			if entity.health == 0 then
				table.remove(entities, i)
				entity.fixture:destroy()
			end
		end

		world:update(dt)
	end
end
