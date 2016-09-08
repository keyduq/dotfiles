call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript' 
Plug 'mattn/emmet-vim'
Plug 'valloric/youcompleteme'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" para inicializar vim con NERDTree
autocmd vimenter * NERDTree

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
" let g:airline_solarized_normal_green = 1

" vim-javascript
let g:javascript_plugin_jsdoc = 1

set number " para que se muestren los numeros de linea
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin on
