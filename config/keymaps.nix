let
  toggle = key: action: {
    key = "\\${key}";
    options.desc = "Toggle ${action}";
    action = "<cmd>setlocal ${action}!<cr>";
  };
  window-jump = key: {
    key = "<c-${key}>";
    mode = ["n" "i" "t"];
    action = "<c-w>${key}";
  };
in [
  {
    key = "<S-u>";
    action = "<C-r>";
    options.desc = "Redo";
  }

  {
    key = "<c-c>";
    options.desc = "Comment line";
    action = "<cmd>normal gcc<cr>";
  }

  (toggle "w" "wrap")
  (toggle "n" "number")
  (toggle "r" "relativenumber")
  (toggle "i" "ignorecase")
  (toggle "c" "cursorline")
  (toggle "C" "cursorcolumn")

  {
    key = "<s-h>";
    action = "<cmd>bprevious<cr>";
    options.desc = "Previous buffer";
  }

  {
    key = "<s-l>";
    action = "<cmd>bnext<cr>";
    options.desc = "Next buffer";
  }
] ++ map window-jump ["h" "j" "k" "l"]
