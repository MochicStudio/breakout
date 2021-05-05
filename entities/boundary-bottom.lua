-- Boundary Bottom
local world = require('world')
local MORE_THAN_HEIGHT = love.graphics.getHeight() + 1

local boundaryBottom = {}
-- We set the boundary y axis greater than the window's height value
-- so we can't see it in the game screen.
boundaryBottom.body = love.physics.newBody(world, 400, MORE_THAN_HEIGHT, 'static')
boundaryBottom.shape = love.physics.newRectangleShape(800, 1)
boundaryBottom.fixture = love.physics.newFixture(boundaryBottom.body, boundaryBottom.shape)
boundaryBottom.fixture:setUserData('boundaryBottom')

return boundaryBottom
