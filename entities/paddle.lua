-- Paddle Entity
local world = require('world')

return function(posX, posY)
	local paddle = {}
	paddle.body = love.physics.newBody(world, posX, posY, 'static')
	paddle.shape = love.physics.newRectangleShape(180, 20)
	paddle.fixture = love.physics.newFixture(paddle.body, paddle.shape)
	paddle.fixture:setUserData(paddle)

	-- Entity handles it's own draw function
	paddle.draw = function(self)
		love.graphics.polygon('fill', paddle.body:getWorldPoints(paddle.shape:getPoints()))
	end

	return paddle
end
