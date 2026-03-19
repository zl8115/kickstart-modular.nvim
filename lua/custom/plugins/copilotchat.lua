return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = false,
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
    },
    config = function()
      local chat = require 'CopilotChat'
      local map = vim.keymap.set

      map('n', '<leader>cc', '<cmd>CopilotChatToggle<CR>', { desc = 'Open Copilot Chat' })
      map('v', '<leader>cc', ':CopilotChat<CR>', { desc = 'Open Copilot Chat' })
    end,
  },
}
