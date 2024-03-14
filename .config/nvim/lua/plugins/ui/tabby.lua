return function()
  local palette = {
    accent = "#ccd6f4",     -- orange
    accent_sec = "#323232", -- fg4
    bg = "#272727",         -- bg1
    fg = "#c7c7c7",         -- fg3
    bg_sec = "#e1e2e",      -- bg2
    fg_sec = "#00ff89",     -- fg2
  }

  local filename = require("tabby.filename")
  -- local cwd = function()
  --   return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
  -- end
  local tabname = function(tabid)
    return vim.api.nvim_tabpage_get_number(tabid)
  end
  local line = {
    hl = { fg = palette.fg, bg = palette.bg },
    layout = "active_wins_at_tail",
    head = {
      -- { cwd, hl = { fg = palette.bg, bg = palette.accent } },
      -- { "", hl = { fg = palette.accent, bg = palette.bg } },
    },
    active_tab = {
      label = function(tabid)
        return {
          "  " .. tabname(tabid) .. " ",
          hl = { fg = palette.fg_sec, bg = palette.bg_sec },
        }
      end,
      left_sep = { " " },
      right_sep = { " " },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          "  " .. tabname(tabid) .. " ",
          hl = { fg = palette.fg, bg = palette.bg },
        }
      end,
      left_sep = { " " },
      right_sep = { " " },
    },
    top_win = {
      label = function(winid)
        return {
          "  " .. filename.unique(winid) .. " ",
          hl = { fg = palette.fg_sec, bg = palette.bg_sec },
        }
      end,
      left_sep = { " " },
      right_sep = { " " },
    },
    win = {
      label = function(winid)
        return {
          "  " .. filename.unique(winid) .. " ",
          hl = { fg = palette.fg, bg = palette.bg },
        }
      end,
      left_sep = { " " },
      right_sep = { " " },
    },
    tail = {
      { "", hl = { fg = palette.accent_sec, bg = palette.bg } },
      { "  ", hl = { fg = palette.accent, bg = palette.accent_sec } },
    },
  }
  require("tabby").setup({ tabline = line })
end
