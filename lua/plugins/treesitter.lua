return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "css",
        "go",
        "html",
        "javascript",
        "lua",
        "python",
        "query",
        "ruby",
        "scss",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

-- configs.setup({
--   ensure_installed = {
--     "lua",
--     "markdown",
--     "markdown_inline",
--     "bash",
--     "python",
--     "ruby",
--     "javascript",
--   }, -- put the language you want in this array
--
--   -- ensure_installed = "all", -- one of "all" or a list of languages
--   ignore_install = { "" }, -- List of parsers to ignore installing
--   sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
--
--   highlight = {
--     enable = true, -- false will disable the whole extension
--     disable = { "css" }, -- list of language that will be disabled
--   },
--   autopairs = {
--     enable = true,
--   },
--   indent = { enable = true, disable = { "python", "css" } },
--
--   context_commentstring = {
--     enable = true,
--     enable_autocmd = false,
--   },
-- })
