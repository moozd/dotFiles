local M = {}

local register = vim.api.nvim_create_user_command
local cmd = vim.api.nvim_command

local function m(name)
  return "UC" .. name
end

function M.compose(name, args)
  return m(name) .. " " .. (args or "")
end

function M.setup()
  register(m("ChangeDirectory"), function(a)
    cmd("silent! %bd|silent! cd" .. " " .. a["args"])
  end, { nargs = 1, complete = "dir", desc = "Change root directory" })

  register(m("GoHome"), M.compose("ChangeDirectory", vim.env.HOME),{nargs=0,desc="Home"})
end

return M
