return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = false,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },

  {
    "windwp/nvim-ts-autotag",
    enabled = false,
  },
}
