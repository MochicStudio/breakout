-- Paused Text
local state = require('state')

return function()
	local HALF = 2

	local pausedText = {}

	pausedText.draw = function()
		if state.paused then
			love.graphics.print(
				{state.palette[4], 'Paused'},
				love.graphics.getWidth() / HALF,
				love.graphics.getHeight() / HALF
			)
		end
	end

	return pausedText
end
