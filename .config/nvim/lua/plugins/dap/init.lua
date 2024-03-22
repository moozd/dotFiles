-- NOTE: Debugging
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },

      { -- javascript
        "mxsdev/nvim-dap-vscode-js",
        dependencies = {
          "microsoft/vscode-js-debug",
          version = "1.x",
          build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
        },
      },
    },
    config = function()
      local dap = require("dap")
      require("dapui").setup()
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

      local dapui = require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      --
      -- require("plugins.dap.adapters.cpptools")
      -- require("plugins.dap.adapters.netcoredbg")
      -- require("plugins.dap.adapters.godot")
      -- require("plugins.dap.adapters.bash-debug-adapter")
      -- require("plugins.dap.adapters.php-debug-adapter")
      -- require("plugins.dap.adapters.dart-debug-adapter")
      -- require("plugins.dap.adapters.java-debug")
      -- require("plugins.dap.adapters.debugpy")
      -- require("plugins.dap.adapters.go-debug-adapter")
      require("plugins.dap.adapters.js-debug")

      require("dapui").setup()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({ reset = true })
      end
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close
      require("dap.ext.vscode").json_decode = require("overseer.json").decode
      require("overseer").patch_dap(true)
    end,
  },
}
