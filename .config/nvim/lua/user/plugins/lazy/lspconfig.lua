-- LSP configuration plugins (mostly mason-lspconfig, nvim-lspconfig and related extensions for other plugins)
return {
  -- The magic happens in mason-lspconfig, which uses nvim-lspconfig and mason
  -- to actually install and configure LSPs.
  'williamboman/mason-lspconfig.nvim',
  version = '2.x',

  -- Only enable on NeoVim 0.11+, since this is now mandatory for this setup
  enabled = function()
    return (vim.fn.has('nvim-0.11') == 1)
  end,

  dependencies = {
    -- Declare here, but setup is done in mason.lua
    'williamboman/mason.nvim',
    -- The configs are sourced here
    { 'neovim/nvim-lspconfig', version = '2.x' },
  },

  opts = {
    -- Always install these LSPs by default
    ensure_installed = {
      'gopls',
      'gitlab_ci_ls',
      'lua_ls',
      'terraformls',
      'yamlls',
    },
  },
}
