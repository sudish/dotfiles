return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "", -- can be "hard", "soft" or empty string
      transparent_mode = true,
      overrides = {
        -- NonText must be readable so use gruvbox comment color
        NonText = { fg = "#928374" },
        -- Tabs, trailing space & nbsp and other listchars
        Whitespace = { fg = "#7c6f64" },
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
