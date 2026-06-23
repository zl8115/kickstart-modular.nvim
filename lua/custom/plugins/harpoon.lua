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

    -- snacks picker configuration
    local function toggle_snacks(harpoon_files)
      local items = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(items, { text = item.value, file = item.value })
      end
      Snacks.picker.pick {
        title = 'Harpoon',
        items = items,
        format = 'file',
        preview = 'file',
        confirm = function(picker, item)
          picker:close()
          if item then
            vim.cmd('edit ' .. vim.fn.fnameescape(item.file))
          end
        end,
      }
    end

    -- snacks keymap
    vim.keymap.set('n', '<leader>il', function()
      toggle_snacks(harpoon:list())
    end, { desc = 'Harpoon [L]ist' })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
