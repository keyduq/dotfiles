call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'mattn/emmet-vim'
Plug 'valloric/youcompleteme'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'jwalton512/vim-blade'
Plug 'tpope/vim-repeat'
Plug 'benmills/vimux'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-ragtag'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'diepm/vim-rest-console'
Plug 'gregsexton/matchtag'
Plug 'digitaltoad/vim-pug'
Plug 'chriskempson/base16-vim'

" JavaScript
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
"Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support
Plug 'heavenshell/vim-jsdoc', { 'for': ['jsx', 'javascript'] }

" TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support

" markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" Php
Plug 'shawncplus/phpcomplete.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'StanAngeloff/php.vim'

call plug#end()

set autoread " detecta si un archivo ha sido cambiado

" set a map leader for more key combos
let mapleader = ','

" Tab control
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" Mostrar caracteres invisibles
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Busqueda
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter

set number " para que se muestren los numeros de linea
set backspace=indent,eol,start

" Copiar a clipboard
set clipboard+=unnamedplus

" Numeros de lineas relativas
set relativenumber

" Facil quitar busqueda
nnoremap <esc><esc> :noh<return><esc>

" para inicializar vim con NERDTree
"autocmd vimenter * NERDTree
nmap <leader>n :NERDTreeToggle<cr>
" close NERDTree after a file is opened
"let g:NERDTreeQuitOnOpen=1
" show hidden files in NERDTree
let NERDTreeShowHidden=1"

" para el tema
let base16colorspace=256
syntax enable
set background=dark
"let g:solarized_base16=1
colorscheme base16-default-dark

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$|[\/](node_modules|vendor)$'

" configuracion de vim-airline
let g:airline_theme="base16"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
"let g:airline_solarized_normal_green = 1

" JSX on .js
let g:jsx_ext_required = 0

filetype plugin on

" Neomake
autocmd! BufWritePost * Neomake

" javascript highlight
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_tsc_maker = {
      \ 'args': ['-m', 'commonjs', '--noEmit' ],
      \ 'append_file': 0,
      \ 'errorformat':
      \ '%E%f %#(%l\,%c): error %m,' .
      \ '%E%f %#(%l\,%c): %m,' .
      \ '%Eerror %m,' .
      \ '%C%\s%\+%m'
      \ }

" laravel framework
function! GenTags()
  if isdirectory("./vendor")
    echo '(re)Generating framework tags'
    execute "!php artisan ide-helper:generate"
    execute "!phpctags -R *"
    if !filereadable(".git")
      execute "!touch .git"
    endif
  else
    echo 'Not in a framework project'
    if filereadable("tags")
      echo "Regenerating tags..."
      execute "!phpctags -R *"
      if !filereadable(".git")
        execute "!touch .git"
      endif
    else
      let choice = confirm("Create tags?", "&Yes\n&No", 2)
      if choice == 1
        echo "Generating tags..."
        execute "!phpctags -R *"
        if !filereadable(".git")
          execute "!touch .git"
        endif
      endif
    endif
  endif
endfunction

command! -nargs=* GenTags call GenTags()
command! -nargs=1 Vr call VimuxRunCommand(<f-args>)

" Para linkear WQ, Wq con wq, W con w y Q con q
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Para importar a traves de \u en php
function! IPhpInsertUse()
  call PhpInsertUse()
  call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

set autoindent " automatically set indent of new line
set smartindent"

" Persistent undo
set undofile
set undodir=$HOME/.config/nvim/.undo_history

set undolevels=1000
set undoreload=10000

" faster redrawing
set ttyfast

" directorios temporales
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" editar ~/.config/nvim/init.vim
map <leader>ev :e ~/.config/nvim/init.vim<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" incremento/decremento de numeros
:nnoremap <A-a> <C-a>
:nnoremap <A-x> <C-x>

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
