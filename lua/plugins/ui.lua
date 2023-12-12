return {

  -- noice
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Tab" },
    },
  },

  -- noice
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = { "notify", "lsp" },
          kind = "progress",
          any = {
            { find = "No information available" },
            { find = "jdtls" },
          },
        },
        opts = { skip = true },
      })
    end,
  },

  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[

        ██████╗       ██████╗ ███████╗██╗   ██╗
        ██╔══██╗      ██╔══██╗██╔════╝██║   ██║
        ██║  ██║█████╗██║  ██║█████╗  ██║   ██║
        ██║  ██║╚════╝██║  ██║██╔══╝  ╚██╗ ██╔╝
        ██████╔╝      ██████╔╝███████╗ ╚████╔╝ 
        ╚═════╝       ╚═════╝ ╚══════╝  ╚═══╝  
                                              

      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
