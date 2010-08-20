" sane backspace
set backspace=indent,eol,start
set nomodeline

" mouse settings
set mouse=a
set nomousehide
set mousemodel=popup
" middle-click paste
map! <S-Insert> <MiddleMouse>

" display
set ruler
set number
set guifont=Deja\ Vu\ Sans\ Mono\ 7
if has("gui_running")
  colorscheme molokai
else
  colorscheme ir_black
endif

" print
set printoptions=paper:letter

" formatting
filetype plugin indent on
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent cindent

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

" git shortcuts
"" show diff in new window
if has("gui_running")
  noremap gd :!git diff <BAR> gvim -<CR><CR>
else
  noremap gd :!git diff <BAR> vim -<CR><CR>
endif
noremap gs :!git status<CR>
noremap ga :!git add %<CR>
"" edit commit message in new window
"if has("gui_running")
"  noremap gm :!gvim __vim_gitcommitmessage && git commit -F __vim_gitcommitmessage && rm __vim_gitcommitmessage<CR>
"else
"  noremap gm :!vim __vim_gitcommitmessage && git commit -F __vim_gitcommitmessage && rm __vim_gitcommitmessage<CR>
"endif
