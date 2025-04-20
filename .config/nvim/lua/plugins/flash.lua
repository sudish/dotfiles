-- default LazyVim plugin
return {
  {
    "folke/flash.nvim",
    -- opts will be merged with the parent spec
    opts = {
      jump = {
        nohlsearch = true,
      },
      label = {
        rainbow = { enabled = true, shade = 8 },
      },
    },
  },
}
