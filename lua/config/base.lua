-- configuration base.lua

vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'pwsh' --bash, pwsh, fish
vim.opt.backupskip = {'/tmp/*', '/private/tmp/*'}
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- set true if you like use wrap line
vim.opt.backspace = {'start', 'eol', 'indent'}
vim.opt.path:append {'**'}
vim.opt.wildignore:append{'*/node_modules/*', '*/__pycache__/*'}
vim.opt.hidden = true

-- folding
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "2"
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- pytyhon3_host_prog
--vim.cmd([[
--let g:python3_host_prog = '/data/data/com.termux/files/usr/bin/python'
--let g:python_style = 'google'
--]])

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})


-- configuration highlights
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'


-- clipboard
vim.opt.clipboard:append{'unnamed'}
