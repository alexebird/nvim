--
--  __     ___
--  \ \   / (_)_ __ ___
--   \ \ / /| | '_ ` _ \
--    \ V / | | | | | | |
--     \_/  |_|_| |_| |_| v4
--
-- alexebird@gmail.com
-- created 2023/11/13, Scottsdale, AZ.

-- Lazy.vim setup
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

-- VimL vanilla vim options setup...
vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/old_init.vim")
-- ...and trying out setting them in Lua.
vim.opt.shell = "/bin/bash"
vim.opt.backspace = "indent,eol,start"
vim.opt.compatible = false

-- This removes trailing whitespace when any buffer is written.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- vim.api.nvim_create_user_command('SE', 'edit ~/.config/nvim/init.lua', {})

-- This creates a :Date command that inserts the date as a markdown #heading.
local function puts_date()
  local date_str = os.date("# %c")
  vim.api.nvim_put({date_str}, "", true, true)
end
vim.api.nvim_create_user_command("Date", puts_date, {})

-- Load Lua plugin code.
require("lazy").setup("plugins")


-- telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-k>', builtin.buffers, {})
vim.keymap.set('n', '<C-j>', function() require('telescope.builtin').oldfiles({only_cwd=true}) end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- set hop keybindings
local hop = require('hop')
vim.keymap.set('n', 's', function() hop.hint_char1() end, {remap=true})
vim.keymap.set('n', 'S', function() hop.hint_char2() end, {remap=true})

-- LSP keybindings
vim.keymap.set("n", "<leader>mr", function() vim.lsp.buf.rename() end)

-- aerial keybindings
vim.keymap.set("n", "<leader>e", "<cmd>AerialToggle!<CR>")

-- NvimTree keybindings
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeToggle<CR>")
