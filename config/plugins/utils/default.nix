{ icons, ... }:
let
  icons = import ../../icons.nix;
in {
  plugins = {
    alpha = import ./alpha.nix;
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
    nvim-autopairs = {
      enable = true;
      mapBs = true;
      checkTs = true;
      disableInMacro = false;
      enableAfterQuote = true;
      enableMoveright = true;
      disableInVisualblock = false;
      enableCheckBracketLine = false;
      disabledFiletypes = [ "TelescopePrompt" "spectre_panel" ];
    };

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
