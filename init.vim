"dein stuff
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
" Chromatic
let g:chromatica#enable_at_startup=1
let g:chromatica#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

call dein#begin('~/.config/nvim/dein')

" Let dein manage dein
call dein#add('Shougo/dein.vim')

" Plugins go here
call dein#add('Shougo/deoplete.nvim')
call dein#add('neomake/neomake')
call dein#add('junegunn/fzf.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-repeat')
call dein#add('mhinz/vim-sayonara')
call dein#add('pangloss/vim-javascript')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('elixir-lang/vim-elixir')
call dein#add('udalov/kotlin-vim')
call dein#add('neovimhaskell/haskell-vim', { 'on_ft': 'haskell' })
call dein#add('posva/vim-vue')
call dein#add('rhysd/vim-color-spring-night')
call dein#add('ElmCast/elm-vim')
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')
call dein#add('arakashic/chromatica.nvim', { 'on_ft': 'c'})
call dein#add('justinmk/vim-sneak')
call dein#add('rhysd/clever-f.vim')

" Colour schemes go here
call dein#add('flazz/vim-colorschemes.git')
call dein#add('altercation/vim-colors-solarized')
call dein#add('tyrannicaltoucan/vim-deep-space')
call dein#add('tyrannicaltoucan/vim-quantum')

call dein#end()

" Things for dein:
filetype plugin indent on
if dein#check_install()
  call dein#install()
endif

set rtp+=/usr/local/opt/fzf
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set noshowmode


" Sensible leader mappings
let mapleader = " "
let maplocalleader = " "
let g:quantum_italics = 1

" Colour stuff
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if has("termguicolors")
    set termguicolors
endif
set background=dark
colo quantum

" Allow pasting from OS clipboard
set clipboard^=unnamed 

" Tabs -> spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Highlight the current line
" set cursorline

" Indent things
filetype indent on
set autoindent
set smartindent

" Undo history settings
set undofile " Store undo history in a file
set undodir=~/.vimundo " Store all undo history in the same directory

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Movement bindings
nnoremap H ^
nnoremap L $

" Remap jk to escape cause muh homerow
inoremap jk <Esc>

" Quickly repeat the last command
map <leader>! :exec '!!'<CR>

" Add a semicolon to the end of the current line
nnoremap <leader>; m`A;<Esc>``

" Open a Terminal
nnoremap <leader>t :term<CR>

" Toggle comments
nnoremap <leader>c :Commentary<CR>
vnoremap <leader>c :Commentary<CR>

noremap <leader><space> :nohl<CR>
vnoremap <leader><space> :nohl<CR>

" Navigate through buffers
set hidden
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>

" Delete the current buffer (closes buffer and window)
nnoremap <leader>wd :Sayonara<CR>

" Close current buffer
nnoremap <leader>wc :Sayonara!<CR>

" Yeah
command WQ wq
command Wq wq
command W w
command Q q

let s:termbuf = 0
let g:gitgutter_map_keys = 0

" Terminal
augroup terminal
  autocmd TermOpen * setlocal nospell
  autocmd TermOpen * set nolist
  autocmd TermOpen * set nocursorline
  autocmd TermOpen * set bufhidden=hide
augroup END

autocmd BufRead,BufNewFile *-lec.md setlocal spell
autocmd BufRead,BufNewFile *-lec.md setlocal tw=80
autocmd BufRead,BufNewFile *-lec.md setlocal spelllang=en_gb
autocmd BufRead,BufNewFile *-lec.md setlocal nofoldenable
autocmd BufRead,BufNewFile *-lec.md let b:deoplete_disable_auto_complete=1

nnoremap <leader>wd :Sayonara<CR>
nnoremap <leader>wc :Sayonara!<CR>

nmap <silent> <Up>    :wincmd k<CR>
nmap <silent> <Down>  :wincmd j<CR>
nmap <silent> <Left>  :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>

au BufWritePost *.c :Neomake
au BufRead,BufNewFile *.mc set syntax=lisp

" Airline stuff
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch', 'tabline']
let g:airline_theme='quantum'

" Get rid of bufferline stuff now it's in the echo
let g:bufferline_echo = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

nnoremap <Leader>d :!date<CR>

" Fancy colour scheme selector
nnoremap <silent> <Leader>q :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>
