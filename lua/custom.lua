local M = {}

-- Colorscheme
M.theme = "catppuccin"

-- Border style of floating windows
M.border = "rounded"

-- Width of side windows
M.width = function()
    local columns = vim.go.columns
    return math.floor(columns * 0.2) > 25 and math.floor(columns * 0.2) or 25
end

local append_space = function(icons)
    local result = {}
    for k, v in pairs(icons) do
        result[k] = v .. " "
    end
    return result
end

local kind_icons = {
    Array = "",
    Boolean = "",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Key = "",
    Keyword = "",
    Method = "",
    Module = "",
    Namespace = "",
    Null = "",
    Number = "",
    Object = "",
    Operator = "",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
}
M.colors = {
    -- Solarized
    base03 = "#002b36",
    base02 = "#073642",
    base01 = "#586e75",
    base00 = "#657b83",
    base0 = "#839496",
    base1 = "#93a1a1",
    base2 = "#eee8d5",
    base3 = "#fdf6e3",
    yellow = "#b58900",
    red = "#dc322f",
    orange = "#cb4b16",
    magenta = "#d33682",
    violet = "#6c71c4",
    cyan = "#2aa198",
    blue = "#268bd2",
    green = "#859900",
}

M.icons = {
    -- LSP diagnostic
    -- LSP diagnostic
    diagnostic = {
        error = "󰅚 ",
        warn = "󰀪 ",
        hint = "󰛨 ",
        info = "󰋽 ",
    },
    todo_comment = {
        TODO = " ",
        HACK = " ",
        WARN = " ",
        PERF = " ",
        NOTE = " ",
        TEST = "󰙨 ",
    },
    -- LSP kinds
    kind = kind_icons,
    kind_with_space = append_space(kind_icons),
}

M.cmp_format = {
    mode = "symbol",
    maxwidth = 50,
    menu = {
        lazydev = "[DEV]",
        luasnip = "[SNP]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[VIM]",
        buffer = "[BUF]",
        path = "[PTH]",
        calc = "[CLC]",
        latex_symbols = "[TEX]",
        orgmode = "[ORG]",
        cmdline = "[CMD]",
    },
}

return M
