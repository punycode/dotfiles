-- [[ Global keymaps ]]

local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Clear highlights on search when pressing <Esc> in normal mode
map('<Esc>', vim.cmd.nohlsearch, 'Remove search highlights')

-- Folding in normal mode with tab/shift-tab
map('<Tab>', 'za', 'Toggle fold (one level)')
map('<S-Tab>', 'zA', 'Toggle fold (all levels)')
