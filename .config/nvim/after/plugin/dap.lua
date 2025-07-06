local dap = require('dap')
local dapui = require('dapui')

dapui.setup({
  layouts = {
    {
      elements = {
          { id = "repl", size = 0.5 },
          { id = "console", size = 0.5 }
      },
      position = "bottom",
      size =15
    },
    {
      elements = {
        { id = "watches", size=1 },
      },
      position = "left",
      size = 60
    },
    {
      elements = { "repl" },
      position = "bottom",
      size = 15
    },
  },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t"
  },
})

vim.keymap.set('n', '<leader>k', function() require('dapui').eval() end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').restart() end)
vim.keymap.set('n', '<F7>', function() require('dap').terminate() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<leader>pb', function () require('fzf-lua').dap_breakpoints({ }) end)

local function openui (reset)
    local width = vim.o.columns
    if (width > 180) then
        require('dapui').open({ layout = 1, reset=reset or 0 })
        require('dapui').open({ layout = 2, reset=reset or 0 })
    else
        require('dapui').open({ layout = 3, reset=reset or 0 })
    end
end

vim.keymap.set({'n', 'v'}, '<Leader>da', function() openui() end)
vim.keymap.set({'n', 'v'}, '<Leader>do', function() openui({ reset=1 })  end)
vim.keymap.set({'n', 'v'}, '<Leader>dc', function() require('dapui').close({ }) end)

dap.listeners.before.attach.dapui_config = openui
dap.listeners.before.launch.dapui_config = function() end
dap.listeners.before.event_terminated.dapui_config = function() end
dap.listeners.before.event_exited.dapui_config = function() end

-- Python

dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME') .. '/.virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    cwd = vim.fn.getcwd();

    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.pyenv/bin/python3') == 1 then
        return cwd .. '/.pyenv/bin/python3'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- C/C++

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = '/home/lukas/.local/codelldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},
  }
}

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.cpp = {
  {
    name = "Launch lldb",
    type = "codelldb",
    request = "launch",
    program = function()
      local handle = io.popen("find ./build -type f -executable -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-")
      local result = handle:read("*a")
      handle:close()
      local path = vim.fn.trim(result)
      vim.notify("Launching executable: " .. path, vim.log.levels.INFO)
      return path
    end,
    cwd = vim.fn.getcwd(),
    stopOnEntry = false,
  },
  {
    name = "Launch gdb",
    type = "gdb",
    request = "launch",
    program = function()
      local handle = io.popen("find ./build -type f -executable -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-")
      local result = handle:read("*a")
      handle:close()
      local path = vim.fn.trim(result)
      vim.notify("Launching executable: " .. path, vim.log.levels.INFO)
      return path
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp
