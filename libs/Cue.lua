Cue = {}
local cues = {tmp = {}, persist = {}}

function Cue.tmp(tag, c)
	cues.tmp[tag] = c
	return c
end

function Cue.persist(tag, c)
	cues.persist[tag] = c
	return c
end

function Cue.get(tag)
	return cues.tmp[tag] or cues.persist[tag]
end
