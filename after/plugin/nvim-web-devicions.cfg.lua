local status, icons = pcall(require, 'nvim-web-devicons')

if (not status) then
  print("nvim-web-devicons not installed")
end

icons.setup {
  override = {},
  default = true
}
