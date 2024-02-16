let
  cmd = exec: "<cmd>${exec}<cr>";
  lua = arg: cmd "lua ${arg}";
  lead = key: "<leader>${key}";
  telescope = arg: (cmd "Telescope ${arg} theme=ivy");
  toggleterm = opts: (lua "require('toggleterm.terminal').Terminal:new({ ${opts}, hidden = true, on_open = function(_) vim.cmd 'startinsert!' end, }):toggle()");

  k = mode: key: action: desc: {
    inherit key action mode;
    options.desc = desc;
  };

  git = key: act: desc: (k "" (lead "g${key}") act desc);
  lsp = key: act: desc: (k "" (lead "l${key}") act desc);
  buffer = key: act: desc: (k "" (lead key) (cmd act) desc);
  find = key: act: desc: (k "" (lead "f${key}") (telescope act) desc);
  term = key: cmd: desc: (k "" (lead "t${key}") (toggleterm cmd) desc);
in [
  (k ""  "<S-u>" "<C-r>" "Redo")
  (k "" "<S-l>" (cmd "bnext") "Next buffer")
  (k "" "<S-h>" (cmd "bprevious") "Previous buffer")

  # Buffers
  (buffer "b" "enew" "New Buffer")
  (buffer "w" "write" "Write Buffer")
  (buffer "d" "bdelete" "Delete Buffer")

  # Telescope
  (find "f" "fd" "Find files")
  (find "b" "buffers" "Find buffers")
  (find "k" "keymaps" "Find keymaps")
  (find "j" "jumplist" "Find jumplist")
  (find "g" "live_grep" "Find live grep")
  (find "e" "file_browser" "Browse explorer")
  (find "a" "fd follow=true hidden=true" "Find all files")

  # Git
  (git "g" (cmd "LazyGit") "Lazygit")
  (git "s" (telescope "git_status") "Git status")
  (git "b" (telescope "git_branches") "Git Branches")

  (lsp "n" (cmd "Navbuddy") "Navbuddy")

  (term "t" "" "Terminal")
  (term "g" " cmd = 'lazygit' " "LazyGit")

  # Utils
  (k "" (lead "e") (lua "MiniFiles.open()") "Explorer")

  # Options
  (k "" (lead "n") (cmd "set nu!") "Toggle line numbers")
]
