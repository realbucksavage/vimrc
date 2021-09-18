require'bufferline'.setup{
  options = {
    numbers = function(opts)
      return string.format('%s', opts.raise(opts.id))
    end,
    close_command = "bdelete %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = "bdelete %d",
    close_icon = '[x]',
    modified_icon = '[-]',
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, evel, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = {
      {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
      }
    }
  }
}
