{
  imports = [ ./plugins ./colorschemes ];

  config = {
    opts = import ./options.nix;
    globals.mapleader = " ";

    keymaps = [
      {
        mode = "";
        key = "<S-u>";
        action = "<C-r>";
        options.desc = "Redo";
      }
    ];

    # Neovide config
    extraConfigLua = builtins.readFile ./neovide.lua;
  };
}
