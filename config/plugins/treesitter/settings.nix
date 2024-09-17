{
  indent.enable = true;
  highlight.enable = true;
  ensureInstalled = [
    "c"
    "bash"
    "make"
    "diff"
    "comment"
    "dockerfile"

    "lua"
    "go" "gomod" "gosum"
    "html" "css"
    "templ"

    "tsx"
    "javascript"
    "typescript"
    "json" "yaml"

    "sql"
    "http"
    "graphql"

    "python"
    "requirements"

    "nix"
    "regex"
    "comment"

    "markdown" "markdown_inline"
    "gitattributes" "gitcommit" "gitignore"
  ];
  refactor = {
    highlight_definitions.enable = true;
    highlight_current_scope.enable = true;
  };
  endwise.enable = true;
  matchup = {
    enable = true;
    include_match_words = true;
  };

  incremental_selection = {
    enable = true;
    keymaps = {
      init_selection = "<C-Space>";
      node_incremental = "v";
      scope_incremental = false;
      node_decremental = "V";
    };
  };
}
