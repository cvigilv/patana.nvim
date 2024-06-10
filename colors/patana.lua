---@module 'patana'
---@author Carlos Vigil-Vásquez
---@license MIT

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then
	vim.cmd.syntax("reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "patana"

local colors = {
	grays = {
		["000"] = "#000000",
		["050"] = "#0E0E0E",
		["100"] = "#1C1C1C",
		["150"] = "#2A2A29",
		["200"] = "#393837",
		["250"] = "#474645",
		["300"] = "#555453",
		["350"] = "#636261",
		["400"] = "#71706F",
		["450"] = "#807F7D",
		["500"] = "#8E8D8A",
		["550"] = "#9C9B98",
		["600"] = "#AAA9A6",
		["650"] = "#B8B7B4",
		["700"] = "#C6C5C2",
		["750"] = "#D5D3D0",
		["800"] = "#E3E1DD",
		["850"] = "#F1EFEB",
		["900"] = "#FFFDF9",
	},
	green_pastel = "#B3D8AB",
	green_light = "#7BB662",
	green_dark = "#589C48",
	orange_pastel = "#F9BA8A",
	orange_light = "#fbb149",
	orange_dark = "#F58024",
	purple_pastel = "#D2A7DC",
	purple_light = "#994fb2",
	purple_dark = "#733381",
}

-- NOTE: The aim is the following:
--       - Mainly monochrome, with color for literals (`literal`) and errors (`error`)
--       - Things that require my attention should be in *bold* typeface
--       - Things that don't require my attention should be in *italic* typeface
--       - UI stuff that require attention should be highlighted with accent color
--       - Visual and search will have a "highlighter" style background (`visual`)
--       - Diff status also colored, but it should be subtle
local palette
if vim.o.background == "dark" then
	palette = {
		bg = colors.grays["100"],
		bg_subtle = colors.grays["150"],
		bg_very_subtle = colors.grays["250"],
		norm = colors.grays["850"],
		norm_subtle = colors.grays["800"],
		norm_very_subtle = colors.grays["700"],

		cursor_line = colors.grays["150"],
		comment = colors.grays["450"],
		oob = colors.grays["000"],

		visual = colors.orange_pastel,
		literal = colors.purple_light,

		add = colors.green_light,
		change = colors.orange_light,
		delete = colors.purple_light,

		error = colors.purple_light,
		warn = colors.orange_light,
		hint = colors.green_light,
		info = colors.grays["850"],
		ok = colors.norm_subtle,
	}
else
	palette = {
		bg = colors.grays["850"],
		bg_subtle = colors.grays["800"],
		bg_very_subtle = colors.grays["700"],
		norm = colors.grays["050"],
		norm_subtle = colors.grays["100"],
		norm_very_subtle = colors.grays["200"],

		cursor_line = colors.grays["800"],
		comment = colors.grays["450"],
		oob = colors.grays["900"],

		visual = colors.orange_light,
		literal = colors.green_dark,

		add = colors.green_pastel,
		change = colors.orange_pastel,
		delete = colors.purple_pastel,

		error = colors.purple_dark,
		warn = colors.orange_dark,
		hint = colors.green_dark,
		info = colors.grays["050"],
		ok = colors.norm_subtle,
	}
end

local hlgroups = {
	-- normal {{{
	Normal = { fg = palette.norm, bg = palette.bg },
	NormalFloat = { fg = palette.norm, bg = palette.bg_subtle },
	NormalBorder = { link = "NormalFloat" },

	Comment = { fg = palette.comment, italic = true },
	SpecialComment = { link = "Comment" },
	Critical = { fg = palette.bg, bg = palette.accent, bold = true },
	--}}}
	-- constant literals {{{
	Constant = { fg = palette.literal },
	Character = { link = "Constant" },
	Number = { link = "Constant" },
	Boolean = { link = "Constant" },
	Float = { link = "Constant" },
	String = { link = "Constant" },
	Directory = { link = "Constant" },
	Title = { link = "Constant" },
	--}}}
	-- syntax {{{
	Function = { fg = palette.norm },
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

	Type = { underline = true },
	StorageClass = { link = "Type" },
	Structure = { link = "Type" },
	Typedef = { link = "Type" },

	Operator = { fg = palette.accent, bold = true },
	Debug = { link = "Operator" },

	Special = { italic = true },
	SpecialChar = { link = "Special" },
	Tag = { link = "Special" },
	Delimiter = { link = "Special" },

	Underlined = { underline = true },
	Ignore = { fg = palette.norm_very_subtle },
	Error = { reverse = true, bold = true },
	Todo = { fg = palette.accent, italic = true },
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
	CurSearch = { link = "Visual" },
	Cursor = { fg = palette.bg, bg = palette.accent },
	CursorColumn = { link = "CursorLine" },
	CursorLine = { bg = palette.cursor_line },
	CursorLineNr = { fg = palette.norm, bg = palette.cursor_line, bold = true },
	EndOfBuffer = { link = "Normal" },
	ErrorMsg = { fg = palette.accent, bold = true },
	FloatBorder = { fg = palette.norm_subtle, bg = palette.bg_subtle },
	FloatTitle = {
		fg = palette.norm_subtle,
		bg = palette.bg_subtle,
		bold = true,
		underline = true,
	},
	FoldColumn = { link = "SignColumn" },
	Folded = { fg = palette.norm, bg = palette.bg, bold = true },
	IncSearch = { link = "CurSearch" },
	LineNr = { fg = palette.bg_very_subtle },
	MatchParen = { reverse = true },
	ModeMsg = { fg = palette.norm, bold = true },
	MoreMsg = { fg = palette.norm, bold = true },
	MsgArea = { fg = palette.norm, bg = palette.bg_very_subtle },
	NonText = { fg = palette.norm_very_subtle },
	NormalNC = { link = "Normal" },
	NvimInternalError = { link = "ErrorMsg" },
	Pmenu = { bg = palette.bg_subtle },
	PmenoSbar = { bg = palette.bg_subtle, reverse = true },
	PmenuKind = { fg = palette.literal, bg = palette.bg_subtle },
	PmenuSel = { fg = palette.norm, bg = palette.bg_subtle, reverse = true, bold = true },
	PmenuKindSel = { fg = palette.literal, bg = palette.bg_subtle, reverse = true, bold = true },
	Question = { bold = true },
	QuickFixLine = { link = "Visual" },
	Search = { link = "Visual" },
	SignColumn = { bg = palette.bg, fg = palette.norm, bold = true },
	SpecialKey = { fg = palette.norm_subtle },
	StatusLine = { fg = palette.norm, bg = palette.cursor_line },
	StatusLineNC = { fg = palette.norm, bg = palette.oob, italic = true },
	StatusLineTerm = { link = "StatusLine" },
	StatusLineTermNC = { link = "StatusLineNC" },
	Substitute = { link = "IncSearch" },
	TabLine = { fg = palette.norm_very_subtle, bg = palette.bg_very_subtle },
	TabLineFill = { bg = palette.oob },
	TabLineSel = { fg = palette.norm, bg = palette.bg, bold = true },
	Visual = { bg = palette.visual, fg = palette.fg },
	WarningMsg = { fg = palette.critical, bold = true },
	WildMenu = { link = "IncSearch" },
	WinBar = { link = "StatusLine" },
	WinBarNC = { link = "StatusLineNc" },
	WinSeparator = { fg = palette.norm, bg = palette.bg },
	--}}}
	-- diagnostics {{{
	DiagnosticDeprecated = { strikethrough = true },

	DiagnosticError = { fg = palette.error, bold = true },
	DiagnosticWarn = { fg = palette.warn, bold = true },
	DiagnosticHint = { fg = palette.hint, bold = true },
	DiagnosticInfo = { fg = palette.info, bold = true },
	DiagnosticOk = { fg = palette.ok, bold = true },

	DiagnosticUnderlineError = { sp = palette.error, undercurl = true, bold = true },
	DiagnosticUnderlineWarn = { sp = palette.warn, undercurl = true, bold = true },
	DiagnosticUnderlineHint = { sp = palette.hint, undercurl = true, bold = true },
	DiagnosticUnderlineInfo = { sp = palette.info, undercurl = true, bold = true },
	DiagnosticUnderlineOk = { sp = palette.norm, undercurl = true, bold = true },

	DiagnosticVirtualTextError = { link = "DiagnosticError" },
	DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
	DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
	DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },

	DiagnosticDefaultError = { link = "DiagnosticError" },
	DiagnosticDefaultHint = { link = "DiagnosticHint" },
	DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
	DiagnosticDefaultWarn = { link = "DiagnosticWarn" },

	DiagnosticFloatingError = { link = "DiagnosticError" },
	DiagnosticFloatingHint = { link = "DiagnosticHint" },
	DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
	DiagnosticFloatingWarn = { link = "DiagnosticWarn" },

	DiagnosticSignError = { link = "DiagnosticError" },
	DiagnosticSignHint = { link = "DiagnosticHint" },
	DiagnosticSignInfo = { link = "DiagnosticInfo" },
	DiagnosticSignWarn = { link = "DiagnosticWarn" },
	--}}}
	-- git-related {{{
	Added = { fg = palette.fg, bg = palette.add },
	Changed = { fg = palette.fg, bg = palette.change },
	Removed = { fg = palette.fg, bg = palette.delete },
	Deleted = { fg = palette.fg, bg = palette.delete },

	DiffAdd = { link = "Added" },
	DiffChange = { link = "Changed" },
	DiffDelete = { link = "Removed" },
	DiffRemoved = { link = "Removed" },

	DiffAddGutter = { link = "Added" },
	DiffChangeGutter = { link = "Changed" },
	DiffDeleteGutter = { link = "Removed" },

	GitAdd = { link = "Added" },
	GitChange = { link = "Changed" },
	GitDelete = { link = "Removed" },
	--}}}
	-- treesitter {{{
	["@variable"] = { link = "Identifier" },
	["@variable.builtin"] = { link = "Type" },
	["@variable.parameter"] = { link = "Identifier" },
	["@variable.member"] = { link = "Identifier" },

	["@constant"] = { link = "Constant" },
	["@constant.builtin"] = { link = "Type" },
	["@constant.macro"] = { link = "Define" },

	["@module"] = { link = "Include" },
	["@module.builtin"] = { link = "Include" },
	["@label"] = { link = "Label" },

	["@string"] = { link = "String" },
	["@string.documentation"] = { link = "String" },
	["@string.regexp"] = { link = "String" },
	["@string.escape"] = { link = "SpecialChar" },
	["@string.special"] = { link = "SpecialChar" },
	["@string.special.symbol"] = { link = "Identifier" },
	["@string.special.path"] = { link = "Underlined" },
	["@string.special.url"] = { link = "Underlined" },

	["@character"] = { link = "Character" },
	["@character.special"] = { link = "SpecialChar" },

	["@boolean"] = { link = "Boolean" },
	["@number"] = { link = "Number" },
	["@number.float"] = { link = "Float" },

	["@type"] = { link = "Type" },
	["@type.builtin"] = { link = "Type" },
	["@type.qualifier"] = { link = "Type" },
	["@type.definition"] = { link = "Typedef" },

	["@attribute"] = { link = "PreProc" },
	["@property"] = { link = "Identifier" },

	["@function"] = { link = "Function" },
	["@function.builtin"] = { link = "Special" },
	["@function.call"] = { link = "Special" },
	["@function.macro"] = { link = "Macro" },

	["@function.method"] = { link = "@function" },
	["@function.method.call"] = { link = "@function.call" },

	["@constructor"] = { link = "Identifier" },
	["@operator"] = { link = "Operator" },

	["@keyword"] = { link = "Keyword" },
	["@keyword.coroutine"] = { link = "Keyword" },
	["@keyword.function"] = { link = "Function" },
	["@keyword.operator"] = { link = "Operator" },
	["@keyword.import"] = { link = "Include" },
	["@keyword.storage"] = { link = "Keyword" },
	["@keyword.repeat"] = { link = "Repeat" },
	["@keyword.return"] = { link = "Keyword" },
	["@keyword.debug"] = { link = "Debug" },
	["@keyword.exception"] = { link = "Exception" },

	["@keyword.conditional"] = { link = "Conditional" },
	["@keyword.conditional.ternary"] = { link = "Conditional" },
	["@keyword.directive"] = { link = "PreProc" },
	["@keyword.directive.define"] = { link = "PreProc" },

	["@punctutation.delimiter"] = { link = "Delimiter" },
	["@punctutation.bracket"] = { link = "Delimiter" },
	["@punctutation.special"] = { link = "Delimiter" },

	["@comment"] = { link = "Comment" },
	["@comment.documentation"] = { link = "Comment" },

	["@comment.warning"] = { link = "WarningMsg" },
	["@comment.error"] = { link = "Error" },
	["@comment.todo"] = { link = "Todo" },
	["@comment.note"] = { link = "SpecialComment" },

	["@markup.strong"] = { bold = true },
	["@markup.emphasis"] = { italic = true },
	["@markup.underline"] = { underline = true },
	["@markup.strike"] = { strikethrough = true },

	["@markup.heading"] = { link = "Title" },
	["@markup.heading.gitcommit"] = { link = "@spell" },

	["@markup.quote"] = { link = "Comment" },
	["@markup.math"] = { link = "Special" },
	["@markup.environment"] = { link = "Macro" },

	["@markup.link"] = { link = "Underlined" },
	["@markup.link.label"] = { link = "SpecialChar" },
	["@markup.link.url"] = { link = "Keyword" },

	["@markup.raw"] = { link = "SpecialComment" },
	["@markup.raw.block"] = {},

	["@markup.list"] = { link = "Identifier" },
	["@markup.list.checked"] = { link = "Comment" },
	["@markup.list.unchecked"] = { link = "Identifier" },

	["@tag"] = { link = "Label" },
	["@tag.delimiter"] = { link = "Delimiter" },
	["@tag.attribute"] = { link = "Identifier" },

	["@diff.plus"] = { link = "DiffAdd" },
	["@diff.minus"] = { link = "DiffDelete" },
	["@diff.delta"] = { link = "DiffChange" },

	["@string.documentation.python"] = { link = "Comment" },

	["@keyword.function.julia"] = { bold = true },
	--}}}
	-- quickscope.vim {{{
	QuickScopeCursor = { link = "Cursor" },
	QuickScopePrimary = { link = "Search" },
	QuickScopeSecondary = { link = "IncSearch" },
	--}}}
	-- mini.nvim {{{
	MiniStarterFooter = { link = "Normal" },
	MiniStarterHeader = { link = "Normal" },
	MiniStarterSection = { link = "Normal" },
	--}}}
	-- gitsigns.nvim{{{
	GitSignsAdd = { link = "Added" },
	GitSignsChange = { link = "Changed" },
	GitSignsDelete = { link = "Removed" },
	GitSignsAddNr = { link = "Added" },
	GitSignsChangeNr = { link = "Changed" },
	GitSignsDeleteNr = { link = "Removed" },
	GitSignsAddLn = { link = "Added" },
	GitSignsChangeLn = { link = "Changed" },
	GitSignsDeleteLn = { link = "Removed" },
	--}}}
	-- telescope.nvim {{{
	TelescopeSelection = { link = "CursorLine" },
	--}}}
	-- whichkey.nvim {{{
	WhichKey = { link = "NormalFloat" },
	WhichKeyDesc = { link = "WhichKey" },
	WhichKeyFloat = { link = "WhichKey" },
	WhichKeyGroup = { link = "Operator" },
	WhichKeyValue = { link = "Operator" },
	WhichKeyBorder = { link = "WhichKey" },
	WhichKeySeparator = { link = "Constant" },
	--}}}
	-- oil.nvim {{{
	OilDir = { link = "Special" },
	OilCopy = { link = "Function" },
	OilMove = { link = "Function" },
	OilPurge = { link = "Function" },
	OilTrash = { link = "String" },
	OilChange = { link = "Change" },
	OilCreate = { link = "Add" },
	OilDelete = { link = "Removed" },
	OilSocket = { link = "Constant" },
	OilDirIcon = { link = "OilDir" },
	OilRestore = { link = "Function" },
	OilLinkTarget = { link = "Underline" },
	OilTrashSourcePath = { link = "Normal" },
	--}}}
	-- sidebar {{{
	NormalSB = { fg = palette.norm, bg = palette.oob },
	SignColumnSB = { fg = palette.norm, bg = palette.oob },
	WinSeparatorSB = { fg = palette.norm, bg = palette.oob },
	--}}}
}

-- Autocommands (source: https://github.com/folke/tokyonight.nvim/blob/f9e738e2dc78326166f11c021171b2e66a2ee426/lua/tokyonight/util.lua#L67)
local augroup = vim.api.nvim_create_augroup("patana", { clear = true })
vim.api.nvim_create_autocmd("ColorSchemePre", {
	group = augroup,
	callback = function()
		vim.api.nvim_del_augroup_by_id(augroup)
	end,
})

local function set_whl()
	local win = vim.api.nvim_get_current_win()
	local whl = vim.split(vim.wo[win].winhighlight, ",")
	vim.list_extend(whl, { "Normal:NormalSB", "SignColumn:SignColumnSB", "WinSeparator:WinSeparatorSB" })
	whl = vim.tbl_filter(function(hl)
		return hl ~= ""
	end, whl)
	vim.opt_local.winhighlight = table.concat(whl, ",")
end

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "qf", "lazy", "mason", "help", "oil", "undotree", "diff", "gitcommit" },
	callback = set_whl,
})
vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup,
	callback = set_whl,
})

for group, highlight in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, group, highlight)
end
