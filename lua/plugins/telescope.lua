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
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "fb",
        function()
          local fb_actions = require("telescope").extensions.file_browser
          fb_actions.file_browser()
        end,
        desc = "File Browser (current buffer)",
      },
      -- find
      { "fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "Find All Files" },
      { "fc", LazyVim.telescope.config_files(), desc = "Find Config File" },
      { "ff", LazyVim.telescope("files"), desc = "Find Files (Root Dir)" },
      { "fF", LazyVim.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "fg", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
      { "fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "fR", LazyVim.telescope("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "fk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "fh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "fw", LazyVim.telescope("live_grep"), desc = "Grep (Root Dir)" },
      { "fw", LazyVim.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    },
    opts = {
      -- from NVChad:https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/telescope.lua
      pickers = {
        find_files = {
          follow = true,
        },
      },

      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },

        -- prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        preview = {
          filesize_limit = 1, -- MB
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = {
            ["q"] = require("telescope.actions").close,
            ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
          },
          i = {
            ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions
      local function telescope_buffer_dir()
        return vim.fn.expand("%:p:h")
      end

      -- use file browser for telescope
      opts.extensions = {
        file_browser = {
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          follow_symlinks = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            height = 0.80,
            preview_cutoff = 120,
          },
          theme = "dropdown",
          hijack_netrw = true,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
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
                for i = 1, 5 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 5 do
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
      require("telescope").load_extension("file_browser")
    end,
  },
}
