call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'vim-scripts/Align'
Plug 'projekt0n/github-nvim-theme'
Plug 'neoclide/coc.nvim'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" rust binary
Plug '~/Documents/neovim-calculator'
"
" (Optional) Multi-entry selection UI.
" Plug 'junegunn/fzf'
call plug#end()

" Configure coc.nvim for Rust
if executable('rust-analyzer')
    let g:coc_global_extensions = ['coc-rust-analyzer']
endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" focus between splits
map <C-h> :wincmd h <CR>
map <C-j> :wincmd j <CR>
map <C-k> :wincmd k <CR>
map <C-l> :wincmd l <CR>

map ? :w <Cr> :!cargo run <Cr>
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" copy to clipboard 
vnoremap gc :w !wl-copy<CR><Esc>

" by adding set path+=** and set wildmenu to the vimrc, we are now able to hit
" Tab when running a :find command to expand partial matches.
set wildmenu

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

syntax enable

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5>          <Plug> (lcn-menu)
" Or map each action separately
nmap <silent>K     <Plug> (lcn-hover)
nmap <silent> gd   <Plug> (lcn-definition)
nmap <silent> <F2> <Plug> (lcn-rename)

colorscheme github_dark_colorblind

" FILE BROWSING
let g:netrw_banner=0
let g:netrw_browser_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" :edit a folder to open a file browser
" <CR>/v/t to open in a h-splist/v-split/tab
" check |netrw-browse-maps| for more mappings

" SNIPPETS
" Read an empty CPP template and move the cursor
nnoremap ,csk        :- 1read $HOME/.nvim/skeleton.c   <CR> 4j$
nnoremap ,cppsk      :- 1read $HOME/.nvim/skeleton.cpp <CR> 9j$
nnoremap ,forsk      :- 1read $HOME/.nvim/for.cpp      <CR> j$
nnoremap ,cpppointsk :- 1read $HOME/.nvim/cpppoint.cpp <CR> 55j$

set noerrorbells
set relativenumber
set number
set hlsearch
set incsearch
set smartcase
set noswapfile
set nobackup
set undodir=~/AppData/Local/nvim-data/backup
set undofile
set backspace=indent,eol,start
set updatetime=1000
set termguicolors
highlight ColorColumn ctermbg=0 guibg=lightgrey

" NeoVim configuration for clangd

" Set the path to the clangd executable
let g:clangd_executable = 'clangd'

" Setting up a predefined layout with focus on the right split in init.vim
" autocmd VimEnter * vsplit . | vertical resize 40 | wincmd l
