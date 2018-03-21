"compatible              " be iMproved, required
"filetype off                  " required

" Set correct encoding
set encoding=utf-8

" Set font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=InputMono:h12:cANSI
  endif
endif

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Airline : the bottom status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" NerdTree is a fs tree for vim
Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'

" Nord - the best theme for VIM
" Plugin 'arcticicestudio/nord-vim'

" gruvbox theme
Plugin 'morhetz/gruvbox' 

" To auto indent Python files
Plugin 'vim-scripts/indentpython.vim'

" To enable folding of code
Plugin 'tmhedberg/SimpylFold'

" To enable code completion
if has("python3")
"	    Bundle 'Valloric/YouCompleteMe'
endif

" To enable syntax checking/Highlighting
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

" Enable CTRLP Searches
Plugin 'kien/ctrlp.vim'

" Git Support
Plugin 'tpope/vim-fugitive'

" Tagbar for classes
Plugin 'majutsushi/tagbar'

" Indentation
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline_powerline_fonts = 1	

" Italicize the code comments
" let g:nord_italic_comments = 1

" enable the correct theme
" colorscheme nord
" let airline_theme = 'nord'

colorscheme gruvbox
let airline_theme = 'gruvbox'
set background=dark    " Setting dark mode

" enable :NE to show the NERDTree
:command NE NERDTree

" Ignore .pyc in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Show line numbers and ruler
set number
set ruler

" Syntax highlighting
let python_highlight_all=1
syntax on

" Remove Menubar and Toolbar
" set guioptions -=m 
" set guioptions -=T

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_python_binary_path = 'python'


nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction

"PEP8 indentation
au BufNewFile,BufRead *.py:
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css:
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" To access system clipboard
set clipboard=unnamed

" To no wrap lines
set nowrap

" F8 to open tagbar
nmap <F8> :TagbarToggle<CR>

" Start VIM maximized
set lines=999 columns=999

" highlight when the line is over the 80 columns
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" show a line at 80 column
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

endif

let g:indentLine_char = '┆'

" Changing cursor crosshair to underline current line
hi clear CursorLine
hi CursorLine cterm=underline
hi CursorLine gui=underline
"hi clear CursorColumn
"hi CursorColumn cterm=standout
"hi CursorColumn gui=standout
set cursorline! 
"set cursorcolumn!

