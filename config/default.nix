{
  imports = [
    ./plugins
    ./neovide.nix
    ./colorschemes
  ];

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
  };
}
