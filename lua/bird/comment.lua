local function map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end
require('Comment').setup()
map('n', '<leader>x', '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>')
map('n', '<leader>c', '<CMD>lua require("Comment.api").toggle.blockwise.current()<CR>')
map('x', '<leader>x', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
map('x', '<leader>c', '<ESC><CMD>lua require("Comment.api").toggle.blockwise(vim.fn.visualmode())<CR>')

