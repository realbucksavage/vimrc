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

require'gitsigns'.setup()
-- end one liner setups

require'plugins.treesitter'
require'plugins.telescope'
require'plugins.colorscheme'
require'plugins.nvim_tree'
require'plugins.feline'
require'plugins.bufferline'
require'plugins.cmp'
require'plugins.lsp'
require'plugins.dap'
require'plugins.diffview'
