-- Level Text
local state = require('state')

return function()
	local levelText = {}

	levelText.draw = function()
		love.graphics.print(
			{state.palette[4], 'Level: ' .. state.level},
			10,
			25
		)
	end

	return levelText
end
