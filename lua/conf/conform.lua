local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua         = { "stylua" },
		c           = { "clang-format" },
		markdown    = { "prettier" },
		sh          = { "shfmt" },
		-- Conform will run multiple formatters sequentially
		python      = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript  = { { "prettierd", "prettier" } },
	},
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>fr", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)" })
