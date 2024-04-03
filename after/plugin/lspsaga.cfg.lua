local status, saga = pcall(require, 'lspsaga')

if (not status) then
  print("lps saga not installed")
end

saga.setup({
  ui = {
    border = "single"
  },
  lightbulb = {
    enable = false
  },
})

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '[e', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.keymap.set('n', '<leader>cd', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>cd', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>cd', '<Cmd>Lspsaga show_buf_diagnostics<CR>', opts)
vim.keymap.set('n', 'gf', '<Cmd>Lspsaga finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'rn', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', '<leader>a', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', '<leader>o', '<Cmd>Lspsaga outline<CR>', opts)
