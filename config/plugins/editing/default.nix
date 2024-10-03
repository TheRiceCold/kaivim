pkgs: build: {
  imports = [
    (import ./scrollEOF.nix build)
    # (import ./window-picker.nix build)
  ];

  # extraPlugins = with pkgs.vimPlugins; [nvim-window-picker];

  plugins = {
    # nvim-autopairs = import ./autopairs.nix;

    mini.modules = {
      ai = {};
      move = {};
      splitjoin = {};
      trailspace = {};
      basics.mappings.basic = true;
    };

    twilight.enable = true;
    zen-mode.enable = true;
  };
}
