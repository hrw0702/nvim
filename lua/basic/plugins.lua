--bthomason/packer.nvim

local packer = require("packer")
packer.startup(
    {
        -- 所有插件的安装都书写在 function 中
        function()
            -- 包管理器
            use {
                "wbthomason/packer.nvim"
            }
            -- 安装其它插件
            -- Neosolarized theme
            use 'overcache/NeoSolarized'
            -- 优秀的暗色主题
            use {
                "catppuccin/nvim",
                -- 改个别名，因为它的名字是 nvim，可能会冲突
                as = "catppuccin",
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
                    require("conf.catppuccin")
                end
            }
            -- nvim-tree
            use {
                'kyazdani42/nvim-tree.lua',
                requires = {
                    'kyazdani42/nvim-web-devicons',  -- optional, for file icon
                },
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
                    require("conf.nvim-tree")
                end
            }
            -- lualine
            use {
                'nvim-lualine/lualine.nvim',
                requires = { 'kyazdani42/nvim-web-devicons', opt = true },
                config = function()
                    require("conf.lualine")
                end

            }
            -- bufferline
            use {
                'akinsho/bufferline.nvim',
                requires = {
                    'kyazdani42/nvim-web-devicons',
                },
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/bufferline.lua 文件中的代码
                    require("conf.bufferline")
                end
            }
            -- treesitter 语法高亮
            use {
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate',
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/nvim-treesitter.lua 文件中的代码
                    require("conf.nvim-treesitter")
                end
            }
            -- nvim-colorizer.lua 颜色高亮
            use {'norcalli/nvim-colorizer.lua',
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/nvim-colorizer.lua 文件中的代码
                    require("conf.nvim-colorizer")
                end
            }

            -- 缩进线插件
            use {
                'lukas-reineke/indent-blankline.nvim',

                config = function()
                    -- 插件加载完成后自动运行 lua/conf/indent-blankline.lua 文件中的代码
                    require("conf.indent-blankline")
                end
            }

            -- 为了能让状态栏显示 git 信息，所以这个插件是必须的
            use {
                "lewis6991/gitsigns.nvim",
                requires = {
                    -- 依赖于该插件（一款 Lua 开发使用的插件）
                    "nvim-lua/plenary.nvim"
                },
                config = function()
                    require("conf.gitsigns").setup()
                end
            }
            -- nvim-autopairs 自动补全另一半括号

            -- 使用 DAP 进行代码调试，需要使用 3 个插件：
            -- nvim-dap ：基础插件
            -- nvim-dap-virtual-text：显示内联信息
            -- nvim-dap-ui：显示调试界面

        end,

        -- 使用浮动窗口
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

-- 实时生效配置
vim.cmd(
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]]
)

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
--
-- -- 实时生效配置
-- vim.cmd(
--     [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]]
-- )
