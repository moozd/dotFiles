local Util = require("moozd.util")
local Apps = require("moozd.apps")

local map = Util.empty_map_table()

--- navigation ---------------------
map.n["<C-Tab>"] = { "<cmd>:Buffers<cr>", desc = "Find a buffer" }
---lp
map.n["gd"] = { vim.lsp.buf.definition, desc = "Go to definitions" }
map.n["gt"] = { vim.lsp.buf.type_definition, desc = "Go type to definitions" }
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
map.n["X"] = { '<cmd>let @/=""<cr>', desc = "Cancel search" }
-- map.n["<leader><Left>"] = { "<C-w>h", desc = Util.get_icon("ArrowLeft", 1) .. "Left" }
-- map.n["<leader><Down>"] = { "<C-w>j", desc = Util.get_icon("ArrowDown", 1) .. "Down" }
-- map.n["<leader><Up>"] = { "<C-w>k", desc = Util.get_icon("ArrowUp", 1) .. "Up" }
-- map.n["<leader><Right>"] = { "<C-w>l", desc = Util.get_icon("ArrowRight", 1) .. "Right" }
map.n["z<Up>"] = { "<cmd>resize +2<CR>", desc = "Resize split up" }
map.n["z<down>"] = { "<cmd>resize -2<CR>", desc = "Resize split down" }
map.n["z<Right>"] = { "<cmd>vertical resize +5<CR>", desc = "Resize split left" }
map.n["z<Left>"] = { "<cmd>vertical resize -5<CR>", desc = "Resize split right" }

map.n["<M-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }
map.n["<M-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }
map.i["<M-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }
map.i["<M-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }

--- overall-------------------------

-- stylua: ignore
map.n["<leader><Space>"] = {
  "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",
  desc = Util.get_icon("DefaultFile", 1) .. "Buffers"
}
map.n["<leader>x"] = { "<cmd>bdelete<cr>", desc = Util.get_icon("TabClose", 1) .. "Close" }
map.n["<leader>X"] = { Util.close_all_but_this, desc = Util.get_icon("BufferClose", 1) .. "Close All" }
map.n["<leader>w"] = { "<cmd>w<cr>", desc = Util.get_icon("DefaultFile", 1) .. "Save" }
map.n["<leader>W"] = { "<cmd>wa<cr>", desc = Util.get_icon("Session", 1) .. "Save All" }
map.n["<leader>;"] = { "<cmd>buf #<cr>", desc = Util.get_icon("Bookmarks", 1) .. "Switch" }
map.n["<leader>]"] = { "<cmd>bnext<cr>", desc = Util.get_icon("ArrowRight", 1) .. "Next" }
map.n["<leader>["] = { "<cmd>bprev<cr>", desc = Util.get_icon("ArrowLeft", 1) .. "Prev" }
map.n["<leader>D"] = { "<cmd>Dashboard<cr>", desc = Util.get_icon("Window", 1) .. "Dashboard" }
map.n["<leader>t"] = { "<cmd>silent! TagbarToggle<cr>", desc = Util.get_icon("Tab", 1) .. "Tags" }

--- terminal -----------------------
map.t["g<esc>"] = { "<c-\\><c-n>", desc = "Enter Normal Mode" }
map.t["<C-/>"] = { "<cmd>close<cr>", desc = "Hide Terminal" }

--- menu --------------------------
local sections = {
  e = { desc = Util.get_icon("FolderOpen", 1) .. "Explorer" },
  f = { desc = Util.get_icon("Search", 1) .. "Find" },
  c = { desc = Util.get_icon("DefaultFile", 1) .. "Code" },
  a = { desc = Util.get_icon("Terminal", 1) .. "Apps" },
  g = { desc = Util.get_icon("Git", 1) .. "Git" },
  d = { desc = Util.get_icon("Diagnostic", 1) .. "Diagnostics" },
  l = { desc = Util.get_icon("GitUntracked", 1) .. "LeetCode" },
}

--- Explorer ---------------------------
map.n["<leader>e"] = { "<cmd>Neotree focus toggle<cr>", desc = Util.get_icon("Explorer", 1) .. "Explorer" }

--- Git --------------------------------
map.n["<leader>g"] = sections.g
map.n["<leader>gd"] = { "<cmd>Gdiffsplit<cr>", desc = "Diff" }
map.n["<leader>gc"] = { "<cmd>BCommits<cr>", desc = "Commits" }
map.n["<leader>gb"] = { "<cmd>Git blame<cr>", desc = "Blame" }

--- Apps -------------------------------
map.n["<leader>a"] = sections.a
map.n["<leader>ae"] = { "<cmd>Neotree position=float<cr>", desc = Util.get_icon("FolderOpen", 1) .. "Explorer" }
map.n["<leader>ag"] = { Apps.lazygit, desc = Util.get_icon("Git", 1) .. "Git" }
map.n["<leader>at"] = { Apps.terminal, desc = Util.get_icon("Terminal", 1) .. "Terminal" }
map.n["<leader>ad"] = { Apps.lazydocker, desc = Util.get_icon("Docker", 1) .. "Docker" }
map.n["<leader>as"] = { Apps.btm, desc = Util.get_icon("Stats", 1) .. "Stats" }
map.n["<leader>am"] = { Apps.spotify, desc = Util.get_icon("Spotify", 1) .. "Spotify" }

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
map.n["<leader>fz"] = { "<cmd>:Files<cr>", desc = "Find (FZF)" }
map.n["<leader>fw"] = { "<cmd>Telescope live_grep <cr>", desc = "Find words" }
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

Util.setup_keymap(map)
