build:
let
  heirline = build "rebelot" "heirline.nvim" "2024-02-14" "03cff30d7e7d3ba6fdc00925f015822f79cef908" "gbBkqFakLFxT/CHQN79WFsXu28RlP/AtD2CzAc8BhK8=";
  components = build "Zeioth" "heirline-components.nvim" "2024-03-07" "d94b4132bce955aead1dcf2a2d4c9438d06f587b" "BTZVFK/PMtN4GMaYCcfEkZRj2Kp7Uepl7+VF9LVGILg=";
in {
  extraPlugins = [ heirline components ];

  extraConfigLua = ''
    local heirline = require 'heirline'
    local utils = require'heirline.utils'
    local lib = require 'heirline-components.all'

    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self)
        return self.icon and (self.icon .. ' ')
      end,
      hl = function(self)
        return { fg = self.icon_color }
      end
    }

    ${import ./statusline.nix}

    lib.init.subscribe_to_events()
    heirline.load_colors(lib.hl.get_colors())
    heirline.setup({
      statusline = StatusLine,
      -- winbar = {
        -- init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        -- fallthrough = false,
        -- lib.component.breadcrumbs_when_inactive(),
        -- lib.component.breadcrumbs()
      -- },
      tabline = TabLine,
      -- statuscolumn = {
        -- init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        -- lib.component.foldcolumn(),
        -- lib.component.fill(),
        -- lib.component.numbercolumn(),
        -- lib.component.signcolumn(),
      -- },
      opts = {
        -- disable_winbar_cb = function(args) -- make the breadcrumbs bar inactive when...
        --   local is_disabled = not buffers.is_valid(args.buf) or
        --   lib.condition.buffer_matches({
        --     buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
        --     filetype = { "mini", "dashboard", "Outline", "aerial" },
        --   }, args.buf)
        --   return is_disabled
        -- end,
      },
    })

  '';
}
