local boundaryTop = require('entities/boundary-top')
local boundaryVertical = require('entities/boundary-vertical')
local boundaryBottom = require('entities/boundary-bottom')
local brick = require('entities/brick')
local ball = require('entities/ball')
local paddle = require('entities/paddle')
local pausedText = require('entities/paused-text')
local gameOverText = require('entities/game-over-text')
local scoreText = require('entities/score-text')
local levelText = require('entities/level-text')
local stageClearedText = require('entities/stage-cleared-text')

return function(rows)
	local HALF = 2
	local SEVEN_EIGHT = 7/8

	local entities = {
		boundaryTop(love.graphics.getWidth() / HALF, -1),
		boundaryVertical(love.graphics.getWidth() + 1, love.graphics.getHeight() / HALF), -- Right
		boundaryBottom(love.graphics.getWidth() / HALF, love.graphics.getHeight() + 1),
		boundaryVertical(-1, love.graphics.getHeight() / HALF), -- Left
		ball(love.graphics.getWidth() / HALF, love.graphics.getHeight() / HALF),
		paddle(love.graphics.getWidth() / HALF, love.graphics.getHeight() * SEVEN_EIGHT),
		pausedText(),
		gameOverText(),
		scoreText(),
		levelText(),
		stageClearedText()
	}

	local DOUBLE = 2
	local BRICK_WIDTH = 50
	local BRICK_HEIGHT = 20
	local SPACE_X = 50
	local EXTRA_SPACE_X = 5
	local SPACE_Y = 25
	local NO_THAT_MUCH_COLUMNS = 2
	local columns = ((love.graphics.getWidth() - (SPACE_X * DOUBLE)) / BRICK_WIDTH) - NO_THAT_MUCH_COLUMNS

	for x = 1, math.abs(columns) do
		for y = 1, rows do
			local brickX = BRICK_WIDTH + (SPACE_X + EXTRA_SPACE_X) * x
			local brickY = BRICK_HEIGHT + SPACE_Y * y
			entities[#entities + 1] = brick(brickX, brickY)
		end
	end

	return entities
end
