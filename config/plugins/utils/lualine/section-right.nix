colors: get-mode-color: [
  {
    path = 1;
    shorting_target = 40;
    color.fg = colors.grey;
    __unkeyed-1 = "filename";
  }

  {
    __unkeyed-1 = "diff";
    symbols = { added = " "; modified = "󰝤 "; removed = " "; };
    diff_color = {
      added.fg = colors.green;
      removed.fg = colors.red;
      modified.fg = colors.orange;
    };
  }

  {
    sources = [ "nvim_lsp" ];
    __unkeyed-1 = "diagnostics";
    diagnostics_color = {
      color_info.fg = colors.cyan;
      color_error.fg = colors.red;
      color_warn.fg = colors.yellow;
    };
    symbols = { error = " "; warn = " "; info = " "; };
  }
  {
    __unkeyed-1.__raw = ''
      function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end
    '';
    icon = "LSP:";
    color = { fg = colors.pink; gui = "bold"; };
  }

  { color.fg = colors.violet; __unkeyed-1 = "progress"; }

  {
    padding.left = 1;
    color.__raw = get-mode-color;
    __unkeyed-1.__raw = ''function() return '█' end'';
  }
]
