return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      colorscheme = "catppuccin",
      -- colorscheme = "gruvbox",
      -- colorscheme = "solarized-osaka",
    },
  },

  {
    "folke/tokyonight.nvim",
    enabled = false,
    opts = {
      style = "storm",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      -- custom line number color
      on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = colors.yellow }
        highlights.CursorLineNr = { fg = colors.green }
      end,
    },
  },

  {
    "catppuccin/nvim",
    -- enabled = false,
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      -- custom line number color
      custom_highlights = function(colors)
        return {
          CursorLineNr = { fg = colors.rosewater },
          LineNr = { fg = colors.mauve },
        }
      end,
    },
  },

  {
    "craftzdog/solarized-osaka.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = true,
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
