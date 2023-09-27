local Util = require("moozd.util")
local Apps = require("moozd.apps")

local map = Util.empty_map_table()





--- navigation ---------------------
map.n["<Tab>"] = { "<cmd>:Buffers<cr>", desc = "Find a buffer" }
map.n["<Tab><Tab>"] = { "<cmd>:Files<cr>", desc = "Find a file" }
---lsp
map.n["gd"] = { vim.lsp.buf.definition, desc = "Go to definitions" }
map.n["gt"] = { vim.lsp.buf.type_definition, desc = "Go type to definitions" }
map.n["gs"] = { vim.lsp.buf.document_symbol, desc = "Go to document symbols" }
map.n["gS"] = { vim.lsp.buf.workspace_symbol, desc = "Go to workspace symbol" }
map.n["gr"] = { vim.lsp.buf.references, desc = "List references" }
map.n["gi"] = { vim.lsp.buf.implementation, desc = "List implementations" }
map.n["gk"] = { vim.lsp.buf.hover, desc = "Show hover help" }
map.n["gK"] = { vim.lsp.buf.signature_help, desc = "Show signature help" }

map.n["X"] = { '<cmd>let @/=""<cr>', desc = "Cancel search" }
map.n["gh"] = {
  function()
    vim.diagnostic.config({ virtual_text = true })
  end,
}
map.n["ghh"] = {
  function()
    vim.diagnostic.config({ virtual_text = false })
  end,
}

map.n["<leader><Left>"] = { "<C-w>h", desc = Util.get_icon("ArrowLeft", 1) .. "Left" }
map.n["<leader><Down>"] = { "<C-w>j", desc = Util.get_icon("ArrowDown", 1) .. "Down" }
map.n["<leader><Up>"] = { "<C-w>k", desc = Util.get_icon("ArrowUp", 1) .. "Up" }
map.n["<leader><Right>"] = { "<C-w>l", desc = Util.get_icon("ArrowRight", 1) .. "Right" }
map.n["m<Up>"] = { "<cmd>resize +2<CR>", desc = "Resize split up" }
map.n["m<down>"] = { "<cmd>resize -2<CR>", desc = "Resize split down" }
map.n["m<Right>"] = { "<cmd>vertical resize -5<CR>", desc = "Resize split left" }
map.n["m<Left>"] = { "<cmd>vertical resize +5<CR>", desc = "Resize split right" }

map.n["<S-UP>"] = { "<cmd>m-2<cr>", desc = "Move line up" }
map.n["<S-Down>"] = { "<cmd>m+1<cr>", desc = "Move line down" }
--- overall-------------------------
map.n["<leader>e"] =
{ "<cmd>Neotree toggle position=left<cr>", desc = Util.get_icon("FolderOpen", 1) .. "Explorer (sidebar)" }
map.n["<leader>d"] = { "<cmd>Dashboard<cr>", desc = Util.get_icon("Window", 1) .. "Dashboard" }
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
}


map.n["<leader>a"] = sections.a
map.n["<leader>ae"] = { "<cmd>Neotree position=float<cr>", desc = Util.get_icon("FolderOpen", 1) .. "Explorer" }
map.n["<leader>ag"] = { Apps.lazygit, desc = Util.get_icon("Git", 1) .. "Git" }
map.n["<leader>at"] = { Apps.terminal, desc = Util.get_icon("Terminal", 1) .. "Terminal" }
map.n["<leader>ad"] = { Apps.lazydocker, desc = Util.get_icon("Docker", 1) .. "Docker" }
map.n["<leader>as"] = { Apps.btm, desc = Util.get_icon("Stats", 1) .. "Stats" }
map.n["<leader>ar"] = { Apps.redis, desc = Util.get_icon("Redis", 1) .. "Redis" }

--- find --------------------------
map.n["<leader>f"] = sections.f
map.n["<leader>fs"] = { "<cmd>Ag<cr>", desc = "Search" }
map.n["<leader>fS"] = { "<cmd>Spectre <cr>", desc = "Replace" }
map.n["<leader>fd"] =
{ "<cmd>Telescope lsp_document_symbols theme=dropdown previewer=false<cr>", desc = "Find symbols" }
map.n["<leader>fD"] =
{ "<cmd>Telescope lsp_workspace_symbols theme=dropdown previewer=false<cr>", desc = "Find project symbols" }
--- code --------------------------
map.n["<leader>c"] = sections.c
map.n["<leader>cf"] = { vim.lsp.buf.format, desc = "Format" }
map.n["<leader>cd"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Diagnostics" }
map.n["<leader>cr"] = { vim.lsp.buf.rename, desc = "Rename" }
map.n["<leader>cc"] = { vim.lsp.buf.code_action, desc = "Code actions" }
map.n["<leader>ct"] = { "<cmd>TestSuite<cr>", desc = "Run tests" }

Util.setup_keymap(map)
