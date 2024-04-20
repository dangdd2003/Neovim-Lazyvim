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

  -- color highlighter
  {
    "echasnovski/mini.hipatterns",
    -- event = "BufReadPre",
    opts = {
      highlighters = {
        hsl_color = {
          pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
          group = function(_, match)
            -- use hsl to color converter from solarized-osaka
            if LazyVim.has("solarized-osaka") then
              local utils = require("solarized-osaka.hsl")
              --- @type string, string, string
              local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
              --- @type number?, number?, number?
              local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
              --- @type string
              local hex_color = utils.hslToHex(h, s, l)
              return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
            end
          end,
        },
      },
    },
  },

  -- harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      {
        "<leader>H",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<A-n>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon Next File",
      },
      {
        "<A-p>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon Previous File",
      },
    },
  },
}
