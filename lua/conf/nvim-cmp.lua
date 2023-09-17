local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()
local compare = require("cmp.config.compare")
local lspkind = require("lspkind")
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local WIDE_HEIGHT = 40

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	-- Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

-- vscode icons

-- local kind_icons = {
-- 	Text = "",
-- 	Method = "",
-- 	Function = "",
-- 	Constructor = "",
-- 	Field = "",
-- 	Variable = "",
-- 	Class = "",
-- 	Interface = "",
-- 	Module = "",
-- 	Property = "",
-- 	Unit = "",
-- 	Value = "",
-- 	Enum = "",
-- 	Keyword = "",
-- 	Snippet = "",
-- 	Color = "",
-- 	File = "",
-- 	Reference = "",
-- 	Folder = "",
-- 	EnumMember = "",
-- 	Constant = "",
-- 	Struct = "",
-- 	Event = "",
-- 	Operator = "",
-- 	TypeParameter = "",
-- }

local kind_text = {
	Text = "Text",
	Method = "Method",
	Function = "Function",
	Constructor = "Constructor",
	Field = "Field",
	Variable = "Variable",
	Class = "Class",
	Interface = "Interface",
	Module = "Module",
	Property = "Property",
	Unit = "Unit",
	Value = "Value",
	Enum = "Enum",
	Keyword = "Keyword",
	Snippet = "Snippet",
	Color = "Color",
	File = "File",
	Reference = "Reference",
	Folder = "Folder",
	EnumMember = "EnumMember",
	Constant = "Constant",
	Struct = "Struct",
	Event = "Event",
	Operator = "Operator",
	TypeParameter = "TypeParameter",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
	-- maxwidth = 50,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		-- 上一个
		["<C-p>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-n>"] = cmp.mapping.select_next_item(),
		-- 向上滚动
		-- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		-- 向下滚动
		-- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		-- 取消
		["<A-q>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),

		-- 接受当前选择的项目。如果未选择，则“选择”第一项
		-- `select` 设置 `false` 仅确认明确选择的项目
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<A-n>"] = cmp.mapping(function(fallback)
			-- if cmp.visible() then
			-- 	-- cmp.select_next_item()
			-- else
			if luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<A-p>"] = cmp.mapping(function(fallback)
			-- if cmp.visible() then
			-- 	cmp.select_prev_item()
			-- else
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(entry, vim_item)
			-- From kind_icons array
			-- vim_item.menu = string.format("[%s]", kind_text[vim_item.kind])
			-- print(vim_item.kind)

			vim_item.kind = string.format("%s [%s]", kind_icons[vim_item.kind], kind_text[vim_item.kind])
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind

			-- Source
			-- vim_item.menu = ({
			-- 	buffer = "[Buffer]",
			-- 	luasnip = "[LuaSnip]",
			-- 	nvim_lsp = "[LSP]",
			-- 	path = "[Path]",
			-- 	nvim_lua = "[LuaApi]",
			-- 	fuzzy_buffer = "[FuzzyBuffer]",
			-- })[entry.source.name]

			-- the maximum length of the menu item, if it's logger than this value, it will be truncated
			local maxwidth = 50
			if string.len(vim_item.abbr) > maxwidth then
				vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
			end

			return vim_item
		end,
	},
	matching = {
		-- 是否允许模糊匹配
		disallow_fuzzy_matching = true,
		-- 是否允许完全模糊匹配
		disallow_fullfuzzy_matching = true,
		-- 是否允许不带前缀匹配的模糊匹配
		disallow_partial_fuzzy_matching = true,
		-- 是否允许部分匹配
		disallow_partial_matching = false,
		-- 是否允许前缀不匹配
		disallow_prefix_unmatching = false,
	},

	view = {
		-- "custom","wildmenu","native"
		entries = "custom",
		selection_order = "top_down",
	},

	sorting = {
		priority_weight = 2,
		comparators = {
			require("cmp_fuzzy_buffer.compare"),
			compare.offset,
			compare.exact,
			-- compare.scopes,
			compare.score,
			compare.recently_used,
			-- compare.locality,
			compare.kind,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	},

	sources = {
		{ name = "nvim_lsp", keyword_length = 1 }, -- For nvim-lsp
		{ name = "luasnip", keyword_length = 2 }, -- For ultisnips user.
		{ name = "buffer", keyword_length = 2 }, -- for buffer word completion
		{ name = "path" }, -- for path completion
		{ name = "fuzzy_buffer" }, -- for fuzzy_buffer completion
		{ name = "cmp_tabnine" }, -- for fuzzy_buffer completion
		{ name = "nvim_lua" }, -- for fuzzy_buffer completion
	},

	-- 字符触发个数
	-- completion = {
	-- 	keyword_length = 2,
	-- },

	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},

	window = {
		completion = {
			cmp.config.window.bordered(),
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			-- 弹出窗口高亮设置
			-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
			-- scrolloff = 0,
			col_offset = 0,
			side_padding = 1,
			scrollbar = true,
		},
		documentation = {
			cmp.config.window.bordered(),
			max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
			max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "FloatBorder:Pmenu",
		},
	},

	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		-- { name = "buffer" },
		{ name = "fuzzy_buffer" },
	},
})

cmp.setup.cmdline("?", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "fuzzy_buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "cmdline" },
	}, {
		{ name = "path" },
	}),
})
