return {
  'ray-x/navigator.lua',
  dependencies = { 'neovim/nvim-lspconfig', { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' } },
  -- lazy = false,
  -- dev = dev,
  config = function ()
    require('navigator').setup()
  end,
}
