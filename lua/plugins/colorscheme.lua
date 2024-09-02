-- available configured colorschemes:
-- "tokyonight", "catppuccin", "solarized-osaka", "solarized", "gruvbox", "kanagawa", "rose-pine"
local colorscheme = "solarized-osaka" -- <- set colorscheme here

local lazyvim = {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = colorscheme,
  },
}

if colorscheme == "tokyonight" then
  return {
    lazyvim,
    {
      "folke/tokyonight.nvim",
      priority = 1000,
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
  }
elseif colorscheme == "catppuccin" then
  return {
    lazyvim,
    {
      "catppuccin/nvim",
      priority = 1000,
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
  }
elseif colorscheme == "solarized-osaka" then
  return {
    lazyvim,
    {
      "craftzdog/solarized-osaka.nvim",
      priority = 1000,
      opts = {
        -- transparent = false,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      },
    },
  }
elseif colorscheme == "solarized" then
  return {
    lazyvim,
    {
      "maxmx03/solarized.nvim",
      priority = 1000,
      opts = {
        transparent = {
          enabled = true,
        },
        -- palette = "selenized",
        variant = "autumn",
        styles = {
          comments = { italic = true, bold = false },
          functions = { italic = true },
        },
      },
    },
  }
elseif colorscheme == "gruvbox" then
  return {
    lazyvim,
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      opts = {
        transparent_mode = true,
      },
    },
  }
elseif colorscheme == "kanagawa" then
  return {
    lazyvim,
    {
      "rebelot/kanagawa.nvim",
      priority = 1000,
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
  }
elseif colorscheme == "rose-pine" then
  return {
    lazyvim,
    {
      "rose-pine/neovim",
      priority = 1000,
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
          TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        },
      },
    },
  }
else
  LazyVim.warn("Unknown colorscheme! Use default Tokyonight", { title = "Colorscheme 🌈" })
  return {}
end
