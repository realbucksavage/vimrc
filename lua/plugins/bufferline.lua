require'bufferline'.setup {
    options = {
        numbers = "none",
        close_command = "bdelete %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = "bdelete %d",
        close_icon = "[x]",
        modified_icon = "[-]",
        diagnostics = "nvim_lsp",
        doagnostics_indicator = function(count, evel, diagnostics_dict, context)
            return "("..count..")"
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "Files",
                highlight = "Directory",
                text_align = "left"
            }
        },
    }
}
