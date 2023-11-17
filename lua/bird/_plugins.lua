local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}


-- from my orig stuff
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "lewis6991/impatient.nvim" } -- lua startup performance fixes
  use { "nvim-lua/plenary.nvim" } -- library of lua functions
  use { "nathom/filetype.nvim" }
  use { "nvim-lua/popup.nvim" } -- An implementation of the Popup API from vim in Neovim.
  use { "kyazdani42/nvim-web-devicons" }
  use { "nvim-lualine/lualine.nvim" } -- status line
  use { "kyazdani42/nvim-tree.lua" } -- file tree
  use { "numToStr/Comment.nvim" } -- commenting
  use { "lewis6991/gitsigns.nvim" } -- git
  use { "nvim-telescope/telescope.nvim" } -- search
  use { "nvim-telescope/telescope-fzf-native.nvim" }
  use { "jremmen/vim-ripgrep" }
  use { "rebelot/kanagawa.nvim" } -- colorscheme
  use { "tpope/vim-fugitive" }
  use { "tpope/vim-rhubarb" }
  use { "tpope/vim-repeat" }
  use { "tpope/vim-surround" }
  use { "antoinemadec/FixCursorHold.nvim" } -- fix neovim CursorHold and CursorHoldI autocmd events performance bug.
                                            -- decouple updatetime from CursorHold and CursorHoldI (works for Vim and Neovim).
  use { "tpope/vim-sleuth" }
  use { "windwp/nvim-autopairs" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "norcalli/nvim-colorizer.lua" } -- A high-performance color highlighter  -- ie. highlight #FFFFFF with white background
  -- use { "bronson/vim-trailing-whitespace" }
  use { "windwp/nvim-ts-autotag" } -- Use treesitter to autoclose and autorename html tag
  use { -- easymotion-style movement
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
  }
  use { "hrsh7th/nvim-cmp" } -- completion
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hashivim/vim-terraform" }
  use { "ekalinin/Dockerfile.vim" }
  use { "rust-lang/rust.vim" }
  use { "pangloss/vim-javascript" }
  use { "MaxMEllon/vim-jsx-pretty" }
  use { "sbdchd/neoformat" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- treesitter
  use { "p00f/nvim-ts-rainbow" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" } -- sets comment plugin lang based on language under the cursor
  use { "simrat39/symbols-outline.nvim" } -- A tree like view for symbols in Neovim using the Language Server Protocol.
  -- use {
  --   'cuducos/yaml.nvim',
  --   ft = {'yaml'}, -- optional
  --   config = function ()
  --     require("config.yaml")
  --   end,
  -- }

  -- language server protocol
  use { "neovim/nvim-lspconfig" } -- Quickstart configurations for the Nvim LSP client.
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  -- use { -- Neovim plugin that allows you to seamlessly install LSP servers locally.
  --   "williamboman/nvim-lsp-installer",
  --   {
  --     "neovim/nvim-lspconfig",
  --     config = function()
  --       require("nvim-lsp-installer").setup {}
  --       local lspconfig = require("lspconfig")
  --       lspconfig.sumneko_lua.setup {}
  --     end
  --   }
  -- }

  -- use { "folke/trouble.nvim" } -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
  -- use { "tami5/lspsaga.nvim" } -- A light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
  -- use { "ray-x/navigator.lua", requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
