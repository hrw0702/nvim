local ls = require("luasnip") --{{{
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

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

-- Start Refactoring --

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
cs("trig8", {
	t("text1: "),
	i(1),
	t({ "", "text2: " }),
	i(2),
	t({ "", "copy: " }),
	d(3, function(args) -- the returned snippetNode doesn't need a position; it's inserted
        print(vim.inspect(args))
		-- "inside" the dynamicNode.
		return sn(nil, {
			-- jump-indices are local to each snippetNode, so restart at 1.
			i(1, args[1]),
		})
	end, { 1,2 }),
})


-- Tutorial Snippets go here --

local myFirstSnippet = s("myFirstSnippet", {
	t("Hi! This is my first snippets in LuaSnip."),
	i(1, "placeholder_text"),
	t("This is another text node."),
})
table.insert(snippets, myFirstSnippet)

local mySecondSnippet = s(
	"mySecondSnippet",
	fmt(
		[[
local {} = function({})
    {}
end
]],
		{
			i(1, "myVar"),
			c(2, { t("choice arg"), i(1, "myArg"), i(2, "myArg2") }),
			i(3, "-- TODO: something"),
		}
	)
)
table.insert(snippets, mySecondSnippet)

local myFirstAutoSnippet = s(
	{ trig = "digit(%d%d)", dscr = "digit number", regTrig = true },

	f(function(_, snip)
		return snip.captures[1]
	end)
)
table.insert(snippets, myFirstAutoSnippet)

local myFourSnippet = s("four", {
	t("-- Param: "),
	i(1, "text 1 "),
	i(2, { "text 2 ", "text 3 " }),

	f(function(args, snip)
		return args[1][1] .. args[1][2] .. args[2][1] .. " END"
	end, { 2, 1 }),
})
table.insert(snippets, myFourSnippet)

-- End Refactoring --
return snippets, autosnippets
