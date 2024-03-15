return function()
  local catppuccin = require("lualine.themes.catppuccin")

  catppuccin["inactive"]["a"]["bg"] = "#1e1e2e"
  catppuccin["inactive"]["b"]["bg"] = "#1e1e2e"
  catppuccin["inactive"]["c"]["bg"] = "#1e1e2e"
  catppuccin["normal"]["c"]["bg"] = "#1e1e2e"
  
  catppuccin["normal"]["b"]["bg"] = "#1e1e2e"
  catppuccin["insert"]["b"]["bg"] = "#1e1e2e"
  catppuccin["command"]["b"]["bg"] = "#1e1e2e"
  catppuccin["terminal"]["b"]["bg"] = "#1e1e2e"
  catppuccin["visual"]["b"]["bg"] = "#1e1e2e"
  catppuccin["replace"]["b"]["bg"] = "#1e1e2e"
  catppuccin["inactive"]["b"]["bg"] = "#1e1e2e"

  require("lualine").setup({
    options = {
      theme = catppuccin,
      globalstatus = true,
      component_separators = "",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = " ", right = " " }, right_padding = 2 } },
      lualine_b = { { "branch", separator = { right = " " } } },
      lualine_c = {
        "%=", --[[ add your center compoentnts here in place of this comment ]]
        "cwd",
        { "filename", path = 1 },
      },
      lualine_x = {},
      lualine_y = {
        -- {
        --   "fileformat",
        --   icons_enabled = true,
        --   symbols = {
        --     unix = "LF",
        --     dos = "CRLF",
        --     mac = "CR",
        --   },
        -- },
        -- "encoding",
        {
          "filetype",
          separator = { left = " " },
        },
        { "progress", separator = { left = " " } },
      },
      lualine_z = {
        { "location", separator = { left = " ", right = " " }, left_padding = 2 },
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
    extensions = {},
  })
end
