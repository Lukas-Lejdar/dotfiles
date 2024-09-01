local dap = require('dap')

dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = '/root/vrg_demo/vrg/bin/python',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    console = 'integratedTerminal',
    args = {
      '${file}',
      '-v', '--log-cli-level=DEBUG'
    },

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = '/root/vrg_demo/vrg/bin/python'
  },
}

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').restart() end)
vim.keymap.set('n', '<F7>', function() require('dap').terminate() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)

local dapui = require("dapui").setup(
  {
    layouts = { {
        elements = { 
          {
            id = "watches",
            size = 1
          } 
        },
        position = "left",
        size = 40
      }, {
        elements = { {
            id = "console",
            size = 1 
          } },
        position = "bottom",
        size = 10
      } 
    },
})

vim.keymap.set('n', '<leader>da', function() require('dapui').open() end)
vim.keymap.set('n', '<leader>dc', function() require('dapui').close() end)

dap.listeners.before.attach.dapui_config = function() require("dapui").open() end
dap.listeners.before.launch.dapui_config = function() require("dapui").open() end
