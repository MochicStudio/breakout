-- Sound Table
local soundDataSlap = love.sound.newSoundData('gfx/slap.wav')
local soundDataGameOver = love.sound.newSoundData('gfx/game-over.wav')

local sounds = {}

sounds.slap = function()
	local slapSound = love.audio.newSource(soundDataSlap, 'static')
	love.audio.setVolume(0.4)
	love.audio.stop()
	love.audio.play(slapSound)
end

sounds.gameOver = function()
	local gameOverSound = love.audio.newSource(soundDataGameOver, 'static')
	love.audio.setVolume(1)
	love.audio.play(gameOverSound)
end

return sounds
