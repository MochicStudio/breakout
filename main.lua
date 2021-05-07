local world = require('world')
local boundaryTop = require('entities/boundary-top')
local boundaryRight = require('entities/boundary-right')
local boundaryBottom = require('entities/boundary-bottom')
local boundaryLeft = require('entities/boundary-left')
local brick = require('entities/brick')
local ball = require('entities/ball')
local paddle = require('entities/paddle')
local keyMap = require('keymap')
local paused = false

local HALF = 2
local THREE_QUARTER = 0.75

local entities = {
	boundaryTop(love.graphics.getWidth() / HALF, -1),
	boundaryRight(love.graphics.getWidth() + 1, love.graphics.getHeight() / HALF),
	boundaryBottom(love.graphics.getWidth() / HALF, love.graphics.getHeight() + 1),
	boundaryLeft(-1, love.graphics.getHeight() / HALF),
	ball(600, 20),
	paddle(love.graphics.getWidth() / HALF, love.graphics.getHeight() * THREE_QUARTER),
	brick(50, 50),
	brick(101, 50),
	brick(152, 50)
}

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
		entity:draw()
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
