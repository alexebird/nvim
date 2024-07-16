return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = function()
    require('lualine').setup({
      sections = {
        lualine_b = {'diff', 'diagnostics'},
        lualine_c = {
          { 'filename', path = 1 }
        },
        lualine_x = {
          'aerial',
          -- 'encoding',
          -- 'fileformat',
          'filetype',
        },
      }
    })
  end,
}

