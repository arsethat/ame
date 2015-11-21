require("./libs/Actor")
require("./libs/Banter")

local stage = {w = 1280, h = 720}
love.window.setMode(stage.w, stage.h)
love.window.setTitle("ame: visual novel engine")

local ploe = Actor.new {
	tag = 'ploe',
	costume = 'ploe-normal',
	x = 0,
	y = 0,
	w = 720,
	h = 611, 	
}

-- Draw 30 frames a second
local start = love.timer.getTime()
local JIFFY = 1/30
function love.draw()
	Actor.draw()
	Banter.draw()
	if love.timer.getTime() <= start + JIFFY then love.timer.sleep(start + JIFFY - love.timer.getTime()) end
	start = love.timer.getTime()
end

