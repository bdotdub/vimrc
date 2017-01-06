" vim-plug
" --------
call plug#begin('~/.vim/plugged')

Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Townk/vim-autoclose'
Plug 'bling/vim-airline'
Plug 'fatih/vim-go'
Plug 'keith/swift.vim'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'
Plug 'mrtazz/simplenote.vim'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'thinca/vim-localrc'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vividchalk'

call plug#end()

" General Configuration
" ---------------------
colorscheme vividchalk
set background=dark
set guifont=Inconsolata:h24     " Huge and not always there ...
set guifont=Monaco:h14
set guioptions-=T               " Remove GUI toolbar
set visualbell                  " Suppress audio/visual error bell
set notimeout                   " No command timeout
set showcmd                     " Show typed command prefixes while waiting for operator

set expandtab                   " Use soft tabs
set tabstop=2                   " Tab settings
set autoindent
set smarttab                    " Use shiftwidth to tab at line beginning
set shiftwidth=2                " Width of autoindent
set number                      " Line numbers
set nowrap                      " No wrapping
set ignorecase                  " Ignore case
set smartcase                   " ... unless uppercase characters are involved

set list                        " Show whitespace
set listchars=tab:▸\ ,trail:¬   " UTF-8 characters for trailing whitespace
set virtualedit=onemore         " Cursor can display one character past line
set showmatch                   " Show matching brackets
set hidden                      " Allow hidden, unsaved buffers
set splitright                  " Add new windows towards the right
set splitbelow                  " ... and bottom
set wildmode=list:longest       " Bash-like tab completion
set scrolloff=3                 " Scroll when the cursor is 3 lines from edge
set cursorline                  " Highlight current line
set laststatus=2                " Always show statusline

set incsearch                   " Incremental search
set history=1024                " History size

set autoread                    " No prompt for file changes outside Vim
set noswapfile                  " No swap file
set nobackup                    " No backup file
set nowritebackup

set autowriteall                " Save when focus is lost
autocmd FocusLost * silent! wall

" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" Removes a keystroke to run commands
nnoremap ; :

" Make Y consistent with D and C
map Y           y$

" Indent/unindent visual mode selection
vmap <tab>      >gv
vmap <S-tab>    <gv

" Toggle highlight search
map <Leader>hh :set hlsearch!<CR>
imap <Leader>hh <ESC>:set hlsearch!<CR>a

" Toggle syntax highlight
map <Leader>ss :if exists("syntax_on") <Bar>
  \   syntax off <Bar>
  \ else <Bar>
  \   syntax enable <Bar>
  \ endif <CR>
imap <Leader>ss <ESC><Leader>ssi

" Split screen
map <leader>v   :vsp<CR>     " Vertical
map <leader>h   :split<CR>   " Horizontal

" Shell commands
map <C-c> :!

" Move between screens
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-h>      <C-w>h
nmap <C-l>      <C-w>l

" Open .vimrc file in new tab. Think Command + , [Preferences...] but with Shift.
map <D-<>       :tabedit ~/.vimrc<CR>

" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" File tree browser
map \           :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>

" Git blame
map <leader>gb   :Gblame<CR>

" Comment/uncomment lines
map <leader>/   <plug>NERDCommenterToggle
map <D-/>       <plug>NERDCommenterToggle
imap <D-/>      <Esc><plug>NERDCommenterToggle i

" Copy current file path to system pasteboard
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>

" NERDTree
" --------

" Pad comment delimeters with spaces
let NERDSpaceDelims = 1

" Small default width for NERDTree pane
let g:NERDTreeWinSize = 20

" Small default height for CommandT
let g:CommandTMaxHeight=20

" Change working directory if you change root directories
let g:NERDTreeChDirMode=2

" Go
" Run goimports on save
let g:go_fmt_command = "goimports"

" Ack
" ---
nmap <leader>a :Ack <c-r>=expand("<cword>")<cr> 

" Whitespace & highlighting & language-specific config
" ----------------------------------------------------

" Quick an easy way to strip out trailing spaces
map <leader><Space> :%s/\s\+$//e<CR>

" Strip trailing whitespace for code files on save
" C family
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp :%s/\s\+$//e

" Ruby, Rails
autocmd BufWritePre *.rb,*.yml,*.js,*.json,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml,*.feature :%s/\s\+$//e
autocmd BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufRead,BufNewFile *.god set filetype=ruby
autocmd BufRead,BufNewFile Gemfile* set filetype=ruby
autocmd BufRead,BufNewFile Guardfile* set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufRead,BufNewFile Dockerfile* set filetype=dockerfile
"
" Consider question/exclamation marks to be part of a Vim word.
autocmd FileType ruby set iskeyword=@,48-57,_,?,!,192-255

" Highlight JSON files as javascript
autocmd BufRead,BufNewFile *.json set filetype=javascript
" autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" Golang
"
" Quick way to jump to definition
autocmd FileType go map gd :GoDef<CR>

" Quick way to jump to get type info
autocmd FileType go map gi :GoInfo<CR>

" Toggle pasting behavior
set pastetoggle=<leader>p

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"

" JSONify!
autocmd BufRead,BufNewFile *.json map <leader>f :%!python -mjson.tool<CR>

" Neosnippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Machine-local vim settings - keep this at the end
silent! source ~/.vimrc.local

" Typescript
let g:formatdef_tsfmt = 1

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
