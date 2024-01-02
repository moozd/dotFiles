-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")

-- vim.cmd.colorscheme("minimal")
-- vim.cmd.colorscheme("sonokai")
vim.cmd.colorscheme("catppuccin-mocha")

vim.cmd("highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineOk cterm=undercurl gui=undercurl")

vim.cmd("highlight IlluminatedWordRead cterm=NONE gui=NONE  guibg=#393b4e")
vim.cmd("highlight IlluminatedWordText cterm=NONE gui=NONE  guibg=#393b4e")
vim.cmd("highlight IlluminatedWordWrite cterm=NONE gui=NONE guibg=#393b4e")
-- vim.cmd("highlight BufferLineFill guibg=#2c2e34")
