require'trouble'.setup {
    position = 'right',
}

vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<cr>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>xr', '<cmd>TroubleToggle lsp_references<cr>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>xd', '<cmd>TroubleToggle lsp_definitions<cr>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>xf', '<cmd>TroubleToggle quickfix<cr>', {silent = true, noremap = true})
