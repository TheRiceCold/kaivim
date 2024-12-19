{ pkgs, ... }:
{
  extraPlugins = let
    builds = import ../../builds.nix pkgs;
  in [pkgs.vimPlugins.typst-preview-nvim];

  extraConfigLua = ''
    require'typst-preview'.setup {

    }
  '';
}
