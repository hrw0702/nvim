local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local lspkind = require("lspkind")
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

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
	Snippet = "",
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
	Snippet = "LuaSnip",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet
cmp.setup({
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
		["<CR>"] = cmp.mapping.confirm({ select = true }),
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
			print(vim_item.kind)
			vim_item.kind = string.format("%s [%s]", kind_icons[vim_item.kind], kind_text[vim_item.kind])
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
			-- Source
			-- vim_item.menu = ({
			-- 	buffer = "[Buffer]",
			-- 	luasnip = "[LuaSnip]",
			-- 	nvim_lsp = "[LSP]",
			-- 	path = "[Path]",
			-- })[entry.source.name]
			return vim_item
		end,
	},
	-- formatting = {
	-- 	fields = { "kind", "abbr", "menu" },
	-- 	format = function(entry, vim_item)
	-- 		local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
	-- 		local strings = vim.split(kind.kind, "%s", { trimempty = true })
	-- 		-- kind.kind = " " .. (strings[1] or "") .. " "
	-- 		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
	-- 		kind.menu = "    (" .. (strings[2] or "") .. ")"
	-- 		return kind
	-- 	end,
	-- },

	sources = {
		{ name = "nvim_lsp" }, -- For nvim-lsp
		{ name = "luasnip" }, -- For ultisnips user.
		{ name = "buffer" }, -- for buffer word completion
		{ name = "path" }, -- for path completion
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
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
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
		{ name = "buffer" },
	},
})

cmp.setup.cmdline("?", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
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

-- Customization for Pmenu
-- bg = "#282C34"
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#282c34", bg = "#9fbd73", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = false })
-- bg = "#B5585F"
vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#b5585f", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#b5585f", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#b5585f", bg = "NONE" })
-- bg = "#9FBD73"
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#9fbd73", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#9fbd73", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#9fbd73", bg = "NONE" })
-- bg = "#D4BB6C"
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#d4bb6c", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#d4bb6c", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#d4bb6c", bg = "NONE" })
-- bg = "#A377BF"#56b6c2
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#a377bf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#a377bf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#a377bf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#a377bf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#a377bf", bg = "NONE" })
-- bg = "#7E8294"
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "NONE" })
-- bg = "#D4A959"#61afef'
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#d4a959", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#d4a959", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#d4a959", bg = "NONE" })
-- bg = "#6C8ED4"
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#6c8ed4", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#6c8ed4", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#6c8ed4", bg = "NONE" })
-- bg = "#58B5A8"
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#58b5a8", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#58b5a8", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#58b5a8", bg = "NONE" })

-- -- gray
-- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
-- -- blue
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
-- -- light blue
-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
-- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
-- vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
-- -- pink
-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
-- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
-- -- front
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
-- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
