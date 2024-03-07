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
  map.n["<C-Tab>"] = { "<cmd>:Buffers<cr>", desc = "Find a buffer" }
  ---lp
  map.n["gd"] = { vim.lsp.buf.definition, desc = "Go to definitions" }
  -- map.n["gt"] = { vim.lsp.buf.type_definition, desc = "Go type to definitions" }
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

  map.n["t="] = { ":tabnew<CR>", desc = "New" }
  map.n["t-"] = { ":tabclose<CR>", desc = "Close" }
  map.n["]t"] = { ":tabn<CR>", desc = "Next" }
  map.n["[t"] = { ":tabp<CR>", desc = "Previous" }
  map.n["[tm"] = { ":-tabmove<CR>", desc = "Move Backward" }
  map.n["]tm"] = { ":+tabmove<CR>", desc = "Move Forward" }

  -- map.n["<leader><Left>"] = { "<C-w>h", desc = Util.get_icon("ArrowLeft", 1) .. "Left" }
  -- map.n["<leader><Down>"] = { "<C-w>j", desc = Util.get_icon("ArrowDown", 1) .. "Down" }
  -- map.n["<leader><Up>"] = { "<C-w>k", desc = Util.get_icon("ArrowUp", 1) .. "Up" }
  -- map.n["<leader><Right>"] = { "<C-w>l", desc = Util.get_icon("ArrowRight", 1) .. "Right" }
  map.n["<PageUp>"] = { "<cmd>resize +1<CR>", desc = "Resize split up" }
  map.n["<PageDown>"] = { "<cmd>resize -1<CR>", desc = "Resize split down" }
  map.n["<C-PageDown>"] = { "<cmd>vertical resize +1<CR>", desc = "Resize split left" }
  map.n["<C-PageUp>"] = { "<cmd>vertical resize -1<CR>", desc = "Resize split right" }
  --
  map.n["<M-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }
  map.i["<M-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }

  map.n["<M-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }
  map.i["<M-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }

  --- overall-------------------------

  -- stylua: ignore
  map.n["<Tab><Tab>"] = {
    "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",
    desc = Util.get_icon("DefaultFile", 1) .. "Buffers"
  }
  map.n["<leader><Space>"] = {
    "<cmd>Telescope telescope-tabs list_tabs  theme=dropdown previewer=false<cr>",
    desc = Util.get_icon("DefaultFile", 1) .. "Tabs",
    key,
  }

  map.n["<leader>x"] = { "<cmd>bdelete<cr>", desc = Util.get_icon("TabClose", 1) .. "Close" }
  map.n["<leader>X"] = { Util.close_all_but_this, desc = Util.get_icon("BufferClose", 1) .. "Close All" }
  map.n["<leader>w"] = { "<cmd>w<cr>", desc = Util.get_icon("DefaultFile", 1) .. "Save" }
  map.n["<leader>W"] = { "<cmd>wa<cr>", desc = Util.get_icon("Session", 1) .. "Save All" }
  map.n["<leader>;"] = { "<cmd>buf #<cr>", desc = Util.get_icon("Bookmarks", 1) .. "Switch" }
  map.n["<leader>]"] = { "<cmd>bnext<cr>", desc = Util.get_icon("ArrowRight", 1) .. "Next" }
  map.n["<leader>["] = { "<cmd>bprev<cr>", desc = Util.get_icon("ArrowLeft", 1) .. "Prev" }
  map.n["<leader>T"] = { "<cmd>silent! TagbarToggle<cr>", desc = Util.get_icon("Tab", 1) .. "Tags" }
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

  map.n["<leader>H"] = { "<cmd>" .. ucmd("GoHome") .. "<cr>", desc = "Home" }
  map.n["<leader>S"] = {
    "<cmd>"
      .. ucmd("ChangeDirectory", vim.env.HOME .. "/.config/nvim")
      .. "| e "
      .. vim.env.HOME
      .. "/.config/nvim/init.lua"
      .. "<cr>",
    desc = Util.get_icon("ActiveLSP", 1) .. "Settings",
  }

  --- terminal -----------------------
  map.n["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = Util.get_icon("Terminal", 1) .. "Terminal" }
  map.t["<ESC><ESC>"] = { "<c-\\><c-n>", desc = "Enter Normal Mode" }
  map.t["<C-ESC>"] = { "<cmd>close<cr>", desc = "Hide Terminal" }

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
  map.n["<leader>sl"] = { '<cmd>lua require("persistence").load({ last = true })<cr>', desc = "Last session." }
  map.n["<leader>sd"] = { '<cmd>lua require("persistence").load()<cr>', desc = "Current directory." }

  --- Explorer ---------------------------
  map.n["<leader>e"] =
    { "<cmd>Neotree focus toggle position=float<cr>", desc = Util.get_icon("Explorer", 1) .. "Explorer" }

  --- Git --------------------------------
  map.n["<leader>g"] = sections.g
  map.n["<leader>gd"] = { "<cmd>Gdiffsplit<cr>", desc = "Diff" }
  map.n["<leader>gc"] = { "<cmd>BCommits<cr>", desc = "Commits" }
  map.n["<leader>gb"] = { "<cmd>Git blame<cr>", desc = "Blame" }

  --- Apps -------------------------------
  -- map.n["<leader>a"] = sections.a
  -- map.n["<leader>ae"] = { "<cmd>Neotree position=float<cr>", desc = Util.get_icon("FolderOpen", 1) .. "Explorer" }
  -- map.n["<leader>ag"] = { Apps.lazygit, desc = Util.get_icon("Git", 1) .. "Git" }
  -- map.n["<leader>at"] = { Apps.terminal, desc = Util.get_icon("Terminal", 1) .. "Terminal" }
  -- map.n["<leader>ad"] = { Apps.lazydocker, desc = Util.get_icon("Docker", 1) .. "Docker" }
  -- map.n["<leader>as"] = { Apps.btm, desc = Util.get_icon("Stats", 1) .. "Stats" }
  -- map.n["<leader>am"] = { Apps.spotify, desc = Util.get_icon("Spotify", 1) .. "Spotify" }
  -- map.n["<leader>ab"] = { "<cmd>ToggleTerm<cr>", desc = "  Bottom Terminal" }
  --
  --- Diagnostic --------------------------

  map.n["<leader>d"] = sections.d
  -- stylua: ignore
  map.n["<leader>d]"] = { function() vim.diagnostic.goto_next() end, desc = "Goto next diagnostic" }
  -- stylua: ignore
  map.n["<leader>d["] = { function() vim.diagnostic.goto_prev() end, desc = "Goto previous diagnostic" }
  map.n["<leader>dd"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Diagnostics" }

  --- find --------------------------
  map.n["<leader>f"] = sections.f
  map.n["<leader>fs"] = { "<cmd>Ag<cr>", desc = "Search" }
  map.n["<leader>fS"] = { "<cmd>Spectre <cr>", desc = "Replace" }
  map.n["<leader>ff"] = { "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", desc = "Find (Telescope)" }
  map.n["<leader>fo"] = { "<cmd>Telescope oldfiles <cr>", desc = "Recent files (Telescope)" }
  map.n["<leader>fm"] = { "<cmd>Telescope marks <cr>", desc = "Marks(Telescope)" }
  map.n["<leader>fz"] = { "<cmd>:Files<cr>", desc = "Find (FZF)" }
  map.n["<leader>fw"] = { "<cmd>Telescope live_grep <cr>", desc = "Find words" }
  map.n["<leader>ft"] = { "<cmd>TodoTelescope<cr>", desc = "TODOS" }
  map.n["<leader>fd"] =
    { "<cmd>Telescope lsp_document_symbols theme=dropdown previewer=false<cr>", desc = "Find symbols" }
  map.n["<leader>fD"] =
    { "<cmd>Telescope lsp_workspace_symbols theme=dropdown previewer=false<cr>", desc = "Find project symbols" }

  --- code --------------------------
  map.n["<leader>c"] = sections.c
  map.n["<leader>cf"] = { vim.lsp.buf.format, desc = "Format" }
  map.n["<leader>cr"] = { vim.lsp.buf.rename, desc = "Rename" }
  map.n["<leader>cc"] = { vim.lsp.buf.code_action, desc = "Code actions" }
  map.n["<leader>ct"] = { "<cmd>TestSuite<cr>", desc = "Run tests" }

  --- LeetCode ----------------------
  map.n["<leader>l"] = sections.l
  map.n["<leader>lq"] = { "<cmd>LBQuestions<cr>", desc = "List Questions" }
  map.n["<leader>ll"] = { "<cmd>LBQuestion<cr>", desc = "View Question" }
  map.n["<leader>lr"] = { "<cmd>LBReset<cr>", desc = "Reset Code" }
  map.n["<leader>lt"] = { "<cmd>LBTest<cr>", desc = "Run Code" }
  map.n["<leader>ls"] = { "<cmd>LBSubmit<cr>", desc = "Submit Code" }
end
Util.setup_keymap(map)
