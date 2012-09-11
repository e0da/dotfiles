" Pathogen!
" http://github.com/tpope/vim-pathogen
"
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#infect()
Helptags

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

" override some highlight settings
highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight DiffText     gui=none
highlight Macro        gui=none
highlight SpecialKey   gui=none
highlight Special      gui=none
highlight StorageClass gui=none
highlight Tag          gui=none

" highlight right column boundary (only available in 7.3+)
if exists('+colorcolumn')
  set colorcolumn=+1
else
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" print
set printoptions=paper:letter

" formatting
filetype plugin indent on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent

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
set hlsearch incsearch smartcase

" completion
set wildmenu
set wildignore+=pkg,tmp

" better Esc
inoremap <C-j> <ESC>

" cd current window to parent directory of file
noremap <leader>cd :lcd %:h<CR>:pwd<CR>

" generate ctags
noremap <leader>ct :!ctags -R .<CR><CR>

" better range
noremap ' `

" fugitive shortcuts
noremap <bslash>gs :Gstatus<cr>
noremap <bslash>gc :Gcommit<cr>
noremap <bslash>ga :Gwrite<cr>
noremap <bslash>gl :Glog<cr>
noremap <bslash>gd :Gdiff<cr>

" move by screen lines
nnoremap j gj
nnoremap k gk
nnoremap <c-j> 5gj
nnoremap <c-k> 5gk

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

" always show status bar
set laststatus=2

" tmux-like bindings
map <c-b>" :split buffer<cr>
map <c-b>% :vertical split buffer<cr>

" fix white space
map <leader>W :FixWhitespace<cr>

" rerun previous :command
map <leader>] @:

" functions
"" ric
function! ParserTest(parser)
  cd /home/force/work/ric/src/nutricate/tests
  call feedkeys("ggdG:read !./runner.py rparse/" . a:parser . " 2>&1\<CR>\<CR>gg")
endfunction
command! -nargs=1 PT :call ParserTest("test_<args>.py")
