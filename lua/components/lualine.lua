require'lualine'.setup {
  options = { theme = 'tokyonight', disabled_filetypes = {'NvimTree'} },
  tabline = {
    lualine_z = {'filename'},
  }
}
