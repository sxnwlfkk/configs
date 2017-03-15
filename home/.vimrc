set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=/home/cs/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/Pydiction'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'ledger/vim-ledger'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

call vundle#end()

filetype plugin indent on

" Fold docstring preview
let g:SimpylFold_docstring_preview = 1

" 80th column
if (exists('+colorcolumn'))
        set colorcolumn=80
            highlight ColorColumn ctermbg=9
        endif

" Colorscheme use 256 colors
set t_Co=16

set encoding=utf-8
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitbelow
set splitright

" Pydiction settings
let g:pydiction_location='/home/cs/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 3

" Buffer navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Powerline
let g:airline_powerline_fonts = 1
set laststatus=2

" Popup menu when searching for a file
set wildmenu
" Don't redraw when macros
set lazyredraw
" Show matching parentheses
set showmatch
" Start searching while typing
set incsearch
" Highlight search matches
set hlsearch

let mapleader=","
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Enable code folding
set foldmethod=indent
" set foldlevel=99
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Solves tmux color problem
"set term=screen-256color

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Python highlighting
let python_highlight_all=1
syntax on

" Full stack development indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Autoclose ycm window, and set goto to <leader>+g
let g:ycm_autoclose_preview_window_after_completion=1

" Set numbering
set nu

" Switching buffers with TAB in normal mode
function SwitchBuffer()
      b#
  endfunction

  nmap <Tab> :call SwitchBuffer()<CR>
