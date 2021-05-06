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

local bricks = {
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

	local ballWX, ballWY = ball.body:getWorldCenter()

	for i, brick in ipairs(bricks) do
		love.graphics.polygon('fill', brick.body:getWorldPoints(brick.shape:getPoints()))
	end

	love.graphics.circle('fill', ballWX, ballWY, ball.shape:getRadius())
	love.graphics.polygon('fill', paddle.body:getWorldPoints(paddle.shape:getPoints()))
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
