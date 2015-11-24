require("./libs/Crew")
require("./libs/Cue")
require("./libs/Actor")
require("./libs/Banter")

local stage = Cue.tmp("Stage", {
	w = 1280,
	h = 720, 
	frame = 0
})

function love.load()
	love.window.setMode(stage.w, stage.h)
	love.window.setTitle("ame: visual novel engine")

	local icon = love.image.newImageData('res/icon/arsethat.png')
	love.window.setIcon(icon)
end

ame = {}
-- marshalTable is a utility function that converts a lua table to a 
-- string. This will be used for saving etc.
function ame.marshalTable(t)
	local s = ""
	if type(t) == 'table' then
		-- unpack the hash part
		for k,v in pairs(t) do
			s = string.format("%s%s=%s,", s, k, tostring(v))
		end

		-- unpack the array part
		for k in ipairs(t) do
			s = string.format("%s%s,", s, tostring(v))
		end
		
		-- stick it between curlies
		s = string.format("{%s}", s)
	end

	return s
end

local ploe = Actor.new {
	tag = 'ploe',
	costume = 'ploe',
	x = 0,
	y = 0,
	w = 540,
	h = 720, 	
}

-- test dialogue
Banter.push("hello, world\nmy name is myke\ncheck this shit out\nphwoar...\none more time!")
Banter.push("another one")
Banter.push("wahey!")
Banter.roll()

local mouse = Cue.tmp("Mouse", {})
function love.mousepressed(x, y, b)
	mouse.x = x
	mouse.y = y
	mouse[b] = stage.frame
end

function love.mousereleased(x, y, b)
	mouse.x = x
	mouse.y = y
	mouse[b] = false
end

-- Draw 30 frames a second
local start = love.timer.getTime()
local JIFFY = 1/30
local counter = 0
local clip = 0
function love.update()
	counter = counter + 1
	if counter == 10 then
		clip =  clip + 1
		if clip > 2 then clip = 0 end
		ploe:jumpClip(clip)
		counter = 0
	end

	stage.frame = stage.frame + 1
	Crew.update()
end

function love.draw()
	Crew.draw()
	if love.timer.getTime() <= start + JIFFY then love.timer.sleep(start + JIFFY - love.timer.getTime()) end
	start = love.timer.getTime()
end
