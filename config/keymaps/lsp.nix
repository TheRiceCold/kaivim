set-cmd: let
  saga = bind: action: (set-cmd bind "Lspsaga ${action}");
  toggle-term = key: mode: {
    inherit mode key;
    options.desc = "Toggle Terminal";
    action = "<cmd>Lspsaga term_toggle<cr>";
  };
in [
  (set-cmd "ls" "LspStart" "Start")
  (set-cmd "lk" "LspStop" "Stop/Kill")
  (set-cmd "lR" "LspRestart" "Restart")

  # (saga "lh" "hover_doc" "Hover")
  # (saga "lt" "term_toggle" "Terminal")

  (saga "lf" "finder" "Finder")
  (saga "lr" "rename" "Rename")
  (saga "lo" "outline" "Outline")
  (saga "la" "code_action" "Code Action")

  (saga "lD" "peek_definition" "Peek definition")
  (saga "ld" "goto_definition" "Go to definition")
  (saga "lt" "peek_type_definition" "Peek type definition")
  (saga "lT" "goto_type_definition" "Go to type definition")

  (saga "lb" "show_buf_diagnostics" "Show buffer diagnostics")
  (saga "lw" "show_workspace_diagnostics" "Show workspace diagnostics")

  (toggle-term "<c-\\>" "n")
  (toggle-term "<c-\\>" "t")
]
