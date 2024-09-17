-- 基础配置
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- 全局状态栏
-- vim.opt.laststatus = 3
-- jk移动时光标下上方保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 行间距
-- vim.o.linespace = 30
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true

-- 高亮所在行
vim.wo.cursorline = true

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"

-- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "80"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- 新行对齐当前行，空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

-- 搜索不要高亮
vim.o.hlsearch = false

-- 边输入边搜索
vim.o.incsearch = true

-- 使用增强状态栏后不再需要 vim 的模式提示
-- vim.o.showmode = false

-- 命令行高为2，提供足够的显示空间
-- vim.o.cmdheight = 1

-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true

-- 禁止折行
vim.o.wrap = false
vim.wo.wrap = false

-- 行结尾可以跳到下一行
vim.o.whichwrap = "b,s,<,>,[,],h,l"

-- 允许隐藏被修改过的buffer
vim.o.hidden = true

-- 鼠标支持
vim.o.mouse = "a"

-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime
vim.o.updatetime = 300

-- 等待mappings
vim.o.timeoutlen = 300

-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- -- 主题样式
-- vim.o.background = "dark"
-- vim.o.termguicolors = true
-- vim.opt.termguicolors = true

-- 不可见字符的显示，这里只把空格显示为一个点
-- vim.o.list = true
-- vim.o.listchars = "space:·"

-- 代码手工折叠: "manual","indent","syntax","marker"
-- zf: 创建折叠
-- za: 打开/关闭当前的折叠
-- zc: 关闭当前打开的折叠
-- zo: 打开当前的折叠
-- zm: 关闭所有的折叠
-- zM: 关闭所有折叠及其嵌套的折叠
-- zr: 打开所有的折叠
-- zR: 打开所有折叠及其嵌套的折叠
-- zd: 删除当前的折叠
-- zE: 删除所有的折叠
-- zj: 移动至下一个折叠
-- zk: 移动至上一个折叠
-- zn: 禁用折叠
-- zN: 启用折叠
vim.opt.foldenable = true
vim.opt.foldmethod = "manual"
vim.wo.foldlevel = 99

-- 补全增强
vim.o.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.pumheight = 10

-- always show tabline

-- -- 自动缩进的策略为 plugin
-- vim.o.filetype = "plugin"

-- vim.g.python3_host_prog = "/usr/bin/python3"
-- -- disable Node.js provider (optional)
-- vim.g.loaded_node_provider = 0
-- -- disable Perl provider (optional)
-- vim.g.loaded_perl_provider = 0

-- wsl 下 neovim 和系统之间复制配置
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}
-- vim.opt.exrc = true
--
-- -- Edit
-- vim.opt.expandtab = true
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.undofile = true
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
-- vim.opt.list = true
vim.opt.includeexpr = "substitute(v:fname,'\\.','/','g')"
vim.opt.jumpoptions = "stack"
-- vim.opt.completeopt = { "menu", "menuone", "noinsert" }
-- vim.opt.swapfile = false
--
-- -- Interface
-- vim.opt.confirm = true
-- vim.opt.splitkeep = "screen"
-- vim.opt.splitbelow = true
-- vim.opt.splitright = true
-- vim.opt.number = true
-- vim.opt.breakindent = true
-- vim.opt.linebreak = true
-- vim.opt.mouse = "a"
-- vim.opt.mousemoveevent = true
-- vim.opt.termguicolors = true
-- vim.opt.title = true
-- vim.opt.signcolumn = "yes"
-- vim.opt.cursorline = true
-- vim.opt.conceallevel = 2
-- vim.opt.scrolloff = 8
-- vim.opt.sidescrolloff = 8
-- vim.opt.smoothscroll = true
-- vim.opt.pumblend = 12
-- vim.opt.pumheight = 12
-- vim.opt.hlsearch = false
-- -- 显示左侧图标指示列
-- vim.wo.signcolumn = "yes"
-- -- vim.opt.colorcolumn = "81"
-- vim.opt.guifont = "Cascadia Code NF:h12"
-- vim.opt.shortmess:append "I"
vim.opt.fillchars = {
  eob = " ",
  diff = "╱",
  foldopen = "",
  foldclose = "",
  foldsep = "▕",
}
vim.opt.guicursor = {
  "n-v-c-sm:block-Cursor/lCursor",
  "i-ci-ve:ver25-Cursor/lCursor",
  "r-cr-o:hor20-Cursor/lCursor",
}

---@diagnostic disable-next-line: param-type-mismatch
vim.opt.runtimepath:append(vim.fs.joinpath(vim.fn.stdpath "data", "site"))
