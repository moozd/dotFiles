return function()
  local palette = {
    accent = "#ccd6f4", -- orange
    accent_sec = "#323232", -- fg4
    bg = "#1e1e2e", -- bg1
    fg = "#c7c7c7", -- fg3
    fg_sec = "#1e1e2e", -- bg2
    bg_sec = "#89b4fa", -- fg2
    bg_buf_sec = "#a6e3a1",
    fg_buf_sec = "#1e1e2e",
  }

  local filename = require("tabby.filename")
  local tabname = function(tabid)
    return vim.api.nvim_tabpage_get_number(tabid)
  end
  local line = {
    hl = { fg = palette.fg, bg = palette.bg },
    layout = "active_wins_at_tail",
    head = {
      { " ", hl = { fg = palette.accent, bg = palette.bg } },
    },
    active_tab = {
      label = function(tabid)
        return {
          "  " .. tabname(tabid) .. " ",
          hl = { fg = palette.fg_sec, bg = palette.bg_sec },
        }
      end,
      left_sep = {
        "",
        hl = { fg = palette.bg_sec, bg = palette.fg_sec },
      },
      right_sep = {
        "",
        hl = { fg = palette.bg_sec, bg = palette.fg_sec },
      },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          "  " .. tabname(tabid) .. " ",
          hl = { fg = palette.fg, bg = palette.bg },
        }
      end,
      left_sep = {
        " ",
        hl = { fg = palette.bg_sec, bg = palette.fg_sec },
      },
      right_sep = {
        " ",
        hl = { fg = palette.bg_sec, bg = palette.fg_sec },
      },
    },
    top_win = {
      label = function(winid)
        return {
          "  " .. filename.unique(winid) .. " ",
          hl = { fg = palette.fg_buf_sec, bg = palette.bg_buf_sec, style = "bold" },
        }
      end,
      left_sep = {
        " ",
        hl = { bg = palette.fg_buf_sec, fg = palette.bg_buf_sec, style = "bold" },
      },
      right_sep = {
        " ",
        hl = { bg = palette.fg_buf_sec, fg = palette.bg_buf_sec, style = "bold" },
      },
    },
    win = {
      label = function(winid)
        return {
          "  " .. filename.unique(winid) .. " ",
          hl = { fg = palette.fg, bg = palette.bg },
        }
      end,
      left_sep = { " ", hl = { fg = palette.fg, bg = palette.bg } },
      right_sep = { " ", hl = { fg = palette.fg, bg = palette.bg } },
    },
    tail = {
      { "", hl = { fg = palette.accent_sec, bg = palette.bg } },
      { "  ", hl = { fg = palette.accent, bg = palette.accent_sec } },
    },
  }
  require("tabby").setup({ tabline = line })
end
