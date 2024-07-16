---@module 'patana'
---@author Carlos Vigil-Vásquez
---@license MIT

-- NOTE: The aim is the following:
--       - Mainly monochrome, with color for literals (`literal`) and errors (`error`)
--       - Things that require my attention should be in *bold* typeface
--       - Things that don't require my attention should be in *italic* typeface
--       - UI stuff that require attention should be highlighted with accent color
--       - Visual and search will have a "highlighter" style background (`visual`)
--       - Diff status also colored, but it should be subtle

vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then
	vim.cmd.syntax("reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "patana"

-- Constants
local DEFAULT_ORDER = { "greens", "oranges", "purples" }

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
if vim.g.patana_color_order == nil then
	vim.g.patana_color_order = DEFAULT_ORDER
end

local colors = {
	grays = {
		["000"] = "#000000",
		["050"] = "#0E0E0E",
		["100"] = "#1C1C1C", -- darker
		["150"] = "#2A2A29",
		["200"] = "#393837",
		["250"] = "#474645",
		["300"] = "#555453", -- dark
		["350"] = "#636261",
		["400"] = "#71706F",
		["450"] = "#807F7D",
		["500"] = "#8E8D8A", -- normal
		["550"] = "#9C9B98",
		["600"] = "#AAA9A6",
		["650"] = "#B8B7B4",
		["700"] = "#C6C5C2", -- light
		["750"] = "#D5D3D0",
		["800"] = "#E3E1DD",
		["850"] = "#F1EFEB",
		["900"] = "#FFFDF9", -- lighter
	},
	greens = {
		["100"] = "#182612", -- darker
		["200"] = "#304d23",
		["300"] = "#487335", -- dark
		["400"] = "#609a47",
		["500"] = "#7bb662", -- normal
		["600"] = "#96c581",
		["700"] = "#b0d4a1", -- light
		["800"] = "#cae2c0",
		["900"] = "#e5f1e0", -- lighter
	},
	oranges = {
		["100"] = "#361903", -- darker
		["200"] = "#6b3105",
		["300"] = "#a14a08", -- dark
		["400"] = "#d6630a",
		["500"] = "#f58024", -- normal
		["600"] = "#f79850",
		["700"] = "#f9b27b", -- light
		["800"] = "#fbcca7",
		["900"] = "#fde5d3", -- lighter
	},

	purples = {
		["100"] = "#1e1023", -- darker
		["200"] = "#3d1f47",
		["300"] = "#5b2f6a", -- dark
		["400"] = "#7a3e8e",
		["500"] = "#994fb2", -- normal
		["600"] = "#ad71c1",
		["700"] = "#c195d0", -- light
		["800"] = "#d6b8e0",
		["900"] = "#eadcef", -- lighter
	},
}

local contrasting = {
	greens = { fg = colors.grays["000"], bg = colors.greens["700"] },
	oranges = { fg = colors.grays["000"], bg = colors.oranges["700"] },
	purples = { fg = colors.grays["900"], bg = colors.purples["700"] },
}

-- Setup colors to use
local primary
local secondary
local accent

local is_color_order_valid = function(order)
	if #order ~= 3 then
		return
	end

	for _, color in ipairs(order) do
		if not vim.tbl_contains(DEFAULT_ORDER, color) then
			vim.notify("patana.nvim :: '" .. color .. "' is not a valid color", vim.log.levels.ERROR)
			return
		end
	end

	return true
end

if is_color_order_valid(vim.g.patana_color_order) then
	primary = vim.g.patana_color_order[1]
	secondary = vim.g.patana_color_order[2]
	accent = vim.g.patana_color_order[3]
else
	vim.notify("patana.nvim :: Invalid color order setup, falling back to default", vim.log.levels.ERROR)
	primary = DEFAULT_ORDER[1]
	secondary = DEFAULT_ORDER[2]
	accent = DEFAULT_ORDER[3]
end

-- stylua: ignore start
local palette
if vim.o.background == "dark" then
	palette = {
    -- Normal
		bg               = colors.grays["100"],
		bg_subtle        = colors.grays["150"],
		bg_very_subtle   = colors.grays["250"],
		norm             = colors.grays["850"],
		norm_subtle      = colors.grays["800"],
		norm_very_subtle = colors.grays["700"],

    -- Colors
		primary          = colors[primary]["500"],
		secondary        = colors[secondary]["500"],
		accent           = colors[accent]["500"],

    -- Special
		cursor_line      = colors.grays["150"],
		comment          = colors.grays["450"],
		oob              = colors.grays["000"],
    search           = colors.oranges["100"],
	}
else
	palette = {
		-- Normal
		bg               = colors.grays["850"],
		bg_subtle        = colors.grays["800"],
		bg_very_subtle   = colors.grays["700"],
		norm             = colors.grays["050"],
		norm_subtle      = colors.grays["100"],
		norm_very_subtle = colors.grays["200"],

		-- Colors
		primary          = colors[primary]["500"],
		secondary        = colors[secondary]["500"],
		accent           = colors[accent]["500"],

		-- Special
		cursor_line      = colors.grays["800"],
		comment          = colors.grays["450"],
		oob              = colors.grays["900"],
		search           = colors.oranges["800"],
	}
end

local hlgroups = {
	-- normal {{{
	Normal         = { fg = palette.norm, bg = palette.bg },
	NormalFloat    = { fg = palette.norm, bg = palette.bg_subtle },
	NormalBorder   = { link = "NormalFloat" },

	Comment        = { fg = palette.comment, italic = true },
	SpecialComment = { link = "Comment" },

	--}}}
	-- constant literals {{{
	Constant  = { fg = palette.primary },
	Character = { link = "Constant" },
	Number    = { link = "Constant" },
	Boolean   = { link = "Constant" },
	Float     = { link = "Constant" },
	String    = { link = "Constant" },
	Directory = { link = "Constant" },
	Title     = { link = "Constant" },
	--}}}
	-- syntax {{{
	Function   = { fg = palette.norm, bold = true },
	Identifier = { link = "Function" },

	Statement  = { bold = true },
	Conditonal = { link = "Statement" },
	Repeat     = { link = "Statement" },
	Label      = { link = "Statement" },
	Keyword    = { link = "Statement" },
	Exception  = { link = "Statement" },

	PreProc   = { bold = true },
	Include   = { link = "PreProc" },
	Define    = { link = "PreProc" },
	Macro     = { link = "PreProc" },
	PreCondit = { link = "PreProc" },

	Type         = { bg = palette.bg_subtle},
	StorageClass = { link = "Type" },
	Structure    = { link = "Type" },
	Typedef      = { link = "Type" },

	Operator = { fg = palette.norm_very_subtle },
	Debug    = { link = "Operator" },

	Special     = { italic = true },
	SpecialChar = { link = "Special" },
	Tag         = { link = "Special" },
	Delimiter   = { link = "Special" },

	Critical   = { fg = palette.bg, bg = palette.accent, bold = true },
	Error      = { reverse = true, bold = true },
	Ignore     = { fg = palette.norm_very_subtle },
	Todo       = { fg = palette.accent, italic = true },
	Underlined = { underline = true },
	--}}}
	-- spell {{{
	SpellBad                    = { undercurl = true, sp = palette.norm },
	SpellCap                    = { link      = "SpellBad" },
	SpellLocal                  = { link      = "SpellBad" },
	SpellRare                   = { link      = "SpellBad" },
	--}}}
	-- ui {{{
	ColorColumn       = { link = "CursorLine" },
	Conceal           = { link = "Comment" },
	CurSearch         = { link = "Search" },
	Cursor            = { fg = palette.bg, bg = palette.accent },
	CursorColumn      = { link = "CursorLine" },
	CursorLine        = { bg = palette.cursor_line },
	CursorLineNr      = { fg = palette.norm, bg = palette.cursor_line, bold = true },
	EndOfBuffer       = { link = "Normal" },
	ErrorMsg          = { fg = palette.accent, bold = true },
	FloatBorder       = { fg = palette.norm_subtle, bg = palette.bg_subtle },
	FloatTitle        = { fg = palette.norm_subtle, bg = palette.bg_subtle, bold = true, underline = true },
	FoldColumn        = { link = "SignColumn" },
	Folded            = { fg = palette.norm, bg = palette.bg, bold = true },
	IncSearch         = { link = "Search" },
	LineNr            = { fg = palette.bg_very_subtle },
	MatchParen        = { reverse = true },
	ModeMsg           = { fg = palette.norm, bold = true },
	MoreMsg           = { fg = palette.norm, bold = true },
	MsgArea           = { fg = palette.norm, bg = palette.bg_very_subtle },
	NonText           = { fg = palette.norm_very_subtle },
	NormalNC          = { link = "Normal" },
	NvimInternalError = { link = "ErrorMsg" },
	Pmenu             = { bg = palette.bg_subtle },
	PmenuSbar         = { bg = palette.bg_subtle, reverse = true },
	PmenuKind         = { fg = palette.primary, bg = palette.bg_subtle },
	PmenuSel          = { fg = palette.norm, bg = palette.bg_subtle, reverse = true, bold = true },
	PmenuKindSel      = { fg = palette.primary, bg = palette.bg_subtle, reverse= true, bold = true, },
	Question          = { bold = true },
	QuickFixLine      = { link = "Search" },
	Search            = { bg = palette.search },
	SignColumn        = { bg = palette.bg, fg = palette.norm, bold = true },
	SpecialKey        = { fg = palette.norm_subtle },
	StatusLine        = vim.tbl_extend("force", contrasting[primary], { bold = true }),
	StatusLineNC      = contrasting[primary],
	StatusLineTerm    = { link = "StatusLine" },
	StatusLineTermNC  = { link = "StatusLineNC" },
	Substitute        = { link = "Search" },
	TabLine           = { fg = palette.norm_very_subtle, bg = palette.bg_very_subtle },
	TabLineFill       = { bg = palette.oob },
	TabLineSel        = { fg = palette.norm, bg = palette.bg, bold = true },
	Visual            = { fg = palette.bg, bg = palette.primary },
	WarningMsg        = { fg = palette.critical, bold = true },
	WildMenu          = { link = "Search" },
	WinBar            = { link = "StatusLine" },
	WinBarNC          = { link = "StatusLineNc" },
	WinSeparator      = { fg = palette.norm, bg = palette.bg },
	--}}}
	-- diagnostics {{{
	DiagnosticDeprecated        = { strikethrough  =  true },
	DiagnosticOk                = { fg = palette.norm, bold = true },

	DiagnosticError             = { fg = palette.accent, bold = true },
	DiagnosticDefaultError      = { link = "DiagnosticError" },
	DiagnosticFloatingError     = { link = "DiagnosticError" },
	DiagnosticSignError         = { link = "DiagnosticError" },
	DiagnosticVirtualTextError  = { link = "DiagnosticError" },

	DiagnosticWarn              = { fg = palette.secondary, bold = true },
	DiagnosticDefaultWarn       = { link = "DiagnosticWarn" },
	DiagnosticFloatingWarn      = { link = "DiagnosticWarn" },
	DiagnosticSignWarn          = { link = "DiagnosticWarn" },
	DiagnosticVirtualTextWarn   = { link = "DiagnosticWarn" },

	DiagnosticHint              = { fg = palette.primary, bold = true },
	DiagnosticDefaultHint       = { link = "DiagnosticHint" },
	DiagnosticFloatingHint      = { link = "DiagnosticHint" },
	DiagnosticSignHint          = { link = "DiagnosticHint" },
	DiagnosticVirtualTextHint   = { link = "DiagnosticHint" },

	DiagnosticInfo              = { fg = palette.norm, bold = true },
	DiagnosticDefaultInfo       = { link = "DiagnosticInfo" },
	DiagnosticFloatingInfo      = { link = "DiagnosticInfo" },
	DiagnosticSignInfo          = { link = "DiagnosticInfo" },
	DiagnosticVirtualTextInfo   = { link = "DiagnosticInfo" },

	DiagnosticUnderlineError    = { sp = palette.accent,    undercurl = true, bold = true },
	DiagnosticUnderlineWarn     = { sp = palette.secondary, undercurl = true, bold = true },
	DiagnosticUnderlineHint     = { sp = palette.primary,   undercurl = true, bold = true },
	DiagnosticUnderlineInfo     = { sp = palette.info,      undercurl = true, bold = true },
	DiagnosticUnderlineOk       = { sp = palette.norm,      undercurl = true, bold = true },
	--}}}
	-- diff {{{
	Added            = { fg = colors.greens["100"], bg = colors.greens["900"], reverse = vim.o.background == "dark" },
	DiffAdd          = { link = "Added" },
	DiffAddGutter    = { link = "Added" },
	GitAdd           = { link = "Added" },

	Changed          = { fg = colors.oranges["100"], bg = colors.oranges["900"], reverse = vim.o.background == "dark" },
	DiffChange       = { link = "Changed" },
	DiffChangeGutter = { link = "Changed" },
	GitChange        = { link = "Changed" },

	Deleted          = { fg = colors.purples["100"], bg = colors.purples["900"], reverse = vim.o.background == "dark" },
	DiffDelete       = { link = "Deleted" },
	DiffDeleteGutter = { link = "Removed" },
	GitDelete        = { link = "Removed" },

	Removed          = { fg = colors.purples["100"], bg = colors.purples["900"], reverse = vim.o.background == "dark" },
	DiffRemoved      = { link = "Removed" },
	--}}}
	-- treesitter {{{
	["@string.documentation"]   = { link = "Comment" },
	["@keyword.function.julia"] = { bold = true },
	--}}}
	-- quickscope.vim {{{
	QuickScopeCursor            = { link = "Cursor" },
	QuickScopePrimary           = { link = "Search" },
	QuickScopeSecondary         = { link = "IncSearch" },
	--}}}
	-- mini.nvim {{{
	MiniStarterFooter           = { link = "Normal" },
	MiniStarterHeader           = { link = "Normal" },
	MiniStarterSection          = { link = "Normal" },
	--}}}
	-- gitsigns.nvim {{{
	GitSignsAdd      = { link = "Added" },
	GitSignsAddNr    = { link = "Added" },
	GitSignsAddLn    = { link = "Added" },

	GitSignsChange   = { link = "Changed" },
	GitSignsChangeNr = { link = "Changed" },
	GitSignsChangeLn = { link = "Changed" },

	GitSignsDelete   = { link = "Removed" },
	GitSignsDeleteNr = { link = "Removed" },
	GitSignsDeleteLn = { link = "Removed" },
	--}}}
	-- telescope.nvim {{{
	TelescopeSelection = { link = "CursorLine" },
	--}}}
	-- whichkey.nvim {{{
	WhichKey          = { link = "NormalFloat" },
	WhichKeyDesc      = { link = "WhichKey" },
	WhichKeyFloat     = { link = "WhichKey" },
	WhichKeyGroup     = { link = "Operator" },
	WhichKeyValue     = { link = "Operator" },
	WhichKeyBorder    = { link = "WhichKey" },
	WhichKeySeparator = { link = "Constant" },
	--}}}
	-- oil.nvim {{{
	OilDir             = { link = "Special" },
	OilCopy            = { link = "Function" },
	OilMove            = { link = "Function" },
	OilPurge           = { link = "Function" },
	OilTrash           = { link = "String" },
	OilChange          = { link = "Change" },
	OilCreate          = { link = "Add" },
	OilDelete          = { link = "Removed" },
	OilSocket          = { link = "Constant" },
	OilDirIcon         = { link = "OilDir" },
	OilRestore         = { link = "Function" },
	OilLinkTarget      = { link = "Underline" },
	OilTrashSourcePath = { link = "Normal" },
	--}}}
	-- sidebar {{{
	NormalSB       = { fg =  palette.norm, bg = palette.oob },
	SignColumnSB   = { fg =  palette.norm, bg = palette.oob },
	WinSeparatorSB = { fg =  palette.norm, bg = palette.oob },
	--}}}
}
-- stylua: ignore end

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
