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

if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/Unite.vim'
NeoBundle 'thinca/vim-quickrun'

"Project
NeoBundle 'kana/vim-altr'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'project.tar.gz'
NeoBundle 'The-NERD-tree'

"Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'rails.vim'

"JavaScript/CSS
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'othree/javascript-libraries-syntax.vim'

"Gradle
NeoBundle 'tfnico/vim-gradle'
NeoBundle 'thinca/vim-quickrun'

"Python
"cd ~/.vim/bundle/jedi-vim  git submodule update --init
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'jmcantrell/vim-virtualenv'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

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

"hi Pmenu     ctermbg=8  
"hi PmenuSel  ctermfg=0 ctermbg=7 
"hi PmenuSbar ctermbg=1

let g:neocomplcache_enable_at_startup=1
set laststatus=2 
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).'\|'.&ff.']'}\\%l/%L\ (%P)%m%=%{strftime(\"%Y/%m/%d\ %H:%M\")} 
 
let g:used_javascript_libs = 'underscore,backbone,angularjs'
 
if has("autocmd")
  
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1

  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

  autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
  autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
  autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
endif

hi Pmenu ctermbg=7
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

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

call pathogen#infect()
