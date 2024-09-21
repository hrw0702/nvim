---@type LazyPluginSpec
return {
  "folke/trouble.nvim",
  enabled = true,
  init = function()
    -- HACK: Hijack quickfix to open trouble
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "qf",
      callback = function(args)
        local bufnr = args.buf
        vim.schedule(function()
          local winid = vim.fn.bufwinid(bufnr)
          if winid == -1 then
            return
          end
          vim.api.nvim_win_close(winid, true)
          require("trouble").open "quickfix"
        end)
      end,
    })
  end,
  keys = {
    {
      "<leader>q",
      "<Cmd>Trouble diagnostics <CR>",
      -- function()
      -- require("trouble").toggle "quickfix"
      -- end,
      desc = "Quickfix",
    },
  },
  opts = {
    auto_close = true,
    focus = true,
    keys = { ["<cr>"] = "jump_close" },
    win = { size = { width = 0.3, height = 0.4 } },
  },
}
