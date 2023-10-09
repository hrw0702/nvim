-- https://github.com/lukas-reineke/indent-blankline.nvim

-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

require("ibl").setup({
	enabled = true,
	debounce = 200,
	viewport_buffer = {
		min = 30,
		max = 500,
	},
	indent = {
		char = "│",
		tab_char = "│",
		-- highlight = "IblIndent",
		smart_indent_cap = true,
		priority = 1,
	},
	whitespace = {
		-- highlight = "IblWhitespace",
		remove_blankline_trail = true,
	},
	scope = {
		enabled = true,
		char = nil,
		show_start = false,
		show_end = false,
		injected_languages = false,
		highlight = "IblScope",
		priority = 500,
		include = {
			node_type = {
				["*"] = {
					"*",
				},
			},
		},
		-- exclude = :
		-- 	language = {},
		-- 	node_type = {
		-- 		["*"] = {
		-- 			"source_file",
		-- 			"program",
		-- 		},
		-- 		-- lua = {
		-- 		-- 	"chunk",
		-- 		-- },
		-- 		python = {
		-- 			"module",
		-- 		},
		-- 	},
		-- },
	},
	exclude = {
		filetypes = {
			"lspinfo",
			"packer",
			"checkhealth",
			"help",
			"man",
			"gitcommit",
			"TelescopePrompt",
			"TelescopeResults",
			"",
		},
		buftypes = {
			"terminal",
			"nofile",
			"quickfix",
			"prompt",
		},
	},
})
