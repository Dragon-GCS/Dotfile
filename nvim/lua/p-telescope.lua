local actions = require("telescope.actions")

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<Esc>"] = actions.close
        -- ["<C-h>"] = "which_key"
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6 
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end
        },
        ["n"] = {
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd("startinsert")
          end
        }
      }
    },
  }
}

require("telescope").load_extension("file_browser")
local opts = {noremap=true, silent = true}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', 
    "<cmd>lua require('telescope').extensions.file_browser.file_browser({path='%:p:h', cmd=telescope_buffer_dir(), respect_git_ignore=false, hidden=true})<CR>", opts)
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
