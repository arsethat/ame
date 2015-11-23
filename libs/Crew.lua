Crew = {}

local crews = {}
function Crew.update()
	for k in ipairs(crews) do
		local c = crews[k]
		if c.update and (c.status == "LIVE") then c.status = c:update() end
		if c.status == "EXIT" then return false end
	end

	return true
end

function Crew.draw()
	for k in ipairs(crews) do
		local c = crews[k]
		if c.draw then c:draw() end
	end
end



function Crew.new(c)
	c.status = "LIVE"
	table.insert(crews, c)
end
