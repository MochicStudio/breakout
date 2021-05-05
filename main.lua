local world = require('world')
local ball = require('entities/ball')
local paddle = require('entities/paddle')
local boundaryTop = require('entities/boundary-top')
local keyMap = require('keymap')

love.update = function(dt)
	world:update(dt)
end

love.draw = function()
	local ballWX, ballWY = ball.body:getWorldCenter()

	love.graphics.polygon('fill', boundaryTop.body:getWorldPoints(boundaryTop.shape:getPoints()))
	love.graphics.circle('fill', ballWX, ballWY, ball.shape:getRadius())
	love.graphics.polygon('fill', paddle.body:getWorldPoints(paddle.shape:getPoints()))
end

love.keypressed = function(pressedKey)
	if keyMap[pressedKey] then
		keyMap[pressedKey]()
	end
end
