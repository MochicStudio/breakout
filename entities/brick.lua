-- Brick Entity
local world = require('world')

-- We're gonna need more than one brick so we better
-- do it dynamically returning a function that takes
-- the X and Y position of each brick we're gonna create
-- on the world
return function(posX, posY)
	local brick = {}

	brick.health = 3

	brick.body = love.physics.newBody(world, posX, posY, 'static')
	brick.shape = love.physics.newRectangleShape(50, 20)
	brick.fixture = love.physics.newFixture(brick.body, brick.shape)
	-- Set the brick entity as the user data. This way we have
	-- all the information of the entity it self and not just the name
	brick.fixture:setUserData(brick)

	-- Entity handles it's own draw function
	brick.draw = function(self)
		local HEALTHY = 3
		local HALF_WAY = 2
		local ALMOST_DEAD = 1
		-- Set color based on health
		if self.health == HEALTHY then
			love.graphics.setColor(0, 1, 0, 1)
		elseif self.health == HALF_WAY then
			love.graphics.setColor(1, 1, 0, 1)
		elseif self.health == ALMOST_DEAD then
			love.graphics.setColor(1, 0, 0, 1)
		end

		love.graphics.polygon('fill', brick.body:getWorldPoints(brick.shape:getPoints()))
	end

	brick.endContact = function(self)
		self.health = self.health - 1
	end

	return brick
end
