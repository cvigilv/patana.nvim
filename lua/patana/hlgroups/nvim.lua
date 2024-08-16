M = {}

function M.get()
	local palette = require("patana.palette").generate_palette()
	local colors = require("patana.colors")

	return {
		-- normal {{{
		Normal = { fg = palette.norm, bg = palette.bg },
		NormalFloat = { fg = palette.norm, bg = palette.bg_subtle },
		NormalBorder = { link = "NormalFloat" },

		Comment = { fg = palette.comment, italic = true },
		SpecialComment = { link = "Comment" },
		--}}}
		-- constant literals {{{
		Constant = { fg = palette.primary },
		Character = { link = "Constant" },
		Number = { link = "Constant" },
		Boolean = { link = "Constant" },
		Float = { link = "Constant" },
		String = { link = "Constant" },
		Directory = { link = "Constant" },
		Title = { link = "Constant" },
		--}}}
		-- syntax {{{
		Function = { fg = palette.norm, bold = true },
		Identifier = { link = "Function" },

		Statement = { bold = true },
		Conditonal = { link = "Statement" },
		Repeat = { link = "Statement" },
		Label = { link = "Statement" },
		Keyword = { link = "Statement" },
		Exception = { link = "Statement" },

		PreProc = { bold = true },
		Include = { link = "PreProc" },
		Define = { link = "PreProc" },
		Macro = { link = "PreProc" },
		PreCondit = { link = "PreProc" },

		Type = { bg = palette.bg_subtle },
		StorageClass = { link = "Type" },
		Structure = { link = "Type" },
		Typedef = { link = "Type" },

		Operator = { fg = palette.norm_very_subtle },
		Debug = { link = "Operator" },

		Special = { italic = true },
		SpecialChar = { link = "Special" },
		Tag = { link = "Special" },
		Delimiter = { link = "Special" },

		Critical = { fg = palette.bg, bg = palette.accent, bold = true },
		Error = { reverse = true, bold = true },
		Ignore = { fg = palette.norm_very_subtle },
		Todo = { fg = palette.accent, italic = true },
		Underlined = { underline = true },
		--}}}
		-- spell {{{
		SpellBad = { undercurl = true, sp = palette.norm },
		SpellCap = { link = "SpellBad" },
		SpellLocal = { link = "SpellBad" },
		SpellRare = { link = "SpellBad" },
		--}}}
		-- ui {{{
		ColorColumn = { link = "CursorLine" },
		Conceal = { link = "Comment" },
		CurSearch = { fg = palette.bg, bg = palette.norm, bold = true },
		Cursor = { fg = palette.bg, bg = palette.accent },
		CursorColumn = { link = "CursorLine" },
		CursorLine = { bg = palette.cursor_line },
		CursorLineNr = { fg = palette.norm, bg = palette.cursor_line, bold = true },
		EndOfBuffer = { link = "Normal" },
		ErrorMsg = { fg = palette.accent, bold = true },
		FloatBorder = { fg = palette.norm_subtle, bg = palette.bg_subtle },
		FloatTitle = { fg = palette.norm_subtle, bg = palette.bg_subtle, bold = true, underline = true },
		FoldColumn = { link = "SignColumn" },
		Folded = { link = "Normal" },
		IncSearch = { link = "Search" },
		LineNr = { fg = palette.bg_very_subtle },
		MatchParen = { reverse = true },
		ModeMsg = { fg = palette.norm, bold = true },
		MoreMsg = { fg = palette.norm, bold = true },
		MsgArea = { fg = palette.norm, bg = palette.oob },
		NonText = { fg = palette.norm_very_subtle },
		NormalNC = { link = "Normal" },
		NvimInternalError = { link = "ErrorMsg" },
		Pmenu = { bg = palette.bg_subtle },
		PmenuSbar = { bg = palette.bg_subtle, reverse = true },
		PmenuKind = { fg = palette.primary, bg = palette.bg_subtle },
		PmenuSel = { fg = palette.norm, bg = palette.bg_subtle, reverse = true, bold = true },
		PmenuKindSel = { fg = palette.primary, bg = palette.bg_subtle, reverse = true, bold = true },
		Question = { bold = true },
		QuickFixLine = { link = "Search" },
		Search = { fg = palette.bg, bg = palette.primary, bold = true },
		SignColumn = { bg = palette.bg, fg = palette.norm, bold = true },
		SpecialKey = { fg = palette.norm_subtle },
		StatusLine = {
			fg = vim.g.patana_colored_statusline and "#000000" or palette.fg,
			bg = vim.g.patana_colored_statusline and palette.contrasting or palette.bg_subtle,
			bold = true,
		},
		StatusLineNC = {
			fg = vim.g.patana_colored_statusline and "#000000" or palette.fg,
			bg = vim.g.patana_colored_statusline and palette.contrasting or palette.bg_subtle,
		},
		StatusLineTerm = { link = "StatusLine" },
		StatusLineTermNC = { link = "StatusLineNC" },
		Substitute = { link = "Search" },
		TabLine = { fg = palette.norm_very_subtle, bg = palette.bg_very_subtle },
		TabLineFill = { bg = palette.oob },
		TabLineSel = { fg = palette.norm, bg = palette.bg_subtle, bold = true },
		Visual = { fg = palette.bg, bg = palette.primary },
		WarningMsg = { fg = palette.critical, bold = true },
		WildMenu = { link = "Search" },
		WinBar = { link = "StatusLine" },
		WinBarNC = { link = "StatusLineNc" },
		WinSeparator = { fg = palette.norm, bg = palette.bg },
		--}}}
		-- diagnostics {{{
		DiagnosticDeprecated = { strikethrough = true },
		DiagnosticOk = { fg = palette.norm, bold = true },

		DiagnosticError = { fg = palette.accent, bold = true },
		DiagnosticDefaultError = { link = "DiagnosticError" },
		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticVirtualTextError = { link = "DiagnosticError" },

		DiagnosticWarn = { fg = palette.secondary, bold = true },
		DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
		DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
		DiagnosticSignWarn = { link = "DiagnosticWarn" },
		DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },

		DiagnosticHint = { fg = palette.primary, bold = true },
		DiagnosticDefaultHint = { link = "DiagnosticHint" },
		DiagnosticFloatingHint = { link = "DiagnosticHint" },
		DiagnosticSignHint = { link = "DiagnosticHint" },
		DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

		DiagnosticInfo = { fg = palette.norm, bold = true },
		DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
		DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
		DiagnosticSignInfo = { link = "DiagnosticInfo" },
		DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },

		DiagnosticUnderlineError = { sp = palette.accent, undercurl = true, bold = true },
		DiagnosticUnderlineWarn = { sp = palette.secondary, undercurl = true, bold = true },
		DiagnosticUnderlineHint = { sp = palette.primary, undercurl = true, bold = true },
		DiagnosticUnderlineInfo = { sp = palette.info, undercurl = true, bold = true },
		DiagnosticUnderlineOk = { sp = palette.norm, undercurl = true, bold = true },
		--}}}
		-- diff {{{
		Added = { fg = colors.greens["100"], bg = colors.greens["900"], reverse = vim.o.background == "dark" },
		DiffAdd = { link = "Added" },
		DiffAddGutter = { link = "Added" },
		GitAdd = { link = "Added" },

		Changed = { fg = colors.oranges["100"], bg = colors.oranges["900"], reverse = vim.o.background == "dark" },
		DiffChange = { link = "Changed" },
		DiffChangeGutter = { link = "Changed" },
		GitChange = { link = "Changed" },

		Deleted = { fg = colors.purples["100"], bg = colors.purples["900"], reverse = vim.o.background == "dark" },
		DiffDelete = { link = "Deleted" },
		DiffDeleteGutter = { link = "Removed" },
		GitDelete = { link = "Removed" },

		Removed = { fg = colors.purples["100"], bg = colors.purples["900"], reverse = vim.o.background == "dark" },
		DiffRemoved = { link = "Removed" },

		DiffText = { fg = colors.norm, bg = colors.bg_subtle },
		--}}}
		-- treesitter {{{
		["@string.documentation"] = { link = "Comment" },
		["@keyword.function.julia"] = { bold = true },
		--}}}
	}
end

return M
