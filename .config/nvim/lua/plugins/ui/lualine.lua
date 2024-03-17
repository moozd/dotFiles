local lsp = require("moozd.status.lsp").lsp_client_names

local function lsp_component()
  local sources = lsp()
  local width = vim.fn.winwidth(0)
  if width < 50 then
    return ""
  end
  if string.len(sources) == 0 then
    return ""
  end
  return "( " .. sources .. " )"
end

return function()
  local catppuccin = require("lualine.themes.catppuccin")

  catppuccin["inactive"]["a"]["bg"] = "#1e1e2e"
  catppuccin["inactive"]["b"]["bg"] = "#1e1e2e"
  catppuccin["inactive"]["c"]["bg"] = "#1e1e2e"
  catppuccin["normal"]["c"]["bg"] = "#1e1e2e"
  catppuccin["normal"]["c"]["fg"] = "#45475a"

  catppuccin["normal"]["b"]["bg"] = "#1e1e2e"
  catppuccin["insert"]["b"]["bg"] = "#1e1e2e"
  catppuccin["command"]["b"]["bg"] = "#1e1e2e"
  catppuccin["terminal"]["b"]["bg"] = "#1e1e2e"
  catppuccin["visual"]["b"]["bg"] = "#1e1e2e"
  catppuccin["replace"]["b"]["bg"] = "#1e1e2e"

  catppuccin["inactive"]["a"]["bg"] = "#1e1e2e"
  catppuccin["inactive"]["b"]["bg"] = "#1e1e2e"
  catppuccin["inactive"]["c"]["bg"] = "#1e1e2e"

  require("lualine").setup({
    options = {
      theme = catppuccin,
      globalstatus = true,
      component_separators = "",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "", right = "" } } },
      lualine_b = { "branch" },
      lualine_c = {
        "%=", --[[ add your center compoentnts here in place of this comment ]]
      },
      lualine_x = {
        { "filetype", colored = false },
        lsp_component,
      },
      lualine_y = {
        "progress",
      },
      lualine_z = {
        {"location",separator = { left = "", right = "" }},
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
