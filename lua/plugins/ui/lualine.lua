local lazy_status = require "lazy.status"
local custom = require "custom"
local icons = custom.icons

local colors = {
  yellow = "#b58900",
  orange = "#cb4b16",
  red = "#dc322f",
  magenta = "#d33682",
  violet = "#6c71c4",
  blue = "#268bd2",
  cyan = "#2aa198",
  green = "#859900",
  bg = "#073642",
}

local function indent()
  if vim.o.expandtab then
    return "SW:" .. vim.o.shiftwidth
  else
    return "TS:" .. vim.o.tabstop
  end
end

local function lsp()
  local clients = vim.lsp.get_clients()
  local buf = vim.api.nvim_get_current_buf()
  clients = vim
    .iter(clients)
    :filter(function(client)
      return client.attached_buffers[buf]
    end)
    :filter(function(client)
      return client.name ~= "GitHub Copilot"
    end)
    :map(function(client)
      return " " .. client.name
    end)
    :totable()
  local info = " LSP:" .. string.sub(table.concat(clients, " "), 4, -1)
  if info == "" then
    return "No attached LSP server"
  else
    return info
  end
end

local function dap()
  ---@diagnostic disable-next-line: redefined-local
  local dap = package.loaded["dap"]
  if dap then
    return dap.status()
  end
  return ""
end

local function osv()
  ---@diagnostic disable-next-line: redefined-local
  local osv = package.loaded["osv"]
  if osv and osv.is_running() then
    return "Running as debuggee"
  end
  return ""
end

local function dap_or_lsp()
  if osv() ~= "" then
    return osv()
  elseif dap() ~= "" then
    return dap()
  else
    return lsp()
  end
end

---@type LazyPluginSpec
return {
  "nvim-lualine/lualine.nvim",
  init = function()
    vim.o.laststatus = 0
  end,
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "ofseed/copilot-status.nvim" },
  },
  opts = {
    sections = {
      lualine_a = {
        {
          "mode",
          icon = "",
          separator = { right = "" },
        },
      },
      lualine_b = {
        {
          "branch",
          icon = "",
        },
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
          source = function()
            return vim.b.gitsigns_status_dict
          end,
        },
      },
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostic.error,
            warn = icons.diagnostic.warn,
            info = icons.diagnostic.info,
            hint = icons.diagnostic.hint,
          },
          diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn = { fg = colors.yellow },
            color_info = { fg = colors.cyan },
            color_hint = { fg = colors.blue },
          },
        },
        -- dap_or_lsp,
      },
      lualine_x = {
        {
          lsp,
          color = { fg = colors.green },
        },
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
          color = { fg = "#ff9e64" },
        },
        {
          name = "overseer-placeholder",
          function()
            return ""
          end,
        },
        "copilot",
        indent,
        {
          "encoding",
          show_bomb = true,
        },
        "fileformat",
      },
      lualine_y = {
        {
          "progress",
          icon = "",
        },
      },
      lualine_z = {
        {
          "location",
          icon = "",
        },
      },
    },
    options = {
      icons_enabled = true,
      theme = "auto",
      disabled_filetypes = {
        statusline = {
          "alpha",
        },
      },
      always_divide_middle = true,
      globalstatus = false,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
    extensions = {
      "man",
      "quickfix",
      "nvim-tree",
      "neo-tree",
      "toggleterm",
      "symbols-outline",
      "aerial",
      "fugitive",
      "nvim-dap-ui",
      "mundo",
      "lazy",
    },
  },
}
