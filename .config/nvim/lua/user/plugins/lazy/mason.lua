-- Setup Mason to install tools (formatters, LSP, etc.)
return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      -- Automatic installation of certain non-LSP tools
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      -- Setup Mason with defaults
      require('mason').setup({})

      -- Install some often used packages for Mason using the
      -- tool installer. LSPs are installed/configured indepently
      -- with nvim-lspconfig/mason-lspconfig
      require('mason-tool-installer').setup({
        ensure_installed = {
          { 'markdownlint' },
          { 'prettier' },
          { 'stylua' },
          { 'yamllint' },
        },
      })
    end,
  },
}
