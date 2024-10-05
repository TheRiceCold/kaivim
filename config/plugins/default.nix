{ pkgs, ... }:
{
  imports = [
    ./cmp
    # ./dap
    ./git
    ./lsp
    ./lang
    ./utils
    ./snippet
    ./editing
    ./treesitter
    ./formatting
  ];

  plugins.mini.enable = true;
  extraPlugins = with pkgs.vimPlugins; [ plenary-nvim dressing-nvim ];
}
