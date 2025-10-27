return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',

    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },

    config = function()
      require('user.plugins.cmp')
    end,

    -- This has to be run before entering insert mode, since these capabilities
    -- need to be registered with LSPs, which are initialized long before
    -- entering Insert mode.
    init = function()
      -- Add the completion capabilities to the default config for every LSP
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      vim.lsp.config('*', {
        capabilities = cmp_nvim_lsp.default_capabilities(),
      })
    end,
  },
}
