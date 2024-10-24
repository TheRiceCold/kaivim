{ pkgs, ... }: {
  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in with builds;
    with pkgs.vimPlugins; [
      incline
      scrollEOF

      vim-hexokinase
      vim_current_word
    ];

  plugins = {
    noice.enable = true;
  };

  extraConfigLua = builtins.readFile ./config.lua;
}
