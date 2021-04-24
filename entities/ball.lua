-- Ball Entity
local world = require('world')

local ball = {}
ball.body = love.physics.newBody(world, 200, 200, 'dynamic')
ball.body.setMass(ball.body, 32)
ball.body:setLinearVelocity(300, 300)
ball.shape = love.physics.newCircleShape(10)
ball.fixture = love.physics.newFixture(ball.body, ball.shape)
ball.fixture:setRestitution(1)
ball.fixture:setUserData('ball')

return ball
