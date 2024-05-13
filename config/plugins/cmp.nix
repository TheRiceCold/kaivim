{ pkgs, ... }:
{
  plugins = {
    luasnip = {
      enable = true;
      extraConfig = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };

    cmp-nvim-lsp.enable = true; # lsp
    cmp-buffer.enable = true;
    copilot-cmp.enable = true;
    cmp-path.enable = true; # file system paths
    cmp_luasnip.enable = true; # snippets
    cmp-cmdline.enable = true;
 
    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = {
        experimental.ghost_text = true;
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        sources.__raw = ''
          cmp.config.sources({
            {name = 'nvim_lsp'},
            {name = 'copilot'},
            {name = 'path'},
            {name = 'luasnip'},
            {name = 'cmdline'},
            }, {
          {name = 'buffer'},
          })
        '';
        performance = {
          debounce = 60;
          max_view_entries = 30;
          fetching_timeout = 200;
        };
        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          };
          documentation.border = "rounded";
        };
        formatting = {
          expandable_indicator = true;
          fields = ["kind" "abbr" "menu"];
        };
      };
    };
  };

  extraConfigLua = /* lua */ ''

  '';
}
