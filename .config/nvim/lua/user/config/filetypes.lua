-- [[ Additional filetypes configuration ]]

-- Custom file type mappings by extension and/or patterns
vim.filetype.add({
  extension = {
    fcc = 'yaml', -- Fedora CoreOS Butane configuration files are simply YAML files
    hujson = 'jsonc', -- HuJSON is mostly the same as JSON with comments
  },
  filename = {
    ['.gitlab-ci.yml'] = 'yaml.gitlab', -- GitlabCI main entrypoint
  },
  pattern = {
    -- Detect ansible files correctly
    ['.*/defaults/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/host_vars/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/group_vars/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/group_vars/.*/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/playbook.*%.ya?ml'] = 'yaml.ansible',
    ['.*/playbooks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/roles/.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/roles/.*/handlers/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/tasks/.*%.ya?ml'] = 'yaml.ansible',
    ['.*/molecule/.*%.ya?ml'] = 'yaml.ansible',
    -- Detect gitlab templates in .gitlab/ folders
    ['.*/%.gitlab/.+%.ya?ml'] = 'yaml.gitlab',
    -- Detect Helm chart templates if their are in a Chart directory
    ['.*/templates/.*%.ya?ml'] = function(path, bufnr, ext)
      local chartdir = vim.fs.root(path, 'Chart.yaml')
      if chartdir and path:sub(1, #chartdir) then
        return 'helm'
      else
        return 'yaml'
      end
    end,
  },
})
