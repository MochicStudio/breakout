-- Vertical Boundary
local world = require('world')

return function(posX, posY)
	local boundaryVertical = {}
	boundaryVertical.body = love.physics.newBody(world, posX, posY, 'static')
	boundaryVertical.shape = love.physics.newRectangleShape(1, love.graphics.getHeight())
	boundaryVertical.fixture = love.physics.newFixture(boundaryVertical.body, boundaryVertical.shape)
	boundaryVertical.fixture:setUserData(boundaryVertical)

	-- As for boundaries we won't need to write explicitlly to draw
	-- the entity because is out of the screen game but for code convention
	-- we still write the draw function.
	boundaryVertical.draw = function(self)
	end

	return boundaryVertical
end
