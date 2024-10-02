{
  indent.enable = true;
  highlight.enable = true;
  ensureInstalled = [
    "nix"

    "c" "cpp" "cmake"

    "bash"
    "make"
    "diff"
    "comment"
    "dockerfile"

    "lua"
    "go" "gomod" "gosum"
    "css"
    "html"
    "templ"

    "java"

    "tsx"
    "astro"
    "javascript"
    "typescript"

    "json"
    "yaml"

    "sql"
    "http"
    "graphql"

    "python"
    "requirements"

    "regex"
    "comment"

    "markdown" "markdown_inline"

    "gitignore" "gitconfig" "gitattributes"
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

  playground = {
    enable = true;
  };
}
