--@module 'lazy'
--@type LazySpec
return {
  'dlyongemallo/diffview-plus.nvim',
  cmd = {
    'DiffviewOpen',
    'DiffviewClose',
    'DiffviewToggleFiles',
    'DiffviewFocusFiles',
    'DiffviewFileHistory',
    'DiffviewRefresh',
  },
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
    view = {
      merge_tool = {
        layout = 'diff3_horizontal',
      },
    },
  },
  keys = function()
    local function merge_base(target)
      local result = vim.system({ 'git', 'merge-base', target, 'HEAD' }, { text = tru}):wait()
      if result.code ~= 0 then
        vim.notify('Could not find merge-base with ' .. target .. ':\n' .. (result.stderr or ''), vim.log.levels.ERROR)
        return nil
      end
      return vim.trim(result.stdout)
    end

    local function review_against(target)
      local base = merge_base(target)
      if base then vim.cmd('DiffviewOpen ' .. base) end
    end

    local function review_against_prompt()
      vim.ui.input({ prompt = 'Review changes against branch: ', default = 'origin/main' }, function(target)
        if target and target ~= '' then review_against(target) end
      end)
    end

    return {
      { '<leader>gv', review_against_prompt, desc = '[G]it Review [v]s branch (prompt)' },
      { '<leader>gV', function() review_against 'origin/main' end, desc = '[G]it Review [V]s origin/main' },
      { '<leader>gc', '<cmd>DiffviewClose<CR>', desc = '[G]it Review [C]lose' },
      { '<leader>gt', '<cmd>DiffviewToggleFiles<CR>', desc = '[G]it Review [T]oggle File Panel' },
      { '<leader>gH', '<cmd>DiffviewFileHistory %<CR>', desc = '[G]it File [H]istory (current file)' },
    }
  end
}
