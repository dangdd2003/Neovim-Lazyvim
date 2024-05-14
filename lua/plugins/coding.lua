return {
  -- nvim-cmp - auto completion
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
          winblend = 0,
          scrollbar = false,
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:None,FloatBorder:None",
          winblend = 0,
          scrollbar = false,
        },
      },
    },
  },
}
