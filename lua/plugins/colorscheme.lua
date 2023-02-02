require'nightfox'.setup {
    options = {
        module_default = true,
        styles = {
            comments = "italic",
            keywords = "bold",
        },
        modules = {
            cmp = true,
            dap_ui = true,
            diagnostic = true,
            gitgutter = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            treesitter = true,
            native_lsp = {
                enabled = true,
                background = false,
            },
        },
        groups = {
            all = {
                TelescopeBorder = { fg = "bg4" },
                TelescopeTitle = { fg = "fg2", bg = "bg4" },
                CmpItemKindFunction = { fg = "palette.pink" },
                CmpItemKindMethod = { fg = "palette.pink" },
                CmpWindowBorder = { fg = "bg0", bg = "bg0" },
            },
        },
    }
}

vim.cmd("colorscheme nightfox")
