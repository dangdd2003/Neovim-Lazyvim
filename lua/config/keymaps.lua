-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Ad any additional keymaps here
local keymap = vim.keymap

-- Copy all
keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file" })

-- Go to beginning and end in normal mode
keymap.set("n", "<C-b>", "<Home>", { desc = "Beginning of line" })
keymap.set("n", "<C-e>", "<End>", { desc = "End of line" })

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
