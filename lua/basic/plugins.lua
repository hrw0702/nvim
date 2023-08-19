--bthomason/packer.nvim

local packer = require("packer")
packer.startup({
	-- 所有插件的安装都书写在 function 中
	function()
		-- 包管理器
		use({
			"wbthomason/packer.nvim",
		})

		-- 安装其它插件
		-- 优秀的暗色主题
		-- =============================================================================
		use({
			"catppuccin/nvim",
			-- 改个别名，因为它的名字是 nvim，可能会冲突
			as = "catppuccin",
			config = function()
				-- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
				require("colorscheme.catppuccin")
			end,
		})

		use({
			"marko-cerovac/material.nvim",
			config = function()
				require("colorscheme.material")
			end,
		})

		use({
			"navarasu/onedark.nvim",
			config = function()
				require("colorscheme.onedark")
			end,
		})
		use({
			"EdenEast/nightfox.nvim",
			config = function()
				require("colorscheme.nightfox")
			end,
		})

		use({
			"neanias/everforest-nvim",
			config = function()
				require("colorscheme.everforest")
			end,
		})

		use({
			"maxmx03/solarized.nvim",
			config = function()
				require("colorscheme.solarized")
			end,
		})

		use({
			"loctvl842/monokai-pro.nvim",
			config = function()
				require("colorscheme.monokai-pro")
			end,
		})

		-- use({
		-- 	"savq/melange-nvim",
		-- 	config = function()
		-- 		require("colorscheme.melange")
		-- 	end,
		-- })

		-- =============================================================================
		-- markdown-preview
		-- install without yarn or npm
		use({
			"iamcco/markdown-preview.nvim",
			ft = { "markdown" },
			config = function()
				require("conf.markdown-preview")
				vim.fn["mkdp#util#install"]()
			end,
		})

		-- nvim-tree
		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons", -- optional, for file icon
			},
			config = function()
				-- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
				require("conf.nvim-tree")
			end,
		})

		use({
			"nvim-tree/nvim-web-devicons",
			config = function()
				require("conf.nvim-web-devicons")
			end,
		})
		-- lualine
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
			config = function()
				require("conf.lualine")
			end,
		})
		-- bufferline
		use({
			"akinsho/bufferline.nvim",
			requires = {
				"nvim-tree/nvim-web-devicons",
				-- 删除 buffer 时不影响现有布局
				"famiu/bufdelete.nvim",
			},
			config = function()
				-- 插件加载完成后自动运行 lua/conf/bufferline.lua 文件中的代码
				require("conf.bufferline")
			end,
		})
		-- treesitter 语法高亮
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				-- 插件加载完成后自动运行 lua/conf/nvim-treesitter.lua 文件中的代码
				require("conf.nvim-treesitter")
			end,
		})
		-- nvim-colorizer.lua 颜色高亮
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				-- 插件加载完成后自动运行 lua/conf/nvim-colorizer.lua 文件中的代码
				require("conf.nvim-colorizer")
			end,
		})

		use({
			"fgheng/winbar.nvim",
			config = function()
				require("conf.winbar")
			end,
		})
		-- 缩进线插件
		use({
			"lukas-reineke/indent-blankline.nvim",

			config = function()
				-- 插件加载完成后自动运行 lua/conf/indent-blankline.lua 文件中的代码
				require("conf.indent-blankline")
			end,
		})

		-- 为了能让状态栏显示 git 信息，所以这个插件是必须的
		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				-- 依赖于该插件（一款 Lua 开发使用的插件）
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("conf.gitsigns")
			end,
		})
		-- nvim-autopairs 自动补全另一半括号
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("conf.nvim-autopairs")
			end,
		})

		-- 内置终端
		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("conf.toggleterm")
			end,
		})

		-- 精美弹窗
		use({
			"rcarriga/nvim-notify",
			config = function()
				require("conf.nvim-notify")
			end,
		})

		-- todo comments
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("conf.todo-comments")
			end,
		})

		use({
			"folke/trouble.nvim",
			requires = "nvim-tree/nvim-web-devicons",
			config = function()
				require("conf.trouble")
			end,
		})
		-- TODO

		-- 代码注释
		use({
			"numToStr/Comment.nvim",
			requires = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
			config = function()
				require("conf.Comment")
			end,
		})

		-- 代码补全
		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("conf.luasnip")
			end,
		})
		-- 灯泡提示代码行为
		use({
			"kosayoda/nvim-lightbulb",
			config = function()
				require("conf.nvim-lightbulb")
			end,
		})

		-- 大纲预览
		use({
			"simrat39/symbols-outline.nvim",
			config = function()
				require("conf.outline")
			end,
		})

		-- LSP 基础服务
		-------------------------------------------------------------------------------
		-- 配置文件在 lsp目录
		use({
			"neovim/nvim-lspconfig",
			-- config = function()
			-- 	require("conf.nvim-lspconfig")
			-- end,
		})

		-- 自动安装 LSP
		use({
			"williamboman/mason.nvim",
			-- config = function()
			-- 	require("conf.mason")
			-- end,
		})
		use({
			"williamboman/mason-lspconfig.nvim",
			-- config = function()
			-- 	require("conf.mason-lspconfig")
			-- end,
		})
		-- use({ "jose-elias-alvarez/null-ls.nvim" })
		use({
			"nvimdev/guard.nvim",
		})

		-- LSP UI 美化
		use({
			"tami5/lspsaga.nvim",
			config = function()
				require("conf.lspsaga")
			end,
		})

		-- LSP 进度提示
		use({
			"j-hui/fidget.nvim",
			tag = "legacy",
			config = function()
				require("conf.fidget")
			end,
		})

		-- 插入模式获得函数签名
		use({
			"ray-x/lsp_signature.nvim",
			config = function()
				require("conf.lsp_signature")
			end,
		})
		-------------------------------------------------------------------------------

		-- 自动代码补全系列插件
		use({
			"hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
			requires = {
				{ "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
				{ "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
				{ "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
				{ "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-path" }, -- 路径补全
				{ "ray-x/cmp-treesitter" },
				{ "hrsh7th/cmp-buffer" }, -- 缓冲区补全
				{ "hrsh7th/cmp-cmdline" }, -- 命令补全
				{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
				{ "f3fora/cmp-spell" }, -- 拼写建议
				{ "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
				{ "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
				{ "tzachar/cmp-tabnine", run = "./install.sh" }, -- tabnine 源,提供基于 AI 的智能补全
			},
			config = function()
				require("conf.nvim-cmp")
			end,
		})

		-- 排序和过滤 nvim-cmp 结果
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		-- use({ "romgrk/fzy-lua-native", run = "make" })
		use({
			"tzachar/cmp-fuzzy-buffer",
			requires = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" },
		})

		-- 模糊查找
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim", -- Lua 开发模块
				"BurntSushi/ripgrep", -- 文字查找
				"sharkdp/fd", -- 文件查找
			},
			config = function()
				require("conf.telescope")
			end,
		})
		-- 使用 DAP 进行代码调试，需要使用 3 个插件：
		-- nvim-dap ：基础插件
		-- nvim-dap-virtual-text：显示内联信息
		-- nvim-dap-ui：显示调试界面
	end,

	-- 使用浮动窗口
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})

-- 实时生效配置
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

-- ---@diagnostic disable: undefined-global
-- -- https://github.com/wbthomason/packer.nvim

-- local packer = require("packer")
-- packer.startup(
--     {
--         -- 所有插件的安装都书写在 function 中
--         function()
--             -- 包管理器
--             use {
--                 "wbthomason/packer.nvim"
--             }

--             -- 可以一次加载一个插件，跟上一个字符串
--             use "插件地址"
--
--             -- 可以一次加载多个插件，跟上一个 list
--             use {
--                 "插件地址",
--                 "插件地址",
--                 "插件地址"
--             }
--
--             -- 对于有依赖的插件，可以使用 requires 跟上一个 list
--             use {
--                 "插件地址",
--                 requires = {
--                      "依赖的插件地址",
--                      "依赖的插件地址",
--                      "依赖的插件地址",
--                 }
--             }
--
--             -- 可以在插件加载完成后自动运行一些代码
--             use {
--                 "插件地址",
--                 config = function()
--                     "需要运行的代码 ..."
--                 end
--             }
--
--             -- 插件可以在固定的文件类型里生效
--             use {
--                 "插件地址",
--                 ft = {"html", "css", "javascript"}
--             }
--
--             -- 插件可以在一些自动事件加载后生效（延迟加载）
--             use {
--                 "插件地址",
--                 event = "事件"  -- 使用 :h event 可获取事件帮助
--             }
--
--             -- 插件可以在输入一些命令后生效（延迟加载）
--             use {
--                 "插件地址",
--                 cmd = {"命令", "命令", "命令"}
--             }
--
--             -- 插件可以在按下某些按键后生效（延迟加载）
--             use {
--                 "插件地址",
--                 keys = {
--                    "键位",
--                    "键位"
--                 }
--             }
--
--             -- 在插件加载后自动执行一些操作
--             use {
--                 "插件地址",
--                 run = "命令"
--             }
--
--         end,
--         -- 使用浮动窗口
--         config = {
--             display = {
--                 open_fn = require("packer.util").float
--             }
--         }
--     }
-- )
