return {
  'nvim-tree/nvim-tree.lua',
  version = "*",
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require('nvim-tree.api')
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.del('n', '<C-E>', { buffer = bufnr })
    end

    require('nvim-tree').setup {
      -- open_on_setup = false,
      on_attach = my_on_attach,
      filters = {
        dotfiles = true,
        custom = {
          "^__pycache__$",
        },
      },
      git = {
        ignore = false,
      },
      view = {
        width = 40,
      },
    }
  end,
}
