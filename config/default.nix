{
  imports = [ ./plugins ./colorschemes ];

  config = {
    opts = import ./options.nix;
    globals.mapleader = " ";

    keymaps = import ./keymaps.nix;

    # Neovide config
    extraConfigLua = builtins.readFile ./neovide.lua;
  };
}
