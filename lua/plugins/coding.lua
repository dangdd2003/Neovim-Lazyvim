return {
  -- nvim-cmp - auto completion
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:None,CursorLine:PmenuSel",
          winblend = 0,
          scrollbar = false,
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:None",
          winblend = 0,
          scrollbar = false,
        },
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = {
      suggestion = {
        keymap = {
          accept_word = "<M-w>",
          accept_line = "<M-l>",
          dismiss = "<M-d>",
        },
      },
      filetypes = {
        yaml = true,
      },
    },
  },
}
