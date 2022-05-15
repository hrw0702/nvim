-- handlers = lsp_status.extensions.clangd.setup(),
-- init_options = {
--   clangdFileStatus = true
-- },
return {
    cmd = {"clangd"},
    filetypes = {"c","cpp","objc","objcpp"},
    log_level = 2,
    -- 再比如我将该服务器的工作域范围改成了当前所在目录的工作区，避免了重复运行多个同样的语言服务器的问题
    root_dir = function()
        return vim.fn.getcwd()
    end,
    on_attach = mix_attach,
}
