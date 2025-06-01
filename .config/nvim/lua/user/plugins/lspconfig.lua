--[[
  Setup LSPs using Mason und nvim-lspconfig
--]]
local lspconfig = require('lspconfig')
local defaults = lspconfig.util.default_config

-- Update LSP client capabilities, if cmp_nvim_lsp is installed
local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if has_cmp then
  defaults.capabilities = vim.tbl_deep_extend('force', defaults.capabilities, cmp_nvim_lsp.default_capabilities())
end

-- Some default LSP servers to install using Mason
local ensure_installed = {
  'gopls',
  'gitlab_ci_ls',
  'lua_ls',
  'terraformls',
  'yamlls',
}

-- Setup LSP servers using mason-lspconfig handlers
require('mason-lspconfig').setup({
  ensure_installed = ensure_installed,
  handlers = {
    -- Default handler for almost all LSPs
    function(server_name)
      lspconfig[server_name].setup({})
    end,

    yamlls = function()
      lspconfig.yamlls.setup({
        filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.ansible' },
      })
    end,

    -- Custom handler for some LSPs
    lua_ls = function()
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      })
    end,
  },
})
