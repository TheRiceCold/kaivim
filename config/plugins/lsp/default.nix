{
  plugins = {
    lspsaga = import ./lspsaga.nix;
    # none-ls = import ./none-ls.nix;
    lsp-format = {
      enable = true;
      lspServersToEnable = [ "nixd" "efm" ];
    };

    lsp = {
      enable = true;
      servers = import ./servers.nix;
      keymaps = {
        lspBuf = {
          K = "hover";
          gd = "definition";
          gD = "references";
          gi = "implementation";
        };
      };
      enabledServers = [];
    };

    trouble = {
      enable = true;
      settings.auto_close = true;
    };
  };
}
