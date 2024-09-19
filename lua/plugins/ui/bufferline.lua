---@type LazyPluginSpec
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.o.showtabline = 2
    vim.o.tabline = " "
  end,
  opts = {},
  keys = {
    {
      "<S-l>",
      "<cmd>BufferLineCycleNext<CR>",
      desc = "Buffer Next",
    },
    {
      "<S-h>",
      "<cmd>BufferLineCyclePrev<CR>",
      desc = "Buffer Prev",
    },
  },
}
