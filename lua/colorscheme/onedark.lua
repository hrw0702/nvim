-- dark = {
-- 	black = "#181a1f",
-- 	bg0 = "#282c34",
-- 	bg1 = "#31353f",
-- 	bg2 = "#393f4a",
-- 	bg3 = "#3b3f4c",
-- 	bg_d = "#21252b",
-- 	bg_blue = "#73b8f1",
-- 	bg_yellow = "#ebd09c",
-- 	fg = "#abb2bf",
-- 	purple = "#c678dd",
-- 	green = "#98c379",
-- 	orange = "#d19a66",
-- 	blue = "#61afef",
-- 	yellow = "#e5c07b",
-- 	cyan = "#56b6c2",
-- 	red = "#e86671",
-- 	grey = "#5c6370",
-- 	light_grey = "#848b98",
-- 	dark_cyan = "#2b6f77",
-- 	dark_red = "#993939",
-- 	dark_yellow = "#93691d",
-- 	dark_purple = "#8a3fa0",
-- 	diff_add = "#31392b",
-- 	diff_delete = "#382b2c",
-- 	diff_change = "#1c3448",
-- 	diff_text = "#2c5372",
-- }
local c = require("onedark.colors")
require("onedark").setup({
	-- Main options --
	style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "dark", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {
		code_violet = "#8389E0",
		code_grey = "#BABABA",
		-- bright_orange = "#ff8800", -- define a new color
		-- green = "#00ffaa", -- redefine an existing color
	},

	highlights = {
		-- common:
		-- vim 错误信息
		ErrorMsg = { fg = c.blue, fmt = "none" },
		WarningMsg = { fg = c.yellow, fmt = "none" },
		-- nvim-cmp 滚动条颜色
		PmenuThumb = { fg = c.none, bg = c.purple },
		--
		-- -- syntax:
		-- "int float double"
		Type = { fg = c.fg, fmt = "none" },
		--
		-- "struct"
		Structure = { fg = c.cyan, fmt = "bold" },
		--
		Identifier = { fg = c.yellow, fmt = "none" },
		Keyword = { fg = c.dark_yellow, fmt = "none" },
		-- 'if else then'
		Conditional = { fg = c.diff_text, fmt = "bold" },

		-- 'while for'
		Repeat = { fg = c.diff_text, fmt = "bold" },

		Macro = { fg = c.orange },
		Special = { fg = c.yellow },

		-- "%d %p \n"
		SpecialChar = { fg = c.dark_red },
		property = { fg = c.dark_cyan },

		-- treesitter:
		["@comment"] = { fg = c.bg2, fmt = "italic" },
		--
		-- -- "if then else "
		-- ["@conditional"] = { fg = "$code_grey", fmt = "none" },
		["@conditional"] = { fg = c.dark_purple, fmt = "italic" },
		--
		["@constant"] = { fg = c.orange },

		-- 枚举变量成员
		["@constant.builtin"] = { fg = c.dark_red },

		["@keyword"] = { fg = c.cyan, fmt = "none" },

		["@keyword.function"] = { fg = c.fg, fmt = "none" },

		-- 函数参数变量名称
		["@parameter"] = { fg = c.fg, fmt = "none" },

		-- struct 成员
		["@property"] = { fg = "$code_grey" },

		-- "while for"
		-- ["@repeat"] = { fg = "$code_grey", fmt = "none" },
		["@repeat"] = { fg = c.dark_purple, fmt = "italic" },

		-- 枚举变量名称
		["@type"] = { fg = c.cyan, fmt = "bold" },

		-- 变量
		["@variable"] = { fg = c.fg, fmt = "none" },

		-- 变量类型
		["@type.builtin"] = { fg = c.fg, fmt = "bold" },
		-- const
		["@type.qualifier"] = { fg = c.dark_red, fmt = "bold" },
		--- 括号
		["@punctuation.bracket"] = { fg = c.fg },
		["@string.escape"] = { fg = c.red, fmt = "none" },
		-- static
		["@StorageClass"] = { fg = c.dark_red, fmt = "bold" },

		-- lsp
		--
		["@lsp.type.comment"] = { fg = c.purple },
		["@lsp.type.enum"] = { fg = c.cyan, fmt = "bold" },
		-- ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
		-- ["@lsp.type.interface"] = hl.treesitter["@type"],
		-- ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
		-- ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
		-- ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
		["@lsp.type.parameter"] = { fg = c.fg },
		["@lsp.type.property"] = { fg = c.dark_yellow },
		-- ["@lsp.type.variable"] = hl.treesitter["@variable"],
		["@lsp.type.macro"] = { fg = c.cyan },
		-- ["@lsp.type.method"] = hl.treesitter["@method"],
		-- ["@lsp.type.number"] = hl.treesitter["@number"],
		-- ["@lsp.type.generic"] = hl.treesitter["@text"],
		-- ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
		-- ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
		-- ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
		-- ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
		-- ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
		-- ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
		-- ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
		-- ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],

		-- treesitter: TS
		-- TSParameter = { fg = c.fg, fmt = "italic" },
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
		TelescopeBorder = { fg = c.fg, bg = c.dark_cyan, fmt = "none" },
		TelescopeSelection = { bg = c.green },
		--
		-- ["@keyword"] = { fg = "$green" },
		-- ["@string"] = { fg = c.red, fmt = "bold" },
		-- ["@function"] = { fg = "#0000ff", sp = "$cyan", fmt = "underline,italic" },
		-- ["@function.builtin"] = { fg = "#0059ff" },
	},

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})

-- vim.print(vim.g.onedark_config.code_style)
-- for group_name, group_settings in pairs(vim.g.onedark_config.highlights) do
-- 	vim.api.nvim_command(
-- 		string.format(
-- 			"highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
-- 			group_name,
-- 			group_settings.fg or "none",
-- 			group_settings.bg or "none",
-- 			group_settings.sp or "none",
-- 			group_settings.fmt or "none"
-- 		)
-- 	)
-- end
vim.api.nvim_command("colorscheme onedark")

-- nvim-cmp
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#000000", bg = "#9fbd73" })
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
