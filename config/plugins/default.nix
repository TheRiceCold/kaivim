{ pkgs, ... }:
{
  imports = [
    ./utils
    ./extras
    ./languages

    ./cmp.nix
    ./git.nix
    ./lualine.nix
    ./telescope.nix
    ./treesitter.nix
  ];
  extraPlugins = with pkgs.vimPlugins; [ plenary-nvim dressing-nvim ];
  plugins = {
    noice.enable = true;
    bufferline.enable = true;
    # dap = { enable = true; };
  };
}
