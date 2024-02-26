{ lib, ... }:
let
  cmd = exec: "<cmd>${exec}<cr>";
  lua = arg: cmd "lua ${arg}";
  lead = key: "<leader>${key}";

  k = key: action: desc: {
    inherit key action;
    mode = ""; options.desc = desc;
  };

  telescope = arg: (cmd "Telescope ${arg} theme=ivy");
  toggleterm = cmd: insert-mode: lua (lib.strings.concatStrings [
    "require('toggleterm.terminal').Terminal:new({"
    "hidden = true,"
    ''${if cmd == "" then "" else "cmd='${cmd}',"}''
    ''${if insert-mode then "on_open = function(_) vim.cmd 'startinsert!' end," else ""}''
    "}):toggle()"
  ]);

  git = let
    bind = key: act: (k (lead "g${key}") act);
  in {
    lazy = key: (bind key (cmd "LazyGit") "Lazygit");
    status = key: (bind key "git_status" "Status");
    branches = key: (bind key "git_branches" "Branches");
  };

  buffer = {
    next = key: (k key (cmd "bnext") "Next buffer");
    prev = key: (k key (cmd "bprevious") "Previous buffer");

    new = key: (k (lead key) (cmd "enew") "New Buffer");
    write = key: (k (lead key) (cmd "write") "Write Buffer");
    delete = key: (k (lead key) (cmd "bdelete") "Delete Buffer");
  };

  find = let
    bind = key: act: (k (lead "f${key}") (telescope act));
  in {
    files = key: (bind key "fd" "Files");
    buffers = key: (bind key "buffers" "Buffers");
    keymaps = key: (bind key "keymaps" "Keymaps");
    grep = key: (bind key "live_grep" "Live Grep");
    jumplist = key: (bind key "jumplist" "Jumplist");
    browse-files = key: (bind key "file_browser" "File Browser");
    hidden-files = key: (bind key "fd follow=true hidden=true" "Files (including hidden)");
  };

  term = let
    bind = { key, cmd, desc, insert-mode }: k (lead "t${key}") (toggleterm cmd insert-mode ) desc;
  in {
    empty = key: (bind {
      cmd = "";
      inherit key;
      desc = "Terminal";
      insert-mode = false;
    });

    lazygit = key: (bind {
      inherit key;
      cmd = "lazygit";
      desc = "LazyGit";
      insert-mode = true;
    });
  };

  lsp = let
    bind = key: act: (k (lead "l${key}") act);
  in {
    navbuddy = key: (bind key (cmd "Navbuddy") "Navbuddy");
  };

  common = {
    explorer = key: (k (lead key) (lua "MiniFiles.open()") "Explorer");
    toggle-numbers = key: (k (lead key) (cmd "set nu!") "Toggle line numbers");
  };

  remap = {
    redo = key: (k key "<C-r>" "Redo");
  };
in {
  keymaps = [
    # NOTE: Common (leader <key>)
    (common.explorer "e")
    (common.toggle-numbers "n")

    # NOTE: Buffers (leader <key>)
    (buffer.new "n")
    (buffer.write  "w")
    (buffer.delete "d")
    (buffer.next "<S-l>")
    (buffer.prev "<S-h>")

    # NOTE: Find (key: leader f<key>)
    (find.grep "g")
    (find.files "f")
    (find.buffers "b")
    (find.keymaps "k")
    (find.jumplist "j")
    (find.browse-files "e")
    (find.hidden-files "a")

    # NOTE: Git (key: leader g<key>)
    (git.lazy "g")
    (git.status  "s")
    (git.branches "b")

    # NOTE: Terminal (key: leader t<key>)
    (term.empty "t")
    (term.lazygit "g")

    # NOTE: LSP Commands (key: leader l<key>)
    (lsp.navbuddy "n")

    (remap.redo "<S-u>")
  ];
}
