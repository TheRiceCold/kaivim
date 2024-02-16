{
  config.plugins = {
    noice.enable = true;
    lualine.enable = true;
    nvim-cmp.enable = true;
    markdown-preview.enable = true;

    treesitter = {
      enable = true;
      indent = true;
      folding = false;
      nixGrammars = true;
      nixvimInjections = true;
      ensureInstalled = [ "comment" "markdown_inline" "regex" ];
    };
    treesitter-context.enable = true;
    treesitter-textobjects.enable = true;
    ts-autotag.enable = true;
    rainbow-delimiters.enable = true;
  };
}
