-- Addons for the LSP base config provided by nvim-lspconfig

local schemastore_settings = {}
local has_schemastore, schemastore = pcall(require, 'schemastore')

if has_schemastore then
  schemastore_settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = '',
      },
      schemas = schemastore.yaml.schemas(),
    },
  }
end

return {
  settings = vim.tbl_deep_extend('force', {
    yaml = {
      -- Disable autoformatting with LSP, since it cannot adapt to yamllint preferences
      -- (e.g. it most certainly formats things in ways not wanted by the repository)
      format = { enable = false },
    },
  }, schemastore_settings),

  filetypes = {
    'yaml',
    'yaml.docker-compose',
    'yaml.gitlab',
    'yaml.helm-values',
    -- This was missing from the defaults and is needed for correct interaction with ansible
    'yaml.ansible',
  },
}
