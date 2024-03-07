local M = {}

function M.reload()
  for name, _ in pairs(package.loaded) do
    if name:match("^cnull") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

function M.create_command()
  vim.cmd("command! ReloadConfig lua ReloadConfig()")
end




return M


