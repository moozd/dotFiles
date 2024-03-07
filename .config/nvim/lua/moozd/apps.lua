local app = require("moozd.util").create_terminal_app

return {
  terminal = app({dir=vim.loop.cwd()}),
  lazygit = app({ cmd = "lazygit", dir = "git_dir" }),
  lazydocker = app({ cmd = "lazydocker", dir = "~/" }),
  btm = app({ cmd = "btm" }),
  spotify = app({ cmd = "spt" }),
}
