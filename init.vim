" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif


set nocompatible
set number
set relativenumber
syntax enable
set fileencodings=utf-8,cp1251
set encoding=utf-8
set title
set autoindent
set nobackup
set noswapfile
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=7
set expandtab
"let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

set clipboard=unnamed
set ruler

set guifont=MesloLGSDZ\ Nerd\ Font\ Mono
" set colorcolumn=80

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif


" True color 24-bit for tmux
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
" set t_BE=
set t_vb=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
" set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set nowrap
set linebreak
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*
set wildignore+=*/env/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline


augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Java
au BufNewFile,BufRead *.java set filetype=java

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md,.java

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2
autocmd FileType java setlocal shiftwidth=4 tabstop=4
autocmd FileType kotlin setlocal shiftwidth=4 tabstop=4

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

syntax enable
" set background=dark
" let g:onedark_style = 'warm'
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme xcodedark

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" vim: set foldmethod=marker foldlevel=0:
"
" hi Normal guibg=NONE ctermbg=NONE
if !exists('g:neovide')
    autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
en
" hi VertSplit guibg=NONE ctermbg=NONE
set mousehide "Спрятать курсор мыши когда набираем текст
set mouse=a "Включить поддержку мыши
set splitbelow
set splitright

let g:neovide_cursor_vfx_mode = "pixiedust"
let neovide_window_position_animation_length = 0
let neovide_window_floating_opacity = 1.0
let neovide_window_floating_blur = v:false

" Completion settings
let g:coq_settings = { 'auto_start': 'shut-up' }

"let g:neovide_fullscreen=v:true
tnoremap <Esc> <C-\><C-n>

" set colorcolumn=100 " vertical column

" File view (nvim tree)
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file


highlight Comment cterm=italic gui=italic

set shell=/usr/local/bin/fish
set guifont=Iosevka:h16
" Set color for vertical colorcolumn
hi VirtualColumn guifg=#BEBEBE

" set listchars=tab:,trail:
" set listchars=tab:,trail:
" set listchars=tab:>,trail:-
"                                        
"                                        
"                                        
"                                        
"          
"                                       
"                                        
"                                        
"                                         
"                                        
"                                      
"                                        
"                                            
"                                        
"                                        
"                                        
"                                        
"                                          
"                                         
"                                         
"                                         
"                                         
"                                         
"                                         
"                                         
"                                         
"                                         
"                                    
" ♥ ⚡
"                                         
"                                         
"                                        
"                                         
"           
" Pomicons (E000-E00A)
"            
" Font Linux (moved F100-F115 with holes → F300-F313)
"                     
" Seti-UI + Custom (E5FA-E62B)
"                                         
"          
"
"         
"
