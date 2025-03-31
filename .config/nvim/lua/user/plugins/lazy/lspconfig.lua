-- LSP configuration plugins (mostly nvim-lspconfig and related extensions for other plugins)
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Declare here, but setup is done in mason.lua
      'williamboman/mason.nvim',
      -- Allows using LSP config names when installing tools via mason.
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('user.plugins.lspconfig')
    end,
  },
}
