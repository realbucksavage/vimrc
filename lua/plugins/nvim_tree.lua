require'nvim-tree'.setup {
    open_on_setup = true,
    open_on_setup_file = true,
    reload_on_bufenter = true,
    view = {
        side = "right",
        preserve_window_proportions = true,
    },
    git = {
        ignore = false,
    },
    renderer = {
        highlight_git = true,
        highlight_modified = "all",
        highlight_opened_files = "all",
        special_files = {
            "node_modules",
            "Makefile",
            "README.md",
            "go.mod",
            "go.sum",
            "build.gradle",
            "settings.gradle",
            "gradle.properties",
            "pom.xml",
        },
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
            resize_window = true,
            quit_on_open = false,
        }
    }
}
