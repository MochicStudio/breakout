-- Brick Entity
local world = require('world')

-- We're gonna need more than one brick so we better
-- do it dynamically returning a function that takes
-- the X and Y position of each brick we're gonna create
-- on the world
return function(posX, posY)
	local brick = {}
	brick.body = love.physics.newBody(world, posX, posY, 'static')
	brick.shape = love.physics.newRectangleShape(50, 25)
	brick.fixture = love.physics.newFixture(brick.body, brick.shape)
	-- Set the brick entity as the user data. This way we have
	-- all the information of the entity it self and not just the name
	brick.fixture:setUserData(brick)

	return brick
end
