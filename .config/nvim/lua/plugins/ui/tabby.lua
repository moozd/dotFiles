return function()
  local palette = {
    accent = "#a6e3a1",     -- orange
    accent_sec = "#bac2de", -- fg4

    bg = "#1e1e2e",         -- bg1
    fg = "#c7c7c7",         -- fg3

    fg_sec = "#94e2d5",     -- fg2
    bg_sec = "#1e1e2e",     -- bg2

    fg_buf_sec = "#94e2d5",
    bg_buf_sec = "#1e1e2e",
  }

  local filename = require("tabby.filename")

  local buficon = function(winid)
    local buf = vim.api.nvim_win_get_buf(winid)
    local file_icon = "  "


    if vim.api.nvim_buf_get_option(buf, "modified") then
      file_icon = "" .. " "
   end

    return file_icon
  end

  local tabname = function(tabid)
    return vim.api.nvim_tabpage_get_number(tabid)
  end

  local line = {
    hl = { fg = palette.fg, bg = palette.bg },
    layout = "active_wins_at_tail",
    head = {
      
    },
    active_tab = {
      label = function(tabid)
        return {
          " 󰪥 " .. tabname(tabid) .. " ",
          hl = { fg = palette.fg_sec, bg = palette.bg_sec, style = "bold" },
        }
      end,
      -- left_sep = {
      --   "",
      --   hl = { fg = palette.bg_sec, bg = palette.fg_sec },
      -- },
      -- right_sep = {
      --   "",
      --   hl = { fg = palette.bg_sec, bg = palette.fg_sec },
      -- },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          "  " .. tabname(tabid) .. " ",
          hl = { fg = palette.fg, bg = palette.bg },
        }
      end,
      -- left_sep = {
      --   " ",
      --   hl = { fg = palette.bg_sec, bg = palette.fg_sec },
      -- },
      -- right_sep = {
      --   " ",
      --   hl = { fg = palette.bg_sec, bg = palette.fg_sec },
      -- },
    },
    top_win = {
      label = function(winid)
        return {
          " " .. buficon(winid) .. filename.unique(winid) .. " ",
          hl = { fg = palette.fg_buf_sec, bg = palette.bg_buf_sec, style = "bold" },
        }
      end,
      -- left_sep = {
      --   "",
      --   hl = { bg = palette.fg_buf_sec, fg = palette.bg_buf_sec },
      -- },
      -- right_sep = {
      --   "",
      --   hl = { bg = palette.fg_buf_sec, fg = palette.bg_buf_sec },
      -- },
    },
    win = {
      label = function(winid)
        return {
          " " .. buficon(winid) .. filename.unique(winid) .. " ",
          hl = { fg = palette.fg, bg = palette.bg },
        }
      end,
      -- left_sep = { " ", hl = { fg = palette.fg, bg = palette.bg } },
      -- right_sep = { " ", hl = { fg = palette.fg, bg = palette.bg } },
    },
    -- tail = {
    --   { " ", hl = { fg = palette.accent_sec, bg = palette.bg } },
    --   { "  ", hl = { fg = palette.accent, bg = palette.accent_sec } },
    -- },
  }
  require("tabby").setup({ tabline = line })
end
