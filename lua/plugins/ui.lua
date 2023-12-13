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
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      table.insert(opts.routes, {
        filter = {
          event = "lsp",
          kind = "progress",
          find = "jdtls",
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
