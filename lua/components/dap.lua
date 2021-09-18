local dap = require'dap'
dap.adapters.go = {
  type = "server",
  host = "127.0.0.1",
  port = 38697,
}

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode",
  name = "lldb",
}

if vim.fn.filereadable('./debugopts.lua') ~= 0 then
  print('loading debugopts')
  require'debugopts'.setup(dap.configurations)
end
