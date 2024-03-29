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

-- 把空格键映射为空
vim.keybinds.gmap("n", " ", "<Nop>", vim.keybinds.opts)
-- 设置leader键为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.keybinds.gmap("n", "<S-h>", ":BufferLineCyclePrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<S-l>", ":BufferLineCycleNext<CR>", vim.keybinds.opts)

-- formatter 代码格式化
-- vim.keybinds.gmap("n", "<leader>fr", ":lua require("conform").format { lsp_fallback = true }<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<leader>fr", ":Format<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fr", ":GuardFmt<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<F4>", ":FormatWrite<CR>", vim.keybinds.opts)

-- MarkdownPreview
vim.keybinds.gmap("n", "<F5>", ":MarkdownPreview<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>ps", ":MarkdownPreviewStop<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>pt", ":MarkdownPreviewToggle<CR>", vim.keybinds.opts)

-- SymbolsOutline 大纲
vim.keybinds.gmap("n", "<leader>so", ":SymbolsOutline<CR>", vim.keybinds.opts)

-- set neovide fullscreen key
vim.keymap.set("n", "<C-F11>", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, {
  silent = true,
  desc = "Toggle Neovide Fullscreen",
})


-- reload nvim packerages
vim.keymap.set("n", "<leader>sv", function()
  vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {
  silent = true,
  desc = "reload init.lua",
})
