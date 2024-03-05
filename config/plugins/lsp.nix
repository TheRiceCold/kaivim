{
  enable = true;
  servers = {
    nixd = {
      enable = true;
      autostart = true;
    };
    html.enable = true;
    ltex.enable = true;
    cssls.enable = true;
    volar.enable = true;
    bashls.enable = true;
    clangd.enable = true;
    dartls.enable = true;
    jsonls.enable = true;
    graphql.enable = true;
    dockerls.enable = true;
    marksman.enable = true;
    yamlls.enable = true;
    tsserver.enable = true;
    tailwindcss.enable = true;
    rust-analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
    };
  };
  keymaps = {
    lspBuf = {
      K = "hover";
      gd = "definition";
      gD = "references";
      gi = "implementation";
    };
  };
}
