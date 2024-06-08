return {

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<c-k>", mode = "i", false }
    end,
    opts = {
      servers = {
        eslint = {},
        vtsls = {
          settings = {
            typescript = {
              referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
              },
              implementationsCodeLens = {
                enabled = true,
                showOnInterfaceMethods = true,
              },
            },
          },
        },
        html = {},
        lua_ls = {
          settings = {
            Lua = {
              workspaceWord = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              type = {
                castNumberToInteger = true,
              },
            },
          },
        },
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },

  -- jdtls
  {
    "mfussenegger/nvim-jdtls",
    enabled = false,
    opts = {
      jdtls = function(opts)
        opts.settings = {
          java = {
            settings = {
              inlayhints = {
                parameterNames = {
                  enabled = true,
                  exclusions = {
                    "**/node_modules/**",
                    "**/.metadata/**",
                    "**/archetype-resources/**",
                    "**/META-INF/maven/**",
                    "/**/test/**",
                  },
                },
              },
            },
          },
        }
        local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
        local jvmArg = "-javaagent:" .. install_path .. "/lombok.jar"
        table.insert(opts.cmd, "--jvm-arg=" .. jvmArg) -- Project Lombok Linting
        return opts
      end,
    },
  },

  -- auto stop lsp
  {
    "zeioth/garbage-day.nvim",
    enabled = false,
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      grace_period = 60 * 5,
      wakeup_delay = 1000,
      notifications = true,
    },
  },
}
