build: {
  imports = [
    # (import ./block.nix build)
    # (import ./window-picker.nix build)

    (import ./scrollEOF.nix build)
    (import ./render-markdown.nix build)
  ];

  plugins = {
    nvim-colorizer = {
      enable = true;
      userDefaultOptions.names = false;
    };

    # trouble = {
    #   enable = true;
    #   settings.auto_close = true;
    # };
  };
}
