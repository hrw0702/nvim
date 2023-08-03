-- Lua
require("onedark").setup({
	-- Main options --
	style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

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

	-- Custom Highlights --
	colors = {
		bright_orange = "#ff8800", -- define a new color
		green = "#00ffaa", -- redefine an existing color
	},

	highlights = {

		lsp_kind_icons_color = {
			-- Default = c.purple,
			-- Array = c.yellow,
			-- Boolean = c.orange,
			-- Class = c.yellow,
			-- Color = c.green,
			-- Constant = c.orange,
			-- Constructor = c.blue,
			-- Enum = c.purple,
			-- EnumMember = c.yellow,
			-- Event = c.yellow,
			-- Field = c.purple,
			-- File = c.blue,
			-- Folder = c.orange,
			-- Function = c.blue,
			Function = { fg = "#00FF00", fmt = "bold" },
			-- Interface = c.green,
			-- Key = c.cyan,
			-- Keyword = c.cyan,
			-- Method = c.blue,
			-- Module = c.orange,
			-- Namespace = c.red,
			-- Null = c.grey,
			-- Number = c.orange,
			-- Object = c.red,
			-- Operator = c.red,
			-- Package = c.yellow,
			-- Property = c.cyan,
			-- Reference = c.orange,
			-- Snippet = c.red,
			-- String = c.green,
			-- Struct = c.purple,
			-- Text = c.light_grey,
			-- TypeParameter = c.red,
			-- Unit = c.green,
			-- Value = c.orange,
			-- Variable = c.purple,
		},
		-- ["@lsp.type.comment"] = hl.treesitter["@comment"],
		-- ["@lsp.type.enum"] = hl.treesitter["@type"],
		-- ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
		-- ["@lsp.type.interface"] = hl.treesitter["@type"],
		-- ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
		-- ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
		-- ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
		-- ["@lsp.type.parameter"] = hl.treesitter["@parameter"],
		-- ["@lsp.type.property"] = hl.treesitter["@property"],
		-- ["@lsp.type.variable"] = hl.treesitter["@variable"],
		-- ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
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

		-- NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
		-- NvimTreeVertSplit = { fg = c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
		-- NvimTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
		-- NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
		-- NvimTreeGitDirty = colors.Yellow,
		-- NvimTreeGitNew = colors.Green,
		-- NvimTreeGitDeleted = colors.Red,
		-- NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
		-- NvimTreeIndentMarker = colors.Fg,
		-- NvimTreeImageFile = { fg = c.dark_purple },
		-- NvimTreeSymlink = colors.Purple,
		-- NvimTreeFolderName = colors.Blue,

		-- CmpItemAbbr = colors.Fg,
		-- CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
		-- CmpItemAbbrMatch = colors.Cyan,
		-- CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
		-- CmpItemMenu = colors.LightGrey,
		-- CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
		--
		-- TelescopePreviewBorder = {bg="$green", fg = "$bright_orange", fmt = "bold" },
		-- TelescopePromptBorder = colors.Cyan,
		-- TelescopeResultsBorder = colors.Cyan,
		-- TelescopePreviewBorder = colors.Cyan,
		-- TelescopeMatching = { fg = c.orange, fmt = "bold" },
		-- TelescopePromptPrefix = colors.Green,
		-- TelescopeSelection = { bg = "$green" },
		-- TelescopeSelectionCaret = colors.Yellow,
		--
		-- TSKeyword = { fg = "$green" },
		-- TSString = { fg = "$bright_orange", bg = "#00ff00", fmt = "bold" },
		-- TSFunction = { fg = "#0000ff", sp = "$cyan", fmt = "underline,italic" },
		-- TSFuncBuiltin = { fg = "#0059ff" },
	},

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})
