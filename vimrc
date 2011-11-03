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
"set nofoldenable
set ruler
set number
set guifont=Ubuntu\ Mono\ 11
colorscheme mylokai

" print
set printoptions=paper:letter

" formatting
filetype plugin indent on
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent cindent
"set foldnestmax=2
nnoremap <space> za
vnoremap <space> zf

"" formatting - C
autocmd filetype c setlocal shiftwidth=4 tabstop=4 softtabstop=4

"" formatting - ASM
autocmd filetype asm setlocal shiftwidth=4 tabstop=4 softtabstop=4

"" formating - Python
autocmd filetype python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype python setlocal foldmethod=indent

"" formatting - Ruby
autocmd filetype ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

"" formatting - JavaScript
"function! JavaScriptFold() 
"    setl foldmethod=syntax
"    setl foldlevelstart=1
"    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"
"    function! FoldText()
"        return substitute(getline(v:foldstart), '{.*', '{...}', '')
"    endfunction
"    setl foldtext=FoldText()
"endfunction
"au FileType javascript call JavaScriptFold()
"au FileType javascript setl fen

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

" GUI options.
set guioptions=

" Tab behavior
set switchbuf=usetab,newtab

