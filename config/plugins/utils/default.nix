{ icons, ... }:
let
  icons = import ../../icons.nix;
in {
  plugins = {
    comment-nvim = {
      enable = true;
      sticky = true;
      padding = true;
      ignore = "^$";
      toggler = { line = "gcc"; block = "gbc"; };
      opleader = { line = "gc"; block = "gb"; };
      mappings = { basic = true; extra = true; };
    };
    emmet.enable = true;

    nvim-colorizer.enable = true;
    # nvim-ufo.enable = true; # FIX: this mf folds everything
    obsidian.enable = true;
    todo-comments.enable = true;
    toggleterm = {
      enable = true;
      direction = "float";
      openMapping = "<c-\\>";
      floatOpts = { border = "curved"; };
    };

    mini = import ./mini.nix { inherit icons; };
  };
}
