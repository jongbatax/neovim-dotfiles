local status, lsp = pcall(require, "lspconfig")

if (not status) then
  print("lspconfig not installed")
  return
end

-- on attach
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<Cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<Cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<Cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<Cr>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async=true})<Cr>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<Cr>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<Cr>', opts)
end

-- capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lua lsp
lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = {
        globals = { "vim", "require" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      telemetry = {
        enable = false
      }
    }
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- tsserver
lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lsp.util.root_pattern("package.json", ".git") or lsp.util.path.dirname(vim.api.nvim_buf_get_name(0))
}

-- emmet
lsp.emmet_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'css', 'javascript', 'blade', 'htmldjango' },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true
      }
    }
  },
  root_dir = lsp.util.root_pattern("package.json", ".git") or lsp.util.path.dirname(vim.api.nvim_buf_get_name(0))
}

-- tailwindcss
lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'css', 'javascript', 'blade', 'htmldjango' },
  root_dir = lsp.util.root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.cjs', 'postcss.config.mjs', 'postcss.config.ts', 'package.json', 'node_modules', '.git')
}

-- html
lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "blade" },
  root_dir = lsp.util.root_pattern("package.json", ".git") or lsp.util.path.dirname(vim.api.nvim_buf_get_name(0))
}

-- css
lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lsp.util.root_pattern("package.json", ".git") or lsp.util.path.dirname(vim.api.nvim_buf_get_name(0))
}

-- php intelephense
lsp.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    intelephense = {
      filetypes = { "php", "blade" },
      files = {
        associations = { "*.php", "*.blade.php" },
        maxSize = 5000000,
      }
    }
  },
  root_dir = lsp.util.root_pattern("composer.json", ".git") or lsp.util.path.dirname(vim.api.nvim_buf_get_name(0))
}

-- python lsp server
lsp.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 88
        }
      }
    }
  },
  root_dir = function(fname)
    return vim.loop.cwd()
  end
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = " " },
    severity_sort = true,
    float = true,
  }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

-- diagnostic symbols in the sign column (gutter)
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
