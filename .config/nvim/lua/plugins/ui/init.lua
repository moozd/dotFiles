local Util = require("moozd.util")

return {
  {
    "xiyaowong/transparent.nvim",
    config = function(opts)
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",    -- plugins which have float panel such as Lazy, Mason, LspInfo
          "NvimTreeNormal", -- NvimTree
        },
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = require("plugins.ui.dashboard").opts,
    config = require("plugins.ui.dashboard").config,
  },
  -- {
  --   "glepnir/dashboard-nvim",
  --   event = "VimEnter",
  --
  --   config = function()
  --     require("dashboard").setup({})
  --   end,
  --   dependencies = { { "nvim-tree/nvim-web-devicons" } },
  -- },
  {
    "akinsho/bufferline.nvim",
      enabled =false,
    config = function()
         require("bufferline").setup({
            options = {
              separator_style = "thick",
              offsets = {
                {
                  filetype = "neo-tree",
                  text = "Explorer",
                  text_align = "center",
                  separator = true,
                },
              },
            },
          })
    end,
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "WhoIsSethDaniel/lualine-lsp-progress.nvim" },
    config = require("plugins.ui.lualine"),
  },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  --   config = function()
  --     require("noice").setup({
  --       views = {
  --         cmdline_popup = {
  --           position = {
  --             row = 3,
  --             col = "50%",
  --           },
  --           size = {
  --             width = 60,
  --             height = "auto",
  --           },
  --         },
  --       },
  --       lsp = {
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true,
  --         },
  --       },
  --       -- you can enable a preset for easier configuration
  --       presets = {
  --         bottom_search = false,        -- use a classic bottom cmdline for search
  --         command_palette = false,      -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false,           -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = true,        -- add a border to hover docs and signature help
  --       },
  --     })
  --   end,
  -- },
  {
    "rcarriga/nvim-notify",
    init = function()
      Util.load_plugin_with_func("nvim-notify", vim, "notify")
    end,
  },
  {
    "stevearc/dressing.nvim",

    init = function()
      Util.load_plugin_with_func("dressing.nvim", vim.ui, { "input", "select" })
    end,
    opts = {
      input = { default_prompt = "➤ " },
      select = { backend = { "telescope", "builtin" } },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    ops = {
      float_opts = {
        border = "curved",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      sources = { "filesystem", "buffers", "git_status" },
      follow_current_file = true,
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem",  display_name = Util.get_icon("FolderClosed", 1) .. "File" },
          { source = "buffers",     display_name = Util.get_icon("DefaultFile", 1) .. "Bufs" },
          { source = "git_status",  display_name = Util.get_icon("Git", 1) .. "Git" },
          { source = "diagnostics", display_name = Util.get_icon("Diagnostic", 1) .. "Diagnostic" },
        },
      },
      default_component_configs = {
        modified = {
          symbol = Util.icons.FileModified,
          highlight = "NeoTreeModified",
        },
        git_status = {
          symbols = {
            -- Change type
            added = Util.icons.GitAdd,       -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = Util.icons.GitChange, -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = Util.icons.GitDelete,  -- this can only be used in the git_status source
            renamed = Util.icons.GitRenamed, -- this can only be used in the git_status source
            -- Status type
            untracked = Util.icons.GitUntracked,
            ignored = Util.icons.GitIgnored,
            unstaged = Util.icons.GitUnstaged,
            staged = Util.icons.GitStaged,
            conflict = Util.icons.GitConflict,
          },
        },
      },

      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,         -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = ture,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            "node_modules",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      -- window = {
      --   position = "float",
      -- },
    },
  },
  -- {
  --   "folke/twilight.nvim",
  --   opts = {
  --   -- your configuration comes here
  --   -- or leave it empty to use the default settings
  --   -- refer to the configuration section below
  -- }
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
