{
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
}
