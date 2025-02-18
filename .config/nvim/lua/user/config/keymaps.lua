-- [[ Global keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)

-- Folding in normal mode with tab/shift-tab
vim.keymap.set('n', '<Tab>', 'za', { desc = 'Toggle fold (one level)' })
vim.keymap.set('n', '<S-Tab>', 'zA', { desc = 'Toggle fold (all levels)' })

