local Toggleterm = require("toggleterm")

Toggleterm.setup({
	--  开启的终端默认进入插入模式
	start_in_insert = true,
	-- 设置终端打开的大小
	size = function(term)
		if term.direction == "horizontal" then
			return 12
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,

	-- hide the number column in toggleterm buffers
	hide_numbers = true,

	direction = "vertical",
	highlights = {
		-- highlights which map to a highlight group name and a table of it's values
		-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
		Normal = {
			guibg = "Normal",
		},
		-- NormalFloat = {
		-- 	link = "Normal",
		-- },
		-- FloatBorder = {
		-- 	guifg = "<VALUE-HERE>",
		-- 	guibg = "<VALUE-HERE>",
		-- },
	},
	-- 打开普通终端时，关闭拼写检查
	on_open = function()
		vim.cmd("setlocal nospell")
	end,
})

-- 新建终端
local Terminal = require("toggleterm.terminal").Terminal

local function inInsert()
	-- 删除 Esc 的映射
	vim.keybinds.dgmap("t", "<Esc>")
end

-- 新建浮动终端
local floatTerm = Terminal:new({
	hidden = true,
	-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
	direction = "float",
	float_opts = {
		-- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		border = "curved",
	},
	on_open = function(term)
		inInsert()
		-- 浮动终端中 Esc 是退出
		vim.keybinds.bmap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>:close<CR>", vim.keybinds.opts)
	end,
	on_close = function()
		-- 重新映射 Esc
		vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
	end,
})

-- 新建 lazygit 终端
local lazyGit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "curved",
	},
	on_open = function(term)
		inInsert()
		-- lazygit 中 q 是退出
		vim.keybinds.bmap(term.bufnr, "i", "q", "<cmd>close<CR>", vim.keybinds.opts)
	end,
	on_close = function()
		-- 重新映射 Esc
		vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
	end,
})

-- 定义新的方法
Toggleterm.float_toggle = function()
	floatTerm:toggle()
end

Toggleterm.lazygit_toggle = function()
	lazyGit:toggle()
end

-- 退出终端插入模式
vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
-- 打开普通终端
vim.keybinds.gmap("n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<CR>", vim.keybinds.opts)
-- 打开浮动终端
vim.keybinds.gmap("n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<CR>", vim.keybinds.opts)
-- 打开lazy git 终端
vim.keybinds.gmap("n", "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", vim.keybinds.opts)
-- 打开或关闭所有终端
vim.keybinds.gmap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", vim.keybinds.opts)

-- 要需创建多个终端，可：
-- 1 <键位> leader tt
-- 2 <键位>
-- ... <键位>
-- 另外，上面我们新建了 2 个特殊终端，所以普通终端的顺序应该是从 3 开始
