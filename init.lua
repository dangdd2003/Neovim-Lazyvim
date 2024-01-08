-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- neovide setings
if vim.g.neovide then
  vim.o.guifont = "Hack Nerd Font:h11"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
