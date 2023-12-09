return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "cpp",
      "java",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    vim.treesitter.language.register("markdown", "markdown_inline")
  end,
}
