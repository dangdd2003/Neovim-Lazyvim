-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- clangd inlay hints
require("lazyvim.util").lsp.on_attach(function(client, buffer)
  if client.name == "clangd" then
    local group = vim.api.nvim_create_augroup("clangd_no_inlay_hints_in_insert", { clear = true })

    vim.keymap.set("n", "<leader>uh", function()
      if require("clangd_extensions.inlay_hints").toggle_inlay_hints() then
        vim.api.nvim_create_autocmd(
          "InsertEnter",
          { group = group, buffer = buffer, callback = require("clangd_extensions.inlay_hints").disable_inlay_hints }
        )
        vim.api.nvim_create_autocmd(
          { "TextChanged", "InsertLeave" },
          { group = group, buffer = buffer, callback = require("clangd_extensions.inlay_hints").set_inlay_hints }
        )
      else
        vim.api.nvim_clear_autocmds({ group = group, buffer = buffer })
      end
    end, { buffer = buffer, desc = "Toggle Inlay Hints" })
  end
end)
