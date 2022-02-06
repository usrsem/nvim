if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
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
    Plug 'glepnir/lspsaga.nvim' " better lsp UI
    " Plug 'romgrk/barbar.nvim'
    Plug 'arzg/vim-colors-xcode'
    Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'ThePrimeagen/vim-be-good'

    " LSP plugins
    Plug 'neovim/nvim-lspconfig'
    Plug 'sheerun/vim-polyglot' " syntax highlighting
    Plug 'tell-k/vim-autopep8'

    " Git plugins
    Plug 'lewis6991/gitsigns.nvim' " show git signs on lines in file

    " Plug 'windwp/nvim-autopairs' " smart pairs
    Plug 'mfussenegger/nvim-jdtls' " java lsp
    Plug 'folke/trouble.nvim' " diagnostics list
    " Plug 'folke/zen-mode.nvim'
    " Plug 'andweeb/presence.nvim' " show nvim status in discord))
    Plug 'sunjon/shade.nvim' " shadow unused windows
    " Has problems with 'Too many files'
    " Plug 'TimUntersberger/neogit'
    Plug 'ahmedkhalf/jupyter-nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'noib3/nvim-cokeline'
    Plug 'glepnir/dashboard-nvim'
endif

call plug#end()
