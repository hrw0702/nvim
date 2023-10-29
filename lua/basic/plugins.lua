-- 加载lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- 安装其它插件
	-- 优秀的暗色主题
	-- =============================================================================
	spec = {
		{
			"catppuccin/nvim",
			-- 改个别名，因为它的名字是 nvim，可能会冲突
			name = "catppuccin",
			config = function()
				-- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
				require("colorscheme.catppuccin")
			end,
		},

		{
			"EdenEast/nightfox.nvim",
			config = function()
				require("colorscheme.nightfox")
			end,
		},

		{
			"neanias/everforest-nvim",
			config = function()
				require("colorscheme.everforest")
			end,
		},
		{
			"loctvl842/monokai-pro.nvim",
			config = function()
				require("colorscheme.monokai-pro")
			end,
		},

		{
			"olimorris/onedarkpro.nvim",
			name = "onedark",
			lazy = false,
			priority = 1000,
			config = function()
				require("colorscheme.onedarkpro")
			end,
		},

		-- 当前窗口高亮
		{
			"levouh/tint.nvim",
			config = function()
				require("conf.tint")
			end,
		},

		-- =============================================================================
		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			config = function()
				require("conf.nvim-surround")
			end,
		},
		-- markdown-preview
		-- install without yarn or npm
		{
			"iamcco/markdown-preview.nvim",
			ft = { "markdown" },
			config = function()
				require("conf.markdown-preview")
				vim.fn["mkdp#util#install"]()
			end,
		},

		-- nvim-tree
		-- {
		-- 	"nvim-tree/nvim-tree.lua",
		-- 	dependencies = {
		-- 		"nvim-tree/nvim-web-devicons", -- optional, for file icon
		-- 	},
		-- 	config = function()
		-- 		-- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
		-- 		require("conf.nvim-tree")
		-- 	end,
		-- },
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "main",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				"s1n7ax/nvim-window-picker",
			},
			config = function()
				-- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
				require("conf.neo-tree")
			end,
		},

		-- {
		-- 	"nvim-tree/nvim-web-devicons",
		-- 	config = function()
		-- 		require("conf.nvim-web-devicons")
		-- 	end,
		-- },

		-- lualine
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
			config = function()
				require("conf.lualine")
			end,
		},
		-- bufferline
		{
			"akinsho/bufferline.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				-- 删除 buffer 时不影响现有布局
				"famiu/bufdelete.nvim",
			},
			config = function()
				-- 插件加载完成后自动运行 lua/conf/bufferline.lua 文件中的代码
				require("conf.bufferline")
			end,
		},
		-- treesitter 语法高亮
		{
			"nvim-treesitter/nvim-treesitter",
			-- event = { "BufReadPost", "BufNewFile" },
			build = function()
				if #vim.api.nvim_list_uis() ~= 0 then
					vim.api.nvim_command("TSUpdate")
				end
			end,
			config = function()
				-- 插件加载完成后自动运行 lua/conf/nvim-treesitter.lua 文件中的代码
				require("conf.nvim-treesitter")
			end,
		},
		{
			"nvim-treesitter/playground",
			config = function()
				require("conf.playground")
			end,
		},
		-- nvim-colorizer.lua 颜色高亮
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				-- 插件加载完成后自动运行 lua/conf/nvim-colorizer.lua 文件中的代码
				require("conf.nvim-colorizer")
			end,
		},

		{
			"fgheng/winbar.nvim",
			config = function()
				require("conf.winbar")
			end,
		},
		-- 缩进线插件
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			opts = {},

			config = function()
				-- 插件加载完成后自动运行 lua/conf/indent-blankline.lua 文件中的代码
				require("conf.indent-blankline")
			end,
		},

		-- 为了能让状态栏显示 git 信息，所以这个插件是必须的
		{
			"lewis6991/gitsigns.nvim",
			dependencies = {
				-- 依赖于该插件（一款 Lua 开发使用的插件）
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("conf.gitsigns")
			end,
		},
		-- nvim-autopairs 自动补全另一半括号
		{
			"windwp/nvim-autopairs",
			config = function()
				require("conf.nvim-autopairs")
			end,
		},

		-- 内置终端
		{
			"akinsho/toggleterm.nvim",
			config = function()
				require("conf.toggleterm")
			end,
		},

		-- 精美弹窗
		{
			"rcarriga/nvim-notify",
			config = function()
				require("conf.nvim-notify")
			end,
		},

		-- todo comments
		{
			"folke/todo-comments.nvim",
			dependencies = "nvim-lua/plenary.nvim",
			config = function()
				require("conf.todo-comments")
			end,
		},

		{
			"folke/trouble.nvim",
			dependencies = "nvim-tree/nvim-web-devicons",
			config = function()
				require("conf.trouble")
			end,
		},
		-- TODO

		-- 代码注释
		{
			"numToStr/Comment.nvim",
			dependencies = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
			config = function()
				require("conf.Comment")
			end,
		},

		-- 代码补全
		{
			"L3MON4D3/LuaSnip",
			config = function()
				require("conf.luasnip")
			end,
		},
		-- 灯泡提示代码行为
		{
			"kosayoda/nvim-lightbulb",
			config = function()
				require("conf.nvim-lightbulb")
			end,
		},

		-- 大纲预览
		{
			"simrat39/symbols-outline.nvim",
			config = function()
				require("conf.outline")
			end,
		},

		-- LSP 基础服务
		-------------------------------------------------------------------------------
		-- 配置文件在 lsp目录
		{
			"neovim/nvim-lspconfig",
			-- config = function()
			-- 	require("conf.nvim-lspconfig")
			-- end,
		},

		-- 自动安装 LSP
		{
			"williamboman/mason.nvim",
			-- config = function()
			-- 	require("conf.mason")
			-- end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			-- config = function()
			-- 	require("conf.mason-lspconfig")
			-- end,
		},
		-- { "jose-elias-alvarez/null-ls.nvim" },
		{
			"nvimdev/guard.nvim",
			dependencies = {
				"nvimdev/guard-collection",
			},
		},
		-- formatter
		-- {
		-- 	"stevearc/conform.nvim",
		-- 	event = { "BufReadPre", "BufNewFile" },
		-- 	config = function()
		-- 		require("conf.conform")
		-- 	end,
		-- },
		--
		-- {
		-- 	"mfussenegger/nvim-lint",
		-- 	event = { "BufReadPre", "BufNewFile" },
		-- 	config = function()
		-- 		require("conf.nvim-lint")
		-- 	end,
		-- },

		-- LSP UI 美化
		{
			"tami5/lspsaga.nvim",
			config = function()
				require("conf.lspsaga")
			end,
		},

		-- LSP 进度提示
		{
			"j-hui/fidget.nvim",
			tag = "legacy",
			event = "LspAttach",
			config = function()
				require("conf.fidget")
			end,
		},

		-- 插入模式获得函数签名
		{
			"ray-x/lsp_signature.nvim",
			config = function()
				require("conf.lsp_signature")
			end,
		},
		-------------------------------------------------------------------------------

		-- 自动代码补全系列插件
		{
			"hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
			-- event = "InsertEnter",
			dependencies = {
				"onsails/lspkind-nvim", -- 为补全添加类似 vscode 的图标
				"hrsh7th/vim-vsnip", -- vsnip 引擎，用于获得代码片段支持
				"hrsh7th/cmp-vsnip", -- 适用于 vsnip 的代码片段源
				"hrsh7th/cmp-nvim-lsp", -- 替换内置 omnifunc，获得更多补全
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-path", -- 路径补全
				"ray-x/cmp-treesitter",
				"hrsh7th/cmp-buffer", -- 缓冲区补全
				"hrsh7th/cmp-cmdline", -- 命令补全
				"saadparwaiz1/cmp_luasnip", -- snippet completions
				"f3fora/cmp-spell", -- 拼写建议
				"rafamadriz/friendly-snippets", -- 提供多种语言的代码片段
				"lukas-reineke/cmp-under-comparator", -- 让补全结果的排序更加智能
			},
			config = function()
				require("conf.nvim-cmp")
			end,
		},
		-- tabnine 源,提供基于 AI 的智能补全
        -- 不能安装时进入插件目录运行 install.sh
		{
			"tzachar/cmp-tabnine",
			build = "./install.sh",
			dependencies = "hrsh7th/nvim-cmp",
		},

		-- 排序和过滤 nvim-cmp 结果
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		{
			"tzachar/cmp-fuzzy-buffer",
			dependencies = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" },
		},

		-- 模糊查找
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim", -- Lua 开发模块
				"BurntSushi/ripgrep", -- 文字查找
				"sharkdp/fd", -- 文件查找
			},
			config = function()
				require("conf.telescope")
			end,
		},
		-- 使用 DAP 进行代码调试，需要使用 3 个插件：
		-- nvim-dap ：基础插件
		-- nvim-dap-virtual-text：显示内联信息
		-- nvim-dap-ui：显示调试界面

		-- neodev
		{
			"folke/neodev.nvim",
			config = function()
				require("conf.neodev")
			end,
		},
		{ "folke/neoconf.nvim" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	checker = {
		enabled = true, -- automatically check for plugin updates
		notify = false,
	},
	ui = {
		border = "rounded",
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				-- 'tutor',
				"zipPlugin",
			},
		},
	},
})
