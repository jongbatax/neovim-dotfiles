local status, toggleterm = pcall(require, "toggleterm")
local Terminal = require('toggleterm.terminal').Terminal

if (not status) then return end

local is_win32 = vim.fn.has("win32")
if (is_win32 == 1) then
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = 'float',
  float_opts = {
    border = 'curved'
  }
})

local float = Terminal:new({
  cmd = "pwsh",
  hidden = true,
  direction = 'float',
  exit_on_close = false,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<F10>", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})

local horizontal = Terminal:new({
  cmd = "pwsh",
  hidden = true,
  exit_on_close = false,
  direction = 'horizontal',
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<F9>", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})


toggleterm.setup {
  hidden = true,
  direction = 'float',
  open_mapping = [[<c-\>]],
  close_on_exit = false,
  float_opts = {
    border = 'curved'
  }
}


function _Lazygit_toggle()
  lazygit:toggle()
end

function _Float_toggle()
  float:toggle()
end

function _Horizontal_toggle()
  horizontal:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _Lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua _Float_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F9>", "<cmd>lua _Horizontal_toggle()<CR>", { noremap = true, silent = true })
