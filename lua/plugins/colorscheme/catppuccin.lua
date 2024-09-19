---@type LazyPluginSpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  opts = {
    term_colors = true,
    color_overrides = {
      all = {
        base03 = "#002b36",
        base02 = "#073642",
        base01 = "#586e75",
        base00 = "#657b83",
        base0 = "#839496",
        base1 = "#93a1a1",
        base2 = "#eee8d5",
        base3 = "#fdf6e3",
        git_add = "#109868",
        git_change = "#859900",
        git_delete = "#9a353d",
        git_hunk_add = "#43554d",
        git_hunk_add_inline = "#3f534f",
        git_hunk_change_inline = "#41483d",
        git_hunk_delete = "#502d30",
        git_hunk_delete_inline = "#6f2e2d",

        light_blue = "#61afef",
        light_green = "#7f8700",

        comment = "#586e75",
        indentline = "#073642",
        scope_indentline = "#657b83",
        selection = "#300924",
        cursorline = "#073642",
        base = "#002b36",
        mantle = "#073642",
        crust = "#0a323d",
        text = "#93a1a1",
        subtext0 = "#839496",
        subtext1 = "#839496",
        surface0 = "#073642",
        surface1 = "#586e75",
        surface2 = "#657b83",
        overlay0 = "#586e75",
        overlay1 = "#6c71c4",
        overlay2 = "#839496",

        -- Accent Colors
        yellow = "#b58900",
        maroon = "#cb4b16",
        red = "#dc322f",
        pink = "#d33682",
        orange = "#cb4b16",
        magent = "#d33682",
        violet = "#6c71c4",
        cyan = "#2aa198",
        magenta = "#d33682",
        mauve = "#6c71c4",
        blue = "#268bd2",
        teal = "#2aa198",
        green = "#859900",

        -- rosewater = "#f5e0dc",
        -- flamingo = "#f2cdcd",
        -- peach = "#fab387",
        -- sky = "#89dceb",
        -- sapphire = "#74c7ec",
        -- lavender = "#b4befe",
      },
    },
    custom_highlights = function(color)
      return {
        NeoTreeWinSeparator = {
          fg = color.base03,
          bg = color.mantle,
        },
        -- Visual mode selection
        Visual = { bg = color.selection },

        MsgSeparator = { bg = color.mantle },

        FloatBorder = { fg = color.blue, bg = color.bg },
        LineNr = { fg = color.base01, bg = color.base02 },
        CursorLineNr = { fg = color.base3, bg = color.cyan, style = { "bold" } },
        LineNrNC = { fg = color.base1, bg = color.base02 },
        SignColumn = { bg = color.base02 }, -- column where |signs| are displayed

        TabLine = { bg = color.pink, fg = color.text },
        -- TabLineFill = { fg = color.subtext0, bg = color.mantle },
        TabLineSel = { fg = color.base, bg = color.pink },

        MatchParen = { fg = "NONE", bg = color.surface1, style = { "bold" } },

        -- telescope overrides
        TelescopeTitle = { fg = color.base, bg = color.blue },
        TelescopePreviewTitle = { fg = color.base, bg = color.green },
        TelescopePromptTitle = { fg = color.base, bg = color.red },
        TelescopeResultsTitle = { fg = color.mantle, bg = color.lavender },
        -- gitsign
        GitSignsAdd = { fg = color.git_add, bg = color.base02 },
        GitSignsAddCursorLine = { fg = color.git_add, bg = color.base02 },
        GitSignsChange = { fg = color.git_change, bg = color.base02 },
        GitSignsChangeCursorLine = { fg = color.git_change, bg = color.base02 },
        GitSignsDelete = { fg = color.git_delete, bg = color.base02 },
        GitSignsDeleteCursorLine = { fg = color.git_delete, bg = color.base02 },
        GitSignsUntracked = { fg = color.blue, bg = color.base02 },
        GitSignsUntrackedCursorLine = { fg = color.blue, bg = color.base02 },

        GitSignsAddPreview = { bg = color.git_hunk_add },
        GitSignsDeletePreview = { bg = color.git_hunk_delete },
        GitSignsAddInline = { bg = color.git_hunk_add_inline },
        GitSignsChangeInline = { bg = color.git_hunk_change_inline },
        GitSignsDeleteInline = { bg = color.git_hunk_delete_inline },
        DiagnosticSignOk = { bg = color.base02 },
        DiagnosticSignInfo = { bg = color.base02 },
        DiagnosticSignHint = { bg = color.base02 },
        DiagnosticSignError = { bg = color.base02 },
        DiagnosticSignWarn = { bg = color.base02 },

        -- -- syntax:
        Boolean = { fg = color.yellow },
        Comment = { fg = color.comment },
        PreCondit = { fg = color.orange },
        cDefine = { fg = color.orange },
        -- cBlock= { fg = color.git_add },
        -- cCppParen= { fg = color.git_add },
        Number = { fg = color.violet },
        -- "int float double"
        Type = { fg = color.fg, bold = true },
        --
        StorageClass = { fg = color.green },
        -- "struct"
        Structure = { fg = color.fg, bold = true },
        --
        Identifier = { fg = color.yellow },
        Keyword = { fg = color.magenta },
        -- 'if else then'
        Conditional = { fg = color.yellow },

        -- 'while for'
        Repeat = { fg = color.yellow, italic = true },

        Constant = { fg = color.cyan },
        Macro = { fg = color.orange },
        Special = { fg = color.yellow },

        -- "%d %p \n"
        SpecialChar = { fg = color.red },
        property = { fg = color.red },
        Include = { fg = color.magenta },

        -- treesitter:
        ["@comment"] = { fg = color.comment, italic = true },
        ["@include"] = { fg = color.magenta },
        ["@string"] = { fg = color.green },
        ["@number"] = { fg = color.violet },
        --
        -- -- "if then else "
        -- ["@conditional"] = { fg = "$code_grey" },
        ["@conditional"] = { fg = color.yellow, italic = true },
        --
        ["@constant"] = { fg = color.base1 },

        -- 枚举变量成员
        ["@constant.builtin"] = { fg = color.dark_red },

        -- ["@keyword"] = { fg = color.fg, bold = true },
        ["@keyword"] = { fg = color.yellow, bold = false },
        ["@keyword.lua"] = { fg = color.fg, bold = true },

        ["@function"] = { fg = color.cyan },
        ["@attribute"] = { fg = color.green },
        ["@keyword.function"] = { fg = color.fg },
        ["@keyword.operator"] = { fg = color.cyan },
        ["@operator"] = { fg = color.cyan },

        -- 函数参数变量名称
        ["@parameter"] = { fg = color.base1 },

        -- struct 成员
        ["@property"] = { fg = color.base0 },
        ["@preproc"] = { fg = color.orange },
        ["@define"] = { fg = color.orange },

        -- "while for"
        -- ["@repeat"] = { fg = "$code_grey" },
        ["@repeat"] = { fg = color.yellow, italic = true },

        -- 枚举变量名称
        ["@type"] = { fg = color.cyan, bold = false },

        -- 变量
        ["@variable"] = { fg = color.base1 },

        -- 变量类型
        ["@type.builtin"] = { fg = color.fg, bold = true },
        -- const
        ["@type.qualifier"] = { fg = color.green, bold = true },
        --- 括号
        ["@punctuation.bracket"] = { fg = color.fg },
        ["@punctuation.bracket.lua"] = { fg = color.fg },
        ["@string.escape"] = { fg = color.red },
        -- static
        ["@StorageClass"] = { fg = color.green },

        -- c return
        ["@keyword.return"] = { fg = color.magenta, italic = true },

        -- lsp
        --
        -- ["@lsp.type.comment"] = { fg = color.comment, italic = true },
        -- 定义宏的时候，取消颜色
        ["@lsp.type.comment"] = {},
        -- ["@lsp.type.comment.c"] = { fg = color.orange },
        -- 定义宏的时候，取消颜色
        ["@lsp.type.comment.c"] = {},
        ["@lsp.type.enum"] = { fg = color.cyan, bold = false },
        ["@lsp.type.class"] = { fg = color.fg, bold = false },
        ["@lsp.typemod.class.declaration.c"] = {
          fg = color.magenta,
          bold = false,
        },
        ["@lsp.typemod.class.fileScope.c"] = {
          fg = color.fg,
          italic = true,
          bold = true,
        },
        ["@lsp.typemod.class.globalScope.c"] = { fg = color.cyan, bold = false },
        ["@lsp.typemod.enum.declaration.c"] = {
          fg = color.magenta,
          bold = false,
        },
        ["@lsp.typemod.enum.fileScope.c"] = {
          fg = color.fg,
          italic = true,
          bold = true,
        },
        ["@lsp.typemod.enum.globalScope.c"] = { fg = color.cyan, bold = false },
        ["@lsp.mod.classScope"] = { fg = color.base0 },
        ["@lsp.type.definition"] = { fg = color.cyan, bold = true },

        ["@function.builtin"] = { fg = color.blue },
        -- ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
        -- ["@lsp.type.interface"] = hl.treesitter["@type"],
        -- ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
        -- ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
        -- ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
        ["@lsp.type.function"] = { fg = color.blue, italic = false },
        ["@lsp.type.parameter"] = { fg = color.base1, italic = false },
        ["@lsp.type.property"] = { fg = color.base0, italic = true },
        ["@lsp.type.variable"] = { fg = color.base1 },
        ["@lsp.type.macro"] = { fg = color.violet },
        -- ["@lsp.type.method"] = hl.treesitter["@method"],
        -- ["@lsp.type.number"] = hl.treesitter["@number"],
        -- ["@lsp.type.generic"] = hl.treesitter["@text"],
        -- ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
        ["@lsp.typemod.macro.globalScope"] = { fg = color.cyan },
        ["@lsp.typemod.function.defaultLibrary"] = { fg = color.light_blue },
        ["@lsp.typemod.parameter.functionScope.c"] = { fg = color.base0 },
        ["@lsp.type.operator"] = { fg = color.base0 },

        -- cmp style
        -- ["@PmenuSel"] = { fg = color.green, bg = color.base02 },
        -- ["@Pmenu"] = { fg = color.base01, bg = "NONE" },
        -- ["@CmpItemAbbrDeprecated"] = { fg = "#282c34", bg = color.green },
        -- ["@CmpItemAbbrMatch"] = { fg = color.blue, bg = "NONE" },
        -- ["@CmpItemAbbrMatchFuzzy"] = { fg = color.blue, bg = "NONE" },
        -- ["@CmpItemMenu"] = { fg = color.violet, bg = "NONE" },
        -- ["@CmpItemKindField"] = { fg = color.red, bg = "NONE" },
        -- ["@CmpItemKindProperty"] = { fg = color.red, bg = "NONE" },
        -- ["@CmpItemKindEvent"] = { fg = color.red, bg = "NONE" },
        -- ["@CmpItemKindText"] = { fg = color.green, bg = "NONE" },
        -- ["@CmpItemKindEnum"] = { fg = color.green, bg = "NONE" },
        -- ["@CmpItemKindKeyword"] = { fg = color.green, bg = "NONE" },
        -- ["@CmpItemKindConstant"] = { fg = color.yellow, bg = "NONE" },
        -- ["@CmpItemKindConstructor"] = { fg = color.yellow, bg = "NONE" },
        -- ["@CmpItemKindReference"] = { fg = color.yellow, bg = "NONE" },
        -- ["@CmpItemKindFunction"] = { fg = color.violet, bg = "NONE" },
        -- ["@CmpItemKindStruct"] = { fg = color.violet, bg = "NONE" },
        -- ["@CmpItemKindClass"] = { fg = color.violet, bg = "NONE" },
        -- ["@CmpItemKindModule"] = { fg = color.violet, bg = "NONE" },
        -- ["@CmpItemKindOperator"] = { fg = color.violet, bg = "NONE" },
        -- ["@CmpItemKindVariable"] = { fg = color.base1, bg = "NONE" },
        -- ["@CmpItemKindFile"] = { fg = color.base1, bg = "NONE" },
        -- ["@CmpItemKindUnit"] = { fg = color.yellow, bg = "NONE" },
        -- ["@CmpItemKindSnippet"] = { fg = color.yellow, bg = "NONE" },
        -- ["@CmpItemKindFolder"] = { fg = color.yellow, bg = "NONE" },
        -- ["@CmpItemKindMethod"] = { fg = color.blue, bg = "NONE" },
        -- ["@CmpItemKindValue"] = { fg = color.blue, bg = "NONE" },
        -- ["@CmpItemKindEnumMember"] = { fg = color.blue, bg = "NONE" },
        -- ["@CmpItemKindInterface"] = { fg = color.cyan, bg = "NONE" },
        -- ["@CmpItemKindColor"] = { fg = color.cyan, bg = "NONE" },
        -- ["@CmpItemKindTypeParameter"] = { fg = color.cyan, bg = "NONE" },

        -- window_picker overrides
        WindowPickerStatusLine = {
          fg = color.surface0,
          bg = color.red,
          style = { "bold" },
        },
        WindowPickerStatusLineNC = {
          fg = color.surface0,
          bg = color.red,
          style = { "bold" },
        },
        WindowPickerWinBar = {
          fg = color.surface0,
          bg = color.red,
          style = { "bold" },
        },
        WindowPickerWinBarNC = {
          fg = color.surface0,
          bg = color.red,
          style = { "bold" },
        },

        QuickFixLineNr = { fg = color.overlay0 },
      }
    end,
    integrations = {
      aerial = true,
      fidget = true,
      markdown = true,
      mason = true,
      neotree = true,
      native_lsp = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = {
        enabled = true,
      },
      noice = true,
      notify = true,
      treesitter_context = true,
      octo = true,
      overseer = true,
      symbols_outline = true,
      illuminate = true,
      ufo = false,
      which_key = true,
      window_picker = true,
    },
  },
}
