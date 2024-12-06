-- [[ Global folding settings (filetypes may have local adaptions) ]]

-- Use treesitter for folding by default
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Fold levels (start with deeply nested structures folded)
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 8
vim.opt.foldlevelstart = 6
