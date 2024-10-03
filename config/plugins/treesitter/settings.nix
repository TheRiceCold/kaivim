{
  indent.enable = true;
  highlight.enable = true;
  ensureInstalled = [
    "bash"
    "lua"
    "nix"

    "c"
    "cpp"
    "make"
    "cmake"

    "zig"
    "rust"

    "comment"
    "dockerfile"

    "go"
    "gomod"
    "gosum"

    "css"
    "html"
    "templ"

    "tsx"
    "astro"
    "javascript"
    "typescript"

    "xml"
    "json"
    "yaml"
    "toml"

    "sql"
    "http"
    "graphql"

    "python"
    "requirements"

    "regex"
    "comment"

    "latex"
    "markdown"
    "markdown_inline"

    "diff"
    "gitignore"
    "git_config"
    "gitattributes"

    "vala"
    "dart"
    "java"
    "ruby"

    "gdscript"
    "gdshader"

    "tmux"
    "hyprlang"
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
