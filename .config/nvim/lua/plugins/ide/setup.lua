local cspell_path = vim.env.HOME .. "/.config/nvim/.cspell.json"

return function()
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

  require("mason-nvim-dap").setup({})

  require("lspconfig").sqlls.setup({
    root_dir = function()
      return vim.loop.cwd()
    end,
  })
end
