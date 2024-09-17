{ pkgs, ... }:
{
  imports = [
    ./ui
    ./lsp
    ./utils
    ./languages
    ./completion
    ./treesitter
  ];

  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim
    dressing-nvim
    zen-mode-nvim
    vim-visual-multi
  ];
}
