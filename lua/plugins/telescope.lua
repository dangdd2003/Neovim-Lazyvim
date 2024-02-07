return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",

      -- cmake - windows
      -- {
      --   "nvim-telescope/telescope-fzf-native.nvim",
      --   build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      -- },
    },
    keys = {
      {
        "<leader>fB",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fb",
        function()
          local fb_actions = require("telescope").extensions.file_browser
          fb_actions.file_browser()
        end,
        desc = "File Browser (cwd)",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions
      local function telescope_buffer_dir()
        return vim.fn.expand("%:p:h")
      end

      opts.extensions = {
        file_browser = {
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignroe = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 0.9 },
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            ["n"] = {
              ["h"] = fb_actions.goto_parent_dir,
              ["<bs>"] = fb_actions.goto_parent_dir,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
}
