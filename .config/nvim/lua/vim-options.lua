vim.g.mapleader = " "

vim.cmd("set path+=**")

-- Ignore files
vim.cmd("set wildignore+=**/node_modules/**")

vim.cmd("set guicursor=")
vim.cmd("set relativenumber")
vim.cmd("set nohlsearch")
vim.cmd("set hidden")
vim.cmd("set noerrorbells")
vim.cmd("set tabstop=2 softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set nu")
vim.cmd("set nowrap")
vim.cmd("set noswapfile")
vim.cmd("set nobackup")
vim.cmd("set undodir=~/.vim/undodir")
vim.cmd("set undofile")
vim.cmd("set incsearch")
vim.cmd("set termguicolors")
vim.cmd("set scrolloff=8")
vim.cmd("set signcolumn=yes")
vim.cmd("set isfname+=@-@")

-- For linux clipboard
vim.cmd("set clipboard=unnamedplus")

-- Give more space for displaying messages.
vim.cmd("set cmdheight=2")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.cmd("set updatetime=50")

-- Don't pass messages to |ins-completion-menu|.
vim.cmd("set shortmess+=c")

vim.cmd("set colorcolumn=80")

-- Opens splits below / to the right
vim.cmd("set splitbelow")
vim.cmd("set splitright")
