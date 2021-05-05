-- Boundary Rigth
local world = require('world')
local MORE_THAN_WIDTH = love.graphics.getWidth() + 1
local HALF_HEIGHT = love.graphics.getHeight() / 2

local boundaryRight = {}
-- We set the x axis greater than the window's width so we
-- can't see it in the game screen.
boundaryRight.body = love.physics.newBody(world, MORE_THAN_WIDTH, HALF_HEIGHT, 'static')
boundaryRight.shape = love.physics.newRectangleShape(1, 800)
boundaryRight.fixture = love.physics.newFixture(boundaryRight.body, boundaryRight.shape)
boundaryRight.fixture:setUserData('boundaryRight')

return boundaryRight
