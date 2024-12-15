return {
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

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = true,
        },
      },
    },
  },
}
