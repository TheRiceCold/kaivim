{ lib, ... }:
let
  cmd = exec: "<cmd>${exec}<cr>";
  lua = arg: cmd "lua ${arg}";
  lead = key: "<leader>${key}";

  k = key: action: desc: {
    inherit key action;
    mode = ""; options.desc = desc;
  };

  browser = url: "firefox '${url}' open=0";
  telescope = arg: (cmd "Telescope ${arg} theme=ivy");
  toggleterm = cmd: insert-mode: lua (lib.strings.concatStrings [
    "require('toggleterm.terminal').Terminal:new({"
    "hidden = true,"
    ''${if cmd == "" then "" else "cmd='${cmd}',"}''
    ''${if insert-mode then "on_open = function(_) vim.cmd 'startinsert!' end," else ""}''
    "}):toggle()"
  ]);

  common = {
    zen-mode  = key: (k (lead key) (cmd "ZenMode") "Zen mode");
    explorer = key: (k (lead key) (lua "MiniFiles.open()") "Explorer");
    toggle-numbers = key: (k (lead key) (cmd "set nu!") "Toggle line numbers");
  };

  remap = {
    redo = key: (k key "<C-r>" "Redo");
  };

  git = let
    bind = key: act: (k (lead "g${key}") act);
  in {
    lazy = key: (bind key (cmd "LazyGit") "Lazygit");
    status = key: (bind key (telescope "git_status") "Status");
    branches = key: (bind key (telescope "git_branches") "Branches");
  };

  buffer = {
    next = key: (k key (cmd "bnext") "Next buffer");
    prev = key: (k key (cmd "bprevious") "Previous buffer");

    new = key: (k (lead key) (cmd "enew") "New Buffer");
    write = key: (k (lead key) (cmd "w!") "Write Buffer");
    delete = key: (k (lead key) (cmd "update! | bdelete") "Delete Buffer");
    close = key: (k (lead key) (cmd "clo") "Close Buffer Window (Split)");
  };

  find = let
    bind = key: (k (lead "f${key}"));
    fd = key: act: (bind key (telescope act));
  in {
    files = key: (fd key "fd" "Files");
    buffers = key: (fd key "buffers" "Buffers");
    keymaps = key: (fd key "keymaps" "Keymaps");
    grep = key: (fd key "live_grep" "Live Grep");
    jumplist = key: (fd key "jumplist" "Jumplist");
    browse-files = key: (fd key "file_browser" "File Browser");
    todo = key: (bind key (cmd "TodoTelescope theme=ivy") "Todo");
    hidden-files = key: (fd key "fd follow=true hidden=true" "Files (including hidden)");
  };

  term = let
    bind = {
      key, cmd, desc, insert-mode ? false,
    }: (k (lead "t${key}") (toggleterm cmd insert-mode) desc);
  in {
    empty = key: (bind {
      cmd = "";
      inherit key;
      desc = "Terminal";
    });

    lazygit = key: (bind {
      inherit key;
      cmd = "lazygit";
      desc = "LazyGit";
      insert-mode = true;
    });
  };

  lsp = let
    bind = key: act: (k (lead "l${key}") (cmd act));
  in {
    start = key: (bind key  "LspStart" "Start");
    stop = key: (bind key "LspStop" "Stop/Kill");
    restart = key: (bind key "LspRestart" "Restart");
    rename = key: (bind key "Lspsaga rename" "Rename");
    outline = key: (bind key "Lspsaga outline" "Outline");
    term = key: (bind key "Lspsaga term_toggle" "Terminal");
    action = key: (bind key "Lspsaga code_action" "Code Action");
  };

  md = let
    bind = key: act: (k (lead "M${key}") (cmd act));
  in {
    view = key: (bind key "MarkdownPreviewToggle" "Toggle View");
  };

  latex = let
    bind = key: act: (k (lead "L${key}") (cmd act));
  in {
    view = key: (bind key "VimtexView" "View");
    errors = key: (bind key "VimtexErrors" "Errors");
    reload = key: (bind key "VimtexReload" "Reload");
    compile = key: (bind key "VimtexCompile" "Compile");
  };

  nix = let
    bind = {
      key, cmd, desc, insert-mode ? false
    }: k (lead "N${key}") (toggleterm cmd insert-mode) desc;
  in {
    profile-install = key: bind {
      inherit key;
      desc = "Profile Install";
      cmd = "nix profile install";
    };
    develop = key: bind {
      inherit key;
      desc = "Develop";
      cmd = "nix develop";
    };
    packages =  key: bind {
      inherit key;
      desc = "Search packages";
      cmd = browser "https://search.nixos.org/packages";
    };
    update =  key: bind {
      inherit key;
      desc = "Update";
      cmd = "nix flake update";
    };
  };
in {
  keymaps = [
    # INFO: Common (leader <key>)
    (common.explorer "e")
    (common.zen-mode "z")
    (common.toggle-numbers "n")

    # INFO: Buffers (leader <key>)
    (buffer.write  "w")
    (buffer.close "c")
    (buffer.delete "d")
    (buffer.next "<S-l>")
    (buffer.prev "<S-h>")

    # INFO: Find (key: leader f<key>)
    (find.grep "g")
    (find.files "f")
    (find.todo "t")
    (find.buffers "b")
    (find.keymaps "k")
    (find.jumplist "j")
    (find.browse-files "e")
    (find.hidden-files "a")

    # INFO: Git (key: leader g<key>)
    (git.lazy "g")
    (git.status  "s")
    (git.branches "b")

    # INFO: Terminal (key: leader t<key>)
    (term.empty "t")
    (term.lazygit "g")

    # INFO: LSP Commands (key: leader l<key>)
    (lsp.outline "o")
    (lsp.restart "R")
    (lsp.action "a")
    (lsp.rename "r")
    (lsp.start "s")
    (lsp.stop "k")
    (lsp.term "t")

    # INFO: LaTeX Commands (key: leader L<key>)
    (latex.view "v")
    (latex.errors "e")
    (latex.reload "r")
    (latex.compile "c")

    # INFO: Markdown Commands (key: leader M<key>)
    (md.view "v")

    # INFO: Nix Commands (key: leader N<key>)
    (nix.update "u")
    (nix.develop "d")
    (nix.packages "p")
    (nix.profile-install "i")

    (remap.redo "<S-u>")
  ];
}
