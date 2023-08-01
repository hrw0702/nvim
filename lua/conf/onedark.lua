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
