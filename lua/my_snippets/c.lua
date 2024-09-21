local ls = require "luasnip"

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require "luasnip.util.types"
local conds = require "luasnip.extras.conditions"
local conds_expand = require "luasnip.extras.conditions.expand"

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("c Snippets", { clear = true })
local file_pattern = "*.c"

local function cs(trigger, nodes, opts)
  local snippet = s(trigger, nodes)
  local target_table = snippets

  local pattern = file_pattern
  local keymaps = {}

  if opts ~= nil then
    -- check for custom pattern
    if opts.pattern then
      pattern = opts.pattern
    end

    -- if opts is a string
    if type(opts) == "string" then
      if opts == "auto" then
        target_table = autosnippets
      else
        table.insert(keymaps, { "i", opts })
      end
    end

    -- if opts is a table
    if opts ~= nil and type(opts) == "table" then
      for _, keymap in ipairs(opts) do
        if type(keymap) == "string" then
          table.insert(keymaps, { "i", keymap })
        else
          table.insert(keymaps, keymap)
        end
      end
    end

    -- set autocmd for each keymap
    if opts ~= "auto" then
      for _, keymap in ipairs(keymaps) do
        vim.api.nvim_create_autocmd("BufEnter", {
          pattern = pattern,
          group = group,
          callback = function()
            vim.keymap.set(keymap[1], keymap[2], function()
              ls.snip_expand(snippet)
            end, { noremap = true, silent = true, buffer = true })
          end,
        })
      end
    end
  end

  table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- -- Start Refactoring --
local function copy(args)
  return args[1]
end

-- complicated function for dynamicNode.
local function docsnip(args, _, old_state)
  -- vim.notify("args: " .. vim.inspect(args))
  -- !!! old_state is used to preserve user-input here. DON'T DO IT THAT WAY!
  -- Using a restoreNode instead is much easier.
  -- View this only as an example on how old_state functions.
  local nodes = {
    t { "/**", " * " },
    i(1, "A short Description"),
    t { "", "" },
  }

  -- These will be merged with the snippet; that way, should the snippet be updated,
  -- some user input eg. text can be referred to in the new snippet.
  local param_nodes = {}

  if old_state then
    nodes[2] = i(1, old_state.descr:get_text())
  end
  param_nodes.descr = nodes[2]

  -- At least one param.
  if string.find(args[2][1], ", ") then
    vim.list_extend(nodes, { t { " * ", "" } })
  end

  local insert = 2
  for indx, arg in ipairs(vim.split(args[2][1], ",", true)) do
    -- Get actual name parameter.
    local arg_t = {}
    arg_t = vim.split(arg, " ", true)
    -- arg = vim.split(arg, " ", true)[2]
    arg = arg_t[#arg_t]

    if arg then
      local inode
      -- if there was some text in this parameter, use it as static_text for this new snippet.
      if old_state and old_state[arg] then
        inode = i(insert, old_state["arg" .. arg]:get_text())
      else
        inode = i(insert)
      end
      vim.list_extend(
        nodes,
        { t { " * @param " .. arg .. " " }, inode, t { "", "" } }
      )
      param_nodes["arg" .. arg] = inode

      insert = insert + 1
    end
  end

  if args[1][1] ~= "void" then
    local inode
    if old_state and old_state.ret then
      inode = i(insert, old_state.ret:get_text())
    else
      inode = i(insert)
    end

    vim.list_extend(
      nodes,
      { t { " * ", " * @return " .. args[1][1] .. " " }, inode, t { "", "" } }
    )
    param_nodes.ret = inode
    insert = insert + 1
  end

  vim.list_extend(nodes, { t { " */" } })

  local snip = sn(nil, nodes)
  -- Error on attempting overwrite.
  snip.old_state = param_nodes
  return snip
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
  local file = io.popen(command, "r")
  local res = {}

  if file ~= nil then
    for line in file:lines() do
      table.insert(res, line)
    end
  end

  return res
end

-- Returns a snippet_node wrapped around an insertNode whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, snip, old_state, fmt)
  local fmt = fmt or "%Y-%m-%d"
  return sn(nil, i(1, os.date(fmt)))
