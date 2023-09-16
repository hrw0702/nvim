-- https://github.com/akinsho/bufferline.nvim

vim.opt.termguicolors = true

require("bufferline").setup({
	options = {
		highlights = {
			fill = {
				fg = "#eee8d5",
				bg = "#d33682",
			},
			background = {
				fg = "#eee8d5",
				bg = "#d33682",
			},
			tab = {
				fg = "#eee8d5",
				bg = "#d33682",
			},
			tab_selected = {
				fg = "#eee8d5",
				bg = "#d33682",
			},
            buffer_selected = {
				fg = "#eee8d5",
				bg = "#d33682",
                bold = true,
                italic = true,
            },
              pick_selected = {
				fg = "#eee8d5",
				bg = "#d33682",
                bold = true,
                italic = true,
            },
            pick_visible = {
				fg = "#eee8d5",
				bg = "#d33682",
                bold = true,
                italic = true,
            },
            pick = {
				fg = "#eee8d5",
				bg = "#d33682",
                bold = true,
                italic = true,
            },
		},
		themable = true,
		-- 为每个 buffer 都配置一个序数
		numbers = "ordinal",
		-- 使用内置 LSP 进行诊断
		diagnostics = "nvim_lsp",
		-- 不建议更改图标

		-- TODO
		-- indicator_icon = "▎",
		indicator_icon = "▊",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		-- 分割符样式："slant" | "thick" | "thin" | "slope" | "padded_slope"
		-- 如果是透明背景，不推荐使用 slant
		separator_style = "thin",
		-- 左侧让出 nvim-tree 的位置
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},

		-- 显示 LSP 报错图标
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
