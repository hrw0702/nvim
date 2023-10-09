local onedarkpro = require("onedarkpro")
local colors = require("onedarkpro.helpers")
-- local config = require("onedarkpro.config").config

local c = {
	base03 = "#002b36",
	bg = "#002b36",
	base02 = "#073642",
	base01 = "#586e75",
	base00 = "#657b83",
	base0 = "#839496",
	base1 = "#93a1a1",
	fg = "#93a1a1",
	white = "#abb2bf",
	base2 = "#eee8d5",
	base3 = "#fdf6e3",
	yellow = "#b58900",
	orange = "#cb4b16",
	red = "#dc322f",
	magenta = "#d33682",
	violet = "#6c71c4",
	blue = "#268bd2",
	light_blue = "#61afef",
	cyan = "#2aa198",
	green = "#859900",
	light_green = "#7f8700",

	comment = "#586e75",
	indentline = "#073642",
	scope_indentline = "#657b83",
	selection = "#300924",
	cursorline = "#073642",
	git_add = "#109868",
	git_change = "#948B60",
	git_delete = "#9a353d",
	git_hunk_add = "#43554d",
	git_hunk_add_inline = "#3f534f",
	git_hunk_change_inline = "#41483d",
	git_hunk_delete = "#502d30",
	git_hunk_delete_inline = "#6f2e2d",
}
-- local light_color = {
-- 	brblack = "#1c1c1c",
-- 	black = "#262626",
-- 	brgreen = "#4e4e4e",
-- 	bryellow = "#585858",
-- 	brblue = "#808080",
-- 	brcyan = "#8a8a8a",
-- 	white = "#d7d7af",
-- 	brwhite = "#ffffd7",
-- 	yellow = "#af8700",
-- 	brred = "#d75f00",
-- 	red = "#d70000",
-- 	magenta = "#af005f",
-- 	brmagenta = "#5f5faf",
-- 	blue = "#0087ff",
-- 	cyan = "#00afaf",
-- 	green = "#5f8700",
-- }
--
-- local c = {
-- 	background = "dark",
-- 	bg = "#282c34",
-- 	bg_statusline = "#22262d",
-- 	black = "#282c34",
-- 	gray = "#5c6370",
-- 	white = "#abb2bf",
-- 	fg = "#abb2bf",
-- 	blue = "#61afef",
-- 	cyan = "#56b6c2",
-- 	dark_cyan = "#005869",
-- 	dark_green = "#109868",
-- 	green = "#98c379",
-- 	orange = "#d19a66",
-- 	purple = "#c678dd",
-- 	red = "#e06c75",
-- 	yellow = "#e5c07b",
-- 	color_column = "#2d313b",
-- 	comment = "#7f848e",
-- 	cursorline = "#2d313b",
-- 	diff_add = "#003e4a",
-- 	diff_delete = "#501b20",
-- 	diff_text = "#005869",
-- 	fg_gutter = "#3d4350",
-- 	fg_gutter_inactive = "#abb2bf",
-- 	float_bg = "#21252b",
-- 	fold = "#30333d",
-- 	git_add = "#109868",
-- 	git_change = "#948B60",
-- 	git_delete = "#9a353d",
-- 	git_hunk_add = "#43554d",
-- 	git_hunk_add_inline = "#3f534f",
-- 	git_hunk_change_inline = "#41483d",
-- 	git_hunk_delete = "#502d30",
-- 	git_hunk_delete_inline = "#6f2e2d",
-- 	highlight = "#e2be7d",
-- 	indentline = "#3b4048",
-- 	inlay_hint = "#4c525c",
-- 	line_number = "#495162",
-- 	selection = "#414858",
-- 	virtual_text_error = "#e8939a",
-- 	virtual_text_hint = "#7ec7d1",
-- 	virtual_text_information = "#90c7f4",
-- 	virtual_text_warning = "#edd2a1",
-- }

