" Vim
set hidden
set nomodeline

" sane backspace
set backspace=indent,eol,start

" mouse settings
set mouse=a
set nomousehide
set mousemodel=popup
" middle-click paste
map! <S-Insert> <MiddleMouse>

" display
syntax on
set nofoldenable
set ruler
set number
set guifont=Deja\ Vu\ Sans\ Mono\ 7
colorscheme mylokai

" print
set printoptions=paper:letter

" formatting
filetype plugin indent on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent cindent
autocmd FileType c setlocal shiftwidth=8 tabstop=8 softtabstop=8


" saving and encoding
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
set nobackup nowritebackup noswapfile autoread

" searching
set hlsearch incsearch ignorecase smartcase

" bash-like autocomplete
set wildmenu
set wildmode=list:longest

" better Esc
inoremap <C-j> <ESC>

" cd current window to parent directory of file
noremap gc :lcd %:h<CR>:pwd<CR>

" better range
noremap ' `

" fugitive shortcuts
noremap <bslash>gs :Gstatus<cr>
noremap <bslash>gc :Gcommit<cr>
noremap <bslash>ga :Gwrite<cr>
noremap <bslash>gl :Glog<cr>
noremap <bslash>gd :Gdiff<cr>

" use ctrl-h/j/k/l to switch between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Disable default Ctrl-Space behavior
map  <Nul> <Nop>
imap <Nul> <Nop>
vmap <Nul> <Nop>
cmap <Nul> <Nop>
nmap <Nul> <Nop>

set guioptions=
