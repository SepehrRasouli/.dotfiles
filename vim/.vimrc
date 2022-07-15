set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'puremourning/vimspector'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'tpope/vim-fugitive'
Plugin 'tc50cal/vim-terminal'
Plugin 'frazrepo/vim-rainbow'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'itchyny/lightline.vim'
Plugin 'pacokwon/onedarkhc.vim'
Plugin 'morhetz/gruvbox'
Plugin 'alvan/vim-closetag'
Plugin 'preservim/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'dense-analysis/ale'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'easymotion/vim-easymotion'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
map <silent><Leader>g :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>
set encoding=utf-8
" Enable folding
set foldmethod=indent
set foldlevel=99
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
 highlight BadWhitespace ctermbg=red guibg=darkred

let python_highlight_all=1
syntax on

let NERDTreeMinimalUI=1
autocmd BufEnter * if tabpagenr('$') == 1
      \ && winnr('$') == 1
      \ && exists('b:NERDTree')
      \ && b:NERDTree.isTabTree()
      \ | quit | endif

" vim-nerdtree-syntax-highlight
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeSyntaxEnabledExtensions = ['rb', 'ruby']

let g:DevIconsEnableFoldersOpenClose = 1

let g:lightline = {
      \ 'colorscheme': 'one',
     \ 'active': {
      \   'left': [ ['mode','paste'],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'relativepath'] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set number
set showmatch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc
set expandtab 
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set autoindent
set laststatus=2
set encoding=UTF-8
set t_Co=256
set noshowmode
set hid
set background=dark
set ruler
hi Normal guibg=NONE ctermbg=NONE
filetype plugin on
filetype indent on
colorscheme gruvbox


if exists('+termguicolors')
  " Necessary when using tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Tabs
set sw=2 ts=2 sts=2 " Default
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType xml :setlocal sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4
autocmd FileType go :setlocal sw=4 ts=4 sts=4

" Make vertical separator pretty
highlight VertSplit cterm=NONE
set fillchars+=vert:\▏

function D()
  execute "NERDTree"
endfunction
command! D call D()

function Term()
  execute "below term++rows=15"
endfunction
command! Term call Term()


