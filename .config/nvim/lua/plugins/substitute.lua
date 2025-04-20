return {
  "gbprod/substitute.nvim",
  -- opts = {},
  config = function()
    -- explicitly initialize the exchange table to workaround a bug
    require("substitute").setup({ exchange = {} })
    vim.keymap.set("n", "gss", require("substitute").operator, { desc = "Substitute", noremap = true })
    -- vim.keymap.set("n", "gsss", require("substitute").line, { desc = "Substitute line", noremap = true })
    -- vim.keymap.set("n", "gsS", require("substitute").eol, { desc = "Substitute line", noremap = true })
    vim.keymap.set("x", "gss", require("substitute").visual, { desc = "Substitute", noremap = true })
    vim.keymap.set("n", "gsx", require("substitute.exchange").operator, { desc = "Exchange", noremap = true })
    -- vim.keymap.set("n", "gsxx", require("substitute.exchange").line, { desc = "Exchange line", noremap = true })
    vim.keymap.set("x", "gsx", require("substitute.exchange").visual, { desc = "Exchange", noremap = true })
    -- vim.keymap.set("n", "gsxc", require("substitute.exchange").cancel, { desc = "Exchange cancel", noremap = true })
  end,
}
