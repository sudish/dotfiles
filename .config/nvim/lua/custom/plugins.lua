return function(use)
  use({
    'folke/which-key.nvim',
     config = function()
        require('which-key').setup({})
     end
  })

  use({
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('gruvbox').setup { contrast = 'soft' }
    end
  })

  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {
        check_ts = true,
        fast_wrap = {},
      }
    end
  })

  use({
    'kyazdani42/nvim-web-devicons',
    config = function ()
      require 'nvim-web-devicons'.setup { default = true }
    end
  })

  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  use {
    'nvim-neo-tree/neo-tree.nvim',
     branch = 'v2.x',
     requires = {
       'nvim-lua/plenary.nvim',
       'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
       'MunifTanjim/nui.nvim',
    }
  }
end
