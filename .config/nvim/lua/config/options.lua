-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- allow cursor keys to move through line beginnings/ends
vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,]"

-- don't auto continue comments
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

vim.g.have_nerd_font = true

vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Preview substitutions live
vim.opt.inccommand = "split"

-- LazyVim options
vim.g.autoformat = false
