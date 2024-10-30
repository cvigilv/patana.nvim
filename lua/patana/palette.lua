M = {}

function M.generate_palette()
	local colors = require("patana.colors")

  -- stylua: ignore start
  local palette
  if vim.o.background == "dark" then
    palette = {
      -- Normal
      bg             = vim.g.patana_high_contrast and colors["00"] or colors["01"],
      bg_subtle      = vim.g.patana_high_contrast and colors["01"] or colors["02"],
      bg_very_subtle = vim.g.patana_high_contrast and colors["02"] or colors["03"],
      fg             = vim.g.patana_high_contrast and colors["11"] or colors["10"],
      fg_subtle      = vim.g.patana_high_contrast and colors["10"] or colors["09"],
      fg_very_subtle = vim.g.patana_high_contrast and colors["09"] or colors["08"],

      -- Colors
      primary        = colors["16"],
      secondary      = colors["13"],
      accent         = colors["19"],

      -- Special
      cursor_line    = vim.g.patana_high_contrast and colors["01"] or colors["00"],
      comment        = colors["04"],
      oob            = colors["00"],
      search         = colors["13"],
      contrasting    = colors["19"],
    }
  else
    palette = {
      -- Normal
      bg             = vim.g.patana_high_contrast and colors["11"] or colors["10"],
      bg_subtle      = vim.g.patana_high_contrast and colors["10"] or colors["09"],
      bg_very_subtle = vim.g.patana_high_contrast and colors["09"] or colors["08"],
      fg             = vim.g.patana_high_contrast and colors["00"] or colors["02"],
      fg_subtle      = vim.g.patana_high_contrast and colors["01"] or colors["03"],
      fg_very_subtle = vim.g.patana_high_contrast and colors["02"] or colors["04"],

      -- Colors
      primary        = colors["13"],
      secondary      = colors["16"],
      accent         = colors["19"],

      -- Special
      cursor_line    = vim.g.patana_high_contrast and colors["11"] or colors["10"],
      comment        = colors["07"],
      oob            = colors["11"],
      search         = colors["13"],
      contrasting    = colors["19"],
    }
  end
	-- stylua: ignore end

	return palette
end

return M
