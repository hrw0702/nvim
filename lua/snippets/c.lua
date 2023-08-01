local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("c Snippets", { clear = true })
local file_pattern = "*.c"

local function cs(trigger, nodes, opts) --{{{
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
cs("para", {
	-- Simple static text.
	t("// @Parameters: "),
	-- function, first parameter is the function, second the Placeholders
	-- whose text it gets as input.
	f(copy, 2),
	t({ "", "void " }),
	-- Placeholder/Insert.
	i(1),
	t("("),
	-- Placeholder with initial text.
	i(2, "int foo"),
	-- Linebreak
	t({ ") {", "\t" }),
	-- Last Placeholder, exit Point of the snippet.
	i(0),
	t({ "", "}" }),
})
cs("wow", {
	t({ "After expanding, the cursor is here ->" }),
	i(2),
	t({ "", "After jumping forward once, cursor is here ->" }),
	i(1),
	t({ "", "After jumping once more, the snippet is exited there ->" }),
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

local function fn(
	args, -- text from i(2) in this example i.e. {{"456"}}
	parent, -- parent snippet or parent node
	user_args -- user_args from opts.user_args
)
	return "[" .. args[1][1] .. user_args .. "]"
end
cs("fntrig", {
	i(1),
	t("<-i(1)"),
	f(
		fn, -- callback (args,parent,user_args) -> string
		{ 2 }, -- node indice(s) whose text is passed to fn, i.e i(2)
		{ user_args = { "user_args_value" } } -- opts
	),
	t("i(2)->"),
	i(2),
	t("<-i(2) i(0)->"),
	i(0),
})

cs(
	"cnode",
	c(1, {
		t("Ugh boring, a text node"),
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
	t({ "vim.cmd[[", "  " }),
	i(1, ""),
	t({ "", "]]" }),
}) --}}}
cs("cmd", fmt("vim.cmd[[{}]]", { i(1, "") })) -- single line vim.cmd
cs({ -- github import for packer{{{
	trig = "https://github%.com/([%w-%._]+)/([%w-%._]+)!",
	regTrig = true,
	hidden = true,
}, {
	t([[use "]]),
	f(function(_, snip)
		return snip.captures[1]
	end),
	t("/"),
	f(function(_, snip)
		return snip.captures[2]
	end),
	t({ [["]], "" }),
	i(1, ""),
}, "auto") --}}}

cs( -- {regexSnippet} LuaSnippet{{{
	"regexSnippet",
	fmt(
		[=[
cs( -- {}
{{ trig = "{}", regTrig = true, hidden = true }}, fmt([[
{}
]], {{
  {}
}}))
      ]=],
		{
			i(1, "Description"),
			i(2, ""),
			i(3, ""),
			i(4, ""),
		}
	),
	{ pattern = "*/snippets/*.lua", "<C-d>" }
) --}}}
cs( -- [luaSnippet] LuaSnippet{{{
	"luaSnippet",
	fmt(
		[=[
cs("{}", fmt( -- {}
[[
{}
]], {{
  {}
  }}){})
    ]=],
		{
			i(1, ""),
			i(2, "Description"),
			i(3, ""),
			i(4, ""),
			c(5, {
				t(""),
				fmt([[, "{}"]], { i(1, "keymap") }),
				fmt([[, {{ pattern = "{}", {} }}]], { i(1, "*/snippets/*.lua"), i(2, "keymap") }),
			}),
		}
	),
	{ pattern = "*/snippets/*.lua", "jcs" }
) --}}}

cs( -- choice_node_snippet luaSnip choice node{{{
	"choice_node_snippet",
	fmt(
		[[
c({}, {{ {} }}),
]],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	{ pattern = "*/snippets/*.lua", "jcn" }
) --}}}

cs( -- [function] Lua function snippet{{{
	"function",
	fmt(
		[[
function {}({})
  {}
end
]],
		{
			i(1, ""),
			i(2, ""),
			i(3, ""),
		}
	),
	"jff"
) --}}}
cs( -- [local_function] Lua function snippet{{{
	"local_function",
	fmt(
		[[
local function {}({})
  {}
end
]],
		{
			i(1, ""),
			i(2, ""),
			i(3, ""),
		}
	),
	"jlf"
) --}}}
cs( -- [local] Lua local variable snippet{{{
	"local",
	fmt(
		[[
local {} = {}
  ]],
		{ i(1, ""), i(2, "") }
	),
	"jj"
) --}}}

-- Tutorial Snippets go here --

-- End Refactoring --

return snippets, autosnippets
