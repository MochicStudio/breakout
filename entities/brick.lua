-- Brick Entity
local world = require('world')
local state = require('state')
local sounds = require('sounds')

-- We're gonna need more than one brick so we better
-- do it dynamically returning a function that takes
-- the X and Y position of each brick we're gonna create
-- on the world
return function(posX, posY)
	local brick = {}

	brick.health = 3
	brick.type = 'brick'

	brick.body = love.physics.newBody(world, posX, posY, 'static')
	brick.shape = love.physics.newRectangleShape(50, 20)
	brick.fixture = love.physics.newFixture(brick.body, brick.shape)
	-- Set the brick entity as the user data. This way we have
	-- all the information of the entity it self and not just the name
	brick.fixture:setUserData(brick)

	-- Entity handles it's own draw function
	brick.draw = function(self)
		local WHITE = 4
		-- Set color based on health
		love.graphics.setColor(state.palette[self.health] or state.palette[WHITE])
		love.graphics.polygon('fill', brick.body:getWorldPoints(brick.shape:getPoints()))
		-- Reset color
		love.graphics.setColor(state.palette[WHITE])
	end

	brick.endContact = function(self)
		sounds.slap()
		self.health = self.health - 1
	end

	return brick
end
