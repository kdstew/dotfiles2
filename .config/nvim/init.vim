" -- Treesitter
" :TSInstall css dockerfile html javascript json lua typescript vim

"
" -- LSP: language servers
"   npm install -g typescript typescript-language-server vscode-langservers-extracted dockerfile-language-server-nodejs vls eslint_d prettier svelte-language-server
"   npm install -g @volar/vue-language-server
"   terraform-ls
"     - add hashicorp to yum repos: https://www.hashicorp.com/official-packaging-guide
"     - sudo dnf install terraform-ls

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
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"" Completion snipets - For luasnip
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'rafamadriz/friendly-snippets'

" Commenting
" Plug 'tpope/vim-commentary'
Plug 'numToStr/Comment.nvim'


" Plug 'shaunsingh/nord.nvim'
" Plug 'altercation/vim-colors-solarized'
Plug 'gruvbox-community/gruvbox'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}

Plug 'phaazon/hop.nvim'

" File finding
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" File navigation
Plug 'preservim/nerdtree'
Plug 'ThePrimeagen/harpoon'

" Allows for seamless navigation between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" helper for surrounds
Plug 'tpope/vim-surround'

" Terraform highlighting
Plug 'hashivim/vim-terraform'

Plug 'tpope/vim-abolish'

" Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tree-sitter/tree-sitter-embedded-template'

Plug 'github/copilot.vim'

Plug 'AndrewRadev/splitjoin.vim'

call plug#end()

nnoremap <leader>e <cmd>NERDTreeToggle<cr>

" Moving line up/down & selected lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Zooming in and out on a split
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" Solarized color scheme
" syntax enable
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox

let g:gruvbox_baby_background_color='dark'
colorscheme gruvbox-baby

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
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
nnoremap gD :vsplit<CR>gd

" nnoremap <c-p> :bprev<CR>
" nnoremap <c-n> :bnext<CR>

" Harpoon keymaps
lua <<EOF
  local harpoon_mark = require("harpoon.mark")
  local harpoon_ui = require("harpoon.ui")

  vim.keymap.set("n", "<leader>a", harpoon_mark.add_file)
  vim.keymap.set("n", "<C-s>", harpoon_ui.toggle_quick_menu)

  vim.keymap.set("n", "<leader>1", function() harpoon_ui.nav_file(1) end)
  vim.keymap.set("n", "<leader>2", function() harpoon_ui.nav_file(2) end)
  vim.keymap.set("n", "<leader>3", function() harpoon_ui.nav_file(3) end)
  vim.keymap.set("n", "<leader>4", function() harpoon_ui.nav_file(4) end)
EOF

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "css", "dockerfile", "help", "html", "javascript", "json", "lua", "svelte", "typescript", "vim"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }


  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.tree_sitter_embedded_template = {
    install_info = {
      url = "~/.local/share/nvim/plugged/tree-sitter-embedded-template", -- local path or git repo
      files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
      -- optional entries:
      -- branch = "main", -- default branch in case of git repo if different from master
      -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
      -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "ejs", -- if filetype does not match the parser name
  }


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
        buf_map(bufnr, "n", "gd", ":LspDef<CR>")
        buf_map(bufnr, "n", "gr", ":LspRename<CR>")
        buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
      buf_map(bufnr, "n", "K", ":LspHover<CR>")
      --buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
      --buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
        buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
      -- buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
        buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
      --if client.resolved_capabilities.document_formatting then
      --    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      --end
  end

  local lspconfig = require 'lspconfig'

  --Enable (broadcasting) snippet capability for completion
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)

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


  -- lspconfig.vuels.setup{
  --   capabilities = capabilities,
  -- }
  lspconfig.volar.setup{
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
    capabilities = capabilities,
  }

  lspconfig.gopls.setup{
    capabilities = capabilities,
  }

  lspconfig.svelte.setup{
    capabilities = capabilities,
  }

  lspconfig.pyright.setup{
    capabilities = capabilities,
  }

  vim.diagnostic.config({
    virtual_text = false,
  })
  -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  --   vim.lsp.diagnostic.on_publish_diagnostics, {
  --     -- Disable virtual_text
  --     virtual_text = false,
  --   }
  -- )

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

  require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = '-',
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  }
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
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      --['<C-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({
        reason = cmp.ContextReason.Auto,
      }), {"i", "c"}),
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
    
    -- view = {
    --   entries = "native"
    -- },
    
    -- experimental = {
    --   ghost_text = true,
    -- }
  })

  require("luasnip.loaders.from_vscode").lazy_load()
EOF
