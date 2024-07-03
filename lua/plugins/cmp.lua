-- cmp.setup({
--   mapping = {
--     -- ["<Tab>"] = cmp.mapping(function(fallback)
--     --   if cmp.visible() then
--     --     cmp.select_next_item()
--     --   -- else
--     --     -- ultisnips_mappings.expand_or_jump_forwards(fallback)
--     --   end
--     -- end),
--     -- ["<S-Tab>"] = function(fallback)
--     --   if cmp.visible() then
--     --     cmp.select_prev_item()
--     --   -- else
--     --     -- ultisnips_mappings.expand_or_jump_backwards(fallback)
--     --   end
--     -- end,
--     ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--     ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--     ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--     ['<C-e>'] = cmp.mapping({
--       i = cmp.mapping.abort(),
--       c = cmp.mapping.close(),
--     }),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--   },
--   sources = cmp.config.sources({
--     { name = 'nvim_lsp' },
--     -- { name = 'vsnip' }, -- For vsnip users.
--     -- { name = 'luasnip' }, -- For luasnip users.
--     -- { name = 'ultisnips' }, -- For ultisnips users.
--     -- { name = 'snippy' }, -- For snippy users.
--   },
--   {
--     {
--       name = 'buffer',
--       keyword_length = 2,
--       option = {
--         -- include all buffers
--         get_bufnrs = function()
--           return vim.api.nvim_list_bufs()
--         end
--       }
--     },
--   })
-- })



local cmp_spec = {
  'hrsh7th/nvim-cmp',
  lazy = false,
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
  },
}

cmp_spec.config = function()
  local cmp = require("cmp")
  -- vim.opt.completeopt = { "menu", "menuone", "noselect" }
  --
  --

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      {
        name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end
        }
      },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

return {
  cmp_spec,
}
