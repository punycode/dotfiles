--[[ Global options - can be additionally enhanced by `mini.basic` plugin ]]

--[[ Editing (width, tabs, spaces, indentation) ]]

vim.opt.textwidth = 120

-- Tabs/spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Enable break indent
vim.opt.breakindent = true

-- Smarter indentation of blocks
vim.opt.smartindent = true


--[[ Folding ]]

-- Use treesitter for folding by default
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Fold levels (start with deeply nested structures folded)
vim.opt.foldlevel = 6
-- Only fold by default if more than n lines would be foldet
vim.opt.foldminlines = 5

--[[ UI options ]]

-- Enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- How to open new splits (left to right, top to bottom)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- How to display tabs, nbsp and trailing whitespace
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- TODO: make dependent on nerd font?

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Enable colored column for maximum line length
vim.opt.colorcolumn = '+1'

-- Minimal number of lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Enable mouse mode (click to select window)
vim.opt.mouse = 'a'

-- Set default behaviour for insert mode completion menus
vim.opt.completeopt = { 'menu', 'menuone', 'popup' }

-- [[ Miscellaneous ]]

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time (also used for CurserHold events)
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time (displays which-key popup sooner)
vim.opt.timeoutlen = 300

-- Disable some of the builtin language bindings (we don't use them)
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
