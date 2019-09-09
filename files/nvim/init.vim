"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins!
"                            Managed with vim-plug
"                     https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" Plugins that only install if this is NeoVim
if has('nvim')
  Plug 'SirVer/ultisnips'
  Plug 'Valloric/YouCompleteMe',       { 'do': './install.py --clang-completer' }
  Plug 'vim-ruby/vim-ruby',            { 'for': 'ruby' }
endif

Plug 'Lokaltog/vim-easymotion', { 'on': '<Plug>(easymotion-s)' }
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'alampros/vim-styled-jsx', {'for': ['javascript', 'jsx']}
Plug 'ap/vim-css-color'
Plug 'ashisha/image.vim', { 'on': 'Image' }
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'jgdavey/tslime.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot' | " XXX building polyglot is managed by bin/up
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'troydm/zoomwintab.vim', { 'on': 'ZoomWinTabToggle' }
Plug 'vim-scripts/AnsiEsc.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vim Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if (!has('nvim'))
  set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding can only be set on startup in NeoVim
endif

set hidden                                                " don't unload buffer when switching away
set modeline                                              " allow per-file settings via modeline
set secure                                                " disable unsafe commands in local .vimrc files
set nobackup nowritebackup noswapfile autoread            " no backup or swap
set hlsearch incsearch ignorecase smartcase               " search
set wildmenu                                              " completion
set backspace=indent,eol,start                            " sane backspace
set clipboard+=unnamed,unnamedplus                        " use the system clipboard for yank/put/delete
set mouse=a                                               " enable mouse for all modes settings
set nomousehide                                           " don't hide the mouse cursor while typing
set mousemodel=popup                                      " right-click pops up context menu
set ruler                                                 " show cursor position in status bar
set number                                                " show absolute line number of the current line
set nofoldenable                                          " I fucking hate code folding
set scrolloff=10                                          " scroll the window so we can always see 10 lines around the cursor
set textwidth=80                                          " wrap at 80 characters like a valid human
set printoptions=paper:letter                             " use letter as the print output format
set guioptions-=T                                         " turn off GUI toolbar (icons)
set guioptions-=r                                         " turn off GUI right scrollbar
set guioptions-=L                                         " turn off GUI left scrollbar
set winaltkeys=no                                         " turn off stupid fucking alt shortcuts
set laststatus=2                                          " always show status bar
set shell=bash

" check the parent directories for tags, too.
set tags=./tags,tags;$HOME

" middle-click paste
noremap! <s-insert> <middlemouse>

" auto save
autocmd BufLeave,CursorHold,CursorHoldI,FocusLost * silent! wa

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
set t_Co=256 " 256 colors in terminal

if has('gui_gnome')
  set guifont=Ubuntu\ Mono\ 8.4
endif

" Neovim
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " not yet supported in iTerm 2 stable
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Tweaks for Molokai colorscheme (ignored if Molokai isn't used)
let g:molokai_original=1
let g:rehash256=1

" Use the first available colorscheme in this list
for scheme in [ 'gruvbox', 'solarized', 'molokai', 'desert' ]
  try
    execute 'colorscheme '.scheme
    break
  catch
    continue
  endtry
endfor

" Highlight columns 80 and 120
let &colorcolumn='80,120'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent
autocmd filetype c,asm,python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.hdbs setlocal ft=mustache

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fugitive shortcuts
noremap \gs :Gstatus<cr>
noremap \gc :Gcommit<cr>
noremap \ga :Gwrite<cr>
noremap \gl :Glog<cr>
noremap \gd :Gdiff<cr>
noremap \gb :Gblame<cr>

" NERDTree
let NERDTreeWinPos='right'
noremap <c-\> :NERDTreeToggle<cr>
noremap \nf :NERDTreeFind<cr>

" EasyMotion
nmap <space> <Plug>(easymotion-s)

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-j>"

" ctrlp
" let g:ctrlp_working_path_mode = 'c'

" FZF
nmap <c-p> :FZF<cr>

" vim-easy-align
"" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-test
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let g:test#strategy = 'tslime'
let g:test#preserve_screen = 1
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1


" Don't prompt to load ycm_extra_conf.py for YouCompleteMe; just load it.
let g:ycm_confirm_extra_conf = 0

" Customize Syntastic
" let g:syntastic_sh_shellcheck_args = '-x'
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_always_populate_loc_list = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use single quote as additional range key
noremap ' `

" Rerun previous :command
noremap \' @:

" Underline a line with equals (<h1> in Markdown documents) and put the cursor
" after the line.
"
"   Example Thing
"   =============
"
noremap \= yypVr=j

" Underline a line with hyphens (<h2> in Markdown documents) and put the cursor
" after the line.
"
"   Example Thing
"   -------------
"
noremap \- yypVr-j

" Wrap a line with a # at the beginning and end, then put a solid line of #s
" above and below it and place the cursor after the bottom line, e.g.
"
"   #################
"   # Example Thing #
"   #################
"
noremap \# I#<space><esc>A<space>#<esc>yyPVr#yyjpj

" Handle white space turds
noremap \W :StripWhitespace<cr>
noremap \w :ToggleWhitespace<cr>

" Delete ALL THE BUFFERS!
noremap \bd :bufdo bd<cr>

" cd current window to parent directory of file
noremap \cd :lcd %:h<cr>:pwd<cr>

" Copy path of current file to clipboard
noremap \cp :let @+ = expand("%")<cr>

" Generate ctags
noremap \ct :!ctags -R .<cr><cr>

" Reload ~/.vimrc
noremap \rc :source ~/.vimrc<cr>

" Sort selection
noremap \s :sort<cr>

" Put contents of parentheses on their own newline and reindent (must position
" cursor inside parentheses in normal mode first).
nmap \( ci(<cr><esc>Pa<cr><esc>Vkk=

" Break a comma-delimited list onto new lines
vmap \, :s/,/,\r/g<cr>

" Ag for string in gem directories, too!
" https://github.com/FergusonSean/dotfiles/blob/master/.vimrc#L109
command! -nargs=* Gag call ag#Ag('grep<bang>', <q-args> . ' . ' . system('bundle show --paths | tr "\n" " "'))

" Replace `:key =>` with `key:`, accommodating extra spaces before the =>
noremap \hr :s/:\(\S\+\)\s*=>/\1:/g<cr>

" Replace continugous non-word characters in a visual selection with a dash
" ex. BK-11 BurgerKing::Broiler served your way
"  -> BK-11-BurgerKing-Broiler-served-your-way
vmap \\- :s@\%V\W\+@-@g<cr>

" Fix broken iskeyword (i.e. . isn't terminating constants as words, so hitting
" w on the 'F' in 'Foo.bar(:stuff)' puts your cursor on '(' instead of '.'. See
" more here: https://github.com/vim-ruby/vim-ruby/issues/280 This also seems to
" fix syntax highlighting of constants when it breaks. I still don't understand
" this problem!  ARG!
noremap \kw :set iskeyword=@,48-57,_,192-255<cr>

" Dealing with splits
" Thanks http://flaviusim.com/blog/resizing-vim-window-splits-like-a-boss/
"
" XXX The order and repetition of these width/height settings looks funny, but
" it is what I determined works through experimentation. This was helpful to me
" in finding my way. https://github.com/junegunn/goyo.vim/issues/13
set winwidth=30
set winheight=5
set winminwidth=30
set winminheight=5
set winwidth=80
set winheight=30
nnoremap <silent> _ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Dumb shit for Mac garbage because this operating system is bullshit for idiots
if has('mac')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
