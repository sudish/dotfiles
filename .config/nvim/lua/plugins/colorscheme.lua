return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "", -- can be "hard", "soft" or empty string
      transparent_mode = true,
      overrides = {
        -- Tabs, trailing space & nbsp. "#a89984" is brighter
        Whitespace = { fg = "#7c6f64" }
      }
    }
  },

  {
    "rebelot/kanagawa.nvim",
    opts = {
      keywordStyle = { italic = false },
      theme = "wave",              -- "wave", "dragon", "lotus" (light)
    }
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
