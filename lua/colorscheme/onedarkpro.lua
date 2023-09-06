local onedarkpro = require("onedarkpro")
local colors = require("onedarkpro.helpers")

local c = {
	background = "dark",
	bg = "#282c34",
	bg_statusline = "#22262d",
	black = "#282c34",
	gray = "#5c6370",
	white = "#abb2bf",
	fg = "#abb2bf",
	blue = "#61afef",
	cyan = "#56b6c2",
	dark_green = "#109868",
	green = "#98c379",
	orange = "#d19a66",
	purple = "#c678dd",
	red = "#e06c75",
	yellow = "#e5c07b",
	color_column = "#2d313b",
	comment = "#7f848e",
	cursorline = "#2d313b",
	diff_add = "#003e4a",
	diff_delete = "#501b20",
	diff_text = "#005869",
	fg_gutter = "#3d4350",
	fg_gutter_inactive = "#abb2bf",
	float_bg = "#21252b",
	fold = "#30333d",
	git_add = "#109868",
	git_change = "#948B60",
	git_delete = "#9a353d",
	git_hunk_add = "#43554d",
	git_hunk_add_inline = "#3f534f",
	git_hunk_change_inline = "#41483d",
	git_hunk_delete = "#502d30",
	git_hunk_delete_inline = "#6f2e2d",
	highlight = "#e2be7d",
	indentline = "#3b4048",
	inlay_hint = "#4c525c",
	line_number = "#495162",
	selection = "#414858",
	virtual_text_error = "#e8939a",
	virtual_text_hint = "#7ec7d1",
	virtual_text_information = "#90c7f4",
	virtual_text_warning = "#edd2a1",
}

