-- using fidget
--require("fidget").setup({
--  notification = {
--
--    window = {
--      winblend = 0,
--    }
--  }
--})

-- which key
require("which-key").setup({})

-- mini indent
require("mini.indentscope").setup({
  options = {
    try_as_border = true,
    indent_at_cursor = false,
  },
  --symbol = '╎│',
  symbol = '╎',
})

-- noice
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  routes = {
    {
      filter = {
        event = "notify",
        find = "No information available"
      },
      opts = { skip = true }
    }
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
})
