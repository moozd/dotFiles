local Util = require("moozd.util")
local Apps = require("moozd.apps")
local ucmd = require("config.commands").compose

local map = Util.empty_map_table()

if vim.g.neovide then
  require("config.utils.neovide").setupKeybindings()
end

if vim.g.vscode then
  local vscode = require("vscode-neovim")
  local function action(command, args)
    return function()
      vscode.action(command, { args = args })
    end
  end

  map.n["gd"] = { action("editor.action.revealDefinition"), desc = "Go to definitions" }
  map.n["gK"] = { action("editor.action.showHover"), desc = "Show signature help" }
  map.n["gi"] = { action("editor.action.goToImplementation") }
  map.n["gr"] = { action("editor.action.goToReferences") }
  map.n["gcc"] = { action("editor.action.addCommentLine") }

  map.n["<leader>e"] = { action("workbench.view.explorer") }
  map.n["<Leader>;"] = { action("workbench.action.navigateBackInNavigationLocations") }
  map.n["<Leader>w"] = { action("workbench.action.files.save") }
  map.n["<Leader>W"] = { action("workbench.action.files.saveFiles") }
  map.n["<leader>X"] = { action("workbench.action.closeOtherEditors") }
  map.n["<leader>x"] = { action("workbench.action.closeActiveEditor") }
  map.n["<leader>]"] = { action("workbench.action.nextEditor") }
  map.n["<leader>["] = { action("workbench.action.previousEditor") }

  map.n["<leader>cf"] = { action("editor.action.formatDocument") }
  map.n["<leader>cc"] = { action("editor.action.quickFix") }
  map.n["<leader>cr"] = { action("editor.action.rename") }

  map.n["<leader>ag"] = { action("workbench.view.scm") }
  map.n["<leader>at"] = { action("workbench.action.terminal.toggleTerminal") }

  map.n["<leader>fs"] = { action("workbench.action.findInFiles") }
  map.n["<leader>fw"] = { action("workbench.action.findInFiles") }
  map.n["<leader>fS"] = { action("workbench.action.replaceInFiles") }
  map.n["<leader>ff"] = { action("workbench.action.quickOpen") }
