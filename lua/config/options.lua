-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set tab width to 4 spaces for all languages
vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation
vim.opt.softtabstop = 4 -- Number of spaces that a tab counts for while editing
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Additional editor options
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.wrap = false -- Disable line wrapping
vim.opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true
vim.opt.matchtime = 3

-- File Related options
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.autoread = true
vim.opt.autowrite = false
local undodir = "~/.local/share/nvim/undodir"
vim.opt.undodir = vim.fn.expand(undodir)
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, "p")
end

vim.opt.clipboard = "unnamedplus"
