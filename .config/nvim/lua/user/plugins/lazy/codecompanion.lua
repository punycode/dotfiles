return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = {
    'CodeCompanion',
    'CodeCompanionActions',
    'CodeCompanionChat',
    'CodeCompanionCmd',
  },
  opts = {
    adapters = {
      qwen3 = function()
        return require('codecompanion.adapters').extend('ollama', {
          name = 'qwen3',
          schema = {
            model = {
              default = 'qwen3:8b',
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = 'qwen3',
      },
      inline = {
        adapter = 'qwen3',
      },
    },
  },
}
