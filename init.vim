call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript' 
Plug 'mattn/emmet-vim'
Plug 'valloric/youcompleteme'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'shawncplus/phpcomplete.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'

call plug#end()

set autoread " detecta si un archivo ha sido cambiado

" set a map leader for more key combos
let mapleader = ','

" Tab control
set noexpandtab " tabs ftw
set smarttab " tab espeta 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " la visibilidad del tab
set softtabstop=4 " editar como si tab fueran 4 caracteres
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" para inicializar vim con NERDTree
"autocmd vimenter * NERDTree
nmap <leader>n :NERDTreeToggle<cr>
" close NERDTree after a file is opened
"let g:NERDTreeQuitOnOpen=1
" show hidden files in NERDTree
let NERDTreeShowHidden=1"

" para el tema
syntax enable
set background=dark
colorscheme solarized

" configuracion de syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$|[\/](node_modules)$'

" configuracion de vim-airline
let g:solarized = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" let g:airline_solarized_normal_green = 1

" vim-javascript
let g:javascript_plugin_jsdoc = 1

set number " para que se muestren los numeros de linea
set backspace=indent,eol,start
filetype plugin on
"if has('gui_running')
  "set guifont=Ubuntu_Mono:h12
"endif

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
:endfunction

command! -nargs=* GenTags call GenTags()

" Para importar a traves de \u en php
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

set autoindent " automatically set indent of new line
set smartindent"

" faster redrawing
set ttyfast
