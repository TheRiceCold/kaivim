{
  plugins = {
    treesitter = {
      enable = true;
      folding = false;
      nixGrammars = true;
      nixvimInjections = true;
      settings = {
        indent.enable = true;
        ensureInstalled = [
          "http"
          "json"
          "regex"
          "comment"
          "markdown_inline"
        ];
      };
    };
    ts-autotag.enable = true;
    rainbow-delimiters.enable = true;
    treesitter-context.enable = true;
    treesitter-textobjects.enable = true;
  };
}
