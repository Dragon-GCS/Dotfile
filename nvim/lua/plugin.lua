vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- plugin manager
  use 'wbthomason/packer.nvim'
  -- color theme
  use 'sainnhe/everforest'
  -- lualine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Language server
  use 'neovim/nvim-lspconfig'
  -- Syntax parsing
  use {'nvim-treesitter/nvim-treesitter'}
  -- autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  -- icon for suggestion
  use 'onsails/lspkind-nvim'
  -- telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- file icon
  use 'kyazdani42/nvim-web-devicons'
  -- autopair 
  use 'windwp/nvim-autopairs'
  -- switch comment and code
  use 'numToStr/Comment.nvim'
  -- action with surround
  use 'tpope/vim-surround'
  -- multi cursor
  use 'mg979/vim-visual-multi'
end)
