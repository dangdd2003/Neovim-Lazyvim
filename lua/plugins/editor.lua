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
            -- Macos/Linux: open file in default application
            -- vim.fn.jobstart({ "xdg-open", path }, { detach = true })
            --  Windows: open file in default application
            os.execute("explorer.exe " .. path)
          end,
        },
      },
    },
  },
}
