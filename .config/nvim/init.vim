set path+=**

"Nice menu when typing `:find *.js`
set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=**/node_modules/**


set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
" set noshowmode
set signcolumn=yes
set isfname+=@-@
" set ls=0

" For linux clipboard
set clipboard=unnamedplus

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80

" Opens splits below / to the right
set splitbelow
set splitright


call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'tckmn/vim-minisnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
"Plug 'glepnir/lspsaga.nvim'

"Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/playground'

" Commenting
Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'shaunsingh/nord.nvim'

Plug 'phaazon/hop.nvim'

Plug 'preservim/nerdtree'

" Allows for seamless navigation between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

Plug 'triglav/vim-visual-increment'

call plug#end()

" Hop key bindings
map s <cmd>HopChar1<CR>
omap s v<cmd>HopChar1<CR>

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>

lua require("colors")
lua require("lsp-config")
lua require("cmp-uha")
lua require("commenting")
