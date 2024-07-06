{
  experimental.ghost_text = true;
  mapping = {
    __raw = /* lua */ ''
      cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.abort(),

        ['<C-b>'] = cmp.mapping.scroll_docs(-4),

        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        ['<C-Space>'] = cmp.mapping.complete(),

        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ['<S-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        })
    '';
  };
  snippet = {
    expand = /* lua */ "function(args) require('luasnip').lsp_expand(args.body) end";
  };
  sources = {
    __raw = /* lua */ ''
      cmp.config.sources({
          {name = 'nvim_lsp'},
          {name = 'copilot'},
          {name = 'path'},
          {name = 'luasnip'},
          {name = 'cmdline'},
          }, { {name = 'buffer'} })
    '';
  };
  performance = {
    debounce = 60;
    fetching_timeout = 200;
    max_view_entries = 30;
  };
  window = {
    completion = {
      border = "rounded";
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
    };
    documentation = {
      border = "rounded";
    };
  };
  formatting = {
    fields = ["kind" "abbr" "menu"];
    expandable_indicator = true;
  };
}
