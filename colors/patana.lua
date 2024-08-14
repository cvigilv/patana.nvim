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

-- Configuration
vim.g.patana_primary_color = vim.g.patana_primary_color or "greens"
vim.g.patana_secondary_color = vim.g.patana_secondary_color or "oranges"
vim.g.patana_accent_color = vim.g.patana_accent_color or "purples"
vim.g.patana_high_contrast = vim.g.patana_high_contrast or false
vim.g.patana_colored_statusline = vim.g.patana_colored_statusline or false

-- Setup
local augroup = vim.api.nvim_create_augroup("patana", { clear = true })
vim.api.nvim_create_autocmd("ColorSchemePre", {
	group = augroup,
	callback = function()
		vim.api.nvim_del_augroup_by_id(augroup)
	end,
})

local all_hlgroups = {
	require("patana.hlgroups.nvim"),
	require("patana.hlgroups.gitsigns"),
	require("patana.hlgroups.mini"),
	require("patana.hlgroups.oil"),
	require("patana.hlgroups.quickscope"),
	require("patana.hlgroups.telescope"),
	require("patana.hlgroups.whichkey"),
}

for _, hlgroups in pairs(all_hlgroups) do
	for group, highlight in pairs(hlgroups.get()) do
		vim.api.nvim_set_hl(0, group, highlight)
	end
end
