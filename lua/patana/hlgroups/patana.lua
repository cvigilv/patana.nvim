M = {}

function M.get()
	local palette = require("patana.palette").generate_palette()

	return {
		-- normal {{{
		UserOOB = { fg = palette.norm, bg = palette.oob },
		--}}}
	}
end

return M
