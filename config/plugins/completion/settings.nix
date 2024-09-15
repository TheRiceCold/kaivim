{
  experimental.ghost_text = true;
  mapping = {
    __raw = /* lua */ ''
      cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        })
    '';
  };
  snippet = {
    expand = /* lua */ "function(args) require('luasnip').lsp_expand(args.body) end";
  };

  sources = {
    __raw = /* lua */ ''
      cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'lazydev' },
      })
    '';
  };

  performance = {
    debounce = 60;
    fetching_timeout = 200;
    max_view_entries = 30;
  };

  window = {
    completion = {
      scrollbar = false;
      border = "rounded";
    };
    documentation = {
      scrollbar = false;
      border = "rounded";
    };
  };

  completion = {
    completeopt = "menu,menuone,preview,noinsert";
  };

  formatting = {
    fields = ["kind" "abbr" "menu"];
    expandable_indicator = true;
  };
}
