M = {}

function M.generate_palette()
	local colors = require("patana.colors")

  -- stylua: ignore start
  local palette
  if vim.o.background == "dark" then
    palette = {
      -- Normal
      bg             = vim.g.patana_high_contrast and colors.blacks["900"] or colors.blacks["800"],
      bg_subtle      = vim.g.patana_high_contrast and colors.blacks["800"] or colors.blacks["700"],
      bg_very_subtle = vim.g.patana_high_contrast and colors.blacks["700"] or colors.blacks["600"],
      fg             = vim.g.patana_high_contrast and colors.whites["800"] or colors.whites["800"],
      fg_subtle      = vim.g.patana_high_contrast and colors.whites["700"] or colors.whites["700"],
      fg_very_subtle = vim.g.patana_high_contrast and colors.whites["600"] or colors.whites["600"],

      -- Colors
      primary        = colors[vim.g.patana_primary_color]["600"],
      secondary      = colors[vim.g.patana_secondary_color]["600"],
      accent         = colors[vim.g.patana_accent_color]["600"],

      -- Special
      cursor_line    = vim.g.patana_high_contrast and colors.blacks["850"] or colors.blacks["750"],
      comment        = colors.whites["000"],
      oob            = colors.blacks["900"],
      search         = colors[vim.g.patana_primary_color]["200"],
      contrasting    = colors[vim.g.patana_primary_color]["700"],
    }
  else
    palette = {
      -- Normal
      bg             = vim.g.patana_high_contrast and colors.whites["900"] or colors.whites["800"],
      bg_subtle      = vim.g.patana_high_contrast and colors.whites["800"] or colors.whites["700"],
      bg_very_subtle = vim.g.patana_high_contrast and colors.whites["700"] or colors.whites["600"],
      fg             = vim.g.patana_high_contrast and colors.blacks["800"] or colors.blacks["800"],
      fg_subtle      = vim.g.patana_high_contrast and colors.blacks["700"] or colors.blacks["700"],
      fg_very_subtle = vim.g.patana_high_contrast and colors.blacks["600"] or colors.blacks["600"],

      -- Colors
      primary        = colors[vim.g.patana_primary_color]["400"],
      secondary      = colors[vim.g.patana_secondary_color]["400"],
      accent         = colors[vim.g.patana_accent_color]["400"],

      -- Special
      cursor_line    = vim.g.patana_high_contrast and colors.whites["850"] or colors.whites["750"],
      comment        = colors.blacks["000"],
      oob            = colors.whites["900"],
      search         = colors[vim.g.patana_primary_color]["800"],
      contrasting    = colors[vim.g.patana_primary_color]["700"],
    }
  end
	-- stylua: ignore end

	return palette
end

return M
