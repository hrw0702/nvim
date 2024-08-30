local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
return {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "require" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					vim.api.nvim_get_runtime_file("", true),
					-- Neovim 配置目录
					-- [vim.fn.stdpath("$HOME/.config/nvim") .. "/lua"] = true,
					-- [vim.fn.stdpath("config") .. "/lua"] = true,
					[vim.fn.stdpath("config") .. "/lua"],
					"${3rd}/busted/library",
					"${3rd}/luassert/library",
					"${3rd}/luv/library",
				},
				checkThirdParty = {
					enable = false,
				},
                maxPreload = 5000,
                preloadFileSize = 10000,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
