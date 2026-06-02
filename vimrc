let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your plugins here
Plug 'sheerun/vim-polyglot'
" Plug 'wojciechkepka/vim-github-dark'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

call plug#end()

" Set default visual basis
colorscheme ghdark
set number
set relativenumber
set laststatus=2
" set colorcolumn=81
" highlight ColorColumn ctermbg=DarkBlue
" Make 81st column stand out
" highlight ColorColumn ctermbg=Red
highlight ColorColumn ctermbg=DarkBlue
call matchadd('ColorColumn', '\%81v', 100)
highlight ColorColumn ctermbg=DarkBlue

" Set the cursor between box and line in insert and normal mode
let &t_EI = "\e[1 q"
let &t_SR = "\e[3 q"
let &t_SI = "\e[5 q"
" \e[6 q: Steady bar (line).
" \e[5 q: Blinking bar.
" \e[2 q: Steady block. 

" default opening of tabs
set splitright
set splitbelow

" Light Line Config
let g:lightline = {
      \ 'colorscheme': 'ghdark',
      \ }

" Netrw Configs 
" These are formed as auto commands 
autocmd FileType netrw setlocal relativenumber
let g:netrw_keepdir = 0
let g:netrw_browse_split = 0
" let g:netrw_winsize = 25
