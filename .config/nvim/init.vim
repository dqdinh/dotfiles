" .vimrc File
" Procured from: Jeffrey Way
" jeffrey@jeffrey-way.com
"
" Improved by: Garrett Dawson
" killtheliterate@gmail.com
"
" source -- https://github.com/jdavis/dotfiles/blob/master/.vimrc

"Forget compatibility with Vi. Who cares.
set nocompatible

"
" Global Settings
"

set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

" The default 20 isn't nearly enough
set history=9999

"Enable filetypes
filetype on
filetype plugin on
filetype indent on

" Allows the backspace to delete indenting, end of lines, and over the start
" of insert
set backspace=indent,eol,start

" Pretty colors
syntax on

" Show the matching when doing a search
set showmatch

" Always show the last line
set display+=lastline

" UTF-8
set encoding=utf-8

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
let mapleader = "'"
let maplocalleader = '\'

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Show command in bottom right portion of the screen
set showcmd

" Disable beeping and flashing.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"Show no lines numbers
set nonumber

" Use smarter defaults
set smartindent
set smarttab
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping
set wrap
set formatoptions=qrn1
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Faster shortcut for commenting. Requires T-Comment plugin
map ,/ <c-_><c-_>

" More useful command-line completion
set wildmenu

" Automatically re-read the file if it has changed
set autoread

" Off on start
set nofoldenable

" Indent seems to work the best
set foldmethod=indent
set foldlevel=20

"Auto-completion menu
set wildmode=list:longest

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone

"
" Global Bindings
"

" Show only selected in Visual Mode
nmap <silent> <leader>th :cal ToggleSelected(0)<cr>
vmap <silent> <leader>th :cal ToggleSelected(1)<cr>

" Split the window using some nice shortcuts
nmap <leader>s<bar> :vsplit<cr>
nmap <leader>s- :split<cr>

" Unhighlight the last search pattern on Enter
nn <silent> <cr> :nohlsearch<cr><cr>

" Remove trailing whitespace
nmap <leader>tW :cal StripTrailingWhitespace()<cr>

" Control enhancements in insert mode
imap <C-F> <right>
imap <C-B> <left>
imap <M-BS> <esc>vBc
imap <C-P> <up>
imap <C-N> <down>

" When pushing j/k on a line that is wrapped, it navigates to the same line,
" just to the expected location rather than to the next line
nnoremap j gj
nnoremap k gk

" Map Ctrl+V to paste in Insert mode
imap <C-V> <C-R>*

" Map Ctrl+C to copy in Visual mode
vmap <C-C> "+y

" Add paste shortcut
nmap <leader>P "+p

"Map escape key to jj -- much faster
imap jj <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
"
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Ignore some defaults
set wildignore=*.o,*.obj,*~,*.pyc
set wildignore+=.env
set wildignore+=.env[0-9]+
set wildignore+=.git,.gitkeep
set wildignore+=.tmp
set wildignore+=.coverage
set wildignore+=*DS_Store*
set wildignore+=.sass-cache/
set wildignore+=__pycache__/
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=.tox/**
set wildignore+=.idea/**
set wildignore+=*.egg,*.egg-info
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" Fold Keybindings
"nnoremap <space> za

"
" Custom Settings
"

" Set on textwidth when in markdown files
autocmd FileType markdown set textwidth=80

"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"

"Shortcut for NERDTreeToggle
nmap ,nt :NERDTreeToggle

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"customize window width
let NERDTreeWinSize=30

"Prevent NT from replacing Netrw
let NERDTreeHijackNetrw=0

" Netrw
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1

" Explorer
nmap <leader>E :Explore<cr>

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

"--------------------------"
" PERSONAL SETTINGS
" -------------------------"

" testing out 256 colors
" http://vim.wikia.com/wiki/256_colors_in_vim
set t_Co=256

" P a pause when leaving insert mode
set timeout timeoutlen=1000 ttimeoutlen=50

" Scrollbar junk
set guioptions=aAce

" Colors and fonts
syntax enable

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ScreenShell Support
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For tmux support
let g:ScreenImpl = 'Tmux'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
" https://github.com/junegunn/vim-plug#usage
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'scrooloose/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'zhaocai/GoldenView.Vim'

" Add plugins to &runtimepath
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 235
colo seoul256

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <silent> <C-N>  <Plug>GoldenViewNext
nmap <silent> <C-P>  <Plug>GoldenViewPrevious
