-- NOTE: Leader keys should be defined as early as possible, so loaded plugins
-- register their keymaps with the correct leader keys. All other keymaps are
-- defined later on in other parts of the configuration.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('user.config.options')
require('user.config.keymaps')
require('user.plugins')

-- vim: ts=2 sts=2 sw=2 et
