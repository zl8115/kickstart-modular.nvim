return {
  'zbirenbaum/copilot.lua',
  enabled = false, -- Enable for CopilotChat
  opts = {
    suggestion = {
      enabled = false,
      auto_trigger = true,
      hide_during_completion = false,
      keymap = {
        accept = false, -- handled by nvim-cmp / blink.cmp
        next = '<M-]>',
        prev = '<M-[>',
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
