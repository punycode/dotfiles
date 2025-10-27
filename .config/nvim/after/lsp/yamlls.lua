-- Addons for the LSP base config provided by nvim-lspconfig
return {
  filetypes = {
    'yaml',
    'yaml.docker-compose',
    'yaml.gitlab',
    'yaml.helm-values',
    -- This was missing from the defaults and is needed for correct interaction with ansible
    'yaml.ansible',
  },
}
