-- one liner setups
require'nvim-autopairs'.setup {}

require'toggleterm'.setup {
    open_mapping = [[<F60>]],
    hide_numbers = true,
    insert_mappings = true,
}

require'trouble'.setup {
    position = "bottom",
    height = 15,
    icons = true,
    group = true,
    indent_lines = true,
    use_diagnostic_signs = true,
}
-- end one liner setups

require'plugins.nvim_tree'
require'plugins.lualine'
require'plugins.bufferline'
require'plugins.cmp'
require'plugins.lsp'
