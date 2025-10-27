-- nvim-lint (https://github.com/mfussenegger/nvim-lint/) is An asynchronous
-- linter plugin for Neovim complementary to the built-in
-- Language Server Protocol support.
return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      markdown = { 'markdownlint' },
      yaml = { 'yamllint' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      group = vim.api.nvim_create_augroup('lint.setup', { clear = true }),
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
