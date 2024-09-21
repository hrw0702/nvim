local lazy_status = require "lazy.status"
local custom = require "custom"
local icons = custom.icons
local colors = custom.colors

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
          -- icon = "",
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
          color = { fg = colors.green, bg = colors.base02 },
          -- color = { fg = colors.green },
        },
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
          color = { fg = colors.orange },
        },
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
          color = { fg = colors.violet, bg = colors.base02 },
        },
      },
      lualine_z = {
        {
          "location",
          icon = "",
          color = { fg = colors.base2, bg = colors.base02 },
        },
        {
          function()
            return os.date "%H:%M"
          end,
          icon = "󱑒",
          color = { fg = colors.base2, bg = colors.cyan },
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
      -- "neo-tree",
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
