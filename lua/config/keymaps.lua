-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Ad any additional keymaps here
require("D-Dev.discipline").cowboy() -- force to use counter

local keymap = vim.keymap

-- Copy all
keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy all" })

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- tabs
keymap.set("n", "<leader><tab>ml", "<cmd>tabmove +<CR>", { desc = "Move tab next" })
keymap.set("n", "<leader><tab>mh", "<cmd>tabmove -<CR>", { desc = "Move tab next" })

-- Go to beginning and ending in insert mode
keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })

-- Navigate within insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Add additional undo breack-points
keymap.set("i", "?", "?<c-g>u")
keymap.set("i", "/", "/<c-g>u")
keymap.set("i", ":", ":<c-g>u")

-- Git blame by line
-- keymap.set("n", "<Leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git Line Blame" })
keymap.set("n", "<Leader>gb", function()
  local gitsigns = require("gitsigns")
  gitsigns.toggle_current_line_blame()
  local status = require("gitsigns.config").config.current_line_blame
  if status then
    LazyVim.info("Enabled git blame by line", { title = "Gitsigns" })
  else
    LazyVim.warn("Disabled git blame by line", { title = "Gitsigns" })
  end
end, { desc = "Git Blame By Line" })

-- Delete unused keymap
keymap.del("n", "<S-h>")
keymap.del("n", "<S-l>")
