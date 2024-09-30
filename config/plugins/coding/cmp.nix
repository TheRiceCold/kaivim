{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        experimental.ghost_text = true;
        mapping.__raw = /* lua */ ''
          cmp.mapping.preset.insert({
            ['<C-j>'] = cmp.mapping.scroll_docs(-4),
            ['<C-k>'] = cmp.mapping.scroll_docs(4),
            ['<C-l>'] = cmp.mapping.select_next_item(),
            ['<C-h>'] = cmp.mapping.select_prev_item(),
            ['<cr>'] = cmp.mapping.confirm({ select = true }),
          })
        '';
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "cmdline"; }
        ];

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
          format.__raw = ''
            require'lspkind'.cmp_format {
              before = require'tailwind-tools.cmp'.lspkind_format
            }
          '';
        };
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-cmdline.enable = true;
    # cmp_luasnip.enable = true;
    # friendly-snippets.enable = true;
  };
}

# snippet = {
# expand = /* lua */ ''
# function(args)
#   require('luasnip').lsp_expand(args.body)
# end
# '';
# };
#
# sources = {
# __raw = /* lua */ ''
# cmp.config.sources({
#   { name = 'nvim_lsp' },
#   { name = 'luasnip' },
#   { name = 'buffer' },
#   { name = 'path' },
# })
# '';
