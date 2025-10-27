-- Addons for the LSP base config provided by nvim-lspconfig
return {
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
}
