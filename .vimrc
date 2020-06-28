set nocompatible              " be iMproved, required
filetype off                  " required
set number		      " number line
set autoindent		      " auto indent
set cindent		      " 
set ts=2		      " tab space
set shiftwidth=2	      " shift width
 colorscheme gruvbox 
 set bg=dark
 let g:gruvbox_italic=0
 let g:gruvbox_termcolors=256
 let g:gruvbox_contrast_dark="soft"
 "
 "color schme config dracura
 "packadd! dracula
 "syntax enable
 "colorscheme dracula
 "
"colorscheme jellybeans
syntax on

filetype off

" 마지막으로 수정된 곳에 커서를 위치함
 au BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \ exe "norm g`\"" |
 \ endif

let laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"nerdtree
Plugin 'scrooloose/nerdtree'
"airline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
"gitgutter
Plugin 'airblade/vim-gitgutter'
"fugitive
Plugin 'tpope/vim-fugitive'
"syntastic
Plugin 'scrooloose/syntastic'
"crtlp
Plugin 'ctrlpvim/ctrlp.vim'
"colorscheme
"Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'
"javascript-syntax
Plugin 'pangloss/vim-javascript'
"sicp nilj
Plugin 'amdt/vim-niji'
"sicp predit
Plugin 'vim-scripts/paredit.vim'
"sicp tsline
Plugin 'sjl/tslime.vim'
"vim-jsx
Plugin 'mxw/vim-jsx'
"javascript-libraries-syntax
Plugin 'othree/javascript-libraries-syntax.vim'
"vim-jsx-pretty
Plugin 'maxmellon/vim-jsx-pretty'
"live-server
Plugin 'davidgranstrom/nvim-markdown-preview'
"surround.vim HTML
Plugin 'tpope/vim-surround'
"Emmet.vim emmetHTML
Plugin 'mattn/emmet-vim'
"colorschemes
Plugin 'rafi/awesome-vim-colorschemes'
"atomp-dark
Plugin 'gosukiwi/vim-atom-dark'
"indentLine
Plugin 'yggdroot/indentline'
"php
Plugin 'stanangeloff/php.vim'
"regtag
Plugin 'tpope/vim-ragtag'
"pug
Plugin 'digitaltoad/vim-pug'
"pug complate
Plugin 'dnitro/vim-pug-complete'
"dockerfile.vim
Plugin 'ekalinin/dockerfile.vim'

call vundle#end()            " required
filetype plugin indent on    " required
filetype on

"airlineSttings"

set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter ='default'
let g:airline_theme='gruvbox'
set laststatus=2

"nerdTrr
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"ctrip
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "gitignore

"javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
"augroup javascript_folding
"	    au!
"	        au FileType javascript setlocal foldmethod=syntax
"	augroup END
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

"vim-jsx
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

"vim-nilj
let g:niji_dark_colours = [
    \ [ '81', '#5fd7ff'],
    \ [ '99', '#875fff'],
    \ [ '1',  '#dc322f'],
    \ [ '76', '#5fd700'],
    \ [ '3',  '#b58900'],
    \ [ '2',  '#859900'],
    \ [ '6',  '#2aa198'],
    \ [ '4',  '#268bd2'],
    \ ]

"sicp tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

 "tslime {{{
 let g:tslime_ensure_trailing_newlines = 1
 let g:tslime_normal_mapping = '<localleader>t'
 let g:tslime_visual_mapping = '<localleader>t'
 let g:tslime_vars_mapping = '<localleader>T'
 "}}}
 
 "sicp
 autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

"javascript-libraries-syntax
let g:used_javascript_libs = 'react'

"Emmet.vim

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"indentLine

let g:indentLine_color_term = 239 
let g:indentLine_char = '|'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0
let g:indentLine_enabled = 1

