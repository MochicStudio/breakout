-- Boundary Top
local world = require('world')

return function(posX, posY)
	local boundaryTop = {}
	-- We set the boundary y axis as a negative value so we don't see it
	-- in the game screen. And the y size of the rectangle to 1 for the
	-- same reason.
	boundaryTop.body = love.physics.newBody(world, posX, posY, 'static')
	boundaryTop.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 1)
	boundaryTop.fixture = love.physics.newFixture(boundaryTop.body, boundaryTop.shape)
	boundaryTop.fixture:setUserData(boundaryTop)

	-- As for boundaries we won't need to write explicitlly to draw
	-- the entity because is out of the screen game but for code convention
	-- we still write the draw function.
	boundaryTop.draw = function(self)
	end

	return boundaryTop
end
