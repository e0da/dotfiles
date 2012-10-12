" Pathogen!
" http://github.com/tpope/vim-pathogen
"
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

set hidden                                                " don't unload buffer when switching away
set modeline                                              " allow per-file settings via modeline
set exrc                                                  " enable per-directory .vimrc files
set secure                                                " disable unsafe commands in local .vimrc files
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding
set nobackup nowritebackup noswapfile autoread            " no backup or swap
set hlsearch incsearch ignorecase smartcase               " search
set wildmenu                                              " completion
set backspace=indent,eol,start                            " sane backspace
set clipboard=unnamedplus                                 " use the system clipboard for yank/put/delete
set mouse=a                                               " enable mouse for all modes settings
set nomousehide                                           " don't hide the mouse cursor while typing
set mousemodel=popup                                      " right-click pops up context menu
set ruler                                                 " show cursor position in status bar
set number                                                " show line numbers on left
set nofoldenable                                          " I fucking hate code folding
set scrolloff=10                                          " scroll the window so we can always see 10 lines around the cursor
set cursorline                                            " highlight the current line
set printoptions=paper:letter                             " use letter as the print output format
set guioptions-=T                                         " turn off GUI toolbar (icons)
set guioptions-=r                                         " turn off GUI right scrollbar
set guioptions-=L                                         " turn off GUI left scrollbar
set laststatus=2                                          " always show status bar

" middle-click paste
map! <S-Insert> <MiddleMouse>

" font and highlighting
syntax on
set t_Co=256 " 256 colors in terminal
set guifont=Ubuntu\ Mono\ 11
let g:molokai_original=1
colorscheme molokai

" override some highlight settings (turn off stupid italics in Molokai)
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

" formatting
filetype plugin indent on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd filetype c,asm,python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" bindings to:
" - cd current window to parent directory of file
" - generate ctags
" - flush command-t index
" - better range
" - fix white space
" - rerun previous :command
" - underline a line with equals (h1 in Markdown documents)
" - underline a line with hyphens (h2 in Markdown documents)
noremap <leader>cd :lcd %:h<cr>:pwd<cr>
noremap <leader>ct :!ctags -R .<cr><cr>
noremap <leader>cf :CommandTFlush<cr>
noremap ' `
map <leader>W :FixWhitespace<cr>
map <leader>] @:
map <leader>= yypVr=
map <leader>- yypVr-

" fugitive shortcuts
noremap <leader>gs :Gstatus<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>ga :Gwrite<cr>
noremap <leader>gl :Glog<cr>
noremap <leader>gd :Gdiff<cr>
noremap <leader>gb :Gblame<cr>

" move by screen lines
noremap j gj
noremap k gk
noremap <c-j> 5gj
noremap <c-k> 5gk

" NERDTree
let NERDTreeWinPos='right'
map <c-\> :NERDTreeToggle<cr>

" Run ric parser test on given parser
function! ParserTest(parser)
  cd /home/force/work/ric/src/nutricate/tests
  call feedkeys("ggdG:read !./runner.py rparse/" . a:parser . " 2>&1\<cr>\<cr>gg")
endfunction
command! -nargs=1 PT :call ParserTest("test_<args>.py") " invoke with `:PT parser_name`. Best to load python 2.5 virtualenv first
