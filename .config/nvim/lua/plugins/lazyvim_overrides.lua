-- Override behavior of default LazyVim plugins
return {
  -- snacks includes a lot of plugins
  {
    "folke/snacks.nvim",
    -- opts will be merged with the parent spec
    opts = {
      indent = {
        -- disables all indent guides
        enabled = false,
        -- indent = {
        --   -- disable to have only most local indent guide shown
        --   enabled = false,
        -- },
      },
    },
  },
}
