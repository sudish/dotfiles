-- default LazyVim plugin
return {
  {
    "folke/snacks.nvim",
    -- opts will be merged with the parent spec
    opts = {
      -- a section for each snacks plugin
      indent = {
        -- disables all indent guides
        enabled = false,
        -- to show only the most relevant indent
        -- indent = {
        --   enabled = false,
        -- },
      },
    },
  },
}
