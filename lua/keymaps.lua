local utils = require "utils"
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

vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.keymap.set("s", "<BS>", "<BS><Cmd>startinsert<CR>")
vim.keymap.set("s", "<C-h>", "<C-h><Cmd>startinsert<CR>")
vim.keymap.set({ "n", "x", "o" }, "j", "gj")
vim.keymap.set({ "n", "x", "o" }, "k", "gk")
vim.keymap.set({ "n", "x", "o" }, "gj", "j")
vim.keymap.set({ "n", "x", "o" }, "gk", "k")
vim.g.mapleader = " "
vim.g.maplocalleader = "  "

local next_diagnostic, prev_diagnostic
if vim.fn.has "nvim-0.11" == 1 then
  next_diagnostic, prev_diagnostic = utils.make_repeatable_move_pair(function()
    vim.diagnostic.jump { count = vim.v.count1 }
  end, function()
    vim.diagnostic.jump { count = -vim.v.count1 }
  end)
else
  next_diagnostic, prev_diagnostic = utils.make_repeatable_move_pair(function()
    ---@diagnostic disable-next-line: deprecated
    vim.diagnostic.goto_next { float = false }
  end, function()
    ---@diagnostic disable-next-line: deprecated
    vim.diagnostic.goto_prev { float = false }
  end)
end

vim.keymap.set(
  "n",
  "]d",
  next_diagnostic,
  { desc = "Jump to the next diagnostic in the current buffer" }
)
vim.keymap.set(
  "n",
  "[d",
  prev_diagnostic,
  { desc = "Jump to the previous diagnostic in the current buffer" }
)

local function toggle_quickfix()
  local wins = vim.fn.getwininfo()
  local qf_win = vim
    .iter(wins)
    :filter(function(win)
      return win.quickfix == 1
    end)
    :totable()
  if #qf_win == 0 then
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end

vim.keymap.set("n", "<leader>q", toggle_quickfix, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>tq", toggle_quickfix, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>hi", function()
  vim.show_pos()
end, { desc = "Inspect" })
vim.keymap.set("n", "<leader>ht", function()
  vim.treesitter.inspect_tree()
end, { desc = "Treesitter Tree" })
vim.keymap.set("n", "<leader>hq", function()
  vim.treesitter.query.edit()
end, { desc = "Treesitter Query" })

local cnext, cprevious = utils.make_repeatable_move_pair(function()
  return pcall(function()
    vim.cmd.cnext { count = vim.v.count1 }
  end)
end, function()
  return pcall(function()
    vim.cmd.cprevious { count = vim.v.count1 }
  end)
end)
vim.keymap.set("n", "]q", cnext, { desc = "Next quickfix" })
vim.keymap.set("n", "[q", cprevious, { desc = "Prev quickfix" })

local filetype_keymaps =
  vim.api.nvim_create_augroup("ofseed_filetype_keymaps", {})
vim.api.nvim_create_autocmd("Filetype", {
  group = filetype_keymaps,
  pattern = "qf",
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = bufnr })
  end,
})

vim.keymap.set(
  "n",
  "<leader>ll",
  vim.diagnostic.setloclist,
  { desc = "Diagnostic list" }
)

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
