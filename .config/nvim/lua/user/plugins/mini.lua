--[[
  Setup mini.nvim micro-plugins for various purposes:
  * Some defaults for vim options
  * Additional text-objects and motions
  * A better statusline
--]]

-- Sane defaults for VIM options, which have not been set in our own config
require('mini.basics').setup()
-- Not Artificial Intelligence, but additional text-objects for around/inner
require('mini.ai').setup()

-- We setup mini icons as an alternative to nvim-web-devicons
require('mini.icons').setup({
  style = (vim.g.have_nerd_font and 'glyph') or 'ascii',
})
MiniIcons.mock_nvim_web_devicons()

-- We use the mini.statusline for our needs
require('mini.statusline').setup({
  use_icons = vim.g.have_nerd_font,
})
