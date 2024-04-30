{ pkgs, ... }:
{
  imports = [
    ./utils
    ./extras
    ./languages
    ./lualine.nix
    ./telescope.nix
    ./treesitter.nix
  ];
  extraPlugins = [ pkgs.vimPlugins.plenary-nvim ];
  plugins = {
    lsp = import ./lsp;
    lspsaga.enable = true;

    noice.enable = true;
    bufferline.enable = true;
    # fidget.enable = true;
    cmp = {
      enable = true;
    };
    # dap = { enable = true; };
  };
}
