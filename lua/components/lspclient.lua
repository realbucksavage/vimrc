local status, lspconfig = pcall(require, 'lspconfig')
if not status then
  print 'lspconfig not loaded!'
  return
end

on_lsp_attach = function(client, bufnr)

  local chain_complete_list = {
    default = {
      {complete_items = {'lsp', 'snippet'}},
      {complete_items = {'path'}, triggered_only = {'/'}},
      {complete_items = {'buffers'}},
    },
    string = {
      {complete_items = {'path'}, triggered_only = {'/'}},
      {complete_items = {'buffers'}},
    },
    comment = {
      {complete_items = {'path'}, triggered_only = {'/'}},
      {complete_items = {'buffers'}},
    },
  }

  print('LSP Client Attached')
  require'completion'.on_attach({
    chain_complete_list = chain_complete_list,
  })

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<C-b>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-LeftMouse>', '<LeftMouse><Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-A-b>', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<A-S-r>', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<A-S-7>', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>a', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

local language_servers = { 'gopls', 'rust_analyzer', 'tsserver', 'metals' }
for _, lsp in ipairs(language_servers) do
  lspconfig[lsp].setup {
    on_attach = on_lsp_attach,
  }
end

local homedir = os.getenv'HOME'
lspconfig.jdtls.setup {
  cmd = {homedir .. '/.config/nvim/scripts/jdtls', homedir .. '/.vim-java-workspaces/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')},
  on_attach = on_lsp_attach,
}

