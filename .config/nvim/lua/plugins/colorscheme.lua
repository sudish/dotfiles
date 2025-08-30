return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "", -- can be "hard", "soft" or empty string
      transparent_mode = true,
      overrides = {
        -- NonText must be readable so use lighter gruvbox colors
        -- NonText = { fg = "#928374" }, -- comment color
        NonText = { fg = "#7c6f64" }, -- dark4
        -- Tabs, trailing space & nbsp and other listchars
        Whitespace = { fg = "#665c54" }, -- dark3
        -- Missing in gruvbox
        TreesitterContext = { link = "Folded" },
        TreesitterContextLineNumber = { link = "CursorLineNr" },
      },
    },
  },

  {
    "rebelot/kanagawa.nvim",
    opts = {
      keywordStyle = { italic = false },
      theme = "wave", -- "wave", "dragon", "lotus" (light)
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      -- colorscheme = "gruvbox",
      -- colorscheme = "kanagawa",
    },
  },
}
