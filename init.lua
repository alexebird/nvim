--
--  __     ___
--  \ \   / (_)_ __ ___
--   \ \ / /| | '_ ` _ \
--    \ V / | | | | | | |
--     \_/  |_|_| |_| |_| v4
--
-- alexebird@gmail.com
-- created 2023/11/13, Scottsdale, AZ.

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

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

require("lazy").setup("plugins")
-- not added over from old vim setup yet:
-- use { "sbdchd/neoformat" }
-- use { "folke/trouble.nvim" } -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
-- use { "tami5/lspsaga.nvim" } -- A light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
-- use { "ray-x/navigator.lua", requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}

-- set hop keybindings
local hop = require('hop')
vim.keymap.set('n', 's', function()
  hop.hint_char1()
end, {remap=true})
vim.keymap.set('n', 'S', function()
  hop.hint_char2()
end, {remap=true})

-- trouble keybindings
vim.keymap.set("n", "<leader>tx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "<leader>tr", function() require("trouble").toggle("lsp_references") end)

vim.keymap.set("n", "<leader>mr", function() vim.lsp.buf.rename() end)
