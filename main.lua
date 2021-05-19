local world = require('world')
local state = require('state')
local input = require('input')
local entities = require('entities')

love.draw = function()
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
	if state.gameOver or state.paused or state.stageCleared then
		return
	end

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
