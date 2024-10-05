{ pkgs, ... }: {
  plugins = {
    # nvim-autopairs = import ./autopairs.nix;

    mini.modules = {
      move = {};
      splitjoin = {};
      trailspace = {};
    };

    twilight.enable = true;
    zen-mode.enable = true;
  };

  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in [builds.scrollEOF];

  extraConfigLua = ''
    require'scrollEOF'.setup{
      disabled_filetypes = { 'minifiles' }
    }
  '';
}
