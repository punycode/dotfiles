-- Colorschemes to load.
return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme('tokyonight')
      -- You can configure highlights by doing something like:
      vim.cmd.hi('Comment gui=none')
    end,
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
}

-- vim: ts=2 sts=2 sw=2 et
