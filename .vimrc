" Toggle folds with za

" Common settings {{{
syntax on

set number
set relativenumber

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set expandtab

set nocompatible              " be iMproved, required
filetype off                  " required

augroup vimrc
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Vundle and plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin
Plugin 'bling/vim-airline'	" Lean & mean status/tabline for vim that's light as air.
Plugin 'tpope/vim-fugitive' " Git helper and git branch in vim-airline
Plugin 'kien/ctrlp.vim'		" Full path finder for Vim
Plugin 'ervandew/supertab'	" Use <Tab> for completion
Plugin 'scrooloose/syntastic'	" Syntax checking
Plugin 'airblade/vim-gitgutter'	" Show git modification
Plugin 'davidhalter/jedi-vim'	" Advanced python autocompletion <C-Space>
Plugin 'nathanaelkane/vim-indent-guides'	" Indent guides
Plugin 'tpope/vim-fireplace' " Clojure and clojurescript plugin
" reminder: cpp evaluate form, gf goto file
Plugin 'guns/vim-clojure-highlight' " Better highlight (locals, imports)
Plugin 'LucHermitte/lh-vim-lib' " Allow a _vimrc_local.vim
Plugin 'LucHermitte/local_vimrc'
Plugin 'arteymix/vim-ocl' " OCL Highlight
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" Color {{{
"set t_Co=256
let base16colorspace=256	" Access colors present in 256 colorspace
colorscheme base16-default
set background=dark
" }}}

" Common settings and leaders {{{
set hidden
set visualbell
set t_vb=
set backspace=indent,eol,start
set undolevels=500
let mapleader = "'"
let maplocalleader = "-"

nnoremap ; :

" Search remap
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Very magic regex search
nnoremap / /\v

" Clear search
noremap <silent> <leader>/ :nohls<cr><c-l>

" Paste
set pastetoggle=<F2>
" }}}

" filetype autocmd {{{
augroup vimrc
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
  autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
  autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
  autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab si ai et
augroup END
" }}}

" Remember line when reopen file {{{
augroup vimrc
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
augroup END
" }}}

" Movement remap {{{
" Remap arrow keys
noremap <Down> gj
noremap <Up> gk
" Remap movement to move by column layout
nnoremap j gj
nnoremap k gk
" Remap movement to move by whole line
nnoremap gj j
nnoremap gk k
" }}}

" Window splitting remap {{{
nnoremap <leader>w <C-w>v<C-w>l " Horizontal split
nnoremap <leader>q <C-w>s<C-w>j " Vertiacl split
nnoremap <C-h> <C-w>h " Move to left split
nnoremap <C-k> <C-w>k " Move to top split
nnoremap <C-l> <C-w>l " Move to right split
nnoremap <C-j> <C-w>j " Move to bottom split
nnoremap <leader>h <C-w>< " Rezise vertical split left
nnoremap <leader>l <C-w>> " Rezise vertical split right
nnoremap <leader>j <C-w>- " Rezise vertical split down
nnoremap <leader>k <C-w>+ " Rezise vertical split up
" }}}

" Buffers remap {{{
nnoremap <leader>' :enew<cr>
nnoremap <leader>, :bprevious<cr>
nnoremap <leader>. :bnext<cr>
nnoremap <leader>p :bdelete<cr>
" }}}

" Tabs remap {{{
nnoremap <leader>a :tabnew<cr>
nnoremap <leader>o :tabprevious<cr>
nnoremap <leader>e :tabnext<cr>
nnoremap <leader>u :tabclose<cr>
" }}}

" edit and source .vimrc {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Special remap and autocmd {{{
" Capitalize previous word
inoremap <c-u> <esc>vbUi

" Open the corresponding .c file with a .h file
augroup vimrc
autocmd BufReadPost *.h nested :call OpenCFileIfExist(expand('%<') . '.c')
augroup END

function! OpenCFileIfExist(file)
  if filereadable(a:file)
    execute "normal! :e " . a:file . "\<cr>"
  endif
endfunction
" }}}

" Airline Status line settings {{{
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"" }}}

" Gitgutter settings {{{
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
"" }}}

" vim-indent-guides settings {{{
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_size = 1
augroup vimrc
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=7
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8
augroup END
"" }}}

" Syntastic settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"" }}}
