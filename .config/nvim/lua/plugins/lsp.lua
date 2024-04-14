local cspell_path = vim.env.HOME .. "/.config/nvim/.cspell.json"

local function setup_lsp()
  local null_ls = require("null-ls")
  require("mason").setup({})

  require("mason-lspconfig").setup({})
  require("mason-lspconfig").setup_handlers({
    function(server_name)
      if require("lspconfig")[server_name] then
        require("lspconfig")[server_name].setup({})
      end
    end,
  })

  local cspell_config = {
    config_file_preferred_name = ".cspell.json",
    find_json = function()
      return cspell_path
    end,
  }

  local cspell = require("cspell")

  null_ls.setup({
    sources = {
      cspell.diagnostics.with({
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity["HINT"]
        end,
        diagnostic_config = {
          virtual_text = false,
        },
        config = cspell_config,
      }),
      cspell.code_actions.with({
        config = cspell_config,
      }),
    },
  })
  require("mason-null-ls").setup({
    handlers = {
      function(source_name, methods)
        if source_name == "cspell" then
          return
        end
        require("mason-null-ls").default_setup(source_name, methods)
      end,
    },
  })
end

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
      "davidmh/cspell.nvim",
    },
    config = setup_lsp,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({})
    end,
  },
  { "folke/neodev.nvim", opts = {} },
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    enabled = function()
      -- NOTE: https://www.reddit.com/r/neovim/comments/17v7azl/comment/k991hyq/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
      local disabled = false
      local context = require("cmp.config.context")
      disabled = disabled or (context.in_treesitter_capture("comment") and vim.bo.filetype ~= "lua")
      return not disabled
    end,
    -- event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local compare = require("cmp.config.compare")
      return {
        completion = {
          completeopt = "menu,menuone",
        },
        window = {
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          },
          completion = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
          },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", group_index = 1, keyword_length = 3, priority = 1500 },
          { name = "luasnip", group_index = 2, keyword_length = 2, priority = 20 },
          { name = "path", group_index = 3, keyword_length = 1, priority = 10 },
          { name = "buffer", group_index = 4, keyword_length = 5, priority = 0 },

          { name = "vim-dadbod-completion", priority = 1500 },
          { name = "gitmoji", priority = 5 },
        }),
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            preset = "codicons",
          }),
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = {
          priority_weight = 1.0,
          comparators = {
            -- compare.score_offset, -- not good at all
            compare.locality,
            compare.exact,
            compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
            compare.kind,
            compare.order,
            compare.recently_used,
            compare.offset,
            -- compare.scopes, -- what?
            -- compare.sort_text,
            -- compare.length, -- useless
          },
        },
      }
    end,
  },
  {
    "Dynge/gitmoji.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    opts = { -- the values below are the defaults
      filetypes = { "gitcommit" },
      completion = {
        append_space = false,
        complete_as = "emoji",
      },
    },
    ft = "gitcommit",
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "notjedi/nvim-rooter.lua",
    config = function()
      require("nvim-rooter").setup()
    end,
  },
}
