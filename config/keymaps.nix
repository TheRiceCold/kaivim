let
  toggle = key: action: {
    mode = "n";
    key = "\\${key}";
    options.desc = "Toggle ${action}";
    action = "<cmd>setlocal ${action}!<cr>";
  };
in [
  {
    mode = "";
    key = "<S-u>";
    action = "<C-r>";
    options.desc = "Redo";
  }

  (toggle "w" "wrap")
  (toggle "n" "number")
  (toggle "r" "relativenumber")
  (toggle "w" "ignorecase")
  (toggle "c" "cursorline")
  (toggle "C" "cursorcolumn")
]
