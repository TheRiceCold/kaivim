{ pkgs, ... }: {
  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in [builds.grug-far];
  # extraPlugins = [pkgs.vimPlugins.grug-far];

  extraConfigLua = ''
    require'grug-far'.setup {

    }
  '';
}
