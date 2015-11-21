Banter = {}

font = love.graphics.newFont('res/font/banksia.ttf', 50) 
love.graphics.setFont(font)

local msg = "hello, world"
local last = 0 
function Banter.draw()
	last = last + 1
	local len = msg:len()
	if last > len then last = len end
	love.graphics.print(msg:sub(0, last), 0, 410)
end
