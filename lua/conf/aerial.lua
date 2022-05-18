-- https://github.com/stevearc/aerial.nvim

require("aerial").setup(
    {
        min_width = 30,
        -- backends = {"lsp", "treesitter", "markdown"}
        backends = {"treesitter", "markdown"},
        -- false 是显示所有的图标
        filter_kind = false,
        -- 将从 lspkind 和 nvim-web-devicons 中获得图标
        nerd_font = "auto",
        -- 何时更新
        update_events = "TextChanged,InsertLeave",
        -- 按键映射
        on_attach = function(bufnr)
            -- 打开、关闭大纲预览
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
            -- 移动到上一个/下一个子项目，同 <C-k> 和 <C-j>
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
            -- 移动到上一个/下一个大项目
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
            vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
        end
    }
)
