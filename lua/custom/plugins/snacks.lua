return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    { '<leader>sf', function() Snacks.picker.files() end, desc = 'Smart [S]earch [F]iles' },
    { '<leader>ssf', function() Snacks.picker.smart() end, desc = 'Smart [S]earch [F]iles' },
    { '<leader><leader>', function() Snacks.picker.buffers() end, desc = '[ ] Find existing buffers' },
    { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
    { '<leader>sch', function() Snacks.picker.command_history() end, desc = '[S]earch [C]ommand [H]istory' },
    { '<leader>snf', function() Snacks.picker.notifications() end, desc = '[S]earch [N]otification [H]istory' },
  },
}
