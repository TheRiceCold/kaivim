let
  icons = import ../../icons.nix;
in {
  plugins = {
    alpha = import ./alpha.nix;
    mini = import ./mini.nix icons;
    obsidian = import ./obsidian.nix;

    comment = {
      enable = true;
      settings = {
        sticky = true;
        padding = true;
        ignore = "^$";
        toggler = { line = "gcc"; block = "gbc"; };
        opleader = { line = "gc"; block = "gb"; };
        mappings = { basic = true; extra = true; };
      };
    };

    emmet.enable = true;

    nvim-colorizer.enable = true;
    # nvim-ufo.enable = true; # FIX: this mf folds everything
    nvim-autopairs = {
      enable = true;
      settings = {
        mapBs = true;
        checkTs = true;
        disableInMacro = false;
        enableAfterQuote = true;
        enableMoveright = true;
        disableInVisualblock = false;
        enableCheckBracketLine = false;
        disabledFiletypes = [ "TelescopePrompt" "spectre_panel" ];
      };
    };

    todo-comments = {
      enable = true;
      keywords = {
        TODO = { icon = ""; color = "info"; };
        DOCS = { icon = ""; color = "info"; };
        NOTE = { icon = ""; color = "hint"; };
        INFO = { icon = ""; color = "hint"; };
      };
    };

    toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        open_mapping = "[[<c-\\>]]";
        float_opts = { border = "curved"; };
      };
    };
  };
}
