-- Setup automatic treesitter configuration
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'main',
  lazy = false,

  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
  },

  config = function()
    require('nvim-treesitter').install({
      'bash',
      'c',
      'comment',
      'cpp',
      'dockerfile',
      'editorconfig',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
      'json',
      'json5',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'regex',
      'toml',
      'vim',
      'yaml',
    })
  end,
}