onedarkpro.setup({
	colors = {
		-- 设置背景色
		onedark = {
			bg = "#002b36",
			black = "#002b36",
			base02 = "#073642",
			-- comment = "#586e75",
			base00 = "#657b83",
			base0 = "#839496",
			fg = "#93a1a1",
			white = "#93a1a1",
			base2 = "#eee8d5",
			base3 = "#fdf6e3",
			yellow = "#b58900",
			orange = "#cb4b16",
			red = "#dc322f",
			magenta = "#d33682",
			purple = "#6c71c4",
			blue = "#268bd2",
			cyan = "#2aa198",
			green = "#859900",
			cursorline = "#073642",
		},
		-- onelight = { bg = "#00FF00" }, -- green
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
		TabLineSel = { bg = c.magenta, fg = c.bg }, -- tab pages line, active tab page label
		TabLine = { fg = c.white, bg = c.magenta },
		BufferLineBufferSelected = { fg = c.magenta, italic = true, bold = true },

		StatusLine = { fg = c.base0 },

		-- DiagnosticSign
		DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.base02 },
		DiagnosticWarn = { fg = c.yellow, bg = c.base02 },
		DiagnosticSignError = { fg = c.red, bg = c.base02 },
		DiagnosticSignWarn = { fg = c.yellow, bg = c.base02 },
		DiagnosticSignInfo = { fg = c.blue, bg = c.base02 },
		DiagnosticSignHint = { fg = c.cyan, bg = c.base02 },
		-- gitsign
		GitSignsAdd = { fg = c.git_add, bg = c.base02 },
		GitSignsAddCursorLine = { fg = c.git_add, bg = c.base02 },
		GitSignsChange = { fg = c.git_change, bg = c.base02 },
		GitSignsChangeCursorLine = { fg = c.git_change, bg = c.base02 },
		GitSignsDelete = { fg = c.git_delete, bg = c.base02 },
		GitSignsDeleteCursorLine = { fg = c.git_delete, bg = c.base02 },
		GitSignsUntracked = { fg = c.blue, bg = c.base02 },
		GitSignsUntrackedCursorLine = { fg = c.blue, bg = c.base02 },

		GitSignsAddPreview = { bg = c.git_hunk_add },
		GitSignsDeletePreview = { bg = c.git_hunk_delete },
		GitSignsAddInline = { bg = c.git_hunk_add_inline },
		GitSignsChangeInline = { bg = c.git_hunk_change_inline },
		GitSignsDeleteInline = { bg = c.git_hunk_delete_inline },
		-- nvim-tree
		NvimTreeNormalNC = { bg = c.base02 },
		NvimTreeFolderIcon = { fg = c.green },
		NvimTreeRootFolder = { fg = c.green },
		NvimTreeFolderName = { fg = c.blue },
		NvimTreeOpenedFolderName = { fg = c.blue },
		-- editor
		Visual = { bg = c.selection }, -- Visual mode selection
		-- ColorColumn = { bg = c.base02 },
		-- color_column = { bg = c.base02 },
		--
		LineNr = { fg = c.base01, bg = c.base02 },
		LineNrNC = { fg = c.base01, bg = c.base02 },
		SignColumn = { bg = c.base02 }, -- column where |signs| are displayed
		-- common:
		-- vim 错误信息
		ErrorMsg = { fg = c.red },
		WarningMsg = { fg = c.yellow },
		-- nvim-cmp 滚动条颜色
		PmenuThumb = { fg = c.magenta, bg = c.cyan },
		CursorLineNr = { fg = c.base2, bg = c.cyan },
		CursorLine = { bg = c.base02 },
		-- indent-blankline
		IblIndent = { fg = c.indentline},
		-- 当前选中范围
		IblScope = { fg = c.scope_indentline},

		--
		-- -- syntax:
		Comment = { fg = c.comment },
		PreCondit = { fg = c.orange },
		cDefine = { fg = c.orange },
		-- cBlock= { fg = c.git_add },
		-- cCppParen= { fg = c.git_add },
		Number = { fg = c.violet },
		-- "int float double"
		Type = { fg = c.fg, bold = true },
		--
		StorageClass = { fg = c.green },
		-- "struct"
		Structure = { fg = c.fg, bold = true },
		--
		Identifier = { fg = c.yellow },
		Keyword = { fg = c.magenta },
		-- 'if else then'
		Conditional = { fg = c.yellow },

		-- 'while for'
		Repeat = { fg = c.yellow, italic = true },

		Constant = { fg = c.cyan },
		Macro = { fg = c.orange },
		Special = { fg = c.yellow },

		-- "%d %p \n"
		SpecialChar = { fg = c.red },
		property = { fg = c.red },
		Include = { fg = c.magenta },

		-- treesitter:
		["@comment"] = { fg = c.comment, italic = true },
		["@include"] = { fg = c.magenta },
		["@string"] = { fg = c.green },
		["@number"] = { fg = c.violet },
		--
		-- -- "if then else "
		-- ["@conditional"] = { fg = "$code_grey" },
		["@conditional"] = { fg = c.yellow, italic = true },
		--
		["@constant"] = { fg = c.base1 },

		-- 枚举变量成员
		["@constant.builtin"] = { fg = c.dark_red },

		-- ["@keyword"] = { fg = c.fg, bold = true },
		["@keyword"] = { fg = c.yellow, bold = false },
		["@keyword.lua"] = { fg = c.fg, bold = true },

		["@function"] = { fg = c.cyan },
		["@attribute"] = { fg = c.green },
		["@keyword.function"] = { fg = c.fg },
		["@keyword.operator"] = { fg = c.cyan },
		["@operator"] = { fg = c.cyan },

		-- 函数参数变量名称
		["@parameter"] = { fg = c.base1 },

		-- struct 成员
		["@property"] = { fg = c.base0 },
		["@preproc"] = { fg = c.orange },
		["@define"] = { fg = c.orange },

		-- "while for"
		-- ["@repeat"] = { fg = "$code_grey" },
		["@repeat"] = { fg = c.yellow, italic = true },

		-- 枚举变量名称
		["@type"] = { fg = c.cyan, bold = false },

		-- 变量
		["@variable"] = { fg = c.base1 },

		-- 变量类型
		["@type.builtin"] = { fg = c.fg, bold = true },
		-- const
		["@type.qualifier"] = { fg = c.green, bold = true },
		--- 括号
		["@punctuation.bracket"] = { fg = c.fg },
		["@punctuation.bracket.lua"] = { fg = c.fg },
		["@string.escape"] = { fg = c.red },
		-- static
		["@StorageClass"] = { fg = c.green },

		-- c return
		["@keyword.return"] = { fg = c.magenta, italic = true },

		-- lsp
		--
		-- ["@lsp.type.comment"] = { fg = c.comment, italic = true },
		-- 定义宏的时候，取消颜色
		["@lsp.type.comment"] = {},
		-- ["@lsp.type.comment.c"] = { fg = c.orange },
		-- 定义宏的时候，取消颜色
		["@lsp.type.comment.c"] = {},
		["@lsp.type.enum"] = { fg = c.cyan, bold = false },
		["@lsp.type.class"] = { fg = c.fg, bold = false },
		["@lsp.typemod.class.declaration.c"] = { fg = c.magenta, bold = false },
		["@lsp.typemod.class.fileScope.c"] = { fg = c.fg, italic = true, bold = true},
		["@lsp.typemod.class.globalScope.c"] = { fg = c.cyan, bold = false },
		["@lsp.mod.classScope"] = { fg = c.base0 },
		["@lsp.type.definition"] = { fg = c.cyan, bold = true },

		["@function.builtin"] = { fg = c.blue },
		-- ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
		-- ["@lsp.type.interface"] = hl.treesitter["@type"],
		-- ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
		-- ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
		-- ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
		["@lsp.type.function"] = { fg = c.blue, italic = false },
		["@lsp.type.parameter"] = { fg = c.base1, italic = false },
		["@lsp.type.property"] = { fg = c.base0, italic = true },
		["@lsp.type.variable"] = { fg = c.base1 },
		["@lsp.type.macro"] = { fg = c.violet },
		-- ["@lsp.type.method"] = hl.treesitter["@method"],
		-- ["@lsp.type.number"] = hl.treesitter["@number"],
		-- ["@lsp.type.generic"] = hl.treesitter["@text"],
		-- ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
		["@lsp.typemod.macro.globalScope"] = { fg = c.cyan },
		["@lsp.typemod.function.defaultLibrary"] = { fg = c.light_blue },
		["@lsp.typemod.parameter.functionScope.c"] = { fg = c.base0 },
		["@lsp.type.operator"] = { fg = c.base0 },
		-- ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
		-- ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
		-- ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
		-- ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
		-- ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],

		-- treesitter: TS
		-- TSParameter = { fg = c.fg,italic = true },
		-- TSeonditional = { fg = c.fg, fmt = "none" },
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
		-- TelescopeBorder = { fg = c.fg },
		TelescopeSelection = { fg = c.green, bg = c.base03 },
		--
		TelescopeBorder = {
			fg = c.fg,
			bg = c.base03,
		},
		TelescopePromptBorder = {
			fg = c.fg,
			bg = c.base03,
		},
		TelescopePromptCounter = {
			fg = c.fg,
		},
		TelescopePromptNormal = {
			fg = c.fg,
			bg = c.base03,
		},
		TelescopePromptPrefix = {
			bg = c.magenta,
			fg = c.base3,
		},
		TelescopePromptTitle = {
			fg = "${telescope_prompt}",
			bg = c.yellow,
		},
		TelescopePreviewTitle = {
			fg = "${telescope_results}",
			bg = c.green,
		},
		TelescopeResultsTitle = {
			fg = "${telescope_results}",
			bg = c.orange,
		},
		TelescopeResultsNormal = { bg = c.base02 },
		TelescopeResultsBorder = { fg = c.base01, bg = c.base03 },
		TelescopeMatching = { fg = c.magenta },
		TelescopeNormal = { bg = "${telescope_results}" },
		TelescopePreviewNormal = { bg = c.base02 },
		TelescopePreviewBorder = { fg = c.base01, bg = c.base03 },

		-- nvim-cmp 浮动窗口
		NormalFloat = { bg = c.base02 }, -- Normal text in floating windows.
		FloatBorder = {
			bg = c.bg,
			fg = c.fg,
		},
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
-- nvim_set_hl
vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.green, bg = c.base02 })
vim.api.nvim_set_hl(0, "Pmenu", { fg = c.base01, bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#282c34", bg = c.green, strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = c.blue, bg = "NONE", bold = false })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.blue, bg = "NONE", bold = false })
-- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = false })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = c.cyan, bg = "NONE", italic = false })
-- bg = "#B5585F"
vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = c.red, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = c.red, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = c.red, bg = "NONE" })
-- bg = "#9FBD73"
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = c.green, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = c.green, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = c.green, bg = "NONE" })
-- bg = "#D4BB6C"
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = c.yellow, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = c.yellow, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = c.yellow, bg = "NONE" })
-- bg = "#A377BF"#56b6c2
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = c.violet, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = c.violet, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = c.violet, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = c.violet, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = c.violet, bg = "NONE" })
-- bg = "#7E8294"
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = c.base1, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = c.base1, bg = "NONE" })
-- bg = "#D4A959"#61afef'
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = c.yellow, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = c.yellow, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = c.yellow, bg = "NONE" })
-- bg = "#6C8ED4"
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = c.blue, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = c.blue, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = c.blue, bg = "NONE" })
-- bg = "#58B5A8"
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = c.cyan, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = c.cyan, bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = c.cyan, bg = "NONE" })
