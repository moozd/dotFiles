return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
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
      local dapui = require("dapui")

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

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

      dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
      require("dap.ext.vscode").json_decode = require("overseer.json").decode
      require("overseer").patch_dap(true)
      require("nvim-dap-virtual-text").setup({})
    end,
  },
}
