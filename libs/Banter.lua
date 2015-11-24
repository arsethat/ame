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

-- add a new Banter to the queue
local queue = {}
function Banter.push(m)
	table.insert(queue, m)
end

-- load the next Banter to go
local alive = false 
local answered = false
local last = 0
local len = 0
local msg = ""
local function shift()
	msg = queue[1]
	table.remove(queue, 1)

	if msg then
		last = 0
		len = msg:len()	
	else  
		alive = Cue.tmp("Banter", false)
		answered = false
	end
end

-- initiates the Banter, the dialogue
function Banter.roll()
	shift()
	alive = Cue.tmp("Banter", true)	
end

-- progress the state of the Banter box on screen
local function update()
	if not alive then return "LIVE" end

	local mouse = Cue.get("Mouse")
	
	last = last + settings[speed]
	if last > len then last = len end

	-- if the button was pressed this frame and we didn't pick up
	if mouse.l and (mouse.l ~= answered) then
		answered = mouse.l
		if (last == len) then 
			shift()
		else last = len end
	end


	return "LIVE"
end
 
local function draw()
	if alive then
		love.graphics.print(msg:sub(0, math.floor(last)), 0, 410)
	end
end

Crew.new {
	draw = draw,
	tag = 'Banter',
	update = update,
}
