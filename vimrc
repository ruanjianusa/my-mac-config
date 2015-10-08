set nocompatible
filetype off

""""""""""""""""""Vundle"""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'docunext/closetag.vim'
Plugin 'ervandew/supertab'
"Plugin 'rizzatti/dash.vim' "integrate dash into vim

call vundle#end()
"""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""For Powerline Effect""""""""""""""""""""""""""""
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" These lines setup the environment to show graphics and colors correctly.
"set nocompatible
set t_Co=256
 
let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
 
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif
 
"set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set background=dark
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set autoindent                " auto/smart indent
set smarttab                  " tab and backspace are smart
set tabstop=4                 " 4 spaces
set expandtab                 " insert spaces instead of tabs
set shiftwidth=4              " 4 space tabs
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=20
set shell=bash
set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=longest:full
set wildmenu                  " menu has tab completion
let maplocalleader=','        " all my macros start with ,
set laststatus=2
set mouse=a
set listchars=tab:>-,trail:.,extends:>,precedes:<

"  searching
set incsearch                 " incremental search
set smartcase                 " ignore case unless user searches an [A-Z] char
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

" Highlight trailing whitespace and lines too long
" This must run before the colorscheme
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"  backup
" set backup
" set backupdir=~/.vim_backup
" set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo

" mappings
" NERDTree
map <C-n> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>

" Highlight tab character in red
syn match tab display "\t"
hi link tab Error

" Make line wrapping work as expected
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj

" Pretty colors!
se t_Co=16
colorscheme solarized

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


