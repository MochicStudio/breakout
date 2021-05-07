-- Boundary Left
local world = require('world')

return function(posX, posY)
	local boundaryLeft = {}
	-- We set the x axis as a negative value so we can't see it in the game screen.
	boundaryLeft.body = love.physics.newBody(world, posX, posY, 'static')
	boundaryLeft.shape = love.physics.newRectangleShape(1, love.graphics.getHeight())
	boundaryLeft.fixture = love.physics.newFixture(boundaryLeft.body, boundaryLeft.shape)
	boundaryLeft.fixture:setUserData(boundaryLeft)

	-- As for boundaries we won't need to write explicitlly to draw
	-- the entity because is out of the screen game but for code convention
	-- we still write the draw function.
	boundaryLeft.draw = function(self)
	end

	return boundaryLeft
end
