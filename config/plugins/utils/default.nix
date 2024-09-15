let
  icons = import ../../icons.nix;
in {
  plugins = {
    mini = import ./mini icons;
    # conform-nvim = import ./conform.nix;

    comment = {
      enable = true;
      settings = {
        ignore = "^$";
        sticky = true;
        padding = true;
        opleader = { line = "gc"; block = "gb"; };
        toggler = { line = "gcc"; block = "gbc"; };
        mappings = { basic = true; extra = true; };
      };
    };

    emmet.enable = true;
    nvim-colorizer.enable = true;

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

    rest.enable = true;

    todo-comments = {
      enable = true;
      settings.keywords = {
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
