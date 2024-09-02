{ pkgs, ... }:
{
  imports = [
    ./utils
    ./extras
    ./languages
    ./completion

    ./git.nix
    ./lazy.nix
    ./lualine.nix
    ./telescope.nix
    ./treesitter.nix
  ];
  extraPlugins = with pkgs.vimPlugins; [ plenary-nvim dressing-nvim ];
  plugins = {
    noice.enable = true;
    bufferline.enable = true;
    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };
  };
}
