local status, treesitter = pcall(require, "nvim-treesitter.configs")

if (not status) then
  print("treesitter not installed")
  return
end

treesitter.setup({
  ensure_installed = {
    "html",
    "tsx",
    "lua",
    "markdown",
    "markdown_inline",
    "php",
    "javascript",
    "python"
  },
  autotag = {
    enable = true,
    enable_rename = true,
    filetypes = {"html", "php", "blade", "htmldjango"}
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  },
  indent = {
    enable = true,
    disable = {"python"}
  },
  highlight = {
    enable = true,
  }
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsename = {"javascript", "typescript.tsx"}
