local ft = require("guard.filetype")

-- guard 配置格式：
-- ft('lang'):fmt('format-tool-1')
--        :append('format-tool-2')
--        :lint('lint-tool-1')
--        :append('lint-tool-2')

ft("c"):fmt("clang-format")
ft("lua"):fmt("stylua")
-- ft("rust"):fmt("rustfmt")
ft("python"):fmt("black"):append("isort")
ft("typescript,javascript,typescriptteact"):fmt("prettier")
-- ft("go"):fmt("gofumpt"):append("goimports")
ft("sh"):fmt("shfmt")

-- Call setup() LAST!
require("guard").setup({
	-- the only options for the setup function
	fmt_on_save = false,
	-- Use lsp if no formatter was defined for this filetype
	lsp_as_default_formatter = true,
})
