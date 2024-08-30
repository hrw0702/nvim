local colors = {
	bg = "#282c34",
	fg = "#abb2bf",
	yellow = "#e5c07b",
	cyan = "#56b6c2",
	darkblue = "#081633",
	green = "#98c379",
	orange = "#FF8800",
	violet = "#c678dd",
	magenta = "#be5046",
	blue = "#61afef",
	red = "#e06c75",
	vim_green = "#3cb371",
}

require("winbar").setup({
	enabled = true,
	show_file_path = true,
	show_symbols = true,

	colors = {
		-- You can customize colors like #c946fd,#98c379
		path = colors.cyan,
		file_name = colors.blue,
		symbols = colors.darkblue,
	},

	icons = {
		file_icon_default = "",
		seperator = ">",
		editor_state = "",
		lock_icon = "",
	},

	exclude_filetype = {
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"Trouble",
		"alpha",
		"lir",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"qf",
	},
})
