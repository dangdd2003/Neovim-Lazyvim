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
        desc = "File Browser (current buffer)",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions
      local action_layout = require("telescope.actions.layout")
      local function telescope_buffer_dir()
        return vim.fn.expand("%:p:h")
      end

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_result = true,
        mappings = {
          n = {
            ["<M-p>"] = action_layout.toggle_preview,
          },
          i = {
            ["<M-p>"] = action_layout.toggle_preview,
          },
        },
      })

      opts.pickers = {
        find_files = {
          follow = true,
        },
      }

      opts.extensions = {
        file_browser = {
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignroe = false,
          hidden = true,
          follow_symlink = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 0.9 },
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            ["n"] = {
              -- override default function for open in built-in application
              ["o"] = function(prompt_bufnr)
                local action_state = require("telescope.actions.state")
                local fb_utils = require("telescope._extensions.file_browser.utils")
                local quiet = action_state.get_current_picker(prompt_bufnr).finder.quiet
                local selections = fb_utils.get_selected_files(prompt_bufnr, true)
                if vim.tbl_isempty(selections) then
                  fb_utils.notify("actions.open", { msg = "No selection to be opened!", level = "INFO", quiet = quiet })
                  return
                end
                local cmd = vim.fn.has("win32") == 1 and "explorer.exe"
                  or vim.fn.has("mac") == 1 and "open"
                  or "xdg-open"
                for _, path in ipairs(selections) do
                  require("plenary.job")
                    :new({
                      command = cmd,
                      args = { path:absolute() },
                    })
                    :start()
                end
                actions.close(prompt_bufnr)
              end,
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
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
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
