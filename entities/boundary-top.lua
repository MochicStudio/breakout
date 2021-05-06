-- Boundary Top
local world = require('world')

local boundaryTop = {}
-- We set the boundary y axis as a negative value so we don't see it
-- in the game screen. And the y size of the rectangle to 1 for the
-- same reason.
boundaryTop.body = love.physics.newBody(world, 400, -1, 'static')
boundaryTop.shape = love.physics.newRectangleShape(800, 1)
boundaryTop.fixture = love.physics.newFixture(boundaryTop.body, boundaryTop.shape)
boundaryTop.fixture:setUserData(boundaryTop)

return boundaryTop
