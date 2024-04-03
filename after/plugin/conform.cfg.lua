local status, conform = pcall(require, 'conform')

if (not status) then
  print("conform not installed")
end

conform.setup {
  formatters_by_ft = {
    javascript = { { "prettier" } },
    html = { { "rustywind" } },
    php = { "php-cs-fixer", "phpcbf", "pint" },
    json = { "prettier" },
    blade = { "blade-formatter", "rustywind" },
    pyton = {"black"},
    htmldjango = {"djlint"},
  },
  --format_on_save = {
  --  -- timeout_ms = 3000,
  --  -- lsp_fallback = true,
  --},
}
