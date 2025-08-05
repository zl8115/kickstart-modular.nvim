-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'LazyLoad',
--   callback = function(args)
--     if args.data == 'obsidian.nvim' then
--       vim.cmd.colorscheme 'habamax'
--     end
--   end,
-- })
--

if vim.g.obsidian_vault ~= nil then
  vim.api.nvim_create_autocmd({ 'VimEnter', 'DirChanged' }, {
    callback = function()
      local cwd = vim.fn.getcwd()
      if cwd == vim.g.obsidian_vault then
        vim.cmd.colorscheme 'habamax'
      end
    end,
  })
end
