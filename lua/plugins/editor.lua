return {
  -- flask
  {
    "folke/flash.nvim",
    enabled = false,
  },

  -- which-key - register new keymaps
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
      spec = {
        mode = "n",
        { "<leader><tab>m", group = "move" },
      },
    },
  },

  -- color highlighter
  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = {
      highlighters = {
        hsl_color = {
          pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
          group = function(_, match)
            -- use hsl to color converter from solarized-osaka
            if LazyVim.has("solarized-osaka.nvim") then
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

  -- surrounding
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          normal = "gs",
          normal_cur = "gsa",
          normal_line = "gS",
          normal_cur_line = "gSA",
          visual = "gsa",
          visual_line = "gSA",
          delete = "gsd",
          change = "gsc",
          change_line = "gSC",
        },
      })
    end,
  },
}
