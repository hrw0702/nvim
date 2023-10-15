-- handlers = lsp_status.extensions.clangd.setup(),
-- init_options = {
--   clangdFileStatus = true
-- },
vim.lsp.set_log_level("off")

local lsp_status = require("lsp-status")
local cmp = require("completion")

local mix_attach = function(client)
	lsp_status.on_attach(client)
	cmp.on_attach(client)
end

return {
	cmd = {
		"clangd",
	},
	filetypes = { "c", "cpp", "cc", "objc", "objcpp" },
	log_level = 2,
	-- 再比如我将该服务器的工作域范围改成了当前所在目录的工作区，避免了重复运行多个同样的语言服务器的问题
	root_dir = function()
		return vim.fn.getcwd()
	end,
	handlers = lsp_status.extensions.clangd.setup(),
	init_options = {
		clangdFileStatus = true,
	},
	capabilities = lsp_status.capabilities,
	on_attach = mix_attach,
}
