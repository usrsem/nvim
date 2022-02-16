if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ff :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <silent> fr <cmd>Telescope live_grep<cr>
nnoremap <silent> fb <cmd>Telescope buffers<cr>
nnoremap <silent> fh <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')

-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    path_display={"tail"},
    preview = false,
    mappings = {
      n = {
        ["q"] = actions.close,
      },
      i = {
          ["<C-Down>"] = require('telescope.actions').cycle_history_next,
          ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
      '.gitignore'
    },
    file_ignore_patterns = {
        "node_modules",
        "bin",
        "build",
    },
    pickers = {
        find_files = {
          theme = "dropdown",
        }
    },
  }
}
EOF

