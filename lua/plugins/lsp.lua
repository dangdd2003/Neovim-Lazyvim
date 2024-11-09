return {

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
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
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
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
        -- html = {},
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

  {
    "mfussenegger/nvim-jdtls",
    optional = true,
    opts = {
      settings = {
        java = {
          codeGeneration = {
            generateComments = true,
            hashCodeEquals = {
              useInstanceof = true,
            },
            toString = {
              codeStyle = "String concatenation",
              skipNullValues = false,
              template = "${object.className} { ${member.name()}=${member.value}, ${otherMembers} }",
            },
            useBlocks = true,
          },
          eclipse = {
            downloadSources = true,
          },
          maven = {
            downloadSources = true,
          },
          errors = {
            incompleteClasspath = {
              severity = "error",
            },
          },
          completion = {
            importOrder = {
              "java",
              "jakarta",
              "javax",
              "io",
              "com",
              "org",
            },
          },
          configuration = {
            updateBuildConfiguration = "interactive",
          },
          format = {
            enabled = true,
            comments = {
              enabled = true,
            },
          },
          implementationsCodeLens = {
            enabled = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          inlayhints = {
            parameterNames = {
              enabled = "all",
            },
          },
          jdt = {
            ls = {
              androidSupport = {
                enabled = true,
              },
              lombokSupport = {
                enabled = true,
              },
            },
          },
          maxConcurrentBuilds = 4,
          references = {
            includeAccessors = true,
            includeDecompiledSources = true,
          },
          rename = {
            enabled = true,
          },
          saveActions = {
            organizeImports = false,
          },
          signatureHelp = {
            enabled = true,
            description = {
              enabled = true,
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 999,
              staticStarThreshold = 999,
            },
          },
        },
      },
    },
  },

  -- lsp keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<c-k>", mode = "i", false }
      keys[#keys + 1] =
        { "<c-d>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" }
    end,
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
