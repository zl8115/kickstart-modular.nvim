local dap = require 'dap'

-- dap.adapters.cppdbg = {
--   id = 'cppdbg',
--   type = 'executable',
--   -- command = 'OpenDebugAD7',
--   command = 'D:\\dev\\tools\\cpptools-windows-x64-\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
--   options = {
--     detached = false,
--   },
-- }
--
-- dap.configurations.cpp = {
--   {
--     name = 'Launch file',
--     type = 'cppdbg',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopAtEntry = true,
--     -- args = {},
--     -- runInTerminal = true,
--   },
-- }

dap.adapters.codelldb = {
  id = 'codelldb',
  type = 'executable',
  -- command = 'OpenDebugAD7',
  command = 'D:\\dev\\tools\\codelldb-win32-x64\\extension\\adapter\\codelldb.exe',
  options = {
    detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    -- args = {},
    -- runInTerminal = true,
  },
}

dap.configurations.c = dap.configurations.cpp
