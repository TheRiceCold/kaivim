{
  plugins = {
    fugitive.enable = true;
    diffview.enable = true;
    gitmessenger = {
      enable = true;
      includeDiff = "current";
      noDefaultMappings = true;
    };
    gitsigns = import ./gitsigns.nix;
  };

  # extraPlugins = let
  #   builds = import ../builds.nix pkgs;
  # in [builds.gh-actions];
  #
  # extraConfigLua = ''
  #
  # '' + builtins.readFile ./gh-actions.lua;
}
