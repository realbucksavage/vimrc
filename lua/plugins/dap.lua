require'nvim-dap-virtual-text'.setup {}

local dap, dapui = require'dap', require'dapui'
dapui.setup {}

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end

dap.listeners.after.event_exited['dapui_config'] = function()
    dapui.close()
end

vim.api.nvim_set_keymap('v', '<leader>ev', 'require("dapui").eval()<CR>', { noremap = true, silent = true })
