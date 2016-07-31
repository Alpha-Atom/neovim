"dein stuff
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.config/nvim/dein')

" Let dein manage dein
call dein#add('Shougo/dein.vim')

" Plugins go here
call dein#add('Shougo/deoplete.nvim')
call dein#add('junegunn/fzf.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-repeat')
call dein#add('pangloss/vim-javascript')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('ctrlpvim/ctrlp.vim')

" Colour schemes go here
call dein#add('flazz/vim-colorschemes.git')
call dein#add('junegunn/seoul256.vim')

call dein#end()

" Things for dein:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set rtp+=/usr/local/opt/fzf
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set noshowmode

" Sensible leader mappings
let mapleader = " "
let maplocalleader = " "

" Colour stuff
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colo apprentice 

" Allow pasting from OS clipboard
set clipboard^=unnamed 

" Tabs -> spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Highlight the current line
set cursorline

" Indent things
filetype indent on
set autoindent
set smartindent

" Movement bindings
nnoremap H ^
nnoremap L $

" Remap JJ to escape cause muh homerow
inoremap JJ <Esc>

" Quickly repeat the last command
map <leader>! :exec '!!'<CR>

" Add a semicolon to the end of the current line
nnoremap <leader>; m`A;<Esc>``

" Open a Terminal
nnoremap <leader>t :term<CR>

" Toggle comments
nnoremap <leader>c :Commentary<CR>
vnoremap <leader>c :Commentary<CR>

" Airline stuff
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline', 'branch']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='bubblegum'

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

" Fancy colour scheme selector
nnoremap <silent> <Leader>q :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>
