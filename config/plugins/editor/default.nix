pkgs: build: {
  imports = [
    # (import ./block.nix build)
    # (import ./window-picker.nix build)

    (import ./scrollEOF.nix build)
  ];

  extraPlugins = with pkgs.vimPlugins; [
    nvim-window-picker
  ];

  plugins = {
    nvim-colorizer = {
      enable = true;
      userDefaultOptions.names = false;
    };

    twilight.enable = true;
    zen-mode.enable = true;
  };
}
