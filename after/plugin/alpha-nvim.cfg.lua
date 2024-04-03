local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  "============================================================",
  "   _____                            _           _           ",
  "  / ____|                          | |         | |          ",
  " | (___     ___   _ __    ___    __| |   __ _  | |_    __ _ ",
  "  \\___ \\   / _ \\ | '__|  / _ \\  / _` |  / _` | | __|  / _` |",
  "  ____) | |  __/ | |    |  __/ | (_| | | (_| | | |_  | (_| |",
  " |_____/   \\___| |_|     \\___|  \\__,_|  \\__,_|  \\__|  \\__,_|",
  " ============================================================",
  "                                                  opungdev",
}

-- set menu
dashboard.section.buttons.val = {
  dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
  dashboard.button(";s", "  > Settings", ":Telescope find_files search_dirs={\"$HOME/AppData/Local/nvim\"}<CR>"),
  dashboard.button("q", "󰩈  > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = {
  "Don’t let the noise of others opinions drown out your own inner voice.",
}

alpha.setup(dashboard.opts)

vim.cmd([[
autocmd FileType alpha setlocal nofoldenable
]])
