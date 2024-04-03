local status, mason = pcall(require, "mason")

if (not status) then
  print("mason not installed")
  return
end

mason.setup()
--require("mason-lspconfig").setup()
