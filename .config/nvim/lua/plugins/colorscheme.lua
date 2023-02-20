return {
  {
    "ellisonleao/gruvbox.nvim",
    --   config = function()
    --     require("gruvbox").setup({ contrast = "hard" })
    --   end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = "gruvbox"
    end,
  },
}
