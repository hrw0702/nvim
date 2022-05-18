-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/vim-vsnip
-- https://github.com/hrsh7th/cmp-vsnip
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/f3fora/cmp-spell
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/lukas-reineke/cmp-under-comparator
-- https://github.com/tzachar/cmp-tabnine

-- FIX: tabline 在某些计算机上有 1 个 BUG
-- 当出现：
--    TabNine is not executable
-- 等字样时，需要手动执行（仅限 Manjaro）：
--    rm ~/.local/share/nvim/plugged/cmp-tabnine/binaries
--    ~/.local/share/nvim/plugged/cmp-tabnine/install.sh

local lspkind = require("lspkind")

local cmp = require("cmp")

cmp_config=({
    ---@diagnostic disable-next-line: redundant-parameter

    -- 指定补全引擎
    snippet = {
        expand = function(args)
            -- 使用 vsnip 引擎
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    -- 指定补全源（安装了补全源插件就在这里指定）
    sources = cmp.config.sources(
        {
            {name = "vsnip"},
            {name = "nvim_lsp"},
            {name = "path"},
            {name = "buffer"},
            {name = "cmdline"},
            {name = "spell"},
            {name = "cmp_tabnine"}
        }
    ),
    -- 格式化补全菜单
    formatting = {
        fields = { "kind", "abbr", "menu" },
        max_width = 0,
        kind_icons = {
            Class = " ",
            Color = " ",
            Constant = "ﲀ ",
            Constructor = " ",
            Enum = "練",
            EnumMember = " ",
            Event = " ",
            Field = " ",
            File = "",
            Folder = " ",
            Function = " ",
            Interface = "ﰮ ",
            Keyword = " ",
            Method = " ",
            Module = " ",
            Operator = "",
            Property = " ",
            Reference = " ",
            Snippet = " ",
            Struct = " ",
            Text = " ",
            TypeParameter = " ",
            Unit = "塞",
            Value = " ",
            Variable = " ",
        },
        source_names = {
            nvim_lsp = "(LSP)",
            treesitter = "(TS)",
            emoji = "(Emoji)",
            path = "(Path)",
            calc = "(Calc)",
            cmp_tabnine = "(Tabnine)",
            vsnip = "(vSnippet)",
            luasnip = "(luaSnippet)",
            buffer = "(Buffer)",
            spell = "(Spell)",
        },
        duplicates = {
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            luasnip = 1,
        },
        duplicates_default = 0,
        format = function(entry, vim_item)
            local max_width = cmp_config.formatting.max_width
            if max_width ~= 0 and #vim_item.abbr > max_width then
                vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
            end
            vim_item.kind = cmp_config.formatting.kind_icons[vim_item.kind]
            vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
            vim_item.dup = cmp_config.formatting.duplicates[entry.source.name]
            or cmp_config.formatting.duplicates_default
            return vim_item
        end,
    },
    -- formatting = {
    --     format = lspkind.cmp_format(
    --         {
    --             with_text = true,
    --             maxwidth = 50,
    --             before = function(entry, vim_item)
    --                 vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
    --                 return vim_item
    --             end
    --         }
    --     )
    -- },
    -- 对补全建议排序
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require("cmp-under-comparator").under,
            require("cmp_tabnine.compare"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order
        }
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- 绑定补全相关的按键
    mapping = {
        -- 上一个
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- 选择补全
        ["<CR>"] = cmp.mapping.confirm(),
        --  出现或关闭补全
        ["<C-k>"] = cmp.mapping(
            {
                i = function()
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end,
                c = function()
                    if cmp.visible() then
                        cmp.close()
                    else
                        cmp.complete()
                    end
                end
            }
        ),
        -- 类似于 IDEA 的功能，如果没进入选择框，tab
        -- 会选择下一个，如果进入了选择框，tab 会确认当前选择
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    local entry = cmp.get_selected_entry()
                    if not entry then
                        cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                    end
                    cmp.confirm()
                else
                    fallback()
                end
            end,
            {"i", "s", "c"}
        )
    }
})

-- 命令行 / 模式提示
cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

-- 命令行 : 模式提示
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' }
    }, {
            { name = 'path' }
        })
})
-- cmp.setup.cmdline(
--     ":",
--     {
--         sources = cmp.config.sources(
--             {
--                 {name = "path"}
--             },
--             {
--                 {name = "cmdline"}
--             }
--         )
--     }
-- )
cmp.setup(cmp_config)
