local keyMap = {
	-- Exit the game
	escape = function()
		love.event.quit()
	end,
	-- Pause the game
	space = function()
		return 'pause'
	end
}

return keyMap
