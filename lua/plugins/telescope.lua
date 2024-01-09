return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-h>"] = "which_key",
              ["<esc>"] = require('telescope.actions').close,
            }
          },
          layout_strategy = 'vertical',
          layout_config = {
            -- height = 0.99,
            -- width = 0.99,
            height={padding=0},
            width={padding=0},
          },
        },
      })
    end,
  },

  -- {
  --   "nvim-telescope/telescope-fzf-native.nvim",
  --   lazy = false,
  -- },
}
