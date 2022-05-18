-- 设置leader键为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 保持本地变量
-- 之后就可以这样映射按键
-- vim.keybinds.gmap("模式", "按键", "映射为XX", vim.keybinds.opts)
vim.keybinds = {
	gmap = vim.api.nvim_set_keymap,
	bmap = vim.api.nvim_buf_set_keymap,
	dgmap = vim.api.nvim_del_keymap,
	dbmap = vim.api.nvim_buf_del_keymap,
	opts = { noremap = true, silent = true },
}

-- "jk" 映射<ESC>键
vim.keybinds.gmap("i", "jk", "<ESC>", vim.keybinds.opts)

-- 映射INSERT模式下移动光标
-- Alt+j j
-- Alt+k k
-- Alt+h h
-- Alt+l l
vim.keybinds.gmap("i", "<A-j>", "<Down>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-k>", "<Up>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-h>", "<Left>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-l>", "<Right>", vim.keybinds.opts)

-- 映射窗口选择默认按键<Ctrl+w> 改为<Alt+f>
vim.keybinds.gmap("n", "<A-f>", "<c-w>", vim.keybinds.opts)

-- 映射窗口垂直分割<"Alt+f v">
-- vim.keybinds.gmap("n", "<A-f>v", ":vs<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>vs", ":vs<CR>", vim.keybinds.opts)
-- 映射窗口水平分割<"Alt+f s">
-- vim.keybinds.gmap("n", "<A-f>s", ":sp<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>sp", ":sp<CR>", vim.keybinds.opts)

-- 调整窗口大小 Ctrl+方向键
vim.keybinds.gmap("n", "<C-up>", "<cmd>resize +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-down>", "<cmd>resize -2<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-left>", "<cmd>vertical resize +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-right>", "<cmd>vertical resize -1<CR>", vim.keybinds.opts)

-- NvimTree 按键映射
-- <leader>m 打开，关闭菜单
vim.keybinds.gmap("n", "<leader>m", ":NvimTreeToggle<CR>", vim.keybinds.opts)

-- bufferline 左右TAB切换
vim.keybinds.gmap("n", "<C-h>", ":BufferLineCyclePrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-l>", ":BufferLineCycleNext<CR>", vim.keybinds.opts)

-- nvim-treesitter 代码格式化
-- vim.keybinds.gmap("n", "<F4>", "gg=G", vim.keybinds.opts)
vim.keybinds.gmap("n", "<F4>", ":FormatWrite<CR>", vim.keybinds.opts)
