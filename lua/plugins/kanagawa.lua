return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- local default_colors = require("kanagawa.colors").setup()
    -- local color = require("kanagawa.color")

    -- local my_colors = {
    --   bg_search = "#00ff00",
    -- }

    -- local overrides = 

    require("kanagawa").setup({
      -- colors = my_colors,
      overrides = function(colors)
        return {
          Search = { fg = "#000000", bg = "#FFFF00" },
          Visual = { fg = "#FFFFFF",bg = "#005FD7" },
          ExtraWhitespace = { bg = "darkred" },
          -- WinSeparator = { fg = tostring(color(default_colors.bg_light2)) },
        }
      end,
      -- dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
      globalStatus = true,       -- adjust window separators highlight for laststatus=3
    })
    -- print(vim.inspect(overrides))
    vim.cmd("colorscheme kanagawa")
  end,
}
