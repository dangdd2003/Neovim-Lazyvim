return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
      -- colorscheme = "gruvbox",
      -- colorscheme = "solarized-osaka",
      -- colorscheme = "kanagawa",
      colorscheme = "rose-pine",
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
    enabled = false,
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
      -- transparent = false,
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
    "rebelot/kanagawa.nvim",
    enabled = false,
    opts = {
      transparent = true,
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          TelescopeBorder = { bg = "none" },
        }
      end,
    },
  },

  {
    "rose-pine/neovim",
    -- enabled = false,
    name = "rose-pine",
    opts = {
      dark_variant = "moon",
      styles = {
        transparency = true,
      },
      highlight_groups = {
        LineNr = { fg = "iris" },
        CursorLineNr = { fg = "rose" },
        TelescopeBorder = { fg = "highlight_high", bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "none" },
        TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        TelescopeSelection = { fg = "text", bg = "base" },
        TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
      },
    },
  },
}
