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

" Set the cursor between box and line in insert and normal mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
" \e[6 q: Steady bar (line).
" \e[5 q: Blinking bar.
" \e[2 q: Steady block. 

" default opening of tabs
set splitright
set splitbelow

" Airline configs
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline_theme='ghdark'

" Light Line Config
let g:lightline = {
      \ 'colorscheme': 'ghdark',
      \ }
