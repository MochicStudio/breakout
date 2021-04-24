local world = require('world')
local ball = require('entities/ball')
local paddle = require('entities/paddle')

love.update = function(dt)
	world:update(dt)
end

love.draw = function()
	local ballWX, ballWY = ball.body:getWorldCenter()
	love.graphics.circle('fill', ballWX, ballWY, ball.shape:getRadius())
	love.graphics.polygon('fill', paddle.body:getWorldPoints(paddle.shape:getPoints()))
end
