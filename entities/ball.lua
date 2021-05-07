-- Ball Entity
local world = require('world')

return function(posX, posY)
	local ball = {}
	ball.body = love.physics.newBody(world, posX, posY, 'dynamic')
	ball.body.setMass(ball.body, 32)
	ball.body:setLinearVelocity(300, 300)
	ball.shape = love.physics.newCircleShape(10)
	ball.fixture = love.physics.newFixture(ball.body, ball.shape)
	ball.fixture:setRestitution(1)
	ball.fixture:setUserData(ball)


	-- Entity handles it's own draw function
	ball.draw = function(self)
		local ballWX, ballWY = ball.body:getWorldCenter()

		love.graphics.circle('fill', ballWX, ballWY, ball.shape:getRadius())
	end

	return ball
end
