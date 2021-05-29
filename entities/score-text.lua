-- Score Text
local state = require('state')

return function()
	local scoreText = {}

	scoreText.draw = function()
		love.graphics.print(
			{state.palette[4], 'Score: ' .. state.score},
			10,
			10
		)
	end

	return scoreText
end
