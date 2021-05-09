-- Paddle Entity
local world = require('world')
local input = require('input')

return function(posX, posY)
	local paddle = {}
	paddle.width = 180
	paddle.height = 20
	paddle.body = love.physics.newBody(world, posX, posY, 'static')
	paddle.shape = love.physics.newRectangleShape(paddle.width, paddle.height)
	paddle.fixture = love.physics.newFixture(paddle.body, paddle.shape)
	paddle.fixture:setUserData(paddle)

	-- Entity handles it's own draw function
	paddle.draw = function(self)
		love.graphics.polygon('fill', paddle.body:getWorldPoints(paddle.shape:getPoints()))
	end

	paddle.update = function(self, dt)
		local STEP = 400 * dt -- Works like velocity
		local HALF = 2
		local paddleX, paddleY = paddle.body:getPosition()

		-- Don't move if both keys are been pressed
		if input.left and input.right then
			return
		end

		-- Move left or right
		-- We set the paddle boundaries with the paddle width
		if input.left and paddleX >= paddle.width / HALF then
			paddle.body:setPosition(paddleX - STEP, paddleY)
		elseif input.right and paddleX <= (love.graphics.getWidth() - (paddle.width / HALF)) then
			paddle.body:setPosition(paddleX + STEP, paddleY)
		end
	end

	return paddle
end
