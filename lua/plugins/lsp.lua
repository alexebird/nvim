local lspconfig_spec = {
  'neovim/nvim-lspconfig',
  lazy = false,
}
lspconfig_spec.config = function()
  local lspconfig = require("lspconfig")
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
  })

  lspconfig.pyright.setup({
    capabilities = capabilities,
  })

  -- lspconfig.ruby_ls.setup({
  --   capabilities = capabilities,
  -- })

  lspconfig.solargraph.setup({
    capabilities = capabilities,
  })



-- Configure tsserver (TypeScript)
lspconfig.tsserver.setup {
  on_attach = on_attach,
}

  -- lspconfig.tsserver.setup({
  --   capabilities = capabilities,
  -- })
  lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
      vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
    end,
    root_dir = function(fname)
      return require('lspconfig.util').root_pattern('tsconfig.json')(fname) or
        require('lspconfig.util').root_pattern('.git')(fname)
    end,
    settings = {
      tsserver = {
        preferences = {
          importModuleSpecifier = "non-relative",
        }
      }
    }
  })

  lspconfig.gopls.setup({
    capabilities = capabilities,
  })
end

return {
  lspconfig_spec,
}
