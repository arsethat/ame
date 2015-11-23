Cue = {}
local cues = {signal = {}, persist = {}}

function Cue.signal(tag, struct)
	cues.signal[tag] = struct
end

function Cue.persist(tag, struct)
	cues.persist[tag] = struct
end

function Cue.exists(tag)
	return cue.signal[tag] or cue.persist[tag]
end
