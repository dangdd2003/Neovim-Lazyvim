return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      colorscheme = "catppuccin",
    },
  },

  {
    "folke/tokyonight.nvim",
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
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
