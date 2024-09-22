local opts = function()
  local luasnip = require "luasnip"
  local cmp = require "cmp"
  local WIDE_HEIGHT = 40

  cmp.setup {
    inlay_hints = { enabled = true },
    preselect = cmp.PreselectMode.None,
    window = {
      completion = {
        cmp.config.window.bordered(),
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        -- 弹出窗口高亮设置
        -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
        -- scrolloff = 0,
        col_offset = 0,
        side_padding = 1,
        scrollbar = true,
      },
      documentation = {
        cmp.config.window.bordered(),
        max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
        max_width = math.floor(
          (WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))
        ),
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        -- winhighlight = "FloatBorder:Pmenu",
      },
    },
    completion = {
      completeopt = vim.o.completeopt,
    },

    view = {
      ---@diagnostic disable-next-line:undefined-doc-name
      ---@type selection_order = "near_cursor","top_down"
      entries = { name = "custom", selection_order = "top_down" },
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    mapping = cmp.mapping.preset.insert {
      ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<Esc>"] = cmp.mapping {
        i = cmp.mapping.close(),
        c = cmp.mapping.close(),
      },
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s", "c" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s", "c" }),
    },

    -- Set source precedence
    sources = {
      { name = "lazydev" },
      { name = "nvim_lsp" }, -- For nvim-lsp
      { name = "luasnip" }, -- For luasnip user
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },
      },
      { name = "async_path" },
    },

    --lspkind
    ---@diagnostic disable-next-line: missing-fields
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format {
          mode = "symbol",
          maxwidth = 50,
        }(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        local menu = {
          luasnip = "[SNP]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[VIM]",
          buffer = "[BUF]",
          async_path = "[PTH]",
          calc = "[CLC]",
          latex_symbols = "[TEX]",
          orgmode = "[ORG]",
        }
        kind.kind = (strings[1] or "")
        kind.menu = menu[entry.source.name]
        return kind
      end,
    },

    ---@diagnostic disable-next-line: missing-fields
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require("cmp-under-comparator").under,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
  }

  -- for cmp-smdline
  cmp.setup.cmdline(":", {
    completion = {
      completeopt = "menu,menuone,noselect",
    },
    sources = cmp.config.sources({
      { name = "async_path" },
    }, {
      { name = "cmdline" },
    }, {
      { name = "cmdline_history" },
    }),
  })
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    {
      "FelipeLema/cmp-async-path",
      url = "https://codeberg.org/FelipeLema/cmp-async-path",
    },
    "hrsh7th/cmp-cmdline",
    "dmitmel/cmp-cmdline-history",
    "saadparwaiz1/cmp_luasnip",
    "lukas-reineke/cmp-under-comparator",
    "onsails/lspkind.nvim",
  },
  event = { "InsertEnter", "CursorHold", "CursorHoldI", "User AfterLoad" },
  config = opts,
}
