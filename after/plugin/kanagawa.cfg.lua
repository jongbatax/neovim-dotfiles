local status, kanagawa = pcall(require, "kanagawa")

if (not status) then
  print("kanagawa not installed")
  return
end

kanagawa.setup({
  undercurl = true,
  transparent = true,
  theme = "wave"
})

vim.cmd[[ colorscheme kanagawa ]]
