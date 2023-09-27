local M = {}


function M.lsp()
  local sources = require("null-ls.sources")
  local buf_clients = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
  if #buf_clients == 0 then
    return ""
  end

  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "copilot" and client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  for _, source in ipairs(sources.get_available(buf_ft)) do
    if not vim.tbl_contains(buf_client_names, source.name) then
      table.insert(buf_client_names, source.name)
    end
  end

  local client_names_str = table.concat(buf_client_names, "  ")
  local language_servers = string.format("%s",client_names_str)

  return language_servers
end

return M
