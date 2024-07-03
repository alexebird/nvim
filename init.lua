--
--  __     ___
--  \ \   / (_)_ __ ___
--   \ \ / /| | '_ ` _ \
--    \ V / | | | | | | |
--     \_/  |_|_| |_| |_| v4
--
-- alexebird@gmail.com
-- created 2023/11/13, Scottsdale, AZ.
--

IS_WSL = vim.fn.has('wsl') == 1 or os.getenv("WSL_DISTRO_NAME") ~= nil

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

local signs = {
    Error = "",
    Warning = "",
    Hint = "💡",
    Information = ""
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end


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
vim.keymap.set("n", "<leader>mr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>md", vim.lsp.buf.definition)


function Set_loclist_with_wrap()
  -- Set the location list with diagnostics
  vim.diagnostic.setloclist()

  -- Enable text wrapping in the location list window
  vim.cmd('autocmd! FileType qf setlocal wrap')
end
-- vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, {silent = true, buffer = true})
-- vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>dq', Set_loclist_with_wrap, { noremap = true, silent = true })
vim.keymap.set('n', 'd[', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'd]', vim.diagnostic.goto_next)

-- aerial keybindings
vim.keymap.set("n", "<leader>e", "<cmd>AerialToggle!<CR>")

-- NvimTree keybindings
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeToggle<CR>")


function Format_diagnostic_message(diagnostic, bufnr)
  local message = diagnostic.message
  local win_width = vim.api.nvim_win_get_width(0)
  local line = vim.api.nvim_buf_get_lines(bufnr, diagnostic.lnum, diagnostic.lnum + 1, false)[1]
  local line_length = #line
  local available_space = win_width - line_length - 1  -- Adjust space for padding
  local max_length = math.floor(available_space * 0.7)  -- Use 70% of the available space
  if #message > max_length then
    message = message:sub(1, max_length) .. '...'
  end
  return message
end

-- Configure diagnostic handlers to use floating windows
vim.diagnostic.config({
  -- virtual_text = true,  -- Disable virtual text
  virtual_text = {
    prefix = '●',  -- Change the prefix if needed
    source = "always",  -- Show the source of the diagnostic
    format = function(diagnostic)
      return Format_diagnostic_message(diagnostic, diagnostic.bufnr)
    end,  --
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "always",  -- Show the source of the diagnostic in the floating window
    border = "rounded",  -- Use rounded borders for the floating window
    focusable = true,   -- Make the floating window focusable
    scope = "line",      -- Show diagnostics for the whole line
  },
})

-- Function to open a floating window for diagnostics
-- function ShowDiagnostics()
--   local opts = {
--     focusable = true,  -- Make the floating window focusable
--     close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--     border = "rounded",
--     source = "always",
--     prefix = " ",
--   }
--   vim.diagnostic.open_float(nil, opts)
-- end

-- vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua ShowDiagnostics()<CR>', { noremap = true, silent = true })
