" Things to setup
" - go to definition (gd) needs to be set up
"
" -- Treesitter
" :TSInstall css dockerfile html javascript json lua typescript vim

"
" -- LSP: language servers
"   npm install -g typescript typescript-language-server vscode-langservers-extracted dockerfile-language-server-nodejs vls eslint_d prettier

" -- HTML / CSS / JSON / ESLINT vscode language servers
" -- https://github.com/hrsh7th/vscode-langservers-extracted
" -- npm i -g vscode-langservers-extracted
"
" -- TYPESCRIPT / JAVASCRIPT
" -- https://github.com/typescript-language-server/typescript-language-server
" -- npm install -g typescript typescript-language-server
"
" -- DOCKERFILE
" -- https://github.com/rcjsuen/dockerfile-language-server-nodejs
" -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls
" -- npm install -g dockerfile-language-server-nodejs


set path+=**

let mapleader=" "

"Nice menu when typing `:find *.js`
" set wildmode=longest,list,full
" set wildmenu

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
set autoindent
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
" set signcolumn=number
set signcolumn=yes
set isfname+=@-@
" set ls=0

" For linux clipboard
set clipboard=unnamedplus

" Give more space for displaying messages.
set cmdheight=2

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

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"" Completion snipets - For vsnip users.
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" Commenting
" Plug 'tpope/vim-commentary'
Plug 'numToStr/Comment.nvim'


" Plug 'shaunsingh/nord.nvim'
" Plug 'altercation/vim-colors-solarized'
Plug 'gruvbox-community/gruvbox'

Plug 'phaazon/hop.nvim'

" File finding
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" File navigation
Plug 'preservim/nerdtree'

" Allows for seamless navigation between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" helper for surrounds
Plug 'tpope/vim-surround'

" Terraform highlighting
Plug 'hashivim/vim-terraform'

call plug#end()

nnoremap <leader>e <cmd>NERDTreeToggle<cr>

" Moving line up/down & selected lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Solarized color scheme
" syntax enable
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>

" Telescope setup
" Issue: does not find hidden files currently

" Comment.nvim setup
lua require('Comment').setup()

" Hop setup
lua require('hop').setup()

nnoremap s <cmd>HopChar1<CR>
onoremap s v<cmd>HopChar1<CR>
" nnoremap f <cmd>HopWord<CR>
" onoremap f v<cmd>HopWord<CR>

"
" LSP
"
fun! LspLocationList()
    lua vim.diagnostic.setloclist({open_loclist = false})
endfun

" TODO: There may be some tweeking needed here...
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>vn :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>vp :lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>

lua <<EOF
  local buf_map = function(bufnr, mode, lhs, rhs, opts)
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
          silent = true,
      })
  end

  local on_attach = function(client, bufnr)
      vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
      vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
      vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
      vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
      vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
      vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
      vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
      vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
      vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
      vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
      vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
      vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
      --buf_map(bufnr, "n", "gd", ":LspDef<CR>")
      --buf_map(bufnr, "n", "gr", ":LspRename<CR>")
      --buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
      buf_map(bufnr, "n", "K", ":LspHover<CR>")
      --buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
      --buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
      --buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
      buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
      --buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
      --if client.resolved_capabilities.document_formatting then
      --    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      --end
  end

  local lspconfig = require 'lspconfig'

  --Enable (broadcasting) snippet capability for completion
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  lspconfig.html.setup{
    capabilities = capabilities,
  }

  lspconfig.cssls.setup {
    capabilities = capabilities,
  }

  lspconfig.jsonls.setup {
    capabilities = capabilities,
  }

  lspconfig.tsserver.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        -- confirm these are keyboinds I want
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
  }

  lspconfig.dockerls.setup{
    capabilities = capabilities,
  }

  lspconfig.terraformls.setup{
    -- capabilities = capabilities,
  }


  lspconfig.vuels.setup{
    capabilities = capabilities,
  }

  --
  -- null-ls
  --
  local null_ls = require("null-ls")
  null_ls.setup({
      sources = {
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.formatting.prettier
      },
      on_attach = on_attach
  })
EOF

"
" nvim-cmp
"
lua <<EOF
  local luasnip = require "luasnip"
  local cmp = require "cmp"

  cmp.setup({
    mapping = {
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-y>'] = cmp.mapping.confirm {
        -- behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ['<C-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'luasnip' },
      { name = 'buffer', keyword_length = 4 },
    }),

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    
    experimental = {
      native_menu = true, -- native_menu is currently causing issues with undo.  something todo with floating windows
                          -- https://github.com/hrsh7th/nvim-cmp/issues/328
      ghost_text = true,
    }
  })
EOF
