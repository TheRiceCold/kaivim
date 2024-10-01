{
  plugins = {
    lsp = {
      enable = true;
      servers = import ./servers.nix;
      keymaps = {
        lspBuf = {
          K = "hover";
          # Replaced by glance.nvim
          # gd = "definition";
          # gD = "references";
          # gi = "implementation";
        };
      };
      enabledServers = [];
    };

    # Shows function signature when u type
    # lsp-signature.enable = true;

    # Diagnostics
    trouble.enable = true;

    # lint = import ./lint.nix;
  };
  # Rename
  # Action
}
