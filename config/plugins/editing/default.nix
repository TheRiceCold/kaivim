pkgs: build: {
  imports = [
    (import ./scrollEOF.nix build)
    # (import ./window-picker.nix build)
  ];

  extraPlugins = with pkgs.vimPlugins; [ nvim-window-picker ];

  plugins = {
    # nvim-autopairs = import ./autopairs.nix;

    mini.modules = {
      ai = { };
      basics = {
        options = { basic = true; };
        mappings = {
          basic = true;
          windows = true;
        };
        autocommands = {
          basic = true;
          relnum_with_alt = true;
        };
      };
      move = { };
      splitjoin = { };
      trailspace = { };
    };

    twilight.enable = true;
    zen-mode.enable = true;
  };
}
