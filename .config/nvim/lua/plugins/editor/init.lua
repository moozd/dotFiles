return {
  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup()
    end,
  },
  --- syntax
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },

    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        incremental_selection = { enable = true },
      })
    end,
  },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   config = function()
  --     require("colorizer").setup()
  --   end,
  -- },
  --
  --- keyword illuminate
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  {
    "majutsushi/tagbar",
    init = function()
      vim.g.tagbar_show_ballon = 0
    end,
  },
  --- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "moozd/aidoc.nvim",
    config = function()
      require("aidoc").setup({
        email="mohammad.mdz72@gmail.com"
      })
    end,
  },

  --- comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "glepnir/dbsession.nvim",
    cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
    opts = { auto_save_on_exit = true },
  },
  { "tpope/vim-fugitive" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
    icons = { group = "#", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
    -- init = function() end,
    opts = {
      motions = {
        count = true,
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = " ", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
      },
    },

    config = function(_, opts)
      require("which-key").setup(opts)
      require("moozd.util").which_key_register()
    end,
  },
}
