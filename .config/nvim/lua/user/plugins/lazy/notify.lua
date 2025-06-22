-- Replace vim.notify with a nice looking notification window based variant
return {
  'rcarriga/nvim-notify',
  init = function()
    vim.notify = require('notify')
  end,
  opts = {
    render = 'compact',
    stages = 'slide',
    -- Use the lower right corner for notifications instead of upper right
    top_down = false,
    timeout = 3000,
  },
}
