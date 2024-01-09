-- return {
--   'simrat39/symbols-outline.nvim',
--   dependencies = {
--     'nvim-tree/nvim-web-devicons',
--   },
--   config = function()
--     require("symbols-outline").setup({
--       autofold_depth = 1,
--       relative_width = false,
--       position = 'left',
--       width = 40,
--     })
--   end,
-- }

return {
  'stevearc/aerial.nvim',
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require('aerial').setup({
      layout = {
        -- These control the width of the aerial window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_width and max_width can be a list of mixed types.
        -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
        max_width = { 40, 0.2 },
        -- width = 40,
        min_width = 10,

        -- key-value pairs of window-local options for aerial window (e.g. winhl)
        win_opts = {},

        -- Determines the default direction to open the aerial window. The 'prefer'
        -- options will open the window in the other direction *if* there is a
        -- different buffer in the way of the preferred direction
        -- Enum: prefer_right, prefer_left, right, left, float
        default_direction = "left",

        -- Determines where the aerial window will be opened
        --   edge   - open aerial at the far right/left of the editor
        --   window - open aerial to the right/left of the current window
        placement = "window",

        -- When the symbols change, resize the aerial window (within min/max constraints) to fit
        resize_to_content = false,
      },
    })
  end,
}
