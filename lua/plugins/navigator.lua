if IS_WSL then
  return {}
else
  return {
    -- 'ray-x/navigator.lua',
    -- dependencies = { 'neovim/nvim-lspconfig', { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' } },
    -- -- lazy = false,
    -- -- dev = dev,
    -- config = function()
    --   require('navigator').setup({
    --     default_mapping = false,
    --     keymaps = {
    --       { key = "gK", func = vim.lsp.declaration, desc = 'declaration' },
    --       { key = 'gW', func = require('navigator.workspace').workspace_symbol_live, desc = 'workspace_symbol_live' },
    --       { key = '<Space>ca', mode = 'n', func = require('navigator.codeAction').code_action, desc = 'code_action' },
    --       { key = '<Space>ca', mode = 'v', func = require('navigator.codeAction').range_code_action, desc = 'range_code_action' },
    --       { key = '<Space>rn', func = require('navigator.rename').rename, desc = 'rename' },
    --       { key = '<Space>D', func = vim.lsp.buf.type_definition, desc = 'type_definition' },
    --       { key = 'gL', func = require('navigator.diagnostics').show_diagnostics, desc = 'show_diagnostics' },
    --       { key = 'gG', func = require('navigator.diagnostics').show_buf_diagnostics, desc = 'show_buf_diagnostics' },
    --       { key = '<Leader>dt', func = require('navigator.diagnostics').toggle_diagnostics, desc = 'toggle_diagnostics' },
    --       { key = ']d', func = vim.diagnostic.goto_next, desc = 'next diagnostics' },
    --       { key = '[d', func = vim.diagnostic.goto_prev, desc = 'prev diagnostics' },
    --       { key = '<Space>ff', func = vim.lsp.buf.range_formatting, mode = 'v', desc = 'range format' },
    --     },
    --     lsp = {
    --       format_on_save = false,
    --     },
    --   })
    -- end,
  }
end
