-- ---@type LazyPluginSpec
-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   event = "VeryLazy",
--   opts = {
--     indent = {
--       char = "│",
--       tab_char = "│",
--       -- highlight = "IblIndent",
--       smart_indent_cap = true,
--       priority = 1,
--     },
--     whitespace = {
--       -- highlight = "IblWhitespace",
--       remove_blankline_trail = true,
--     },
--     scope = {
--       enabled = true,
--       char = nil,
--       show_start = false,
--       show_end = false,
--       injected_languages = false,
--       highlight = "IblScope",
--       priority = 500,
--       include = {
--         node_type = {
--           ["*"] = {
--             "*",
--           },
--         },
--       },
--     },
--   },
--   config = function(_, opts)
--     local ibl = require "ibl"
--     local hooks = require "ibl.hooks"
--
--     ibl.setup(opts)
--     hooks.register(
--       hooks.type.SCOPE_HIGHLIGHT,
--       hooks.builtin.scope_highlight_from_extmark
--     )
--
--     -- -- Hide first level indent, using `foldsep` to show it
--     -- hooks.register(hooks.type.VIRTUAL_TEXT, function(_, bufnr, row, virt_text)
--     --   local win = vim.fn.bufwinid(bufnr)
--     --   local lnum = row + 1
--     --   local foldinfo = utils.fold_info(win, lnum)
--     --
--     --   if
--     --     virt_text[1]
--     --     and virt_text[1][1] == opts.indent.char
--     --     and foldinfo
--     --     and foldinfo.start == lnum
--     --   then
--     --     virt_text[1] = { " ", { "@ibl.whitespace.char.1" } }
--     --   end
--     --
--     --   return virt_text
--     -- end)
--   end,
-- }
local utils = require "utils"

---@type LazyPluginSpec
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    indent = {
      char = "▏", -- Thiner, not suitable when enable scope
      tab_char = "▏",
    },
  },
  config = function(_, opts)
    local ibl = require "ibl"
    local hooks = require "ibl.hooks"

    ibl.setup(opts)

    -- Hide first level indent, using `foldsep` to show it
    hooks.register(hooks.type.VIRTUAL_TEXT, function(_, bufnr, row, virt_text)
      local win = vim.fn.bufwinid(bufnr)
      local lnum = row + 1
      local foldinfo = utils.fold_info(win, lnum)

      if
        virt_text[1]
        and virt_text[1][1] == opts.indent.char
        and foldinfo
        and foldinfo.start == lnum
      then
        virt_text[1] = { " ", { "@ibl.whitespace.char.1" } }
      end

      return virt_text
    end)
  end,
}
