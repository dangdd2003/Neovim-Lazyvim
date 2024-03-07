return {
  -- flask
  {
    "folke/flash.nvim",
    enabled = false,
  },

  -- neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        window = {
          mappings = {
            ["<C-o>"] = "system_open",
          },
        },
        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            pcall(vim.notify, path, vim.log.levels.INFO, {
              icon = "📂",
              title = "Open in application",
              timeout = 5000,
            })
            -- local cmd = vim.fn.has("win32") == 1 and "explorer.exe" or vim.fn.has("mac") == 1 and "open" or "xdg-open"
            -- Open file/dir in default built-in application
            -- vim.fn.jobstart({ cmd, path }, { detach = true })
            if vim.fn.has("win32") == 1 then
              --  Windows
              os.execute("start " .. path)
              -- vim.fn.jobstart({ cmd, path })
            elseif vim.fn.has("mac") == 1 then
              -- Macos
              vim.fn.jobstart({ "open", path }, { detach = true })
            else
              -- Linux
              vim.fn.jobstart({ "xdg-open", path }, { detach = true })
            end
          end,
        },
      },
    },
  },
}
