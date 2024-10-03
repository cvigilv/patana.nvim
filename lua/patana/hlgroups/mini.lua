M = {}

function M.get()
	local palette = require("patana.palette").generate_palette()

	return {
		-- MiniStarter {{{
		MiniStarterFooter = { link = "Normal" },
		MiniStarterHeader = { link = "Normal" },
		MiniStarterSection = { link = "Normal" },
		--}}}
		-- MiniPick {{{
		MiniPickBorder = { link = "FloatBorder" }, -- window border.
		MiniPickBorderBusy = { link = "FloatBorder" }, -- window border while picker is busy processing.
		MiniPickBorderText = { bg = palette.bg_subtle, bold = true }, -- non-prompt on border.
		MiniPickHeader = { link = "Title" }, -- headers in info buffer and previews.
		MiniPickIconDirectory = { link = "Directory" }, -- default icon for directory.
		MiniPickIconFile = { link = "Normal" }, -- default icon for file.
		MiniPickMatchCurrent = { link = "Visual" }, -- current matched item.
		MiniPickMatchMarked = { bold = true }, -- marked matched items.
		MiniPickMatchRanges = { link = "Search" }, -- ranges matching query elements.
		MiniPickNormal = { link = "NormalFloat" }, -- basic foreground/background highlighting.
		MiniPickPreviewLine = { link = "Normal" }, -- target line in preview.
		MiniPickPreviewRegion = { link = "Normal" }, -- target region in preview.
		MiniPickPrompt = { link = "MiniPickNormal" }, -- prompt.
		--}}}
		-- MiniStatusline {{{
		MiniStatuslineModeNormal = { link = "StatusLine" },
		MiniStatuslineModeInsert = { link = "StatusLine" },
		MiniStatuslineModeVisual = { link = "StatusLine" },
		MiniStatuslineModeReplace = { link = "StatusLine" },
		MiniStatuslineModeCommand = { link = "StatusLine" },
		MiniStatuslineModeOther = { link = "StatusLine" },
		--}}}
	}
end

return M
