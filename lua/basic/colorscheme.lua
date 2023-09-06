-- 主题色调："dark" or "light"
-- vim.o.background = "light"
vim.o.background = "dark"
local colorscheme = "onedark"
-- 以安装主题
-- catppuccin
-- nightfox,dayfox,dawnfox,duskfox,nordfox,terafox,carbonfox
-- everforest
-- onedark
-- onedarkpro: "onedark","onelight","onedark_vivid","onedark_dark"
-- solarized
-- monokai-pro, monokai-pro-pro, monokai-pro-octagon, monokai-pro-machine
-- monokai-pro-ristretto, monokai-pro-spectrum, monokai-pro-classic
--
-- github_dark,github_dark_dimmed,github_dark_high_contrast,github_dark_colorblind
-- github_dark_tritanopia,github_light,github_light_high_contrast,github_light_colorblind
-- github_light_tritanopia

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
	return
end
