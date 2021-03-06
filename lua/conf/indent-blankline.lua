-- https://github.com/lukas-reineke/indent-blankline.nvim

-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup(
    {
        -- 显示当前所在区域
        show_current_context = true,
        -- 显示当前所在区域的开始位置
        show_current_context_start = false,
        -- 显示行尾符
        show_end_of_line = true
    }
)
