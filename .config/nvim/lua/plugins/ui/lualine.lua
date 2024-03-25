local get_icon = require("moozd.util").get_icon
local lsp = require("moozd.status.lsp")
local mode = require("moozd.status.mode")
local project = require("moozd.status.project")
local search_count = require("moozd.status.search_count")
local selection_count = require("moozd.status.selection_count")
local macro = require("moozd.status.macro")

return function()
  local catppuccin = require("lualine.themes.catppuccin")
  catppuccin.normal.c.bg = "#1e1e2e"
  catppuccin.normal.c.fg = "#45475a"
  catppuccin.inactive.a.bg = "#1e1e2e"
  catppuccin.inactive.b.bg = "#1e1e2e"
  catppuccin.inactive.c.bg = "#1e1e2e"

  local bg = "#11111b"
  catppuccin.normal.a.fg = catppuccin.normal.a.bg
  catppuccin.normal.a.bg = bg
  catppuccin.normal.b.bg = "#1e1e2e"

  catppuccin.insert.a.fg = catppuccin.insert.a.bg
  catppuccin.insert.a.bg = bg
  catppuccin.insert.b.bg = "#1e1e2e"

  catppuccin.command.a.fg = catppuccin.command.a.bg
  catppuccin.command.a.bg = bg
  catppuccin.command.b.bg = "#1e1e2e"

  catppuccin.terminal.a.fg = catppuccin.terminal.a.bg
  catppuccin.terminal.a.bg = bg
  catppuccin.terminal.b.bg = "#1e1e2e"

  catppuccin.visual.a.fg = catppuccin.visual.a.bg
  catppuccin.visual.a.bg = bg
  catppuccin.visual.b.bg = "#1e1e2e"

  catppuccin.replace.a.fg = catppuccin.replace.a.bg
  catppuccin.replace.a.bg = bg
  catppuccin.replace.b.bg = "#1e1e2e"

  catppuccin.normal.a.gui = ""
  catppuccin.insert.a.gui = ""
  catppuccin.command.a.gui = ""
  catppuccin.visual.a.gui = ""
  catppuccin.terminal.a.gui = ""
  catppuccin.replace.a.gui = ""

  require("lualine").setup({
    options = {
      theme = catppuccin,
      globalstatus = true,
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_a = {
        {
          mode.icon_and_text,
          separator = { right = "", left = "" },
        },
        {
          project,
          separator = { right = "", left = "" },
        },
      },
      lualine_b = {
        "branch",
      },
      lualine_c = {
        "%=", --[[ add your center compoentnts here in place of this comment ]]
      },
      lualine_x = {
        macro,
        selection_count,
        search_count,
        lsp,
        "overseer",
        {
          "diff",
          colored = true,
          symbols = {
            added = get_icon("GitAdd", 1),
            modified = get_icon("GitChange", 1),
            removed = get_icon("GitDelete", 1),
          },
        },
        {
          "diagnostics",
          colored = true,
          symbols = {
            error = get_icon("DiagnosticError", 1),
            warn = get_icon("DiagnosticWarn", 1),
            info = get_icon("DiagnosticInfo", 1),
            hint = get_icon("DiagnosticHint", 1),
          },
        },
      },
      lualine_y = {
        { "filetype", colored = true },
        "progress",
        "location",
      },
      lualine_z = {
        -- {
        --   project,
        --
        --   separator = { right = "", left = "" },
        -- },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = { "fzf", "quickfix", "mason", "man", "lazy" },
  })
end
