local Util = require("moozd.util")

local colors = {
  base = {
    bg = "#222425",
    fg = "#f7f7f7",
  },
  secondary = {
    bg = "#282a36",
    fg = "#50fa7b",
  },
  black = "#323232",
  normal = "#50fa7b",
  insert = "#00E3AB",
  visual = "#00C8D6",
  command = "#00B5A6",
  replace = "#00C8D6",
  inactive = "#50fa7b",
}

local custom_theme = {
  normal = {
    a = { bg = colors.normal, fg = colors.black },
    b = colors.secondary,
    c = colors.base,
  },
  insert = {
    a = { bg = colors.insert, fg = colors.black },
    b = colors.secondary,
    c = colors.base,
  },
  visual = {
    a = { bg = colors.visual, fg = colors.black },
    b = colors.secondary,
    c = colors.base,
  },
  replace = {
    a = { bg = colors.replace, fg = colors.black },
    b = colors.secondary,
    c = colors.base,
  },
  command = {
    a = { bg = colors.normal, fg = colors.black },
    b = colors.secondary,
    c = colors.base,
  },
  inactive = {
    a = colors.base,
    b = colors.secondary,
    c = colors.base,
  },
}

return function()
  require("lualine").setup({

    options = {
      -- theme = custom_theme, -- "catppuccin", --"seoul256", -- lualine theme
      theme='auto',
      globalstatus = true,
      component_separators = { left = "┊", right = "┊" },
      -- section_separators = { right = "", left = "" },
      section_separators = { right = "", left = "" },
    },
    extensions = { "neo-tree", "lazy" },
    sections = {

      lualine_a = {
        "mode",
      },
      lualine_b = {
        "branch",
        "diff",
      },
      lualine_c = {},

      lualine_x = {
        -- require("moozd.statusline").lsp,
        -- {
        --   "filetype",
        --   icon_only = false,
        -- },
        {
          "filename",
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 1, -- 0: Just the filename

          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = Util.icons.FileModified, -- Text to show when the file is modified.
            readonly = Util.icons.FileReadOnly, -- Text to show when the file is non-modifiable or readonly.
            unnamed = Util.icons.DefaultFile, -- Text to show for unnamed buffers.
            newfile = Util.icons.FileNew, -- Text to show for newly created file before first write
          },
        },

        -- {
        --   "diagnostics",
        --   sources = { "nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic" },
        --   sections = { "error", "warn", "info", "hint" },
        --   symbols = {
        --     error = Util.get_icon("DiagnosticError", 1),
        --     warn = Util.get_icon("DiagnosticWarn", 1),
        --     info = Util.get_icon("DiagnosticInfo", 1),
        --     hint = Util.get_icon("DiagnosticHint", 1),
        --   },
        --   colored = true,          -- Displays diagnostics status in color if set to true.
        --   update_in_insert = true, -- Update diagnostics in insert mode.
        --   always_visible = true,   -- Show diagnostics even if there are none.
        -- },
      },
      lualine_y = {
        "progress",
      },
    },
  })
end
