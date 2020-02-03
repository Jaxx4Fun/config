" tab setting

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"
" 文件编码
set encoding=utf-8

" 根据文件位置切换文件目录
set autochdir

" misc
set history=1000
" Test -> Test
" test -> ignore case 
set smartcase

""
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set wrap
"  "
set number
set relativenumber
set cursorline

" undo persist
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=80
set updatetime=1000


" key mapping
" save & quit
let mapleader=" "
noremap Q :q<CR>
noremap S :w<CR>
noremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

noremap <LEADER>erc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>rc :source ~/.config/nvim/init.vim<CR>

noremap s <nop>
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sb :set splitbelow<CR>:split<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sr :set splitright<CR>:vsplit<CR>

" windows navigation
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" quick navi
noremap J 5j
noremap K 5k

" clipboard
set clipboard+=unnamedplus

" insert mode Cursor navi
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
call plug#begin('~/.config/nvim/plugged')

Plug 'chriskempson/base16-vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Undo Tree
Plug 'mbbill/undotree'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
" Editor Enhancement
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter' " in <space>cn to comment a line
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'junegunn/vim-easy-align' " gaip= to align the = in paragraph,
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'
Plug 'Konfekt/FastFold'
Plug 'junegunn/vim-peekaboo'

" Input Method Autoswitch
"Plug 'rlue/vim-barbaric' " slowing down vim-multiple-cursors

" Formatter
Plug 'Chiel92/vim-autoformat'
Plug 'preservim/nerdtree'
call plug#end()
set termguicolors
let base16colorspace=256 "开启256的颜色空间"
" colorscheme base16-google-dark
" colorscheme base16-helios
colorscheme base16-synth-midnight-dark
