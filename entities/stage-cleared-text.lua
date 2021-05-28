-- Stage Cleared Text
local state = require('state')

return function()
	local HALF = 2

	local stageClearedText = {}

	stageClearedText.draw = function()
		if state.stageCleared and state.level == state.maxLevel then
			love.graphics.print(
				{state.palette[4], 'You Won!'},
				love.graphics.getWidth() / HALF,
				love.graphics.getHeight() / HALF
			)
		end
	end

	return stageClearedText
end
