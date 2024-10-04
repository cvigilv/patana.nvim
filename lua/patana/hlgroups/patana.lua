M = {}

function M.get()
	local palette = require("patana.palette").generate_palette()

	return {
		-- normal {{{
		UserOOB = { fg = palette.oob, bg = palette.fg },
		--}}}
	}
end

return M
