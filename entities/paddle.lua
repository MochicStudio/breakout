-- Paddle Entity
local world = require('world')

local paddle = {}
paddle.body = love.physics.newBody(world, 400, 400, 'static')
paddle.shape = love.physics.newRectangleShape(180, 20)
paddle.fixture = love.physics.newFixture(paddle.body, paddle.shape)
paddle.fixture:setUserData(paddle)

return paddle
