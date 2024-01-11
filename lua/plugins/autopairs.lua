return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local autopairs = require 'nvim-autopairs'

    autopairs.setup {
      check_ts = true,
      ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' }
      },
      disable_filetypes = { 'TelescopePrompt', 'vim' },
      fast_wrap = {},
    }

    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'

    cmp.event:on('config_done', cmp_autopairs.on_confirm_done())
  end
}