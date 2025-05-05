" --------------------------
" 🧠 Basic Vim Best Practices
" --------------------------

" Zeilennummern
set number              " Absolute Zeilennummern
set relativenumber      " Relative Zeilennummern

" Syntax-Highlighting
syntax enable

" UTF-8 everywhere
set encoding=utf-8
set fileencoding=utf-8

" Indentation
set autoindent
set smartindent
set expandtab           " Tabs → Spaces
set tabstop=4           " Tab = 4 Spaces
set shiftwidth=4        " Indent = 4 Spaces
set softtabstop=4

" Suchverhalten
set ignorecase
set smartcase
set incsearch
set hlsearch

" UI/Anzeige
set cursorline
set scrolloff=5         " 5 Zeilen Abstand beim Scrollen
set showcmd             " Zeige Befehle unten
set showmatch           " Klammern hervorheben
set wildmenu            " Autovervollständigung im Command-Modus
set lazyredraw          " Keine Zwischenredraws
set mouse=a             " Maus aktivieren
set termguicolors

" Backups
set nobackup
set nowritebackup
set noswapfile

" Line Wrapping aus
set nowrap

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Farbschema (mit Fallback)
" try
"     colorscheme desert      " Einfaches, eingebaute Farbschema
" catch
"     echo "Could not load colorscheme"
" endtry

" Wenn du Solarized (oder andere) nutzt:
" colorscheme solarized
" set background=dark

" Mapping: Leader-Key definieren (optional)
let mapleader="\<Space>"

" --------------------------
" 📁 Plugins (wenn du später möchtest)
" --------------------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
" Catppuccin Theme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'preservim/nerdtree'
call plug#end()

" Theme konfigurieren
colorscheme catppuccin_frappe
" set background=dark
