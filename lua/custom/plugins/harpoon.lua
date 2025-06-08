return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- basic keymaps
    vim.keymap.set('n', '<leader>ii', function()
      harpoon:list():add()
    end, { desc = 'Harpoon Add' })
    vim.keymap.set('n', '<leader>id', function()
      harpoon:list():remove()
    end, { desc = 'Harpoon Delete' })
    vim.keymap.set('n', '<leader>iq', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon [Q]uick Menu' })

    vim.keymap.set('n', '<leader>i1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon [1]' })
    vim.keymap.set('n', '<leader>i2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon [2]' })
    vim.keymap.set('n', '<leader>i3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon [3]' })
    vim.keymap.set('n', '<leader>i4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon [4]' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>ik', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon Previous' })
    vim.keymap.set('n', '<leader>ij', function()
      harpoon:list():next()
    end, { desc = 'Harpoon Next' })

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- telescope keymap
    vim.keymap.set('n', '<leader>il', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Harpoon [L]ist' })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
