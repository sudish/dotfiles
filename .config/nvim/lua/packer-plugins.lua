return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'gruvbox-community/gruvbox'

  -- LSP configs
  use 'neovim/nvim-lspconfig'

  -- Tree-sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'RRethy/nvim-treesitter-textsubjects'
  use 'RRethy/nvim-treesitter-endwise'

  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'MunifTanjim/nui.nvim'

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'

  use 'nvim-lualine/lualine.nvim'
  use 'noib3/nvim-cokeline'

  use { 'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x' }
  use 'mrbjarksen/neo-tree-diagnostics.nvim'

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)
