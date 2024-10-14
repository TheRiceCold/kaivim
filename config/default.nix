{
  imports = [./plugins ./colorschemes];

  config = {
    globals.mapleader = " ";
    opts = import ./options.nix;
    keymaps = import ./keymaps.nix;
    extraConfigLua =  builtins.readFile ./config.lua;
  };
}
