M = {}

function M.generate_palette()
	local colors = require("patana.colors")

  -- stylua: ignore start
  local palette
  if vim.o.background == "dark" then
    palette = {
      -- Normal
      bg               = vim.g.patana_high_contrast and colors.grays["000"] or colors.grays["100"],
      bg_subtle        = vim.g.patana_high_contrast and colors.grays["050"] or colors.grays["150"],
      bg_very_subtle   = vim.g.patana_high_contrast and colors.grays["150"] or colors.grays["250"],
      norm             = vim.g.patana_high_contrast and colors.grays["900"] or colors.grays["850"],
      norm_subtle      = colors.grays["800"],
      norm_very_subtle = colors.grays["700"],

      -- Colors
      primary          = colors[vim.g.patana_primary_color]["600"],
      secondary        = colors[vim.g.patana_secondary_color]["600"],
      accent           = colors[vim.g.patana_accent_color]["600"],

      -- Special
      cursor_line      = vim.g.patana_high_contrast and colors.grays["050"] or colors.grays["150"],
      comment          = colors.grays["450"],
      oob              = colors.grays["000"],
      search           = colors[vim.g.patana_primary_color]["200"],
      contrasting      = colors[vim.g.patana_primary_color]["700"],
    }
  else
    palette = {
      -- Normal
      bg               = vim.g.patana_high_contrast and colors.grays["900"] or colors.grays["850"],
      bg_subtle        = colors.grays["800"],
      bg_very_subtle   = colors.grays["700"],
      norm             = vim.g.patana_high_contrast and colors.grays["000"] or colors.grays["050"],
      norm_subtle      = colors.grays["100"],
      norm_very_subtle = colors.grays["200"],

      -- Colors
      primary          = colors[vim.g.patana_primary_color]["400"],
      secondary        = colors[vim.g.patana_secondary_color]["400"],
      accent           = colors[vim.g.patana_accent_color]["400"],

      -- Special
      cursor_line      = vim.g.patana_high_contrast and colors.grays["850"] or  colors.grays["800"],
      comment          = colors.grays["450"],
      oob              = colors.grays["900"],
      search           = colors[vim.g.patana_primary_color]["800"],
      contrasting      = colors[vim.g.patana_primary_color]["700"],
    }
  end
	-- stylua: ignore end

	return palette
end

return M
