local status, telescope = pcall(require, "telescope")

if (not status) then
  print("telescope not installed")
  return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    -- ignore file to show in telescope
    file_ignore_patterns = { "vendor\\.*", ".vscode", ".git\\", "%_%_pycache%_%_", "node%_modules" },
    dynamic_preview_title = true,
    mappings = {
      n = {
        ["q"] = actions.close
      }
    }
  },

  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["C-w"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension('file_browser')
telescope.load_extension('live_grep_args')

-- custom keymaps
vim.keymap.set("n", ";f", function()
  builtin.find_files({
    prompt_prefix='🔍: ',
  })
end)

-- create/delete/move file
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 50 }
  })
end)

vim.keymap.set("n", ";r", function()
  builtin.lsp_document_symbols()
end)

vim.keymap.set("n", ";l", function()
  telescope.extensions.live_grep_args.live_grep_args()
end)

vim.keymap.set("n", ";d", function()
  builtin.lsp_dynamic_workspace_symbols()
end)

vim.keymap.set("n", "\\\\", function()
  builtin.buffers()
end)

vim.keymap.set("n", ";t", function()
  builtin.help_tags()
end)

vim.keymap.set("n", ";;", function()
  builtin.resume()
end)

vim.keymap.set("n", ";e", function()
  builtin.diagnostics()
end)
