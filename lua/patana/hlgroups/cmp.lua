M = {}

function M.get()
	local palette = require("patana.palette").generate_palette()

	return {
		CmpItemAbbrDeprecated = { strikethrough = true },
		CmpItemAbbrMatch = { fg = palette.primary, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = palette.primary, bold = true },
		CmpItemMenu = { link = "Comment" },

		CmpItemKindClass = { link = "Class" },
		CmpItemKindColor = { link = "Color" },
		CmpItemKindConstant = { link = "Constant" },
		CmpItemKindConstructor = { link = "Constructor" },
		CmpItemKindEnum = { link = "Enum" },
		CmpItemKindEnumMember = { link = "EnumMember" },
		CmpItemKindEvent = { link = "Event" },
		CmpItemKindField = { link = "Field" },
		CmpItemKindFile = { link = "File" },
		CmpItemKindFolder = { link = "Folder" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindInterface = { link = "Interface" },
		CmpItemKindKeyword = { link = "Keyword" },
		CmpItemKindMethod = { link = "Method" },
		CmpItemKindModule = { link = "Module" },
		CmpItemKindOperator = { link = "Operator" },
		CmpItemKindProperty = { link = "Property" },
		CmpItemKindReference = { link = "Reference" },
		CmpItemKindSnippet = { link = "Snippet" },
		CmpItemKindStruct = { link = "Struct" },
		CmpItemKindText = { link = "Text" },
		CmpItemKindTypeParameter = { link = "TypeParameter" },
		CmpItemKindUnit = { link = "Unit" },
		CmpItemKindValue = { link = "Value" },
		CmpItemKindVariable = { link = "Variable" },
	}
end

return M
