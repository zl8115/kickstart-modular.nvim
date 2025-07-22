-- cattpuccin
-- https://github.com/catppuccin/catppuccin

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}
--vim: ts=2 sts=2 sw=2 et
