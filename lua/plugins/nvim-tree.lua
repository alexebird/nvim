return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
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
      -- view = {
        -- mappings = {
        --   list = {
        --     -- the default binding for edit_in_place is <C-e>, but I want that to work as normal,
        --     -- so set this binding to something I won't miss.
        --     { key = "<C-e>", action = "" }
        --   }
        -- }
      -- }
    }
  end,
}