onedarkpro.setup({
	colors = {
		dark = {
			telescope_prompt = colors.darken("bg", 1, "onedark"),
			telescope_results = colors.darken("bg", 4, "onedark"),
			telescope_preview = colors.darken("bg", 6, "onedark"),
			telescope_selection = colors.darken("bg", 8, "onedark"),
		},
		light = {
			telescope_prompt = colors.darken("bg", 2, "onelight"),
			telescope_results = colors.darken("bg", 5, "onelight"),
			telescope_preview = colors.darken("bg", 7, "onelight"),
			telescope_selection = colors.darken("bg", 9, "onelight"),
		},
	},
	highlights = {
		-- common:
		-- vim 错误信息
		ErrorMsg = { fg = c.blue },
		WarningMsg = { fg = c.yellow },
		-- nvim-cmp 滚动条颜色
		PmenuThumb = { fg = c.none, bg = c.purple },
		CursorLineNr = { fg = c.fg, bg = c.diff_add, bold = true },
		IndentBlanklineContextChar = { fg = c.white, bold = true },
		--
		-- -- syntax:
		-- "int float double"
		Type = { fg = c.fg },
		--
		-- "struct"
		Structure = { fg = c.cyan },
		--
		Identifier = { fg = c.yellow },
		Keyword = { fg = c.dark_yellow },
		-- 'if else then'
		Conditional = { fg = c.purple, bold = true },

		-- 'while for'
		Repeat = { fg = c.purple, bold = true },

		Macro = { fg = c.orange },
		Special = { fg = c.yellow },

		-- "%d %p \n"
		SpecialChar = { fg = c.red },
		property = { fg = c.red },

		-- treesitter:
		["@comment"] = { fg = c.gray, italic = true },
		--
		-- -- "if then else "
		-- ["@conditional"] = { fg = "$code_grey" },
		["@conditional"] = { fg = c.purple, italic = true },
		--
		["@constant"] = { fg = c.orange },

		-- 枚举变量成员
		["@constant.builtin"] = { fg = c.dark_red },

		["@keyword"] = { fg = c.cyan },

		["@keyword.function"] = { fg = c.fg },

		-- 函数参数变量名称
		["@parameter"] = { fg = c.fg },

		-- struct 成员
		["@property"] = { fg = c.light_grey },

		-- "while for"
		-- ["@repeat"] = { fg = "$code_grey" },
		["@repeat"] = { fg = c.purple, italic = true },

		-- 枚举变量名称
		["@type"] = { fg = c.cyan },

		-- 变量
		["@variable"] = { fg = c.fg },

		-- 变量类型
		["@type.builtin"] = { fg = c.fg, bold = true },
		-- const
		["@type.qualifier"] = { fg = c.red },
		--- 括号
		["@punctuation.bracket"] = { fg = c.fg },
		["@string.escape"] = { fg = c.dark_red },
		-- static
		["@StorageClass"] = { fg = c.red },

		-- c return
		["@keyword.return"] = { fg = c.purple, italic = true },

		-- lsp
		--
		["@lsp.type.comment"] = { fg = gray, italic = true },
		["@lsp.type.enum"] = { fg = c.cyan },
		["@lsp.type.class"] = { fg = c.orange, bold = false },
		["@function.builtin"] = { fg = "#0059ff" },
		-- ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
		-- ["@lsp.type.interface"] = hl.treesitter["@type"],
		-- ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
		-- ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
		-- ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
		["@lsp.type.parameter"] = { fg = c.fg, italic = true },
		["@lsp.type.property"] = { fg = c.dark_green, italic = true },
		["@lsp.type.variable"] = { fg = c.fg },
		["@lsp.type.macro"] = { fg = c.cyan },
		-- ["@lsp.type.method"] = hl.treesitter["@method"],
		-- ["@lsp.type.number"] = hl.treesitter["@number"],
		-- ["@lsp.type.generic"] = hl.treesitter["@text"],
		-- ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
		-- ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
		-- ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
		["@operator"] = { fg = c.fg },
		-- ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
		-- ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
		-- ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
		-- ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
		-- ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],

		-- treesitter: TS
		-- TSParameter = { fg = c.fg,italic = true },
		-- TSConditional = { fg = c.fg, fmt = "none" },
		-- TSInclude = { fg = c.yellow },
		-- TSKeyword = { fg = c.dark_yellow, fmt = "bold" },
		-- TSKeywordOperator = { fg = c.fg, fmt = "none" },
		-- TSPunctSpecial = { fg = c.light_grey },
		-- TSRepeat = { fg = c.dark_yellow, fmt = "bold" },
		-- TSStringEscape = { fg = c.light_grey, fmt = "none" },
		-- TSTypeBuiltin = { fg = c.dark_yellow, fmt = "bold" },
		-- TSVariableBuiltin = { fg = c.light_grey, fmt = "none" },
		--
		-- telescope:
		TelescopeBorder = { fg = c.fg },
		TelescopeSelection = { bg = c.green },
		--
		-- ["@keyword"] = { fg = "$green" },
		-- ["@string"] = { fg = c.red, fmt = "bold" },
		-- ["@function"] = { fg = "#0000ff", sp = "$cyan", fmt = "underline,italic" },

		--       Comment = { fg = "#FF0000", bg = "#FFFF00", italic = true },
		-- ["@Comment"] = { fg = "#ff0000", italic,bold,undercurl = true },
		--
		-- TelescopeBorder = {
		-- 	fg = "${telescope_results}",
		-- 	bg = "${telescope_results}",
		-- },
		-- TelescopePromptBorder = {
		-- 	fg = "${telescope_prompt}",
		-- 	bg = "${telescope_prompt}",
		-- },
		TelescopePromptCounter = { fg = "${fg}" },
		TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
		TelescopePromptPrefix = {
			fg = "${purple}",
			bg = "${telescope_prompt}",
		},
		TelescopePromptTitle = {
			fg = "${telescope_prompt}",
			bg = "${purple}",
		},
		TelescopePreviewTitle = {
			fg = "${telescope_results}",
			bg = "${green}",
		},
		TelescopeResultsTitle = {
			fg = "${telescope_results}",
			bg = "${orange}",
		},
		TelescopeMatching = { fg = "${blue}" },
		TelescopeNormal = { bg = "${telescope_results}" },
		TelescopePreviewNormal = { bg = "${telescope_preview}" },
		-- TelescopePreviewBorder = { fg = "${telescope_preview}", bg = "${telescope_preview}" },
	},
	options = {
		bold = true,
		italic = true,
		undercurl = true,
		window_unfocussed_color = true,
	},
})

vim.cmd("colorscheme onedark")
-- nvim-cmp
vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.black, bg = "#9fbd73" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#282c34", bg = "#9fbd73", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = false })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = false })
-- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = false })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#58b5a8", bg = "NONE", italic = false })
-- bg = "#B5585F"
vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#b5585f", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#b5585f", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#b5585f", bg = "NONE" })
-- bg = "#9FBD73"
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#9fbd73", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#9fbd73", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#9fbd73", bg = "NONE" })
-- bg = "#D4BB6C"
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#d4bb6c", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#d4bb6c", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#d4bb6c", bg = "NONE" })
-- bg = "#A377BF"#56b6c2
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#a377bf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#a377bf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#a377bf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#a377bf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#a377bf", bg = "NONE" })
-- bg = "#7E8294"
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "NONE" })
-- bg = "#D4A959"#61afef'
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#d4a959", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#d4a959", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#d4a959", bg = "NONE" })
-- bg = "#6C8ED4"
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#6c8ed4", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#6c8ed4", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#6c8ed4", bg = "NONE" })
-- bg = "#58B5A8"
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#58b5a8", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#58b5a8", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#58b5a8", bg = "NONE" })
