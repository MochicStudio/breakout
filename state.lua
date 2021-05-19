-- State of the game. This way our data is separated from our functionality
return {
	buttonLeft = false,
	buttonRight = false,
	gameOver = false,
	palette = {
		{1, 0, 0, 1}, -- red
		{1, 1, 0, 1}, -- yellow
		{0, 1, 0, 1}, -- green
		{1, 1, 1, 1} -- white
	},
	paused = false,
	stageCleared = false
}
