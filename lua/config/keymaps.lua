-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Ad any additional keymaps here
local keymap = vim.keymap
local Util = require("lazyvim.util")

-- Copy all
-- keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file" })

-- Go to beginning and end in normal mode
keymap.set({ "n", "v" }, "<C-b>", "^", { desc = "Beginning of line" })
keymap.set({ "n", "v" }, "<C-e>", "$", { desc = "End of line" })

-- Go to beginning and end in insert mode
keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })

-- Navigate within insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Toggle neotree
keymap.set("n", "<C-n>", "<leader>fE", { desc = "Explorer NeoTree (cwd)", remap = true })

-- Vimtex keymaps
keymap.set("n", "<Leader>vc", "<Cmd>VimtexCompile<CR>", { desc = "Vimtex Compile" })
keymap.set("n", "<Leader>vx", "<Cmd>VimtexClean<CR>", { desc = "Vimtex Clean" })

-- Add additional undo breack-points
keymap.set("i", "?", "?<c-g>u")
keymap.set("i", "/", "/<c-g>u")
keymap.set("i", ":", ":<c-g>u")

-- Git
keymap.set("n", "<Leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Line Blame" })

-- Terminal (change default shell to pwsh in Windows)
local terminal = function()
  Util.terminal("pwsh", { cwd = Util.root() })
end
keymap.set("n", "<leader>ft", terminal, { desc = "Terminal (root dir)" })
keymap.set("n", "<leader>fT", function()
  Util.terminal("pwsh")
end, { desc = "Terminal (cwd)" })
keymap.set("n", "<c-/>", terminal, { desc = "Terminal (root dir)" })
keymap.set("n", "<c-_>", terminal, { desc = "which_key_ignore" })

-- Delete unused keymap
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
