-- Paddle Entity
local world = require('world')
local input = require('input')

return function(posX, posY)
	local HALF = 2
	local windowWidth = love.window.getMode()

	local paddle = {}

	paddle.width = 180
	paddle.height = 20
	paddle.speed = 600
	paddle.leftBoundary = paddle.width / HALF
	paddle.rightBoundary = windowWidth - (paddle.width / HALF)

	paddle.body = love.physics.newBody(world, posX, posY, 'kinematic')
	paddle.shape = love.physics.newRectangleShape(paddle.width, paddle.height)
	paddle.fixture = love.physics.newFixture(paddle.body, paddle.shape)
	paddle.fixture:setUserData(paddle)

	-- Entity handles it's own draw function
	paddle.draw = function(self)
		love.graphics.polygon('fill', paddle.body:getWorldPoints(paddle.shape:getPoints()))
	end

	paddle.update = function(self)
		-- Don't move if both keys are been pressed
		if input.left and input.right then
			return
		end

		-- Move left or right
		-- We set the paddle boundaries with the paddle width

		local selfX = self.body:getX()

		if input.left and selfX >= self.leftBoundary then
			self.body:setLinearVelocity(-self.speed, 0)
		elseif input.right and selfX <= self.rightBoundary then
			self.body:setLinearVelocity(self.speed, 0)
		else
			self.body:setLinearVelocity(0, 0)
		end
	end

	return paddle
end
