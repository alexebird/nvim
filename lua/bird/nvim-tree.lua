require('nvim-tree').setup {
  open_on_setup = false,
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
    mappings = {
      list = {
        -- the default binding for edit_in_place is <C-e>, but I want that to work as normal,
        -- so set this binding to something I won't miss.
        { key = "<C-e>", action = "" }
      }
    }
  }
}
