" Jupytext
let g:jupytext_fmt = 'py'
let g:jupytext_style = 'hydrogen'

" Send cell to IronRepl and move to next cell.
" Depends on the text object defined in vim-textobj-hydrogen
" You first need to be connected to IronRepl
nmap ]x ctrih/^# %%<CR><CR>

lua << EOF
local iron = require('iron')

iron.core.set_config {
  preferred = {
    python = "ipython"
  }
}
EOF
