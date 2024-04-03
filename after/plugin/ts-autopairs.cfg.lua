local status, autopairs = pcall(require, "nvim-autopairs")

if (not status) then
  print("autopairs not installed")
  return
end

autopairs.setup({
  disable_filetype = {"TelescopePrompt", "vim"},
})
