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
    ['.*/%.gitlab/.+%.ya?ml'] = 'yaml.gitlab',
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
