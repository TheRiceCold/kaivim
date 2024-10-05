{ pkgs, ... }:
{
  extraPlugins = let
    builds = import ../../builds.nix pkgs;
  in [builds.typst-preview];

  extraConfigLua = ''
    require'typst-preview'.setup {

    }
  '';
}
