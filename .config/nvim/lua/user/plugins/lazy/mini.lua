return {
  { 'echasnovski/mini.nvim',
    priority = 500,
    config = function()
      require('mini.basics').setup()
      require('mini.ai').setup()

      require('mini.icons').setup({
        style = (vim.g.have_nerd_font and 'glyph') or 'ascii',
      })
      -- We setup mini icons as an alternative to nvim-web-devicons
      MiniIcons.mock_nvim_web_devicons()

      -- We use the mini.statusline for our needs
      local statusline = require('mini.statusline')
      statusline.setup({
        use_icons = vim.g.have_nerd_font,
      })
      -- Adapt the location part of the statusline to look nicer
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}
