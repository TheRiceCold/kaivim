{
  plugins = {
    treesitter = {
      enable = true;
      folding = false;
      nixGrammars = true;
      nixvimInjections = true;
      settings = import ./settings.nix;
    };

    ts-autotag.enable = true;
    treesitter-context.enable = true;
    treesitter-textobjects = import ./textobjects.nix;
  };
}
