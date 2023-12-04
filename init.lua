--
--  __     ___
--  \ \   / (_)_ __ ___
--   \ \ / /| | '_ ` _ \
--    \ V / | | | | | | |
--     \_/  |_|_| |_| |_| v4
--
-- alexebird@gmail.com
-- created 2023/11/13

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/old_init.vim")

vim.opt.shell = "/bin/bash"
vim.opt.backspace = "indent,eol,start"
vim.opt.compatible = false
vim.g.rustfmt_autosave = 1

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

require("lazy").setup("plugins", opts)
