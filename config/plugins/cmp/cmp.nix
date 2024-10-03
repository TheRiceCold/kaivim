{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        experimental.ghost_text = true;
        mapping.__raw = ''
          cmp.mapping.preset.insert({
            ['<C-j>'] = cmp.mapping.scroll_docs(-4),
            ['<C-k>'] = cmp.mapping.scroll_docs(4),
            ['<tab>'] = cmp.mapping.select_next_item(),
            ['<S-tab>'] = cmp.mapping.select_prev_item(),
            ['<cr>'] = cmp.mapping.confirm({ select = true }),
          })
        '';

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

        snippet.expand = ''
          function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        '';

        formatting = {
          expandable_indicator = true;
          fields = ["abbr" "kind" "menu"];
        };

        completion.completeopt = "menu,menuone,preview,noinsert";

        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
          {name = "buffer";}
          {name = "cmdline";}
        ];
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-cmdline.enable = true;
    cmp_luasnip.enable = true;
  };
}
