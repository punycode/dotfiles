--[[
  Support for some additional file types (mostly syntax)
--]]
return {
  { 'rodjek/vim-puppet' },
  {
    'grafana/vim-alloy',
    init = function()
      -- Disable the builtin auto formatting
      vim.g.alloy_fmt_on_save = 0
    end,
  },
}
