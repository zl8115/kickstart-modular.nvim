return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    -- NOTE: Check out this for guide
    -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    local dap = require 'dap'
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })

    local dapui = require 'dapui'
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end

    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end

    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end

    -- NOTE: Make sure to install the needed files/exectubles through mason
    require 'custom.plugins.dap.settings.cpptools'
    -- require 'plugins.dap.settings.netcoredbg'
    -- require 'plugins.dap.settings.godot'
    -- require 'plugins.dap.settings.bash-debug-adapter'
    -- require 'plugins.dap.settings.php-debug-adapter'
    -- require 'plugins.dap.settings.dart-debug-adapter'
    -- require 'plugins.dap.settings.chrome-debug-adapter'
    -- require 'plugins.dap.settings.firefox-debug-adapter'
    -- require 'plugins.dap.settings.java-debug'
    -- require 'plugins.dap.settings.node-debug2'
    -- require 'plugins.dap.settings.debugpy'
    -- require "plugins.dap.settings.go-debug-adapter"
    -- require 'plugins.dap.settings.js-debug'
  end,
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },
}
