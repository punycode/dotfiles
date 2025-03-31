-- Setup Mason to install tools (formatters, LSP, etc.)
return {
  { 'williamboman/mason.nvim', opts = {} },
  { 'WhoIsSethDaniel/mason-tool-installer.nvim', lazy = true },
}