end

local function get_filename()
  return vim.fn.fnamemodify(vim.fn.expand "%", ":t")
end

cs("para", {
  -- Simple static text.
  t "// @Parameters: ",
  -- function, first parameter is the function, second the Placeholders
  -- whose text it gets as input.
  f(copy, 2),
  t { "", "void " },
  -- Placeholder/Insert.
  i(1),
  t "(",
  -- Placeholder with initial text.
  i(2, "int foo"),
  -- Linebreak
  t { ") {", "\t" },
  -- Last Placeholder, exit Point of the snippet.
  i(0),
  t { "", "}" },
})
cs("wow", {
  t { "After expanding, the cursor is here ->" },
  i(2),
  t { "", "After jumping forward once, cursor is here ->" },
  i(1),
  t { "", "After jumping once more, the snippet is exited there ->" },
  i(0),
})
cs( -- [wow test],wow snippet
  "wowtest",
  fmt(
    [[
    After expanding, the cursor is here 1-->{}
    After expanding, the cursor is here 2 -->{}
    After expanding, the cursor is here 0 -->{}
    ]],
    {
      i(1, "1"),
      i(2, "2"),
      i(0, "0"),
    }
  )
)
cs(
  {
    trig = "cr",
    name = "Document description",
    dscr = "c Document description and Copyright.",
  },
  fmt(
    [[
    /*
     * @File:           {} 
     * @Description:    {} 
     * @Version:        {} 
     * @Date:           {} 
     * @Author:         HRW 
     * @Copyright:      (C) HRW. {}. All Rights Reserved.
     */
    ]],
    {
      f(function(_, snip)
        return snip.env.TM_FILENAME
      end),
      i(1, "document description"),
      i(2, "V1.0"),
      i(3, { os.date "%Y-%m-%d %X" }),
      i(4, { os.date "%Y" }),
    }
  )
)

cs({
  trig = "fn",
  name = "Function Snippet",
  dscr = "Automatically generate comment: \n@description \n@parameters [in]\n@return",
}, {
  d(6, docsnip, { 2, 4 }),
  t { "", "" },
  c(1, {
    t "",
    t "struct ",
    t "",
  }),
  c(2, {
    t "void",
    -- t("String"),
    t "char",
    t "int",
    t "float",
    t "double",
    -- t("boolean"),
    i(nil, ""),
  }),
  t " ",
  i(3, "myFunc"),
  t "(",
  i(4),
  t ")",
  c(5, {
    t "",
    sn(nil, {
      t("", ""),
      -- t({ "", " throws " }),
      -- i(1),
    }),
  }),
  t { " {", "\t" },
  i(0, "// TODO"),
  t { "", "}" },
})

cs(
  "cnode",
  c(1, {
    t "Ugh boring, a text node",
    i(nil, "At least I can edit something now..."),
    f(function(args)
      return "Still only counts as text!!"
    end, {}),
  })
)

cs( -- [while] JS While Loop snippet{{{
  "mywhile",
  fmt(
    [[
while ({}) {{
  {}
}}
  ]],
    {
      i(1, ""),
      i(2, "// TODO:"),
    }
  )
) --}}}
--
cs("CMD", { -- [CMD] multiline vim.cmd{{{
  t { "vim.cmd[[", "  " },
  i(1, ""),
  t { "", "]]" },
}) --}}}
cs("cmd", fmt("vim.cmd[[{}]]", { i(1, "") })) -- single line vim.cmd
cs({ -- github import for packer{{{
  trig = "https://github%.com/([%w-%._]+)/([%w-%._]+)!",
  regTrig = true,
  hidden = true,
}, {
  t [[use "]],
  f(function(_, snip)
    return snip.captures[1]
  end),
  t "/",
  f(function(_, snip)
    return snip.captures[2]
  end),
  t { [["]], "" },
  i(1, ""),
}, "auto") --}}}

-- Tutorial Snippets go here --

-- End Refactoring --


return snippets, autosnippets
