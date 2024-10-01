pkgs: build: {
  imports = [
    ./lualine
    (import ./telescope build)
    (import ./silicon.nix build)
    (import ./grug-far.nix build)
  ];

  extraPlugins = with pkgs.vimPlugins; [
    harpoon2
    range-highlight-nvim
  ];

  plugins = {
    mini = import ./mini.nix;
    nvim-autopairs = import ./autopairs.nix;

    rest.enable = true;
    neotest.enable = true;
    undotree.enable = true;

    todo-comments = {
      enable = true;
      settings.keywords = {
        TODO = { icon = ""; color = "info"; };
        DOCS = { icon = ""; color = "info"; };
        NOTE = { icon = ""; color = "hint"; };
        INFO = { icon = ""; color = "hint"; };
      };
    };
  };
}
