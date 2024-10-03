--[[
    2. Selected/Focused State:
       - CursorLine        cursorline
       - CursorLineNr      cursorline + accent
       - Visual
       - PmenuSel          UICurrent
       - PmenuKindSel      UICurrent + accent
       - TabLineSel        UICurrent

    3. Unselected/Unfocused State:
       - LineNr            UICurrent + accent
       - Pmenu             UI
       - PmenuKind         UI + accent
       - TabLine           UI

    ...

    5. Status and Information:
       - StatusLine        UI + accent
       - StatusLineNC      UI
       - ModeMsg           OOB + comment
       - MoreMsg           OOB + comment
       - Question          OOB + accent

    ...

    8. Special UI Elements:
       - Cursor            Inverted Normal
       - ColorColumn       Inverted comment
       - SignColumn        UI
       - FoldColumn        UI
       - Folded            UICurrent + accent

    9. Popup and Float:
       - Pmenu             UI
       - PmenuSbar         UI inverted
       - FloatBorder
       - FloatTitle
    --]]

M = {}

function M.get()
	local palette = require("patana.palette").generate_palette()

	return {
		-- Text
		PatanaNormal = {},
		PatanaAccent = {},
		PatanaLight = {},

		-- UI
		PatanaUIFocused = {},
		PatanaUIFocusedAccent = {},
		PatanaUIFocusedLight = {},
		PatanaUIUnfocused = {},
		PatanaUIUnfocusedAccent = {},
		PatanaUIUnfocusedLight = {},

		-- Misc UI
		PatanaCursor = { reverse = true },
		PatanaColorColumn = {},
		PatanaSignColumn = {},
		PatanaFoldColumn = {},
		PatanaFolded = {},
		PatanaOutOfBounds = {},

		-- Popup/Float:
		PatanaFloatNormal = {},
		PatanaFloatAccent = {},
		PatanaFloatLight = {},
	}
end

return M
