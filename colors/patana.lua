---@module 'patana'
---@author Carlos Vigil-Vásquez
---@license MIT

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then
	vim.cmd.syntax("reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "patana"

-- Configuration
vim.g.patana_sidebar_filetypes = {
	"qf",
	"lazy",
	"mason",
	"help",
	"oil",
	"undotree",
	"diff",
	"gitcommit",
}

local colors = require("patana.colors")
local contrasting = {
	greens = { fg = colors.grays["000"], bg = colors.greens["700"] },
	oranges = { fg = colors.grays["000"], bg = colors.oranges["700"] },
	purples = { fg = colors.grays["900"], bg = colors.purples["700"] },
}

-- stylua: ignore start
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

		visual = colors.greens["200"],
		literal = colors.purples["700"],

		error = colors.purples["400"],
		warn = colors.oranges["400"],
		hint = colors.greens["400"],
		info = colors.grays["850"],
		ok = colors.grays["850"],
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

		visual = colors.oranges["800"],
		literal = colors.greens["500"],

		error = colors.purples["600"],
		warn = colors.oranges["600"],
		hint = colors.greens["600"],
		info = colors.grays["050"],
		ok = colors.grays["050"],
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

	Type = { underline = true },
	StorageClass = { link = "Type" },
	Structure = { link = "Type" },
	Typedef = { link = "Type" },

	Operator = { fg = palette.accent },
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
	Added = { fg = colors.greens["100"], bg = colors.greens["900"], reverse = vim.o.background == "dark" },
	Changed = { fg = colors.oranges["100"], bg = colors.oranges["900"], reverse = vim.o.background == "dark" },
	Removed = { fg = colors.purples["100"], bg = colors.purples["900"], reverse = vim.o.background == "dark" },
	Deleted = { fg = colors.purples["100"], bg = colors.purples["900"], reverse = vim.o.background == "dark" },

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
	["@string.documentation"] = { link = "Comment" },
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
	pattern = vim.g.patana_sidebar_filetypes,
	callback = set_whl,
})
vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup,
	callback = set_whl,
})

for group, highlight in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, group, highlight)
end
