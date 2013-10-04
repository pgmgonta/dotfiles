"text format
set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

"
set backspace=2
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

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'kana/vim-altr'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'project.tar.gz'
"NeoBundle 'rails.vim'
NeoBundle 'The-NERD-tree'

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

hi Pmenu     ctermbg=8  
hi PmenuSel  ctermfg=0 ctermbg=7 
hi PmenuSbar ctermbg=1

let g:neocomplcache_enable_at_startup=1

"status line
set laststatus=2 
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).'\|'.&ff.']'}\\%l/%L\ (%P)%m%=%{strftime(\"%Y/%m/%d\ %H:%M\")} 

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
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete

"vim-altr{{{
nmap <F3> <Plug>(altr-forward)
nmap <F2> <Plug>(altr-back)

call altr#define('%.rb', 'spec/%_spec.rb')
call altr#define('app/models/%.rb', 'spec/models/%_spec.rb', 'spec/factories/%s.rb')
call altr#define('app/controllers/%.rb', 'spec/controllers/%_spec.rb')
call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')
call altr#define('spec/routing/%_spec.rb', 'config/routes.rb')
"}}}

function! RSpecSyntax()
  hi def link rubyRailsTestMethod             Function
  syn keyword rubyRailsTestMethod describe context it its specify shared_examples_for it_should_behave_like before after around subject fixtures controller_name helper_name
  syn match rubyRailsTestMethod '\<let\>!\='
  syn keyword rubyRailsTestMethod violated pending expect double mock mock_model stub_model
  syn match rubyRailsTestMethod '\.\@<!\<stub\>!\@!'
endfunction
autocmd BufReadPost *_spec.rb call RSpecSyntax()
