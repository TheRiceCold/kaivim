return {
  'folke/noice.nvim',
  config = function()
    local noice = require 'noice'
    noice.setup(config)
  end,
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    { 'rcarriga/nvim-notify', opts = { timeout = 1000, fps = 60, } },
  },
}
