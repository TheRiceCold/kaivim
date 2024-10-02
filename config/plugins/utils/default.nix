pkgs: build: {
  imports = [
    ./lualine
    ./which-key
    (import ./telescope pkgs build)
    (import ./silicon.nix pkgs build)
    (import ./grug-far.nix pkgs build)
  ];

  extraPlugins = with pkgs.vimPlugins; [
    harpoon2
    range-highlight-nvim
  ];

  plugins = {
    alpha = import ./alpha.nix;

    mini.modules = {
      files = {
        content = { };
        mappings = {
          go_in = "<cr>";
          go_out = "-";
          show_help = "?";
        };
        windows = {
          preview = true;
          width_preview = 40;
        };
      };
      surround = { };
      cursorword = { };
    };

    rest.enable = true;
    noice.enable = true;
    notify.enable = true; # Kinda annoying sometimes
    neotest.enable = true;
    helpview.enable = true;
    undotree.enable = true;

    nvim-colorizer = {
      enable = true;
      userDefaultOptions.names = false;
    };

    todo-comments = {
      enable = true;
      settings.keywords = {
        TODO = {
          icon = "";
          color = "info";
        };
        DOCS = {
          icon = "";
          color = "info";
        };
        NOTE = {
          icon = "";
          color = "hint";
        };
        INFO = {
          icon = "";
          color = "hint";
        };
      };
    };
  };
}
