local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_width = 30
g.nvim_tree_ignore = {"node_modules", ".idea"}
g.nvim_tree_auto_open = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 3
g.nvim_tree_auto_resize = 0
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}

g.nvim_tree_icon_padding = " "
g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = ""
    }
}
