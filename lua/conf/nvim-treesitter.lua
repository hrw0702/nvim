require("nvim-treesitter.configs").setup({
	-- 安装 language parser
	-- :TSInstallInfo 命令查看支持的语言
	ensure_installed = { "vim", "lua", "c","markdown","cpp","bash" },

	-- sync_install = false,

	-- 启用代码高亮功能
	highlight = {
		enable = true,
		disable = { "html" },

		-- disable = function(lang, buf)
		-- 	local max_filesize = 100 * 1024 -- 100 KB
		-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		-- 	if ok and stats and stats.size > max_filesize then
		-- 		return true
		-- 	end
		-- end,
		additional_vim_regex_highlighting = false,
	},

	context_commentstring = {
		enable = true,
	},
	-- 启用增量选择
	incremental_selection = {
		enable = false,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	-- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
	indent = {
		enable = true,
	},
})
-- 开启折叠 Folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
vim.wo.foldlevel = 99
