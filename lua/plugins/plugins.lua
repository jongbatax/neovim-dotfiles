local status, packer = pcall(require, 'packer')

if (not status) then
  print("packer not installed")
  return
end

packer.startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- kanagawa colorscheme
  use { "rebelot/kanagawa.nvim" }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- mason lsp
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- neovim lsp-config
  use "neovim/nvim-lspconfig"

  -- autopairs, autotag
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  -- cmp completion, buffer word builtin-lsp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  -- lua snip
  use({
    'L3MON4D3/LuaSnip',
    tag = "v2.*",
    run = "make_install_jsregxp"
  })

  -- cmp_luasnip
  use 'saadparwaiz1/cmp_luasnip'

  -- lsp kind pictograms like vscode
  use "onsails/lspkind.nvim"

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim'
    }
  }
  -- telescope file brwoser
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- colorizer
  use "norcalli/nvim-colorizer.lua"

  -- nvim-web-devicons
  use "nvim-tree/nvim-web-devicons"

  -- conform formatter
  use "stevearc/conform.nvim"

  -- which key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 200
    end
  }

  -- lsp saga
  use 'nvimdev/lspsaga.nvim'

  -- toggle term
  use 'akinsho/toggleterm.nvim'

  -- bufferline
  use 'akinsho/bufferline.nvim'

  -- lualine
  use 'nvim-lualine/lualine.nvim'

  -- fidget
  -- use 'j-hui/fidget.nvim'

  -- mini indent
  use {
    'echasnovski/mini.nvim',
    tag = '*'
  }

  -- noice
  use {
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    }
  }

  -- alpha nvim
  use {
    'goolord/alpha-nvim'
  }

  -- gitsigns
  use 'lewis6991/gitsigns.nvim'

  -- todo-comment
  use 'folke/todo-comments.nvim'

  -- tailwind-fold
  use 'razak17/tailwind-fold.nvim'
end)
