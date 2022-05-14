-- 设置leader键为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 保持本地变量
-- 之后就可以这样映射按键
-- map("模式","按键","映射为XX",opt)
local map   = vim.api.nvim_set_keymap
local bmap  = vim.api.nvim_buf_set_keymap  
local dgmap = vim.api.nvim_del_keymap  
local dbmap = vim.api.nvim_buf_del_keymap    
local opt   = {noremap = true, silent = true }

-- "jk" 映射<ESC>键
map("i","jk","<ESC>",opt)

-- 映射INSERT模式下移动光标
-- Alt+j j
-- Alt+k k
-- Alt+h h
-- Alt+l l
map("i", "<A-j>","<Down>",opt)
map("i", "<A-k>","<Up>",opt)
map("i", "<A-h>","<Left>",opt)
map("i", "<A-l>","<Right>",opt)

-- 映射窗口选择默认按键<Ctrl+w> 改为<Alt+f>
map("n","<A-f>","<c-w>",opt)

-- 映射窗口垂直分割<"Alt+f v">
-- map("n","<A-f>v",":vs<CR>",opt)
map("n","<leader>vs",":vs<CR>",opt)
-- 映射窗口水平分割<"Alt+f s">
-- map("n","<A-f>s",":sp<CR>",opt)
map("n","<leader>sp",":sp<CR>",opt)

-- 调整窗口大小 Ctrl+方向键
map("n","<C-up>","<cmd>resize +1<CR>",opt)
map("n","<C-down>","<cmd>resize -2<CR>",opt)
map("n","<C-left>","<cmd>vertical resize +1<CR>",opt)
map("n","<C-right>","<cmd>vertical resize -1<CR>",opt)

-- NvimTree 按键映射
-- F3 打开，关闭菜单
map("n","<F3>",":NvimTreeToggle<CR>",opt)

-- bufferline 左右TAB切换
map("n","<C-h>",":BufferLineCyclePrev<CR>",opt)
map("n","<C-l>",":BufferLineCycleNext<CR>",opt)

-- nvim-treesitter 代码格式化
map("n","<F4>","gg=G",opt)
