local world = require('world')
local state = require('state')
local input = require('input')
local funcEntities = require('entities')
local entities = funcEntities(state.level)

local BLUE = 5

love.draw = function()
	love.graphics.setBackgroundColor(state.palette[BLUE])

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
	local hasBricks = false

	if state.gameOver or state.paused then
		return
	end

	for i, entity in ipairs(entities) do
		if entity.type == 'brick' then hasBricks = true end

		if entity.update then entity:update(dt) end

		-- If the entity (brick) has no health
		-- remove it from the table and destroy
		-- its fixture
		if entity.health == 0 then
			table.remove(entities, i)
			entity.fixture:destroy()
		end
	end

	state.stageCleared = not hasBricks

	if state.stageCleared then
		-- Clear stage
		local index = 1
		while index <= #entities do
			local entity = entities[index]
			table.remove(entities, index)
			entity.fixture:destroy()
			index = index + 1
		end

		-- Start new level
		state.level = state.level + 1
		entities = funcEntities(state.level)
	end

	world:update(dt)
end
