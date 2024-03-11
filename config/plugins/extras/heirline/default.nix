build:
let
  heirline = build "rebelot" "heirline.nvim" "2024-02-14" "03cff30d7e7d3ba6fdc00925f015822f79cef908" "gbBkqFakLFxT/CHQN79WFsXu28RlP/AtD2CzAc8BhK8=";
  components = build "Zeioth" "heirline-components.nvim" "2024-03-07" "d94b4132bce955aead1dcf2a2d4c9438d06f587b" "BTZVFK/PMtN4GMaYCcfEkZRj2Kp7Uepl7+VF9LVGILg=";
  lsp-status = build "nvim-lua" "lsp-status.nvim" "2022-08-03" "54f48eb5017632d81d0fd40112065f1d062d0629" "gmLeVnDyL8Zf5ZG92tP3mb/LAt438BxFtAi/Xax2zLI=";
in {
  extraPlugins = [ heirline components lsp-status ];

  extraConfigLua = ''
    local heirline = require 'heirline'
    local utils = require'heirline.utils'
    local conditions = require'heirline.conditions'

    local Space = { provider = ' ' }
    ${import ./colors.nix}
    ${import ./statusline}

    heirline.setup({
      statusline = StatusLine,
      -- tabline = TabLine,
      -- statuscolumn = {
        -- init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        -- lib.component.foldcolumn(),
        -- lib.component.fill(),
        -- lib.component.numbercolumn(),
        -- lib.component.signcolumn(),
      -- },
      opts = {
        colors = colors,
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
