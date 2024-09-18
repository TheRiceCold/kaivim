build: {
  imports = [
    ./git.nix
    (import ./telescope build)
    (import ./silicon.nix build)
  ];

  plugins = {
    mini = import ./mini.nix;
    # conform-nvim = import ./conform.nix;
    nvim-autopairs = import ./autopairs.nix;

    rest.enable = true;
    bufferline = {
      enable = true;
      settings.options = {
        diagnostics = "nvim_lsp";
      };
    };
  };
}
