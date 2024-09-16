{ pkgs, ... }:
{
  imports = [
    ./ui
    ./lsp
    ./utils
    ./extras
    ./languages
    ./completion
    ./treesitter.nix
  ];

  extraPlugins = with pkgs.vimPlugins; [ plenary-nvim dressing-nvim ];
}
