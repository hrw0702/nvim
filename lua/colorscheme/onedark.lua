-- Lua
require("onedark").setup({
	-- Main options --
	style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
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
		-- bright_orange = "#ff8800", -- define a new color
		-- -- green = '#00ffaa',            -- redefine an existing color
		-- dark_green = "#475a39",
	}, -- Override default colors
	highlights = {
		-- ["comments"] = { fg = "$dark_green", fmt = "none" },
		-- ["@comment"] = { fg = "$dark_green", fmt = "none" },
		-- ["@lsp.type.comment"] = { fg = "$dark_green", fmt = "none" },
		-- ["LineNr"] = { fg = "$bright_orange", fmt = "bold" },
		-- ["Whitespace"] = { fg = "$grey", fmt = "none" },
		-- ["@function"] = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
		-- ["@function.builtin"] = {fg = '#0059ff'}
	}, -- Override highlight

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})
-- Lua
require("onedark").setup({
	-- Main options --
	style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
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
		-- bright_orange = "#ff8800", -- define a new color
		-- -- green = '#00ffaa',            -- redefine an existing color
		-- dark_green = "#475a39",
	}, -- Override default colors
	highlights = {
		-- ["comments"] = { fg = "$dark_green", fmt = "none" },
		-- ["@comment"] = { fg = "$dark_green", fmt = "none" },
		-- ["@lsp.type.comment"] = { fg = "$dark_green", fmt = "none" },
		-- ["LineNr"] = { fg = "$bright_orange", fmt = "bold" },
		-- ["Whitespace"] = { fg = "$grey", fmt = "none" },
		-- ["@function"] = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
		-- ["@function.builtin"] = {fg = '#0059ff'}
	}, -- Override highlight

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})
