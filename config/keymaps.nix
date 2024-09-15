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
    "require'toggleterm.terminal'.Terminal:new({"
    ''${if cmd == "" then "" else "cmd='${cmd}',"}''
    ''${if insert-mode then "on_open = function(_) vim.cmd 'startinsert!' end," else ""}''
    "}):toggle()"
  ]);

  remap = {
    redo = key: (k key "<C-r>" "Redo");
  };

  silicon = let
    bind = key: exec: (k (lead "s${key}") (lua "require'nvim-silicon'.${exec}()"));
  in
  {
    clipboard = key: (bind key "clip" "Copy to clipboard");
    save-file = key: (bind key "file" "Save as file");
  };

  common = {
    zen-mode  = key: (k (lead key) (cmd "ZenMode") "Zen mode");
    toggle-block =  key: (k (lead key) (cmd "Block") "Toggle Block");
    explorer = key: (k (lead key) (lua "MiniFiles.open()") "Explorer");
    toggle-numbers = key: (k (lead key) (cmd "set nu!") "Toggle line numbers");
  };

  git = let
    bind = key: act: (k (lead "g${key}") act);
  in {
    lazy = key: (bind key (cmd "LazyGit") "Lazygit");
    status = key: (bind key (telescope "git_status") "Status");
    branches = key: (bind key (telescope "git_branches") "Branches");
  };

  buffer = let
    bl = exec: desc: key: (k key (cmd "BufferLine${exec}") desc);
  in {
    new = key: (k (lead key) (cmd "enew") "New Buffer");
    write = key: (k (lead key) (cmd "w!") "Write Buffer");
    close = key: (k (lead key) (cmd "clo") "Close Split");
    delete = key: (k (lead key) (cmd "update! | bdelete") "Delete Buffer");

    pick = bl "Pick" "Pick";
    pin = bl "TogglePin" "Toggle Pin";
    pick-close = bl "PickClose" "Pick Close";
    next = bl "CycleNext" "Next buffer";
    prev = bl "CyclePrev" "Previous buffer";
    move-next = bl "MoveNext" "Move Next";
    move-prev = bl "MovePrev" "Move Previous";
    close-others = bl "CloseOthers" "Close Others";
  };

  find = let
    bind = key: (k (lead "f${key}"));
    fd = key: act: (bind key (telescope act));
  in {
    files = key: (fd key "fd" "Files");
    emoji = key: (fd key "emoji" "Emoji");
    buffers = key: (fd key "buffers" "Buffers");
    keymaps = key: (fd key "keymaps" "Keymaps");
    grep = key: (fd key "live_grep" "Live Grep");
    jumplist = key: (fd key "jumplist" "Jumplist");
    colorscheme = key: (fd key "colorscheme" "Colorscheme");
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
    start = key: (bind key "LspStart" "Start");
    stop = key: (bind key "LspStop" "Stop/Kill");
    restart = key: (bind key "LspRestart" "Restart");
    rename = key: (bind key "Lspsaga rename" "Rename");
    outline = key: (bind key "Lspsaga outline" "Outline");
    term = key: (bind key "Lspsaga term_toggle" "Terminal");
    action = key: (bind key "Lspsaga code_action" "Code Action");
  };

  rest = let
    bind = key: act: (k (lead "r${key}") (cmd act));
  in {
    run = key: (bind key "Rest run" "Run");
    last = key: (bind key "Rest last" "Run Last");
  };

  latex = let
    bind = key: act: (k (lead "L${key}") (cmd act));
  in {
    view = key: (bind key "VimtexView" "View");
    errors = key: (bind key "VimtexErrors" "Errors");
    reload = key: (bind key "VimtexReload" "Reload");
    compile = key: (bind key "VimtexCompile" "Compile");
  };

  md = let
    bind = key: act: (k (lead "M${key}") (cmd act));
  in {
    view = key: (bind key "MarkdownPreviewToggle" "Browser Preview");
    render = key: (bind key "RenderMarkdown toggle" "Toggle Render");
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
    # Leader <key>
    (common.explorer "e")
    (common.zen-mode "z")
    (common.toggle-block "B")
    (common.toggle-numbers "n")
    (buffer.close "x")
    (buffer.write  "w")
    (buffer.delete "d")
    (buffer.next "<S-l>")
    (buffer.prev "<S-h>")

    # Leader b
    (buffer.pin (lead "bP"))
    (buffer.pick (lead "bp"))
    (buffer.pick-close (lead "bc"))
    (buffer.close-others (lead "bo"))
    (buffer.move-next (lead "bn"))
    (buffer.move-prev (lead "bb"))

    # Leader f
    (find.grep "g")
    (find.todo "t")
    (find.emoji "e")
    (find.files "f")
    (find.buffers "b")
    (find.keymaps "k")
    (find.jumplist "j")
    (find.colorscheme "c")
    (find.hidden-files "a")

    # Leader g
    (git.lazy "g")
    (git.status  "s")
    (git.branches "b")

    # Leader t
    (term.empty "t")
    (term.lazygit "g")

    # Leader l
    (lsp.outline "o")
    (lsp.restart "R")
    (lsp.action "a")
    (lsp.rename "r")
    (lsp.start "s")
    (lsp.stop "k")
    (lsp.term "t")

    # Leader r
    (rest.run "r")
    (rest.last "l")

    # Leader s
    (silicon.clipboard "c")
    (silicon.save-file "f")

    # Leader L
    (latex.view "v")
    (latex.errors "e")
    (latex.reload "r")
    (latex.compile "c")

    # Leader M
    (md.view "v")
    (md.render "r")

    # Leader N
    (nix.update "u")
    (nix.develop "d")
    (nix.packages "p")
    (nix.profile-install "i")

    (remap.redo "<S-u>")
  ];
}
