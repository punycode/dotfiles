-- [[ Additional filetypes configuration ]]

-- Custom file type mappings by extension and/or patterns
vim.filetype.add({
  extension = {
    fcc = 'yaml', -- Fedora CoreOS Butane configuration files are simply YAML files
  },
  filename = {
    ['.gitlab-ci.yml'] = 'yaml.gitlab', -- GitlabCI main entrypoint
  },
  pattern = {
    ['.*/%.gitlab/.+%.ya?ml'] = 'yaml.gitlab',
  },
})
