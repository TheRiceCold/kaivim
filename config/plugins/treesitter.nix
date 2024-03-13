{
  plugins = {
    treesitter = {
      enable = true;
      indent = true;
      folding = false;
      nixGrammars = true;
      nixvimInjections = true;
      ensureInstalled = [
        "http"
        "json"
        "regex"
        "comment"
        "markdown_inline"
      ];
    };
    treesitter-context.enable = true;
    treesitter-textobjects.enable = true;
    rainbow-delimiters.enable = true;
    ts-autotag.enable = true;
  };
}
