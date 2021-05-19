-- Game Over Text
local state = require('state')

return function()
	local HALF = 2

	local gameOverText = {}

	gameOverText.draw = function()
		if state.gameOver then
			love.graphics.print(
				{state.palette[4], 'Game Over!'},
				love.graphics.getWidth() / HALF,
				love.graphics.getHeight() / HALF
			)
		end
	end

	return gameOverText
end
