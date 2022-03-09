" Description: Keymaps
" Set leader to space
noremap <Space> <Nop>
sunmap <Space>
let mapleader=" "

" turn on/off search highlight
function ToggleHLSearch()
       if &hls
            set nohls
       else
            set hls
       endif
endfunction
nmap <silent> <F4> <Esc>:call ToggleHLSearch()<CR>

" Remaps
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

nnoremap <F10> :set cursorline!<CR>

" ### NVIM TREE settings
nnoremap <F2> :CHADopen<CR>
nnoremap R :NvimTreeRefresh<CR>
nnoremap F :NvimTreeFindFile<CR>
nnoremap <S-C-p> "0p

" Delete without yank
nnoremap x "_x

" Increment/decrement
" nnoremap + <C-a>
" nnoremap - <C-x>
noremap + :vertical:resize +5<CR>
noremap - :vertical:resize -5<CR>
" noremap + :resize +5<CR>
" noremap - :resize -5<CR>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
" command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-


" Maximize window
map <F5> <C-W>_<C-W><Bar>
nnoremap <silent><Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent><Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent><Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent><Leader>- :exe "vertical resize " . (winwidth(1) * 2/3)<CR>

" Smart undo on symbols
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Move text without dd+p
vnoremap K :m '>-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>J :m .+1<CR>==
nnoremap <leader>K :m .-2<CR>==

" Jumplist mutations for j and k moving
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

command BufOnly silent! execute "%bd|e#|bd#"
nnoremap <leader>b :BufOnly<CR>

nmap <F5> :!xdg-open %<CR><CR>

nmap <silent> <S-Tab> :bprevious<Return>
nmap <silent> <Tab> :bnext<Return>

" Close buffer
nnoremap <silent> <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Jupyter
" Send a selection of lines
nnoremap <buffer> <silent> <leader>x :JupyterSendCell<CR>
nnoremap <buffer> <silent> <leader>e :JupyterSendRange<CR>
nmap     <buffer> <silent> <leader>e <Plug>JupyterRunTextObj
vmap     <buffer> <silent> <leader>e <Plug>JupyterRunVisual
