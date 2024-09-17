build: {
  imports = [
    ./git.nix
    (import ./telescope build)
  ];

  plugins = {
    mini = import ./mini;
    # conform-nvim = import ./conform.nix;
    # nvim-autopairs = import ./autopairs.nix;

    rest.enable = true;
    bufferline = {
      enable = true;
      settings.options = {
        diagnostics = "nvim_lsp";
      };
    };
  };
}
