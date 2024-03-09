-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- deafaut terminal for windows
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "pwsh"
end

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Neovide (if installed)
if vim.g.neovide then
  vim.o.guifont = "Hack Nerd Font:h11"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

vim.opt.clipboard = "unnamedplus"
