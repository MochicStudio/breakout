-- Boundary Bottom
local world = require('world')
local state = require('state')
local sounds = require('sounds')

return function(posX, posY)
	local boundaryBottom = {}
	-- We set the boundary y axis greater than the window's height value
	-- so we can't see it in the game screen.
	boundaryBottom.body = love.physics.newBody(world, posX, posY, 'static')
	boundaryBottom.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 1)
	boundaryBottom.fixture = love.physics.newFixture(boundaryBottom.body, boundaryBottom.shape)
	boundaryBottom.fixture:setUserData(boundaryBottom)

	-- As for boundaries we won't need to write explicitlly to draw
	-- the entity because is out of the screen game but for code convention
	-- we still write the draw function.
	boundaryBottom.draw = function(self)
	end

	boundaryBottom.beginContact = function(self)
		sounds.gameOver()
		state.gameOver = true
	end

	return boundaryBottom
end
