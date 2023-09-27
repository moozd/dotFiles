-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")

vim.cmd.colorscheme("sonokai")

vim.cmd("highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl")
vim.cmd("highlight DiagnosticUnderlineOk cterm=undercurl gui=undercurl")

vim.cmd("highlight IlluminatedWordRead cterm=NONE gui=NONE  guibg=#393b4e")
vim.cmd("highlight IlluminatedWordText cterm=NONE gui=NONE  guibg=#393b4e")
vim.cmd("highlight IlluminatedWordWrite cterm=NONE gui=NONE guibg=#393b4e")

-- vim.cmd("highlight link  LineNr      Normal")
-- vim.cmd("highlight link  SignColumn  Normal")
-- vim.cmd("highlight Pmenu      guibg=#272822 guifg=#cecece")
-- vim.cmd("highlight PmenuSel   guibg=#004599 guifg=#fff")
-- vim.cmd("highlight PmenuSbar  guibg=#272822")
-- vim.cmd("highlight PmenuThumb guibg=#902700")
-- vim.cmd("highlight VertSplit  guibg=#272822")
-- --
