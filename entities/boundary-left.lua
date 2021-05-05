-- Boundary Left
local world = require('world')
local HALF_HEIGHT = love.graphics.getHeight() / 2

local boundaryLeft = {}
-- We set the x axis as a negative value so we can't see it in the game screen.
boundaryLeft.body = love.physics.newBody(world, -1, HALF_HEIGHT, 'static')
boundaryLeft.shape = love.physics.newRectangleShape(1, 600)
boundaryLeft.fixture = love.physics.newFixture(boundaryLeft.body, boundaryLeft.shape)
boundaryLeft.fixture:setUserData('boundaryLeft')

return boundaryLeft
