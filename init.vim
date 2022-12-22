" Load VimPlug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=';'
set cursorline

set ignorecase smartcase incsearch
set magic

set autoindent
set shell=$SHELL

set hidden

set autoread
set backspace=indent,eol,start
set mouse=nv

set wrap linebreak nolist
set showbreak=^\
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff

set smarttab
set expandtab " use spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set foldmethod=syntax
set foldlevelstart=99
set foldnestmax=10
set nofoldenable
set foldlevel=1

set title
set showmatch
set wildmenu

filetype on
filetype plugin indent on

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'ghifarit53/tokyonight-vim'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'

Plug 'chr4/nginx.vim'
Plug 'tpope/vim-surround'
" Plug 'nvim-lualine/lualine.nvim'
Plug 'feline-nvim/feline.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'leoluz/nvim-dap-go'

function! FoldRegion(expr)
    let lnr = search(a:expr, 'wn')
    if lnr != 0
        exec 'normal!'.lnr.'Gza``'
    endif
endfunction

autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
set nu
set clipboard+=unnamedplus

nnoremap <A-S-r> :so $MYVIMRC<CR>
nnoremap <silent> <A-p> o<Esc>p<Esc>

" Hack for wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" Save a keystroke
nnoremap <silent> <C-s> :w<CR>

nnoremap <silent> <C-j> 3<C-e>
nnoremap <silent> <C-k> 3<C-y> 
nnoremap <silent> <C-Down> <C-e>
nnoremap <silent> <C-Up> <C-y>

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <tab><tab> :Buffers<CR>

Plug 'jparise/vim-graphql'

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd FileType markdown set spell
autocmd FileType markdown nnoremap <silent> <Leader>pdf :w<CR>

Plug 'akinsho/nvim-bufferline.lua'
map <silent> <A-l> :BufferLineCycleNext<CR>
map <silent> <A-h> :BufferLineCyclePrev<CR>
nnoremap <silent> <leader><leader> :b#<CR>

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
let g:nvim_tree_group_empty=1

nnoremap <silent> <A-1> :NvimTreeFindFileToggle<CR>

Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'ray-x/lsp_signature.nvim'

let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'theHamsta/nvim-dap-virtual-text'
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F8> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F19> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

set completeopt=menu,menuone,noselect

Plug 'fatih/vim-go'
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

autocmd FileType go nnoremap <silent> <leader>fs :GoFillStruct<CR>
autocmd FileType go nnoremap <silent> <leader>im :GoImpl<CR>

Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
let g:cargo_shell_command_runner = '!'
let g:rust_fmt_autosave = 1

autocmd FileType rust nnoremap <silent> <leader>bb :Cargo build<CR>
autocmd FileType rust nnoremap <silent> <C-A-l> :RustFmt<CR>

Plug 'folke/trouble.nvim'
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

Plug 'akinsho/toggleterm.nvim'
autocmd TermOpen * startinsert

Plug 'windwp/nvim-autopairs'

Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCreateDefaultMappings = 0
vnoremap <silent> <C-_> :call nerdcommenter#Comment(0, 'toggle')<CR>
nnoremap <silent> <C-_> :call nerdcommenter#Comment(0, 'toggle')<CR>

vnoremap > >gv
vnoremap < <gv

nnoremap < 10<C-w><
nnoremap > 10<C-w>>

nnoremap <CR> :noh<CR><CR>

Plug 'Yggdroot/indentLine'
let g:indentLine_setConceal = 0

Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gg :Git<CR>
nnoremap <silent> <leader>gp :Git push<CR>

call plug#end()

set background=dark
set termguicolors

" let g:one_allow_italics = 1
" colorscheme one
" let g:tokyonight_style = 'storm'
" let g:tokyonight_enable_italic = 1
" colorscheme tokyonight

colorscheme nord

set nosplitright

lua <<EOF
require 'plugins'
EOF
