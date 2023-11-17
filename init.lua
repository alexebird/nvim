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

require("bird.options")
require("lazy").setup("plugins", opts)
require("bird.custom")
