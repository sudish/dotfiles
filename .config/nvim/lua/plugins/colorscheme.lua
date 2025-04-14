return {
  {
    "ellisonleao/gruvbox.nvim",
    --   config = function()
    --     require("gruvbox").setup({ contrast = "hard" })
    --   end,
  },

  {
    "rebelot/kanagawa.nvim",
    --   config = function()
    --     require("kanagawa").setup({ theme = "dragon" })
    --   end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "kanagawa",
    },
  },
}
