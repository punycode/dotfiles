--[[
  Setup the auto-completion engine for LSPs and snippets.
--]]
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  -- Setup the sources to use
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
  }),
  snippet = {
    -- Snippet expansion function
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- Preselect on completion
  preselect = 'item',
  -- Don't trigger autocompletion (we use the manual triggers)
  completion = {
    autocomplete = false,
  },
  -- Nicer selection windows
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- Make autocomplete dialog trigger/select similar to other IDEs
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),

    -- This works in conjunction with the preselect option easily confirm
    -- the first item from the selection with having to navigate the suggestions
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})
