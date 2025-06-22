-- default LazyVim plugin
return {
  "folke/snacks.nvim",
  -- opts will be merged with the parent spec
  opts = {
    -- a section for each snacks plugin
    picker = {
      hidden = true,
      ignored = true,
      matcher = {
        cwd_bonus = true,
        frecency = true,
        history_bonus = true,
      },
    },
    indent = {
      -- disable all indent guides
      enabled = false,
      -- to show only the most relevant indent
      -- indent = {
      --   enabled = false,
      -- },
    },
  },
}
