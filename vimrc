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
Plug 'lervag/vimtex'
" Plug 'tomasr/molokai'
" Plug 'huyvohcmc/atlas.vim'

call plug#end()

" Set default visual basis
colorscheme mono
" let g:molokai_original = 0
set number
set relativenumber
set cursorline
set laststatus=2
" set colorcolumn=81
" highlight ColorColumn ctermbg=DarkBlue
" highlight ColorColumn ctermbg=DarkBlue
" Make 81st column stand out
" call matchadd('ColorColumn', '\%81v', 100)

" Set the cursor between box and line in insert and normal mode
let &t_EI = "\e[1 q"
let &t_SR = "\e[3 q"
let &t_SI = "\e[5 q"
" \e[6 q: Steady bar (line).
" \e[5 q: Blinking bar.
" \e[2 q: Steady block. 

" MY HANDLING OF TABS
:set noexpandtab	" Stop converting tabs to spaces
:set tabstop=4		" Set tab width to 4 spaces
:set shiftwidth=4	" Set auto-indent width to 4 spaces
:retab!				" Force-convert all existing space-indents to real tabs
":set listchars=tab:>-,trail:-
set listchars=tab:├─>
"set listchars=tab:\|\ ,trail:-,extends:>,precedes:<
set list

" default opening of tabs
set splitright
set splitbelow

" Light Line Config
let g:lightline = {
		\ 'colorscheme': 'mono',
		\ }

" Netrw Configs 
" These are formed as auto commands 
autocmd FileType netrw setlocal relativenumber
let g:netrw_keepdir = 1
let g:netrw_browse_split = 0
" let g:netrw_winsize = 25

" Vimtex Set up paramters
autocmd FileType tex setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
let g:vimtex_enabled = 1
syntax enable
let g:vimtex_compiler_enabled = 0
let g:vimtex_view_enabled = 0
let g:vimtex_motion_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_completion_enabled = 0
let g:vimtex_indent_enabled = 0
let g:vimtex_toc_enabled = 0
let g:vimtex_matchparen_enabled = 0

