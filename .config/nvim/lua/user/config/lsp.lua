--[[
  Global settings used when LSPs are attached to buffers.
  These are independent of any plugins and should therefore work with any way
  of LSP setup, native or plugin based.
--]]

-- Settings for the builtin diagnostic support.
vim.diagnostic.config({
  -- Use virtual lines beneath buffer lines to display diagnostic information.
  virtual_lines = true,
})

if vim.g.have_nerd_font then
  -- Use icons for diagnostic signs
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN] = '',
        [vim.diagnostic.severity.INFO] = '',
        [vim.diagnostic.severity.HINT] = '',
      },
    },
  })
end

-- Disable LSP logging (enable if actually debugging)
vim.lsp.set_log_level(vim.log.levels.OFF)

-- Setup autocommands on LspAttach/LspDetach
local lsp_autogroup = vim.api.nvim_create_augroup('user.lsp', { clear = true })
local highlight_autogroup = vim.api.nvim_create_augroup('user.lsp.highlight', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP setup on attach',
  group = lsp_autogroup,
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil then
      return
    end

    -- Add automatic reference highlighting if supported by the LSP server
    if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_autogroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_autogroup,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.api.nvim_create_autocmd('LspDetach', {
  desc = 'LSP unconfigure on detach',
  group = lsp_autogroup,
  callback = function(event)
    -- Clear any highlights and attached highlight autocommands
    vim.lsp.buf.clear_references()
    vim.api.nvim_clear_autocmds({ group = highlight_autogroup, buffer = event.buf })
  end,
})
