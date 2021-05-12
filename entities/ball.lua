-- Ball Entity
local world = require('world')

return function(posX, posY)
	local ball = {}

	ball.maxSpeed = 880

	ball.body = love.physics.newBody(world, posX, posY, 'dynamic')
	-- ball.body.setMass(ball.body, 32)
	ball.body:setLinearVelocity(300, 300)
	ball.shape = love.physics.newCircleShape(0, 0, 10)
	ball.fixture = love.physics.newFixture(ball.body, ball.shape)
	ball.fixture:setRestitution(1)
	ball.fixture:setFriction(0) -- No friction at all
	ball.fixture:setUserData(ball)

	-- Entity handles it's own draw function
	ball.draw = function(self)
		local ballWX, ballWY = ball.body:getWorldCenter()

		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.circle('fill', ballWX, ballWY, ball.shape:getRadius())
	end

	ball.update = function(self)
		local DOUBLE = 2
		local THREE_QUARTERS = 0.75

		local selfVelX, selfVelY = self.body:getLinearVelocity()
		local selfSpeed = math.abs(selfVelX) + math.abs(selfVelY)

		-- Set critical speed validation to variables
		local selfVelXIsCritical = math.abs(selfVelX) > (self.maxSpeed * DOUBLE)
		local selfVelYIsCritical = math.abs(selfVelY) > (self.maxSpeed * DOUBLE)

		-- Return ball speed to a safe value
		if selfVelXIsCritical or selfVelYIsCritical then
			self.body:setLinearVelocity(selfVelX * THREE_QUARTERS, selfVelY * THREE_QUARTERS)
		end

		-- Stop ball. Damping is an opposite force to stop any body.
		if selfSpeed > self.maxSpeed then
			self.body:setLinearDamping(0.1)
		else
			self.body:setLinearDamping(0)
		end
	end

	return ball
end
