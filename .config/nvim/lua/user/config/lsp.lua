--[[
  Global settings used when LSPs are attached to buffers.
  These are independent of any plugins and should therefore work with any way
  of LSP setup, native or plugin based.
--]]

if vim.g.have_nerd_font then
  -- Use icons for diagnostic signs
  vim.diagnostic.config({
    virtual_text = true,
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

local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- For nvim < 0.11 we add the 0.11+ default LSP keymaps for forward compatibility
if vim.fn.has('nvim-0.11') == 0 then
  map('grn', vim.lsp.buf.rename, 'LSP: Rename symbol')
  map('gra', vim.lsp.buf.code_action, 'LSP: Code action', { 'n', 'x' })
  map('grr', vim.lsp.buf.references, 'LSP: Go to references')
  map('gri', vim.lsp.buf.implementation, 'LSP: Go to implementation')
  map('gO', vim.lsp.buf.document_symbol, 'LSP: Document symbol')
  map('<C-S>', vim.lsp.buf.signature_help, 'LSP: Signature help', { 'i', 's' })
end
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
    if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
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
