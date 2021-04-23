-- Game World

-- Collision's callbacks
local beginContact = function(fixtureA, fixtureB, contact)
end

local endContact = function(fixtureA, fixtureB, contact)
end

local preSolve = function(fixtureA, fixtureB, contact)
end

local postSolve = function(fixtureA, fixtureB, contact)
end

local world = love.physics.newWorld(0, 0) -- No gravity.
world:setCallbacks(beginContact, endContact, preSolve, postSolve)
return world
