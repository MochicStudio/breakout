-- Boundary Rigth
local world = require('world')

return function(posX, posY)
	local boundaryRight = {}
	-- We set the x axis greater than the window's width so we
	-- can't see it in the game screen.
	boundaryRight.body = love.physics.newBody(world, posX, posY, 'static')
	boundaryRight.shape = love.physics.newRectangleShape(1, love.graphics.getHeight())
	boundaryRight.fixture = love.physics.newFixture(boundaryRight.body, boundaryRight.shape)
	boundaryRight.fixture:setUserData(boundaryRight)

	-- As for boundaries we won't need to write explicitlly to draw
	-- the entity because is out of the screen game but for code convention
	-- we still write the draw function.
	boundaryRight.draw = function(self)
	end

	return boundaryRight
end
