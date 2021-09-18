autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

set ignorecase
set smartcase
set incsearch
set nolazyredraw

set magic

set autoindent
set shell=$SHELL

set hidden
 
set autoread " Hot-reload files
set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard+=unnamedplus " Yank to clipboard
set mouse=nv

set number

set wrap linebreak nolist
set showbreak=^\
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set title
set showmatch
set wildmenu
set cmdheight=2
set updatetime=300
set shortmess+=c 
set signcolumn=yes 
set cursorline

filetype on
filetype plugin indent on
syntax on

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

function! FoldRegion(expr)
  let lnr = search(a:expr, 'wn')
  if lnr != 0
    exec 'normal!'.lnr.'Gza``'
  endif
endfunction

let mapleader = ';'

" Hack for wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" Save a keystroke
nnoremap <silent> <C-s> :w<CR>

" ;nu and ;rnu to toggle numbering
nnoremap <silent> <leader>nu :set nu!<CR>
nnoremap <silent> <leader>rnu :set rnu!<CR>

nnoremap <silent> <Leader><Leader> :set hls!<CR>

nnoremap <silent> <C-j> 3<C-e>
nnoremap <silent> <C-k> 3<C-y> 
nnoremap <silent> <C-Down> <C-e>
nnoremap <silent> <C-Up> <C-y>

lua require('plugins')

" TREE 
let g:nvim_tree_special_files = { 
    \ 'README.md': 1, 
    \ 'Makefile': 1, 
    \ 'MAKEFILE': 1,
    \ 'pom.xml': 1,
    \ 'go.mod': 2,
    \ 'go.sum': 2,
    \ 'Cargo.lock': 2,
    \ 'Cargo.toml': 2,
    \ '.gitlab-ci.yml': 1,
    \ 'debugopts.lua': 3,
    \}
nnoremap <silent> <A-1> :NvimTreeToggle<CR>
nnoremap <leader><F5> :NvimTreeRefresh<CR>
nnoremap <silent> <leader>nf :NvimTreeFindFile<CR>

  " ctrlp {{{

    nnoremap <silent> <leader>p :CtrlP getcwd()<CR>
    nnoremap <silent> <leader><tab> :CtrlPBuffer<CR>

    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn|vendor|node_modules|target)$',
      \ 'file': '\v\.(exe|so|dll|class|jar)$',
      \ }
  " }}}

  " Fugitive {{{

    nmap <silent> <leader>gs :Gstatus<cr>
    nmap <leader>ge :Gedit<cr>
    nmap <silent><leader>gr :Gread<cr>
    nmap <silent><leader>gb :Gblame<cr>
  " }}}

  " Language Specific {{{
    " i3config {{{
    aug i3config_ft_detection
      au!
      au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
    aug end
    " }}} 
    
    
    " Go {{{

      function AltCrAction()
        let syntaxToken = synIDattr(synID(line("."), col("."), 1), "name")
        if syntaxToken == "goTypeConstructor"
          :GoFillStruct
        elseif syntaxToken == "goTypeName"
          :GoImpl
        endif
      endfunction

      " Syntax
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

      autocmd FileType go nnoremap <silent> <A-cr> :call AltCrAction()<CR>
      autocmd FileType go nnoremap <silent> <A-R> :GoRename<CR>
      autocmd FileType go map <silent> <C-q> :GoDoc<CR>
      autocmd FileType go setlocal tabstop=4
      autocmd FileType go setlocal shiftwidth=4
      autocmd FileType go map <silent> <C-A-l> :GoFmt<CR>:GoImports<CR>
      autocmd Filetype go nmap <silent> <leader>tt :GoAddTags<CR>
      autocmd Filetype go nmap <silent> <leader>fs :GoFillStruct<CR>

    " rust {{{

      let g:cargo_shell_command_runner = '!'
      let g:rustfmt_autosave = 1

      autocmd FileType rust map <silent> <leader>cb :Cargo build<CR>
      autocmd FileType rust map <silent> <C-A-l> :RustFmt<CR>
    " }}}"
    
    " DAP{{{
      nnoremap <silent> <leader>` :lua require'dapui'.toggle()<CR>
      nnoremap <silent> <F9> :lua require'dap'.continue()<CR>
      nnoremap <silent> <F8> :lua require'dap'.step_over()<CR>
      nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
      nnoremap <silent> <F6> :lua require'dap'.step_out()<CR>
      nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
      nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
      nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
      nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
      nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
    "}}}"
    
    " vimrc {{{
      let g:NERDDefaultAlign = 'none'
    " }}}
    
    " Java {{{
      function FormatCurrentJavaFile()
        :w
        :!java -jar ~/tools/google-java-format.jar --replace '%:p'
        :edit!
      endfunction
      autocmd FileType java nmap <silent> <C-A-l> :call FormatCurrentJavaFile()<CR>
    " }}}"

    " MarkDown {{{
      autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
      autocmd FileType markdown set spell
      autocmd FileType markdown nnoremap <silent> <Leader>pdf :w<CR>    
    " }}}

    " XML {{{
      autocmd FileType xml vnoremap <silent> <C-A-l> :!xmllint --format -<CR>
    " }}}
  " }}}

  "Buffer Line {{{

    map <silent> <A-Right> :BufferLineCycleNext<CR>
    map <silent> <A-Left> :BufferLineCyclePrev<CR>
    nnoremap <silent> <Tab><Tab> :b#<CR>
  "}}}"


  " LSP {{{

    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    set completeopt=menuone,noinsert,noselect
    set shortmess+=c

    imap <silent> <c-space> <Plug>(completion_trigger)
  "}}}"

"call plug#end()


" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" These calls must be after plug#end() to ensure that theme loads

set background=dark
set termguicolors


nnoremap <silent> <leader><f12> :belowright split term://zsh<CR>

lua <<END





END
