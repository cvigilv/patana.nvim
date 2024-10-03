M = {}

function M.get()
	local palette = require("patana.palette").generate_palette()

	return {
		TreesitterContext = { link = "Normal" },
		TreesitterContextLineNumber = { link = "LineNr" },
		TreesitterContextSeparator = { link = "Normal" },
		TreesitterContextBottom = { undercurl = true, sp = palette.oob },
		TreesitterContextLineNumberBottom = { undercurl = true, sp = palette.oob },
	}
end

return M
