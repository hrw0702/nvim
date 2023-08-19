-- 详细文档参考：
-- https://github.com/maxmx03/solarized.nvim
-- 默认颜色代码
-- local dark = {
-- 	base00 = "#657b83", -- content tone (winseparator)
-- 	base01 = "#586e75", -- content tone (comment)
-- 	base02 = "#073642", -- background tone (highlight/menu/LineNr)
-- 	base03 = "#002b36", -- background tone dark (main)
-- 	base04 = "#00222b", -- background tone darker (column/nvim-tree)
-- 	base0 = "#839496", -- content tone (foreground)
-- 	base1 = "#93a1a1", -- content tone (statusline/tabline)
-- 	base2 = "#eee8d5", -- background tone light (highlight)
-- 	base3 = "#fdf6e3", -- background tone lighter (main)
-- 	-- accent
-- 	yellow = "#b58900",
-- 	orange = "#cb4b16",
-- 	red = "#dc322f",
-- 	magenta = "#d33682",
-- 	violet = "#6c71c4",
-- 	blue = "#268bd2",
-- 	cyan = "#2aa198",
-- 	green = "#859900",
-- 	-- git
-- 	add = "#859900",
-- 	change = "#b58900",
-- 	delete = "#dc322f",
-- 	-- diagnostic
-- 	info = "#268bd2",
-- 	hint = "#859900",
-- 	warning = "#b58900",
-- 	error = "#dc322f",
-- }

-- local light = {
-- 	base3 = "#002b36", -- background tone darker (main)
-- 	base2 = "#073642", -- background tone dark (highlight)
-- 	base1 = "#586e75", -- content tone (statusline/tabline)
-- 	base0 = "#657b83", -- content tone (foreground)
-- 	base00 = "#839496", -- content tone (winseparator)
-- 	base01 = "#93a1a1", -- content tone (comment)
-- 	base02 = "#eee8d5", -- background tone (highlight/menu/LineNr)
-- 	base03 = "#fdf6e3", -- background tone lighter (main)
-- 	base04 = "#fcf2d8", -- background tone (column/nvim-tree)
-- 	-- accent
-- 	yellow = "#b58900",
-- 	orange = "#cb4b16",
-- 	red = "#dc322f",
-- 	magenta = "#d33682",
-- 	violet = "#6c71c4",
-- 	blue = "#268bd2",
-- 	cyan = "#2aa198",
-- 	green = "#859900",
-- 	-- git
-- 	add = "#859900",
-- 	change = "#b58900",
-- 	delete = "#dc322f",
-- 	-- diagnostic
-- 	info = "#268bd2",
-- 	hint = "#859900",
-- 	warning = "#b58900",

-- default config
require("solarized").setup({
	transparent = false, -- enable transparent background
	styles = {
		comments = { italic = true, bold = false },
		functions = { italic = false },
		variables = { italic = false },
		numbers = {},
		constants = {},
		parameters = {},
		keywords = { bold = false },
		types = { bold = false },
	},
	enables = {
		bufferline = true,
		cmp = true,
		diagnostic = true,
		dashboard = true,
		editor = true,
		gitsign = true,
		hop = true,
		indentblankline = true,
		lsp = true,
		lspsaga = true,
		navic = true,
		neotree = true,
		notify = true,
		semantic = true,
		syntax = true,
		telescope = true,
		tree = true,
		treesitter = true,
		whichkey = true,
		mini = true,
	},

	highlights = function(colors, colorhelper)
		local c = colors
		local darken = colorhelper.darken
		local lighten = colorhelper.lighten
		local blend = colorhelper.blend

		return {
			-- Editor
			LineNr = { fg = c.base01, bg = c.base02 },
			CursorLineNr = { bg = c.magenta },
			CursorLine = { bg = c.base02 },
			StatusLine = { fg = c.red, bg = c.orange },

			Function = { italic = false },

			--  Nvim-cmp Popup menu: Scrollbar
			Pmenu = { fg = c.base1, bg = c.base03 },
			PmenuSel = { fg = c.base1, bg = c.violet },
			PmenuThumb = { bg = c.magenta },
			--  Nvim-cmp Popup document menu: Scrollbar
			PmenuExtra = { fg = c.base1, bg = c.base03 },
			PmenuBar = { bg = c.magenta },

			telescopeSelection = { bg = c.blue },
			-- Visual = { bg = c.cyan },
			CmpKindBorder = { fg = c.base1, bg = c.base04 },
		}
	end,
	-- 自定义颜色
	-- colors = function(colors, colorhelper)
	--     local darken = colorhelper.darken
	--     local lighten = colorhelper.lighten
	--     local blend = colorhelper.blend
	--
	--     return {
	--         fg = '#fff', -- output: #ffffff
	--         bg = darken(colors.base03, 10)
	--     }
	-- end,
	theme = "default", -- or 'neosolarized' or 'neo' for short
})
