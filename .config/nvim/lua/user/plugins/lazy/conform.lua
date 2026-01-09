-- https://github.com/stevearc/conform.nvim is a formatting engine
-- which also integrates with LSP servers. For non-LSP formatters
-- can be installed via Mason

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },

  opts = {
    formatters = {
      -- Add formatting for grafana alloy configuration files
      alloy_fmt = {
        meta = {
          url = 'https://grafana.com/docs/alloy/latest/reference/cli/fmt/',
          description = 'The alloy fmt command rewrites `alloy` configuration files to a canonical format and style.',
        },
        command = 'alloy',
        args = { 'fmt', '-' },
      },
    },

    formatters_by_ft = {
      alloy = { 'alloy_fmt' },
      lua = { 'stylua' },
    },

    -- Allow format on save to be disabled on the fly
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
  },
}
