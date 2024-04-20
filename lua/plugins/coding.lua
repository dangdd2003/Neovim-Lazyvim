return {
  -- nvim-cmp - auto completion
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:None,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          winblend = 0,
          scrollbar = false,
          side_padding = 0,
        },
        documentation = {
          border = "rounded",
          winblend = 0,
          scrollbar = false,
        },
      },
    },
  },
}
