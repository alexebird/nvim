return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {
    keys = "etovxqpdygfblzhckisuran"
  },
  config = function()
    vim.api.nvim_set_keymap("n", "s", "<cmd>lua require'hop'.hint_char1()<cr>", {})
    vim.api.nvim_set_keymap("n", "S", "<cmd>lua require'hop'.hint_char2()<cr>", {})
  end
}
