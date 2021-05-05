local world = require('world')
local ball = require('entities/ball')
local paddle = require('entities/paddle')
local boundaryTop = require('entities/boundary-top')
local boundaryRight = require('entities/boundary-right')
local boundaryBottom = require('entities/boundary-bottom')
local boundaryLeft = require('entities/boundary-left')
local keyMap = require('keymap')

love.update = function(dt)
	world:update(dt)
end

love.draw = function()
	local ballWX, ballWY = ball.body:getWorldCenter()

	love.graphics.polygon('line', boundaryTop.body:getWorldPoints(boundaryTop.shape:getPoints()))
	love.graphics.polygon('line', boundaryRight.body:getWorldPoints(boundaryRight.shape:getPoints()))
	love.graphics.polygon('line', boundaryBottom.body:getWorldPoints(boundaryBottom.shape:getPoints()))
	love.graphics.polygon('line', boundaryLeft.body:getWorldPoints(boundaryLeft.shape:getPoints()))
	love.graphics.circle('fill', ballWX, ballWY, ball.shape:getRadius())
	love.graphics.polygon('fill', paddle.body:getWorldPoints(paddle.shape:getPoints()))
end

love.keypressed = function(pressedKey)
	if keyMap[pressedKey] then
		keyMap[pressedKey]()
	end
end
