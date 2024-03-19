-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Ad any additional keymaps here
require("D-Dev.discipline").cowboy() -- force to use counter

local keymap = vim.keymap

-- Copy all
keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy all" })

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Go to beginning and ending in normal mode
keymap.set({ "n", "v" }, "<C-b>", "^", { desc = "Beginning of line" })
keymap.set({ "n", "v" }, "<C-e>", "$", { desc = "End of line" })

-- Scroll by line
keymap.set("n", "<C-n>", "<C-e>")
keymap.set("n", "<C-p>", "<C-y>")

-- Go to beginning and ending in insert mode
keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })

-- Navigate within insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Vimtex keymaps
keymap.set("n", "<Leader>vc", "<Cmd>VimtexCompile<CR>", { desc = "Vimtex Compile" })
keymap.set("n", "<Leader>vx", "<Cmd>VimtexClean<CR>", { desc = "Vimtex Clean" })

-- Add additional undo breack-points
keymap.set("i", "?", "?<c-g>u")
keymap.set("i", "/", "/<c-g>u")
keymap.set("i", ":", ":<c-g>u")

-- Git blame by line
keymap.set("n", "<Leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Line Blame" })

-- Delete unused keymap
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
