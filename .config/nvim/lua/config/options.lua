-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable inline ghost text suggestions
vim.g.cmp_ghost_text = false

-- Disable inlay hints (the grayed out type annotations)
vim.g.lazyvim_rust_diagnostics = false

-- Disable auto-formatting on save
vim.g.autoformat = false
