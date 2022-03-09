if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
    function! UpdateRemotePlugins(...)
        " Needed to refresh runtime files
        let &rtp=&rtp
        UpdateRemotePlugins
      endfunction
    endif

call plug#begin()

Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature' " Show marks
Plug 'vimwiki/vimwiki' " wiki inside git

if has("nvim")
    Plug 'b3nj5m1n/kommentary' " Fast commentaries
    Plug 'hoob3rt/lualine.nvim' " status line for vim
    Plug 'folke/lsp-colors.nvim' " smart colors for lsp features
    Plug 'kyazdani42/nvim-web-devicons' " icons pack !
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim' " find files and live grep
    Plug 'sharkdp/fd' " dep of telescope
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} "  9k+ snippets
    Plug 'karb94/neoscroll.nvim' " smooth scroll
    " THEMES
    Plug 'arzg/vim-colors-xcode'
    Plug 'shaunsingh/nord.nvim'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'ThePrimeagen/vim-be-good'

    " LSP plugins
    Plug 'neovim/nvim-lspconfig'
    Plug 'sheerun/vim-polyglot' " syntax highlighting
    Plug 'tell-k/vim-autopep8'
    Plug 'CosmicNvim/cosmic-ui'
    Plug 'MunifTanjim/nui.nvim'


    " Git plugins
    Plug 'lewis6991/gitsigns.nvim' " show git signs on lines in file
    Plug 'TimUntersberger/neogit'

    Plug 'windwp/nvim-autopairs' " smart pairs
    Plug 'mfussenegger/nvim-jdtls' " java lsp
    Plug 'folke/trouble.nvim' " diagnostics list
    " Plug 'folke/zen-mode.nvim'
    " Plug 'andweeb/presence.nvim' " show nvim status in discord))
    Plug 'sunjon/shade.nvim' " shadow unused windows
    " Has problems with 'Too many files'
    " Plug 'TimUntersberger/neogit'
    Plug 'noib3/nvim-cokeline'
    " Plug 'glepnir/dashboard-nvim'
    " Vim everywhere in browser
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    " Plug for thin vertical column
    Plug 'davepinto/virtual-column.nvim'


    " Jupyter config
    Plug 'jupyter-vim/jupyter-vim'

    " Markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
    Plug 'stevearc/gkeep.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'mhinz/vim-startify'
    Plug 'danilamihailov/beacon.nvim'
    Plug 'bfredl/nvim-ipy'
endif

call plug#end()
