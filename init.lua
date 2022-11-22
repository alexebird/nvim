--
--  __     ___
--  \ \   / (_)_ __ ___
--   \ \ / /| | '_ ` _ \
--    \ V / | | | | | | |
--     \_/  |_|_| |_| |_| v3
--
-- alexebird@gmail.com
-- created 2022/11/21
--
-- resources:
-- - https://numbersmithy.com/migrating-from-vim-to-neovim-at-the-beginning-of-2022/#nvim-cmp_completion_does_not_pick_up_words_from_other_buffers
--
-- Based on: https://github.com/LunarVim/nvim-basic-ide. The creator also has a YouTube playlist.

require "bird.impatient"
require "bird.plugins"
require "bird.options"

vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/old_init.vim")

require "bird.nvim-tree"
require "bird.comment"
require "bird.lualine"
require "bird.gitsigns"
require "bird.telescope"
require "bird.autopairs"
require "bird.colorizer"
require "bird.autotag"
require "bird.indent_blankline"
require "bird.hop"
require "bird.kanagawa"          -- colorscheme
require "bird.treesitter"
require "bird.cmp"
require "bird.lsp"
require "bird.symbols-outline"
require "bird.custom"
