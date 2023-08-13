local ok, luasnip = pcall(require, "luasnip")
if not ok then
	vim.notify("Could not load luasnip")
	return
end

local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

require("luasnip").config.setup({ store_selection_keys = "<A-p>" })

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

-- Virtual Text{{{
local types = require("luasnip.util.types")
ls.config.set_config({
	history = true, --keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", --update changes as you type
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
			},
		},
		-- [types.insertNode] = {
		-- 	active = {
		-- 		virt_text = { { "●", "GruvboxBlue" } },
		-- 	},
		-- },
	},
}) --}}}

-- More Settings --
-- inoremap <c-u> <cmd>lua require("luasnip.extras.select_choice")()
--
-- key Maps
-- feel free to change the keys to new ones, those are just my current mappings
vim.keymap.set("i", "<C-j>", function()
	if ls.choice_active() then
		return ls.change_choice(1)
	else
		return _G.dynamic_node_external_update(1) -- feel free to update to any index i
	end
end, { noremap = true })
vim.keymap.set("s", "<C-j>", function()
	if ls.choice_active() then
		return ls.change_choice(1)
	else
		return _G.dynamic_node_external_update(1)
	end
end, { noremap = true })
vim.keymap.set("i", "<C-k>", function()
	if ls.choice_active() then
		return ls.change_choice(-1)
	else
		return _G.dynamic_node_external_update(2)
	end
end, { noremap = true })
vim.keymap.set("s", "<C-k>", function()
	if ls.choice_active() then
		return ls.change_choice(-1)
	else
		return _G.dynamic_node_external_update(2)
	end
end, { noremap = true })
-- vim.keymap.set({ "i", "s" }, "<C-j>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end)
-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(-1)
-- 	end
-- end)
vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })
vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])
