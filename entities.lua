local boundaryTop = require('entities/boundary-top')
local boundaryVertical = require('entities/boundary-vertical')
local boundaryBottom = require('entities/boundary-bottom')
local brick = require('entities/brick')
local ball = require('entities/ball')
local paddle = require('entities/paddle')

local HALF = 2
local THREE_QUARTER = 0.75

return {
	boundaryTop(love.graphics.getWidth() / HALF, -1),
	boundaryVertical(love.graphics.getWidth() + 1, love.graphics.getHeight() / HALF), -- Right
	boundaryBottom(love.graphics.getWidth() / HALF, love.graphics.getHeight() + 1),
	boundaryVertical(-1, love.graphics.getHeight() / HALF), -- Left
	ball(love.graphics.getWidth() / HALF, love.graphics.getHeight() / HALF),
	paddle(love.graphics.getWidth() / HALF, love.graphics.getHeight() * THREE_QUARTER),
	brick(50, 50),
	brick(101, 50),
	brick(152, 50)
}
