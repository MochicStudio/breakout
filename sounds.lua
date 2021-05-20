-- Sound Table
local soundData = love.sound.newSoundData('gfx/slap.wav')
love.audio.setVolume(0.4)

return {
	slap = love.audio.newSource(soundData, 'static')
}
