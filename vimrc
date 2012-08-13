" Pathogen!
" http://github.com/tpope/vim-pathogen
"
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Vim
set hidden
set modeline

" sane backspace
set backspace=indent,eol,start

" mouse settings
set mouse=a
set nomousehide
set mousemodel=popup
" middle-click paste
map! <S-Insert> <MiddleMouse>

" display
"" enable 256 colors in terminal
set t_Co=256
syntax on
set nofoldenable
set ruler
set number
set guifont=Ubuntu\ Mono\ 11
set scrolloff=10
set cursorline
let g:molokai_original=1
colorscheme molokai

" print
set printoptions=paper:letter

" formatting
filetype plugin indent on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent cindent

"" formatting - C
autocmd filetype c setlocal shiftwidth=4 tabstop=4 softtabstop=4

"" formatting - ASM
autocmd filetype asm setlocal shiftwidth=4 tabstop=4 softtabstop=4

"" formating - Python
autocmd filetype python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" saving and encoding
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
set nobackup nowritebackup noswapfile autoread

" searching
set hlsearch incsearch ignorecase smartcase

" completion
set wildmenu

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

" GUI options.
"" Disable Toolbar (icons) and scrollbars.
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Tab behavior
set switchbuf=usetab,newtab

" NERDTree
let NERDTreeWinPos='right'
map <c-\> :NERDTreeToggle<cr>

" tmux-like bindings
map <c-b>" :split buffer<cr>
map <c-b>% :vertical split buffer<cr>

map <leader>w :FixWhitespace<cr>
