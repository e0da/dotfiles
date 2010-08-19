map! <S-Insert> <MiddleMouse>
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=50
set nomodeline
set mouse=a
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set termencoding=utf-8
" vim: set ft=vim :
filetype plugin indent on
colors ir_black
set guifont=Deja\ Vu\ Sans\ Mono\ 7
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set number
set directory=/home/force/.vimvar
set backupdir=/home/force/.vimvar

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent cindent
set encoding=utf-8 fileencoding=utf-8
set nobackup nowritebackup noswapfile autoread
set hlsearch incsearch ignorecase smartcase

if has("gui_running")
  colorscheme molokai 
else
  colorscheme ir_black
endif

set wildmenu
set wildmode=list:longest

inoremap <C-j> <Esc>

noremap gc :lcd %:h<Cr>

noremap ' `
