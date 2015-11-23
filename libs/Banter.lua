Banter = {}

font = love.graphics.newFont('res/font/banksia.ttf', 50) 
love.graphics.setFont(font)

-- set the speed of the Banter
local speed = "NORMAL"
function Banter.setSpeed(s)
	speed = s
end

local settings = {
	FAST = 1,
	NORMAL = 0.2,
	SLOW = 0.1, 
}

local queue = {}
function Banter.push(m)
	table.insert(queue, m)
end

-- draw dat Banter 
local msg = "hello, world\nmy name is myke\ncheck this shit out\nphwoar...\none more time!"
local last = 0 
function Banter.draw()
	last = last + settings[speed]
	local len = msg:len()
	if last > len then last = len end
	love.graphics.print(msg:sub(0, math.floor(last)), 0, 410)
	return "LIVE"
end

Crew.new {
	draw = Banter.draw,
	tag = 'Banter',
}
