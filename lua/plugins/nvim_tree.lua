require'nvim-tree'.setup {
    reload_on_bufenter = true,
    view = {
        side = "right",
        preserve_window_proportions = true,
    },
    git = {
        ignore = false,
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "| ",
                none = "  ",
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    actions = {
        change_dir = {
            restrict_above_cwd = true,
        },
        open_file = {
            resize_window = false,
            quit_on_open = false,
        }
    }
}
