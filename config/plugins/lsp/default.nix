{
  plugins = {
    lsp = {
      enable = true;
      servers = import ./servers.nix;
      keymaps = {
        lspBuf = {
          # K = "hover"; # Replaced by Lspsaga hover_doc
          gd = "definition";
          # gD = "references"; # Replaced by Trouble lsp_references
          # gi = "implementation"; # Replaced by Trouble lsp_implementations
        };
      };
      enabledServers = [];
    };

    lint = import ./lint.nix;
    # adds pictograms
    lspkind = import ./lspkind.nix;

    lspsaga = import ./lspsaga.nix;

    # Diagnostics
    trouble.enable = true;
  };
}