else
  --- navigation ---------------------
  map.n["gb"] = {
    ":Telescope buffers theme=dropdown previewer=false<cr>",
    desc = "buffers",
  }

  map.n["gt"] = {
    ":Telescope telescope-tabs list_tabs  theme=dropdown previewer=false<cr>",
    desc = Util.get_icon("DefaultFile", 1) .. "Tabs",
  }

  map.n["]t"] = { ":tabn<cr>", desc = "tab" }
  map.n["]b"] = { ":bnext<cr>", desc = "buffer" }
  map.n["]d"] = { vim.diagnostic.goto_next, desc = "problem" }
  map.n["]c"] = { ":silent! GitGutterNextHunk<cr>", desc = "change" }
  map.n["]j"] = { "<c-i>", desc = "jump" }

  map.n["[t"] = { ":tabp<cr>", desc = "tab" }
  map.n["[b"] = { ":bprev<cr>", desc = "buffer" }
  map.n["[d"] = { vim.diagnostic.goto_prev, desc = "problem" }
  map.n["[c"] = { ":silent! GitGutterPrevHunk<cr>", desc = "change" }
  map.n["[j"] = { "<c-o>", desc = "jump" }

  ---lp
  map.n["gd"] = { vim.lsp.buf.definition, desc = "Go to definitions" }
  map.n["gs"] = { vim.lsp.buf.document_symbol, desc = "Go to document symbols" }
  map.n["gS"] = { vim.lsp.buf.workspace_symbol, desc = "Go to workspace symbol" }
  map.n["gr"] = { vim.lsp.buf.references, desc = "List references" }
  map.n["gi"] = { vim.lsp.buf.implementation, desc = "List implementations" }
  map.n["gk"] = { vim.lsp.buf.hover, desc = "Show hover help" }
  map.n["gK"] = { vim.lsp.buf.signature_help, desc = "Show signature help" }



  -- stylua: ignore
  map.n["gh"] = { function() vim.diagnostic.config({ virtual_text = true }) end, }
  -- stylua: ignore
  map.n["ghh"] = { function() vim.diagnostic.config({ virtual_text = false }) end, }

  map.n["X"] = { ":noh!<cr>", desc = "Cancel search" }

  map.n["tn"] = { ":tabnew<CR>", desc = "New tab" }
  map.n["tc"] = { ":tabclose<CR>", desc = "Close tab" }

  map.n["<t"] = { ":-tabmove<CR>", desc = "Move Backward" }
  map.n[">t"] = { ":+tabmove<CR>", desc = "Move Forward" }

  -- map.n["<leader><Left>"] = { "<C-w>h", desc = Util.get_icon("ArrowLeft", 1) .. "Left" }
  -- map.n["<leader><Down>"] = { "<C-w>j", desc = Util.get_icon("ArrowDown", 1) .. "Down" }
  -- map.n["<leader><Up>"] = { "<C-w>k", desc = Util.get_icon("ArrowUp", 1) .. "Up" }
  -- map.n["<leader><Right>"] = { "<C-w>l", desc = Util.get_icon("ArrowRight", 1) .. "Right" }
  map.n["<PageUp>"] = { ":resize +1<CR>", desc = "Resize split up" }
  map.n["<PageDown>"] = { ":resize -1<CR>", desc = "Resize split down" }
  map.n["<C-PageDown>"] = { ":vertical resize +1<CR>", desc = "Resize split left" }
  map.n["<C-PageUp>"] = { ":vertical resize -1<CR>", desc = "Resize split right" }
  --
  map.n["<M-UP>"] = { ":m-2<cr>", desc = "Move line up" }
  map.i["<M-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }

  map.n["<M-Down>"] = { ":m+1<cr>", desc = "Move line down" }
  map.i["<M-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }

  --- overall-------------------------

  -- stylua: ignore


  map.n["<leader>x"] = { ":bdelete<cr>", desc = Util.get_icon("TabClose", 1) .. "Close" }
  map.n["<leader>X"] = { Util.close_all_but_this, desc = Util.get_icon("BufferClose", 1) .. "Close All" }
  map.n["<leader>w"] = { ":w<cr>", desc = Util.get_icon("DefaultFile", 1) .. "Save" }
  map.n["<leader>W"] = { ":wa<cr>", desc = Util.get_icon("Session", 1) .. "Save All" }
  map.n["<leader>;"] = { ":buf #<cr>", desc = Util.get_icon("Bookmarks", 1) .. "Switch" }
  map.n["<leader>T"] = { ":silent! TagbarToggle<cr>", desc = Util.get_icon("Tab", 1) .. "Tags" }
  map.n["<leader>p"] = {
    function()
      local path = vim.loop.cwd()
      if path == "/" then
        path = vim.env.HOME
      end
      return ":" .. ucmd("ChangeDirectory", path .. "/")
    end,
    desc = "Open Folder",
    expr = true,
  }

  map.n["<leader>H"] = { ":" .. ucmd("GoHome") .. "<cr>", desc = "Home" }
  map.n["<leader>S"] = {
    ":"
      .. ucmd("ChangeDirectory", vim.env.HOME .. "/.config/nvim")
      .. "| e "
      .. vim.env.HOME
      .. "/.config/nvim/init.lua"
      .. "<cr>",
    desc = Util.get_icon("ActiveLSP", 1) .. "Settings",
  }

  --- terminal -----------------------
  map.n["gT"] = { ":ToggleTerm direction=vertical size=100<cr>", desc = Util.get_icon("Terminal", 1) .. "Terminal" }

  --- menu--------------------------
  local sections = {
    e = { desc = Util.get_icon("FolderOpen", 1) .. "Explorer" },
    f = { desc = Util.get_icon("Search", 1) .. "Find" },
    c = { desc = Util.get_icon("DefaultFile", 1) .. "Code" },
    a = { desc = Util.get_icon("Terminal", 1) .. "Apps" },
    g = { desc = Util.get_icon("Git", 1) .. "Git" },
    d = { desc = Util.get_icon("Diagnostic", 1) .. "Diagnostics" },
    l = { desc = Util.get_icon("GitUntracked", 1) .. "LeetCode" },
    s = { desc = "Sessions" },
  }

  --- Sessions --------------------------
  map.n["<leader>s"] = sections.s
  map.n["<leader>sl"] = { ':lua require("persistence").load({ last = true })<cr>', desc = "Last session." }
  map.n["<leader>sd"] = { ':lua require("persistence").load()<cr>', desc = "Current directory." }

  --- Explorer ---------------------------
  map.n["<leader>e"] = { ":Neotree focus toggle <cr>", desc = Util.get_icon("Explorer", 1) .. "Explorer" }

  --- Git --------------------------------
  map.n["<leader>g"] = sections.g
  map.n["<leader>gd"] = { ":Gdiffsplit<cr>", desc = "Diff" }
  map.n["<leader>gc"] = { ":BCommits<cr>", desc = "Commits" }
  map.n["<leader>gb"] = { ":Git blame<cr>", desc = "Blame" }

  --- Apps -------------------------------
  map.n["<leader>a"] = sections.a
  map.n["<leader>ag"] = { Apps.lazygit, desc = Util.get_icon("Git", 1) .. "Git" }
  map.n["<leader>ae"] = { Apps.ranger, desc = Util.get_icon("FolderOpen", 1) .. "Explorer" }
  map.n["<leader>at"] = { Apps.terminal, desc = Util.get_icon("Terminal", 1) .. "Terminal" }
  map.n["<leader>ad"] = { Apps.lazydocker, desc = Util.get_icon("Docker", 1) .. "Docker" }
  map.n["<leader>as"] = { Apps.btm, desc = Util.get_icon("Stats", 1) .. "Stats" }
  map.n["<leader>am"] = { Apps.spotify, desc = Util.get_icon("Spotify", 1) .. "Spotify" }
  map.n["<leader>ab"] = { ":ToggleTerm<cr>", desc = "  Bottom Terminal" }
  --
  --- Diagnostic --------------------------

  map.n["<leader>d"] = sections.d
  -- stylua: ignore
  map.n["<leader>dd"] = { ":TroubleToggle workspace_diagnostics<cr>", desc = "Diagnostics" }

  --- find --------------------------
  map.n["<leader>f"] = sections.f
  map.n["<leader>fs"] = { ":Ag<cr>", desc = "Search" }
  map.n["<leader>fS"] = { ":Spectre <cr>", desc = "Replace" }
  map.n["<leader>ff"] = { ":Telescope find_files theme=dropdown previewer=false<cr>", desc = "Find (Telescope)" }
  map.n["<leader>fo"] = { ":Telescope oldfiles <cr>", desc = "Recent files (Telescope)" }
  map.n["<leader>fm"] = { ":Telescope marks <cr>", desc = "Marks(Telescope)" }
  map.n["<leader>fz"] = { ":Files<cr>", desc = "Find (FZF)" }
  map.n["<leader>fw"] = { ":Telescope live_grep <cr>", desc = "Find words" }
  map.n["<leader>ft"] = { ":TodoTelescope<cr>", desc = "TODOS" }
  map.n["<leader>fd"] = { ":Telescope lsp_document_symbols <cr>", desc = "Find symbols" }
  map.n["<leader>fD"] = { ":Telescope lsp_workspace_symbols <cr>", desc = "Find project symbols" }

  --- code --------------------------
  map.n["<leader>c"] = sections.c
  map.n["<leader>cf"] = { vim.lsp.buf.format, desc = "Format" }
  map.n["<leader>cr"] = { vim.lsp.buf.rename, desc = "Rename" }
  map.n["<leader>cc"] = { vim.lsp.buf.code_action, desc = "Code actions" }
  map.n["<leader>ct"] = { ":TestSuite<cr>", desc = "Run tests" }

  --- LeetCode ----------------------
  map.n["<leader>l"] = sections.l
  map.n["<leader>lq"] = { ":LBQuestions<cr>", desc = "List Questions" }
  map.n["<leader>ll"] = { ":LBQuestion<cr>", desc = "View Question" }
  map.n["<leader>lr"] = { ":LBReset<cr>", desc = "Reset Code" }
  map.n["<leader>lt"] = { ":LBTest<cr>", desc = "Run Code" }
  map.n["<leader>ls"] = { ":LBSubmit<cr>", desc = "Submit Code" }
end
Util.setup_keymap(map)
