return {

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
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
      opts.presets.lsp_doc_border = true
      opts.presets.inc_rename = true
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
       ████╗ ██║█████╗██║  ██║█████╗  ██║   ██║
       ╚██╔╝ ██║╚════╝██║  ██║██╔══╝  ╚██╗ ██╔╝
        ██████╔╝      ██████╔╝███████╗ ╚████╔╝ 
        ╚═════╝       ╚═════╝ ╚══════╝  ╚═══╝  
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local file_browser = function()
        local fb_actions = require("telescope").extensions.file_browser
        fb_actions.file_browser()
      end

      opts.config.header = vim.split(logo, "\n")
      table.insert(opts.config.center, 2, {
        action = file_browser,
        desc = "  File Browser",
        icon = "󰥨",
        key = "b",
      })
      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end
    end,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      if require("lazyvim.util").has("noice.nvim") then
        opts.defaults["<leader>v"] = { name = "+vimtex" }
      end
    end,
  },

  -- lualine - statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        height = 0.8,
      },
    },
  },

  -- incline - filename
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#C71585", guifg = "#F2F3F4" },
            InclineNormalNC = { guibg = "#C0C0C0", guifg = "#8000FF" },
          },
        },
        window = {
          margin = { vertical = 0, horizontal = 0 },
        },
        hide = {
          cursorline = true,
        },
      })
      require("incline").setup({
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified and "bold,italic" or "bold"

          if vim.bo[props.buf].modified then
            filename = filename .. ""
          end

          local function get_diagnostic_label()
            local icons = require("lazyvim.config").icons.diagnostics
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { "┊ " })
            end
            return label
          end

          local buffer = {
            { get_diagnostic_label() },
            { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
            { filename .. " ", gui = modified },
            { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
          }
          return buffer
        end,
      })
    end,
  },
}
