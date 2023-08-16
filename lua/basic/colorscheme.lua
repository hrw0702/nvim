-- 主题色调："dark" or "light"
-- vim.o.background = "light"
vim.o.background = "dark"
local colorscheme = "onedark"
-- 以安装主题
-- catppuccin
-- nightfox,dayfox,dawnfox,duskfox,nordfox,terafox,carbonfox
-- onedark
-- everforest
-- monokai-pro
--
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- carbonfox
-- melange
--
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
	return
end
