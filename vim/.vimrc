"text format
set number
set autoindent
set tabstop=2
set shiftwidth=2

"
set backspace=1
set nowrap

"Vundle
"setup
"mkdir -p ~/.vim/bundle
"git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"set rtp+=~/.vim/vundle.git/ 
"call vundle#rc() 
"NeoBundle 'gmarik/vundle'
"NeoBundle 'Shougo/neobundle'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'hail2u/vim-css3-syntax.git'

"NeoBundle 'rails.vim'
"NeoBundle 'ruby.vim'

syntax on
filetype on
filetype indent on
filetype plugin on

imap <Nul> <C-x><C-o>
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
imap <C-Space> <C-x><C-o>

"use delete key
set t_kD=^?

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=12 guibg=SlateBlue
highlight PmenuSbar ctermbg=0 guibg=#404040

let g:neocomplcache_enable_at_startup=1

"status line
set laststatus=2 
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).'\|'.&ff.']'}\\%l/%L\ (%P)%m%=%{strftime(\"%Y/%m/%d\ %H:%M\")} 

"rails.vim
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"

"Ruby omni complete
set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_rails=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_include_object=1
let g:rubycomplete_include_objectspace=1

"set omnifunc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby set dictionary=~/.vim/syntax/rails.vim 


