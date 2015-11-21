Actor = {}
local actors = {}

-- create a new instance of the Actor class
function Actor.new(a)
	if type(a) ~= "table" or not a.tag then return nil end

	if not a.costume then return nil end
	local costume = love.graphics.newImage('res/costumes/' .. a.costume .. '.png')

	if (not a.w) or (not a.h) then return nil end
	local quad = love.graphics.newQuad(0, 0, a.w, a.h, costume:getWidth(), costume:getHeight())

	function a:draw()
		quad:setViewport(0, 0, a.w, a.h)
		if type(self.animate) == "function" then self.animate = self:animate() end
		love.graphics.draw(costume, quad, self.x, self.y)
	end

	actors[a.tag] = a
	return a
end

-- call the update function on every Actor, this method may not be needed
function Actor.update()
	for k in pairs(actors) do
		if actors[k].update then actors[k]:update() end
	end
end

-- call the draw function on every Actor
function Actor.draw()
	for k in pairs(actors) do
		if actors[k].draw then actors[k]:draw() end
	end
end
