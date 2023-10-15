local lint = require("lint")

lint.linters_by_ft = {
	c = { "cpplint" },
	lua = { "luacheck" },
}
