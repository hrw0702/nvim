local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#E0BE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#18be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#a678dd',
    blue     = '#01afef',
    red      = '#e05f67',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		-- theme = {
		--     -- We are going to use lualine_c an lualine_x as left and
		--     -- right section. Both are highlighted by c theme .  So we
		--     -- are just setting default looks o statusline
		--     normal = { c = { fg = colors.fg, bg = colors.bg } },
		--     inactive = { c = { fg = colors.fg, bg = colors.bg } },
		-- },
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		-- lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		-- return "▊"
		return ""
	end,
	color = { fg = colors.blue }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
})

-- NOTE:
ins_left({
	-- mode component
	function()
		-- return ''
		local Mode = {}

        -- stylua: ignore
        Mode.map = {
            ['n']      = 'NORMAL',
            ['no']     = 'O-PENDING',
            ['nov']    = 'O-PENDING',
            ['noV']    = 'O-PENDING',
            ['no\22'] = 'O-PENDING',
            ['niI']    = 'NORMAL',
            ['niR']    = 'NORMAL',
            ['niV']    = 'NORMAL',
            ['nt']     = 'NORMAL',
            ['v']      = 'VISUAL',
            ['vs']     = 'VISUAL',
            ['V']      = 'V-LINE',
            ['Vs']     = 'V-LINE',
            ['\22']   = 'V-BLOCK',
            ['\22s']  = 'V-BLOCK',
            ['s']      = 'SELECT',
            ['S']      = 'S-LINE',
            ['\19']   = 'S-BLOCK',
            ['i']      = 'INSERT',
            ['ic']     = 'INSERT',
            ['ix']     = 'INSERT',
            ['R']      = 'REPLACE',
            ['Rc']     = 'REPLACE',
            ['Rx']     = 'REPLACE',
            ['Rv']     = 'V-REPLACE',
            ['Rvc']    = 'V-REPLACE',
            ['Rvx']    = 'V-REPLACE',
            ['c']      = 'COMMAND',
            ['cv']     = 'EX',
            ['ce']     = 'EX',
            ['r']      = 'REPLACE',
            ['rm']     = 'MORE',
            ['r?']     = 'CONFIRM',
            ['!']      = 'SHELL',
            ['t']      = 'TERMINAL',
        }

		local mode_code = vim.api.nvim_get_mode().mode
		if Mode.map[mode_code] == nil then
			return mode_code
		end
		-- section_separators = { left = '', right = '' },
		return "" .. Mode.map[mode_code]
	end,
	-- stylua: ignore
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		-- return { bg = mode_color[vim.fn.mode()],fg = Black, }
		return { bg = mode_color[vim.fn.mode()],gui = "bold" }
	end,
	padding = { left = 1, right = 1 },
})

ins_left({
	function()
		-- return "▊"
		return ""
	end,
	color = { fg = colors.blue }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
	"branch",
	icon = "",
	-- color = { fg = colors.violet,  gui = "bold" },
	color = { fg = colors.violet },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta },
})

ins_left({
	-- filesize component
	"filesize",
	cond = conditions.buffer_not_empty,
})

ins_left({ "location", color = { fg = colors.blue } })

ins_left({ "progress", color = { fg = colors.fg } })

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
	function()
		return "%="
	end,
})

-- Add components to right sections
ins_right({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = "柳 ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})
ins_right({
	--  "fileformat",
	"filetype",
	colored = true, -- Displays filetype icon in color if set to true
	fmt = string.upper,
	icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
	color = { fg = colors.green },
})

ins_right({
	"o:encoding", -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = { fg = colors.green },
})

ins_right({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { fg = colors.cyan, gui = "bold" },
	-- padding = { left = 70 },
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.blue },
	padding = { left = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
